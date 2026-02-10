package com.mtf.artixel.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    // [추가] 생성자: 서버 시작 시 이 로그가 찍혀야 정상입니다.
    public SecurityConfig() {
        System.out.println("=======================================");
        System.out.println(">>>> SecurityConfig가 로딩되었습니다! <<<<");
        System.out.println("=======================================");
    }

    // Spring Security의 기본 로그인 화면 및 차단 기능을 해제합니다.
    // 기존 인터셉터(AdminInterceptor 등)가 로그인 체크를 수행하므로 여기서는 문을 열어둡니다.
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf().disable() // CSRF 보안 해제
                .formLogin().disable() // 기본 로그인 페이지 사용 안 함
                .headers().frameOptions().disable() // h2-console 등 iframe 허용
                .and()
                .authorizeRequests()
                // [핵심] 정적 리소스와 manifest 파일은 누구나 접근 가능하게 허용
                .antMatchers("/**").permitAll() // [중요] 모든 경로에 대해 누구나 접근 허용
                .anyRequest().permitAll(); // 나머지 요청도 일단 허용 (보안은 Interceptor에서 처리하므로)

        return http.build();
    }

    // PasswordEncoder Bean 등록
    // AdminService에서 @Autowired PasswordEncoder를 사용할 수 있게 해줍니다.
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}