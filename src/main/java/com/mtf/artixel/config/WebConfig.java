package com.mtf.artixel.config;

import com.mtf.artixel.filter.SecurityHeaderFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

    private final AdminInterceptor adminInterceptor;
    private final PageViewInterceptor pageViewInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 1. HTTPS 리디렉션 (viotorydiary와 동일하게 .well-known 제외 적용)
        registry.addInterceptor(new HttpsRedirectInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/.well-known/**", "/css/**", "/js/**", "/img/**", "/assets/**", "/error/**");

        // 2. 관리자 권한 체크 (viotorydiary 원본 WebMvcConfig의 제외 경로 100% 동일 적용)
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/mng/**")
                .excludePathPatterns(
                        "/mng/assets/**",
                        "/mng/css/**",
                        "/mng/js/**",
                        "/mng/img/**",
                        "/mng/login",
                        "/mng/login.do",
                        "/mng/index",
                        "/mng/index.do",
                        "/assets/**", "/css/**", "/js/**", "/img/**" // 루트 리소스 추가
                );

        // 3. 사용자 페이지 접근 시 조회수 추적 (실제 링크 반영)
        registry.addInterceptor(pageViewInterceptor)
                .addPathPatterns("/", "/about", "/product", "/contact");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String uploadPath = "file:///artixel/tomcat/webapps/uploads/";
        registry.addResourceHandler("/images/**").addResourceLocations(uploadPath);
    }

    @Bean
    public FilterRegistrationBean<SecurityHeaderFilter> securityHeaderFilter() {
        FilterRegistrationBean<SecurityHeaderFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new SecurityHeaderFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setOrder(1);
        return registrationBean;
    }
}