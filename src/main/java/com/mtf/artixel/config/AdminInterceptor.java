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

        // 1. 로그인 페이지 및 예외 리소스 (이중 체크)
        if (requestURI.equals("/mng/index.do") || requestURI.equals("/mng/index") || requestURI.equals("/mng/login.do") || requestURI.equals("/mng/login")) {
            return true;
        }

        // 2. 세션 체크
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            String clientIp = getClientIp(request);
            log.warn("관리자 비로그인/세션만료 접근 차단: IP={} / URI={}", clientIp, requestURI);

            // 3. 완벽한 AJAX(비동기) 판별 로직 - 최신 Fetch API 대응
            boolean isAjax = true; // 기본적으로 모든 요청을 백그라운드 통신으로 간주하여 방어

            String accept = request.getHeader("Accept");
            String requestedWith = request.getHeader("X-Requested-With");
            String fetchDest = request.getHeader("Sec-Fetch-Dest");

            // 브라우저의 직접적인 페이지 이동(새로고침, URL 입력, a태그 클릭)인지 명확히 확인
            if ("document".equals(fetchDest)) {
                isAjax = false;
            } else if (fetchDest == null) {
                // 구형 브라우저(Sec-Fetch-Dest 미지원) 대비 예외 처리
                if (accept != null && accept.contains("text/html") && !"XMLHttpRequest".equals(requestedWith)) {
                    isAjax = false;
                }
            }

            if (isAjax) {
                // 백그라운드 폴링, AJAX 요청은 401 코드로 조용히 차단 (무한 알럿 원천 방지)
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"error\":\"Session Expired\"}");
                out.flush();
                return false;
            } else {
                // 실제 브라우저 화면 이동(새로고침 등)일 경우에만 알럿창 띄우고 로그인 페이지로 이동
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('로그인이 필요한 서비스입니다.');");
                out.println("window.top.location.replace('/mng/index.do');");
                out.println("</script>");
                out.flush();
                return false;
            }
        }

        return true;
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