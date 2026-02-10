package com.mtf.artixel.config;

import com.mtf.artixel.filter.SecurityHeaderFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // [중요] 아래 경로의 'your_id' 부분은 실제 Cafe24 아이디로 바꿔야 합니다.
        // 리눅스 경로이므로 맨 앞에 '/' 가 있어야 하고, 맨 뒤에도 '/'를 붙여야 합니다.
        // file:/// 접두어는 필수입니다.
        String uploadPath = "file:///artixel/tomcat/webapps/uploads/";

        // 웹 브라우저에서 http://도메인/images/파일이름.jpg 로 접근하면
        // 실제로는 위 경로의 파일을 보여줍니다.
        registry.addResourceHandler("/images/**")
                .addResourceLocations(uploadPath);
    }

    @Bean
    public FilterRegistrationBean<SecurityHeaderFilter> securityHeaderFilter() {
        FilterRegistrationBean<SecurityHeaderFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new SecurityHeaderFilter());
        registrationBean.addUrlPatterns("/*"); // 모든 요청에 적용
        registrationBean.setOrder(1); // 가장 먼저 실행되도록 설정
        return registrationBean;
    }
}