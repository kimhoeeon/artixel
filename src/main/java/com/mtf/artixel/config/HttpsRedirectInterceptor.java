package com.mtf.artixel.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class HttpsRedirectInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1. 로컬 개발 환경(localhost)에서는 통과
        String host = request.getServerName();
        if ("localhost".equalsIgnoreCase(host) || "127.0.0.1".equals(host)) {
            return true;
        }

        // 2. Cafe24 호스팅 전용 헤더 확인 (로그 기반 수정)
        String hostingSsl = request.getHeader("hosting_ssl");   // "on" 이면 HTTPS
        String serverPort = request.getHeader("x-server_port"); // "443" 이면 HTTPS

        // 3. HTTPS 여부 판별
        // 표준 방식(isSecure) OR Cafe24 방식(hosting_ssl, x-server_port) 중 하나라도 만족하면 통과
        boolean isSecure = request.isSecure()
                || "on".equalsIgnoreCase(hostingSsl)
                || "443".equals(serverPort);

        // 4. HTTP라면 HTTPS로 강제 리디렉션
        if (!isSecure) {
            String newUrl = "https://" + host + request.getRequestURI();
            if (request.getQueryString() != null) {
                newUrl += "?" + request.getQueryString();
            }
            response.sendRedirect(newUrl);
            return false; // 요청 중단 및 리다이렉트
        }

        return true; // HTTPS이므로 통과
    }
}