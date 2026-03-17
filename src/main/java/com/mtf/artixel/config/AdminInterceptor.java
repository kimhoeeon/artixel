package com.mtf.artixel.config;

import com.mtf.artixel.vo.AdminVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Slf4j
@Component
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();

        // 1. 로그인 페이지 및 정적 자원은 검사 예외 (WebConfig와 이중 체크)
        if (requestURI.startsWith("/mng/index") || requestURI.startsWith("/mng/login") ||
                requestURI.startsWith("/mng/assets") || requestURI.startsWith("/mng/css") ||
                requestURI.startsWith("/mng/js") || requestURI.startsWith("/mng/img")) {
            return true;
        }

        // 2. 관리자 세션 체크
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            String clientIp = getClientIp(request);
            log.warn("관리자 비로그인/세션만료 접근 차단: IP={} / URI={}", clientIp, requestURI);

            // 3. 비동기(AJAX) 요청 판별
            boolean isAjax = false;
            String requestedWith = request.getHeader("X-Requested-With");
            String accept = request.getHeader("Accept");

            if ("XMLHttpRequest".equalsIgnoreCase(requestedWith) ||
                    (accept != null && accept.toLowerCase().contains("application/json"))) {
                isAjax = true;
            }

            if (isAjax) {
                // 비동기 요청일 경우 스크립트가 아닌 401 에러 코드로 조용히 차단 (무한 알럿 원천 방지)
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session Expired");
            } else {
                // 일반 웹 요청일 경우 HTTP 302 리다이렉트로 안전하게 로그인 페이지로 이동 (Query String으로 만료 상태 전달)
                response.sendRedirect("/mng/index.do?expired=true");
            }

            return false; // 컨트롤러 진행 완벽 차단
        }

        return true; // 세션 정상인 경우 통과
    }

    // 클라이언트 IP 추출 유틸 (로그용으로만 남겨둠)
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