package com.mtf.artixel.controller;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String loginPage(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("adminId") != null) {
            return "redirect:/mng/main.do";
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

        // [대시보드 통계 데이터 조회]
        // 1. 누적 문의 건수
        model.addAttribute("totalInquiryCount", inquiryService.getTotalInquiryCount());

        // 2. 금일 문의 건수
        model.addAttribute("todayInquiryCount", inquiryService.getTodayInquiryCount());

        // 3. 구분별 통계 (기업/개인/기관 등)
        model.addAttribute("categoryStats", inquiryService.getInquiryCountByCategory());

        // 4. 국가별 통계 (원형 그래프용)
        model.addAttribute("countryStats", inquiryService.getInquiryCountByCountry());

        // 시스템 상태 정보 수집
        // [B] 관리자 시스템 정보 수집 대시보드 영역 (viotorydiary 방식 적용)
        OperatingSystemMXBean osBean = ManagementFactory.getOperatingSystemMXBean();
        Runtime runtime = Runtime.getRuntime();

        Map<String, Object> sysInfo = new HashMap<>();
        sysInfo.put("osName", System.getProperty("os.name"));
        sysInfo.put("osArch", System.getProperty("os.arch"));
        sysInfo.put("javaVersion", System.getProperty("java.version"));

        // 메모리 정보 계산 (MB 단위)
        long totalMem = runtime.totalMemory() / (1024 * 1024);
        long freeMem = runtime.freeMemory() / (1024 * 1024);
        long usedMem = totalMem - freeMem;
        long maxMem = runtime.maxMemory() / (1024 * 1024);

        sysInfo.put("totalMemory", totalMem);
        sysInfo.put("freeMemory", freeMem);
        sysInfo.put("usedMemory", usedMem);
        sysInfo.put("maxMemory", maxMem);

        // 디스크 정보 계산 (GB 단위)
        File root = new File("/");
        long totalSpace = root.getTotalSpace() / (1024 * 1024 * 1024);
        long usableSpace = root.getUsableSpace() / (1024 * 1024 * 1024);
        long usedSpace = totalSpace - usableSpace;

        sysInfo.put("totalSpace", totalSpace);
        sysInfo.put("usableSpace", usableSpace);
        sysInfo.put("usedSpace", usedSpace);

        // 접속 IP 정보 수집
        try {
            sysInfo.put("serverIp", InetAddress.getLocalHost().getHostAddress());
        } catch (Exception e) {
            sysInfo.put("serverIp", "Unknown");
        }
        sysInfo.put("clientIp", getClientIp(request));

        // 뷰로 데이터 전송
        model.addAttribute("sysInfo", sysInfo);

        return "mng/main";
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