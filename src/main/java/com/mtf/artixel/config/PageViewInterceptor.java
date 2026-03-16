package com.mtf.artixel.config;

import com.mtf.artixel.service.InquiryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        } else if ("/contact".equals(uri)) {
            pageName = "Contact (문의하기)";
        } else if ("/our-technology".equals(uri)) {
            pageName = "Our Technology";
        } else if ("/about".equals(uri)) {
            pageName = "About Us";
        } else if ("/policy/privacy".equals(uri)) {
            pageName = "개인정보처리방침";
        }

        // 해당 페이지 접근 시 비동기적으로 조회수 +1
        if (!pageName.isEmpty()) {
            inquiryService.increasePageView(uri, pageName);
        }

        return true;
    }
}