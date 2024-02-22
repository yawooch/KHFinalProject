package com.kr.pawpawtrip.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

	@GetMapping("/community/notice")
	public String notice() 
	{
		return "community/notice";
	}
}
