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
	
	// ���̵� ã�� �Ϸ�
	@PostMapping("/member/find-id")
	public String findIdComplete() {
		
		return "member/findIdComplete";
	}
	
	// ��й�ȣ ã��
	@GetMapping("/member/find-pw")
	public String findPw() {
		
		return "member/findPw";
	}
	
	// ��й�ȣ ����
	@PostMapping("member/find-pw")
	public String changePw() {
		
		return "member/changePw";
	}
	
	// ��й�ȣ ã�� �Ϸ�
	@PostMapping("/member/change-pw")
	public String findPwComplete() {
		
		return "member/findPwComplete";
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
	
	// 회원가입
	@GetMapping("/enroll")
	public String enroll() {
		
		return "member/enroll";
	}
	
	// 회원가입 완료(수정예정)
	@GetMapping("/enroll/complete")
	public String enrollComplete() {
		
		return "member/enrollComplete";
	}
	
}
