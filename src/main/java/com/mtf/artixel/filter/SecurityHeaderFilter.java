package com.mtf.artixel.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SecurityHeaderFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // 1. Clickjacking 방지 (iframe 등으로 내 사이트를 못 감싸게 함)
        httpResponse.setHeader("X-Frame-Options", "DENY");

        // 2. XSS(스크립트 삽입) 공격 감지 시 브라우저가 차단하도록 설정
        httpResponse.setHeader("X-XSS-Protection", "1; mode=block");

        // 3. MIME 타입 스니핑 차단 (파일 형식을 속여서 실행하는 것 방지)
        httpResponse.setHeader("X-Content-Type-Options", "nosniff");

        // 4. HSTS 설정 (한 번 접속하면 브라우저가 알아서 HTTPS로만 접속하게 함 - 매우 중요)
        // max-age=31536000 (1년)
        httpResponse.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");

        // 5. 캐시 제어 (민감한 정보가 PC방 등 공용 PC에 저장되지 않도록 - 필요시 적용)
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
        httpResponse.setHeader("Expires", "0"); // Proxies

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
