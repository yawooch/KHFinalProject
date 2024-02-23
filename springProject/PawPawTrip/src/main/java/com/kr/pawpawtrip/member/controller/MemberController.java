package com.kr.pawpawtrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}
	
	// 로그인 완료
	@PostMapping("/login")
	public String loginComplete() {
		
		return "member/login";
	}
	
	// 아이디 찾기
	@GetMapping("/member/find-id")
	public String findId() {
		
		return "member/findId";
	}
	
	// 비밀번호 찾기
	@GetMapping("/member/find-pw")
	public String findPw() {
		
		return "member/findPw";
	}
	
	// 마이페이지 회원정보수정
	@GetMapping("/member/mypage/my-info")
	public String myInfo() {
		
		return "member/mypage/myInfo";
	}
	
	// 마이페이지 내가쓴게시글
	@GetMapping("/member/mypage/my-board")
	public String myBoard() {
		
		return "member/mypage/myBoard";
	}
}
