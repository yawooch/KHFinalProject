package com.kh.pawpawtrip.controller.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TemplateController {

    @GetMapping("/about")
    public String about()
    {
        log.info("about() = 호출");

        return "temp/about";
    }
    @GetMapping("/shop")
    public String shop()
    {
    	log.info("shop() = 호출");
    	
    	return "temp/shop";
    }
    @GetMapping("/contact")
    public String contact()
    {
    	log.info("contact() = 호출");
    	
    	return "temp/contact";
    }
    @GetMapping("/shop-single")
    public String shopSsingle()
    {
    	log.info("shop-single() = 호출");
    	
    	return "temp/shop-single";
    }
}
