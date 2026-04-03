package com.mtf.artixel.config;

import com.mtf.artixel.service.InquiryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
@RequiredArgsConstructor
public class PageViewInterceptor implements HandlerInterceptor {

    private final InquiryService inquiryService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String uri = request.getRequestURI();
        String pageName = "";

        // URL 패턴에 맞춰서 자동으로 페이지 이름과 조회수 매핑
        if ("/".equals(uri)) {
            pageName = "메인 (Home)";
        } else if ("/about".equals(uri)) {
            pageName = "Our Technology";
        } else if ("/product".equals(uri)) {
            pageName = "Start Analysis";
        } else if ("/contact".equals(uri)) {
            pageName = "Contact";
        }
        // ==========================================
        // 영문 페이지 URL 매핑 및 조회수 카운팅
        // ==========================================
        else if ("/en".equals(uri) || "/en/".equals(uri)) {
            pageName = "[EN] 메인 (Home)";
        } else if ("/en/about".equals(uri)) {
            pageName = "[EN] Our Technology";
        } else if ("/en/product".equals(uri)) {
            pageName = "[EN] Start Analysis";
        } else if ("/en/contact".equals(uri)) {
            pageName = "[EN] Contact";
        }

        if (!pageName.isEmpty()) {
            // 1. 해당 페이지의 단순 뷰(View) 카운트는 매번 증가
            inquiryService.increasePageView(uri, pageName);

            // 2. 전체 방문자 집계용 로깅 (브라우저 세션당 1회만 기록하여 DB 과부하 방지 및 순수 방문자 측정)
            HttpSession session = request.getSession();
            if (session.getAttribute("site_visited") == null) {
                String clientIp = getClientIp(request);
                inquiryService.insertVisitLog(clientIp);
                session.setAttribute("site_visited", true); // 플래그 꽂기
            }
        }

        return true;
    }

    // 클라이언트 IP 추출 유틸
    private String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}