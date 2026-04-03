package com.mtf.artixel.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {

    @GetMapping("/")
    public String mainPage() {
        return "main";
    }

    @GetMapping("/about")
    public String about() {
        return "about/about";
    }

    @GetMapping("/product")
    public String product() {
        return "product/product";
    }

    @GetMapping("/contact")
    public String contactForm() {
        return "contact/contact";
    }

    // ==========================================
    // 영문(English) 페이지 매핑
    // ==========================================

    @GetMapping("/en")
    public String mainEn() {
        return "en/main";
    }

    @GetMapping("/en/about")
    public String aboutEn() {
        return "en/about/about";
    }

    @GetMapping("/en/product")
    public String productEn() {
        return "en/product/product";
    }

    @GetMapping("/en/contact")
    public String contactEn() {
        return "en/contact/contact";
    }

}