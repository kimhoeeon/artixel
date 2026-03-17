package com.mtf.artixel.controller;

import com.google.gson.Gson;
import com.mtf.artixel.mapper.AdminMngMapper;
import com.mtf.artixel.service.AdminService;
import com.mtf.artixel.service.InquiryService;
import com.mtf.artixel.vo.AdminVO;
import com.mtf.artixel.vo.GameVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.net.InetAddress;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Slf4j
@Controller
@RequestMapping("/mng")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;     // DB 로그인용
    private final InquiryService inquiryService;
    private final AdminMngMapper adminMngMapper;

    // 1. 관리자 로그인 화면 (유지)
    @GetMapping("/index.do")
    public String index(HttpSession session,
                        @RequestParam(value = "expired", required = false) String expired,
                        Model model) {
        if (session.getAttribute("admin") != null) return "redirect:/mng/main.do";

        // 인터셉터에서 세션 만료로 튕겨냈을 경우 메시지 모델에 추가 (index.jsp에서 자동 알럿)
        if ("true".equals(expired)) {
            model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
        }

        return "mng/index";
    }

    @PostMapping("/login")
    public String loginAction(@RequestParam("adminId") String id,
                              @RequestParam("adminPw") String pw,
                              HttpServletRequest request,
                              RedirectAttributes rttr) {
        try {
            // 접속자 IP 추출 (개별 IP 제한 체크용)
            String clientIp = getClientIp(request);

            HttpSession session = request.getSession();

            // 1. 로그인 서비스 호출 (다중 IP 체크 포함된 버전)
            AdminVO admin = adminService.login(id, pw, clientIp);

            if (admin != null) {
                // 2. 세션에 AdminVO 객체 저장 (Key: "admin")
                session.setAttribute("admin", admin);

                // 기존 호환성 유지 (필요하다면)
                session.setAttribute("adminId", admin.getLoginId());
                session.setAttribute("status", "logon");

                return "redirect:/mng/main.do";
            } else {
                rttr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");

                // [변경 3] 주소를 로그인 페이지로 완전히 변경 (리다이렉트)
                return "redirect:/mng/index.do";
            }

        } catch (Exception e) {
            log.warn("관리자 로그인 실패: {}", e.getMessage());

            // [변경 4] 예외 발생 시에도 리다이렉트로 처리
            rttr.addFlashAttribute("msg", e.getMessage());
            return "redirect:/mng/index.do";
        }
    }

    @GetMapping("/login")
    public String loginGetRedirect() {
        return "redirect:/mng/index.do";
    }

    /**
     * 관리자 메인 대시보드
     */
    @GetMapping("/main.do")
    public String mainPage(Model model, HttpServletRequest request) throws Exception {

        // 1. 상단 요약 데이터
        model.addAttribute("totalInquiryCount", inquiryService.getTotalInquiryCount());
        model.addAttribute("todayInquiryCount", inquiryService.getTodayInquiryCount());
        model.addAttribute("totalUniqueVisitors", inquiryService.getTotalUniqueVisitors());
        model.addAttribute("totalVisitors", inquiryService.getTotalVisitors());

        // 실시간 상위 조회 페이지 TOP 5
        model.addAttribute("topPages", inquiryService.getTopPageViews());

        Gson gson = new Gson();

        // 2. 방문 현황 및 문의 현황 (Day/Week/Month 동적 생성)
        Map<String, Object> visitCharts = new HashMap<>();
        Map<String, Object> inquiryCharts = new HashMap<>();
        Map<String, Object> countryCharts = new HashMap<>();

        String[] periods = {"DAY", "WEEK", "MONTH"};
        for (String period : periods) {
            visitCharts.put(period, buildVisitorData(period));
            inquiryCharts.put(period, buildInquiryStackedData(period));
            countryCharts.put(period, buildCountryPieData(period));
        }

        model.addAttribute("visitChartsJson", gson.toJson(visitCharts));
        model.addAttribute("inquiryChartsJson", gson.toJson(inquiryCharts));
        model.addAttribute("countryChartsJson", gson.toJson(countryCharts));

        // 3. 서버 시스템 리소스 현황
        Runtime runtime = Runtime.getRuntime();
        Map<String, Object> sysInfo = new HashMap<>();
        sysInfo.put("osName", System.getProperty("os.name"));
        sysInfo.put("osArch", System.getProperty("os.arch"));
        sysInfo.put("javaVersion", System.getProperty("java.version"));

        long totalMem = runtime.totalMemory() / (1024 * 1024);
        long freeMem = runtime.freeMemory() / (1024 * 1024);
        sysInfo.put("totalMemory", totalMem);
        sysInfo.put("usedMemory", totalMem - freeMem);

        File root = new File("/");
        long totalSpace = root.getTotalSpace() / (1024 * 1024 * 1024);
        long usableSpace = root.getUsableSpace() / (1024 * 1024 * 1024);
        sysInfo.put("totalSpace", totalSpace);
        sysInfo.put("usedSpace", totalSpace - usableSpace);

        try { sysInfo.put("serverIp", InetAddress.getLocalHost().getHostAddress()); }
        catch (Exception e) { sysInfo.put("serverIp", "Unknown"); }
        sysInfo.put("clientIp", getClientIp(request));

        model.addAttribute("sysInfo", sysInfo);

        return "mng/main";
    }

    // --- 차트용 JSON 데이터 빌더 도우미 ---
    private Map<String, Object> buildVisitorData(String period) throws Exception {
        List<String> labels = generateDateLabels(period);
        List<Map<String, Object>> dbList = inquiryService.getVisitorTrend(period);
        Map<String, Integer> dbMap = new HashMap<>();
        for(Map<String, Object> row : dbList) dbMap.put((String)row.get("dateStr"), ((Number)row.get("cnt")).intValue());

        List<Integer> data = new ArrayList<>();
        for(String label : labels) data.add(dbMap.getOrDefault(label, 0));

        Map<String, Object> res = new HashMap<>();
        res.put("categories", labels);
        res.put("data", data);
        return res;
    }

    private Map<String, Object> buildInquiryStackedData(String period) throws Exception {
        List<String> labels = generateDateLabels(period);
        List<Map<String, Object>> dbList = inquiryService.getInquiryTrendByCategory(period);

        String[] categories = {"기업", "개인", "기관", "기타"};
        Map<String, List<Integer>> seriesMap = new HashMap<>();
        for(String cat : categories) seriesMap.put(cat, new ArrayList<>(Collections.nCopies(labels.size(), 0)));

        for(Map<String, Object> row : dbList) {
            String dateStr = (String)row.get("dateStr");
            String cat = (String)row.get("category");
            int cnt = ((Number)row.get("cnt")).intValue();

            int idx = labels.indexOf(dateStr);
            if(idx >= 0) {
                if(seriesMap.containsKey(cat)) seriesMap.get(cat).set(idx, cnt);
                else if (cat != null && cat.startsWith("기타")) {
                    seriesMap.get("기타").set(idx, seriesMap.get("기타").get(idx) + cnt);
                }
            }
        }

        List<Map<String, Object>> series = new ArrayList<>();
        for(String cat : categories) {
            Map<String, Object> s = new HashMap<>();
            s.put("name", cat);
            s.put("data", seriesMap.get(cat));
            series.add(s);
        }

        Map<String, Object> res = new HashMap<>();
        res.put("categories", labels);
        res.put("series", series);
        return res;
    }

    private Map<String, Object> buildCountryPieData(String period) throws Exception {
        List<Map<String, Object>> dbList = inquiryService.getCountryStat(period);
        List<String> labels = new ArrayList<>();
        List<Integer> series = new ArrayList<>();
        for(Map<String, Object> row : dbList) {
            labels.add((String)row.get("country"));
            series.add(((Number)row.get("cnt")).intValue());
        }

        if(labels.isEmpty()) {
            labels.add("데이터 없음");
            series.add(0);
        }

        Map<String, Object> res = new HashMap<>();
        res.put("labels", labels);
        res.put("series", series);
        return res;
    }

    // 빈 날짜 생성을 위한 헬퍼
    private List<String> generateDateLabels(String period) {
        List<String> labels = new ArrayList<>();
        LocalDate now = LocalDate.now();
        if ("MONTH".equals(period)) {
            for(int i=11; i>=0; i--) labels.add(now.minusMonths(i).format(DateTimeFormatter.ofPattern("yyyy-MM")));
        } else if ("WEEK".equals(period)) {
            for(int i=11; i>=0; i--) labels.add(now.minusWeeks(i).with(DayOfWeek.MONDAY).format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        } else {
            for(int i=14; i>=0; i--) labels.add(now.minusDays(i).format(DateTimeFormatter.ofPattern("MM.dd")));
        }
        return labels;
    }

    /**
     * 로그아웃
     */
    @GetMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/mng/index.do";
    }

    @PostMapping("/mng/profile/change-password")
    @ResponseBody
    public String changePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 HttpSession session) {

        // 1. 세션에서 로그인된 관리자 정보 가져오기
        AdminVO admin = (AdminVO) session.getAttribute("admin");

        if (admin == null) {
            return "로그인 정보가 없습니다 (세션 만료).";
        }

        // 2. 서비스 호출 (이메일 대신 ID 전달)
        // AdminVO에 getId() 메서드가 있다고 가정합니다.
        return adminService.changePassword(admin.getLoginId(), currentPassword, newPassword);
    }

    // IP 추출 유틸 메서드
    private String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}