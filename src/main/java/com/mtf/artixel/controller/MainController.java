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

    @GetMapping("/about/about")
    public String about_about() {
        return "about/about";
    }

    @GetMapping("/product/product")
    public String product_product() {
        return "product/product";
    }

}