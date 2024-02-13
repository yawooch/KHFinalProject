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
        log.info("about() = ȣ��");

        return "temp/about";
    }
    @GetMapping("/shop")
    public String shop()
    {
    	log.info("shop() = ȣ��");
    	
    	return "temp/shop";
    }
    @GetMapping("/contact")
    public String contact()
    {
    	log.info("contact() = ȣ��");
    	
    	return "temp/contact";
    }
    @GetMapping("/shop-single")
    public String shopSsingle()
    {
    	log.info("shop-single() = ȣ��");
    	
    	return "temp/shop-single";
    }
}
