package com.mtf.artixel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ComponentScan(basePackages = {"com.mtf.artixel", "com.mtf.artixel.config"})
public class ArtixelApplication extends SpringBootServletInitializer {

	// [중요] 톰캣이 실행될 때 이 메서드를 가장 먼저 찾아서 실행합니다.
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ArtixelApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(ArtixelApplication.class, args);
	}

}