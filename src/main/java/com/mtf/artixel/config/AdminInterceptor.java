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
        HttpSession session = request.getSession();
        AdminVO admin = (AdminVO) session.getAttribute("admin");

        // 관리자 세션이 없을 경우 (로그인 안 했거나 세션 만료)
        if (admin == null) {

            // 1. 현재 요청이 비동기 통신(AJAX)인지 헤더를 통해 판별합니다.
            String ajaxHeader = request.getHeader("X-Requested-With");
            String acceptHeader = request.getHeader("Accept");

            boolean isAjax = "XMLHttpRequest".equals(ajaxHeader) ||
                    (acceptHeader != null && acceptHeader.contains("application/json"));

            if (isAjax) {
                // AJAX 요청인 경우: 무한 스크립트 실행 방지를 위해 401 에러 상태 코드만 조용히 반환
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Ajax request requires login.");
            } else {
                // 일반 페이지 요청인 경우: 경고창을 띄우고 로그인 페이지로 이동
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                // iframe 등 프레임 내부에 갇혀서 얼럿이 뜨는 것을 막기 위해 top.location.href 사용
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); top.location.href='/mng/index.do';</script>");
                out.flush();
            }

            // 컨트롤러로의 접근을 완벽히 차단
            return false;
        }

        // 세션이 유효하다면 정상 통과
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