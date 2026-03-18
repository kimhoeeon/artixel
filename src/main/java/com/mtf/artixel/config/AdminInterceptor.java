package com.mtf.artixel.config;

import com.mtf.artixel.mapper.AdminMapper;
import com.mtf.artixel.vo.AdminVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class AdminInterceptor implements HandlerInterceptor {

    private final AdminMapper adminMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        String clientIp = getClientIp(request);

        // 1. 정적 자원은 IP 및 세션 검사 예외 (WebConfig 이중 체크 보완용)
        if (requestURI.startsWith("/mng/assets") || requestURI.startsWith("/mng/css") ||
                requestURI.startsWith("/mng/js") || requestURI.startsWith("/mng/img")) {
            return true;
        }

        // 2. DB 기반 IP 접근 통제 검사
        // admin_access_ips 테이블에 등록된 전체 IP 리스트를 가져옵니다.
        List<String> allowedIps = adminMapper.selectAllAdminAccessIps();

        // 만약 DB에 IP가 단 하나도 등록되어 있지 않다면 치명적이므로 일단 로컬 호스트만 임시 허용하거나
        // 보안 정책에 따라 전체 차단(return false)할 수 있습니다. 현재는 안전하게 등록된 IP가 없을 경우만 차단합니다.
        if (allowedIps == null || allowedIps.isEmpty() || !allowedIps.contains(clientIp)) {
            log.error("🚨 인가되지 않은 IP의 관리자 페이지 접근 차단: IP={} / URI={}", clientIp, requestURI);

            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied: 등록되지 않은 IP입니다.");
            return false; // 컨트롤러 진행 완벽 차단
        }

        // 3. 로그인 및 인덱스 페이지는 세션 검사 예외 (IP 검사는 통과한 상태)
        if (requestURI.startsWith("/mng/index") || requestURI.startsWith("/mng/login")) {
            return true;
        }

        // 4. 관리자 세션 체크
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            log.warn("관리자 비로그인/세션만료 접근 차단: IP={} / URI={}", clientIp, requestURI);

            boolean isAjax = false;
            String requestedWith = request.getHeader("X-Requested-With");
            String accept = request.getHeader("Accept");

            if ("XMLHttpRequest".equalsIgnoreCase(requestedWith) ||
                    (accept != null && accept.toLowerCase().contains("application/json"))) {
                isAjax = true;
            }

            if (isAjax) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session Expired");
            } else {
                response.sendRedirect("/mng/index.do?expired=true");
            }

            return false;
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