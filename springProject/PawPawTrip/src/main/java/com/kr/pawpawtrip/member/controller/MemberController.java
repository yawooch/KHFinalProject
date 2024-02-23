package com.kr.pawpawtrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	// �α���
	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}
	
	// �α��� �Ϸ�
	@PostMapping("/login")
	public String loginComplete() {
		
		return "member/login";
	}
	
	// ���̵� ã��
	@GetMapping("/member/find-id")
	public String findId() {
		
		return "member/findId";
	}
	
	// ��й�ȣ ã��
	@GetMapping("/member/find-pw")
	public String findPw() {
		
		return "member/findPw";
	}
	
	// ���������� ȸ����������
	@GetMapping("/member/mypage/my-info")
	public String myInfo() {
		
		return "member/mypage/myInfo";
	}
	
	// ���������� �������Խñ�
	@GetMapping("/member/mypage/my-board")
	public String myBoard() {
		
		return "member/mypage/myBoard";
	}
}
