package com.kr.pawpawtrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginComplete() {
		
		return "member/login";
	}
	
	@GetMapping("/member/find-id")
	public String findId() {
		
		return "member/findId";
	}
	
	@GetMapping("/member/find-pw")
	public String findPw() {
		
		return "member/findPw";
	}
	
}
