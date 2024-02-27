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
	
	// 아이디 찾기 완료
	@PostMapping("/member/find-id")
	public String findIdComplete() {
		
		return "member/findIdComplete";
	}
	
	// 비밀번호 찾기
	@GetMapping("/member/find-pw")
	public String findPw() {
		
		return "member/findPw";
	}
	
	// 비밀번호 변경
	@PostMapping("member/find-pw")
	public String changePw() {
		
		return "member/changePw";
	}
	
	// 비밀번호 변경 완료
	@PostMapping("/member/change-pw")
	public String findPwComplete() {
		
		return "member/findPwComplete";
	}
	
	// 마이페이지 - 회원 정보 수정
	@GetMapping("/member/mypage/my-info")
	public String myInfo() {
		
		return "member/mypage/myInfo";
	}
	
	// 마이페이지 - 내가 쓴 게시글
	@GetMapping("/member/mypage/my-board")
	public String myBoard() {
		
		return "member/mypage/myBoard";
	}
	
	// 회원가입
	@GetMapping("/enroll")
	public String enroll() {
		
		return "member/create";
	}
	
	// 회원가입 완료(수정예정)
	@PostMapping("/enroll")
	public String enrollComplete() {
		
		return "member/enrollComplete";
	}
	
}
