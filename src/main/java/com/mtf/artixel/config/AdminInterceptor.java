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

        // 1. 로그인 및 정적 리소스는 인터셉터 패스 (WebConfig와 이중 체크)
        if (requestURI.startsWith("/mng/index") || requestURI.startsWith("/mng/login") ||
                requestURI.startsWith("/mng/assets") || requestURI.startsWith("/mng/css") ||
                requestURI.startsWith("/mng/js") || requestURI.startsWith("/mng/img")) {
            return true;
        }

        // 2. 관리자 세션 검증
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {

            String clientIp = getClientIp(request);
            log.warn("관리자 비로그인/세션만료 접근 차단: IP={} / URI={}", clientIp, requestURI);

            // 3. [1차 방어] 비동기 요청(AJAX, Fetch 등) 정밀 감지
            boolean isAjax = false;
            String requestedWith = request.getHeader("X-Requested-With");
            String accept = request.getHeader("Accept");
            String fetchMode = request.getHeader("Sec-Fetch-Mode");

            if ("XMLHttpRequest".equalsIgnoreCase(requestedWith) ||
                    (accept != null && accept.toLowerCase().contains("application/json")) ||
                    "cors".equalsIgnoreCase(fetchMode)) {
                isAjax = true;
            }

            if (isAjax) {
                // 비동기 요청일 경우 스크립트를 내리지 않고 401 상태 코드만 조용히 반환
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"error\": \"Session Expired\", \"redirect\": \"/mng/index.do\"}");
                out.flush();
                return false;
            }

            // 4. [2차 방어] 일반 웹 요청일 경우 스크립트 실행 (무한 알럿 원천 차단 가드 적용)
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<script>");
            // window.top 객체에 플래그(isSessionAlertShown)를 저장하여 알럿이 중복으로 뜨는 것을 완벽히 차단합니다.
            out.println("if (window.top && !window.top.isSessionAlertShown) {");
            out.println("    window.top.isSessionAlertShown = true;");
            out.println("    alert('로그인이 필요한 서비스입니다.');");
            out.println("    window.top.location.href='/mng/index.do';");
            out.println("} else if (!window.top) {");
            out.println("    alert('로그인이 필요한 서비스입니다.');");
            out.println("    location.href='/mng/index.do';");
            out.println("}");
            out.println("</script>");

            out.flush();
            out.close();

            return false;
        }

        return true; // 세션 유효 시 통과
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