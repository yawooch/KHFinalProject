package com.kr.pawpawtrip;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@GetMapping("/template/main")
	public String main() {
		return "template/main" ;
	}
	@GetMapping("/template/about")
	public String about() {
		return "template/about" ;
	}
	@GetMapping("/template/contact")
	public String contact() {
		return "template/contact" ;
	}
	@GetMapping("/template/shop")
	public String shop() {
		return "template/shop" ;
	}
	@GetMapping("/template/shopSingle")
	public String shopSingle() {
		return "template/shopSingle" ;
	}

	@GetMapping("/common/template")
	public String template() {
		return "common/template" ;
	}
	@GetMapping("/common/error")
	public String error() {
		return "common/error" ;
	}
	
}
