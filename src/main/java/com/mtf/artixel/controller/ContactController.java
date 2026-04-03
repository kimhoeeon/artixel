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
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/contact")
public class ContactController {

    private final InquiryService inquiryService;

    // 2. 사용자가 폼에 입력 후 [제출] 버튼을 눌렀을 때의 처리
    @PostMapping("/submit")
    public String submitContact(
            @ModelAttribute InquiryVO inquiryVO,
            @RequestParam(value = "uploadFile", required = false) List<MultipartFile> uploadFiles,
            HttpServletRequest request,
            RedirectAttributes rttr) {

        // [핵심 분기] 영문 페이지에서 날아온 요청인지 판별 (유형에 [EN] 꼬리표가 있는지 확인)
        boolean isEnglish = inquiryVO.getInquiryType() != null && inquiryVO.getInquiryType().startsWith("[EN]");

        // 처리가 끝난 뒤 돌아갈 화면 URL 설정 (영문은 영문 화면으로, 국문은 국문 화면으로)
        String redirectUrl = isEnglish ? "redirect:/en/contact" : "redirect:/contact";

        try {
            // 프록시 환경 및 로드밸런서 환경을 모두 고려하여 클라이언트의 실제 IP를 추출합니다.
            String clientIp = getClientIp(request);

            // 서비스로 데이터와 파일을 넘겨 비즈니스 로직 실행
            String result = inquiryService.insertInquiry(inquiryVO, uploadFiles, clientIp);

            // 결과에 따른 피드백 메시지 설정
            if ("SPAM_BLOCKED".equals(result)) {
                String msg = isEnglish ? "Too many requests in a short time. Please try again in 1 minute."
                        : "단기간에 너무 많은 요청이 발생했습니다. 1분 후 다시 시도해주세요.";
                rttr.addFlashAttribute("msg", msg);
                return redirectUrl;
            }

            if ("SUCCESS".equals(result)) {
                String msg = isEnglish ? "Your inquiry has been successfully submitted."
                        : "의뢰가 성공적으로 접수되었습니다.";
                rttr.addFlashAttribute("msg", msg);
            } else {
                String msg = isEnglish ? "An error occurred while submitting your inquiry. Please try again."
                        : "의뢰 접수 중 오류가 발생했습니다. 다시 시도해 주세요.";
                rttr.addFlashAttribute("msg", msg);
            }

        } catch (Exception e) {
            log.error("Contact 폼 제출 중 에러 발생: ", e);
            String msg = isEnglish ? "A server communication error occurred. Please contact the administrator."
                    : "서버 통신 중 오류가 발생했습니다. 관리자에게 문의해 주세요.";
            rttr.addFlashAttribute("msg", msg);
        }

        // 제출 완료 후 새로고침 시 중복 제출을 막기 위해 PRG(Post-Redirect-Get) 패턴 사용
        return redirectUrl;
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