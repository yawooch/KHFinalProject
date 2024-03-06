package com.kr.pawpawtrip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.member.model.service.MemberService;
import com.kr.pawpawtrip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired // 빈을 만들어 주입
	private MemberService service;
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}
	
	// SessionAttributes와 ModelAndView(데이터와 뷰에 대한 정보를 담는 객체) 객체를 사용
	// 로그인
	@PostMapping("/login")
	public ModelAndView login(ModelAndView modelAndView,
							  HttpSession session,
							  @RequestParam String memberId,
							  @RequestParam String memberPw) {
		
		// 로그인 후 바로 메인화면으로 이동 (좌측 상단 로그인 > 로그아웃)
//		modelAndView.setViewName("redirect:/");
		
		log.info("login() 호출 - {}, {}", memberId, memberPw);
		
		Member loginMember = service.login(memberId, memberPw);
		
		System.out.println("loginMember : " + loginMember);
		
		if (loginMember != null) {
			modelAndView.setViewName("redirect:/");
			session.setAttribute("loginMember", loginMember);
		} else {
			modelAndView.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("common/msg");
		}
		
		System.out.println("loginMember : " + loginMember);
		
		return modelAndView;
	}
	
	// 로그아웃(SessionStatus 객체 사용)
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		// 세션 영역으로 확장된 Attribute를 지워준다.
		status.setComplete();
		
		return "redirect:/";
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
	
	// 회원가입 화면
	@GetMapping("/enroll")
	public String enroll() {
		
		return "member/enroll";
	}
	
	// 회원가입
	@PostMapping("/enroll")
	public ModelAndView enroll(ModelAndView modelAndView, Member member) {
		log.info("enroll() 호출 - 회원 가입 페이지 호출");
		
		int result = service.save(member);
		
		if (result > 0) {
			// 회원가입 성공 페이지로 이동
			modelAndView.addObject("location", "/member/complete");
			modelAndView.setViewName("member/enrollComplete");
		} else {
			modelAndView.addObject("msg", "회원 가입 실패");
			modelAndView.addObject("location", "/enroll");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	// 회원가입 완료창
	@GetMapping("/member/complete")
	public String enrollComplete() {
		
		return "member/enrollComplete";
	}
}
