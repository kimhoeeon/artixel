package com.mtf.artixel.controller;

import com.mtf.artixel.service.InquiryService;
import com.mtf.artixel.vo.InquiryVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/contact")
public class ContactController {

    private final InquiryService inquiryService;

    // 1. Contact 폼 화면 띄우기 (퍼블리싱된 jsp 연결)
    @GetMapping("/contact/contact")
    public String contactForm() {
        return "contact/contact";
    }

    // 2. 사용자가 폼에 입력 후 [제출] 버튼을 눌렀을 때의 처리
    @PostMapping("/submit")
    public String submitContact(
            @ModelAttribute InquiryVO inquiryVO,
            @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
            HttpServletRequest request,
            RedirectAttributes rttr) {

        try {
            // 프록시 환경 및 로드밸런서 환경을 모두 고려하여 클라이언트의 실제 IP를 추출합니다.
            String clientIp = getClientIp(request);

            // 서비스로 데이터와 파일을 넘겨 비즈니스 로직 실행
            String result = inquiryService.insertInquiry(inquiryVO, uploadFile, clientIp);

            // 결과에 따른 피드백 메시지 설정
            if ("SPAM_BLOCKED".equals(result)) {
                rttr.addFlashAttribute("msg", "단기간에 너무 많은 요청이 발생했습니다. 1분 후 다시 시도해주세요.");
                return "redirect:/contact";
            }

            if ("SUCCESS".equals(result)) {
                rttr.addFlashAttribute("msg", "의뢰가 성공적으로 접수되었습니다.");
            } else {
                rttr.addFlashAttribute("msg", "의뢰 접수 중 오류가 발생했습니다. 다시 시도해 주세요.");
            }

        } catch (Exception e) {
            log.error("Contact 폼 제출 중 에러 발생: ", e);
            rttr.addFlashAttribute("msg", "서버 통신 중 오류가 발생했습니다. 관리자에게 문의해 주세요.");
        }

        // 제출 완료 후 새로고침 시 중복 제출을 막기 위해 PRG(Post-Redirect-Get) 패턴 사용
        return "redirect:/contact";
    }

    // 클라이언트의 정확한 IP를 가져오기 위한 유틸리티 메서드
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