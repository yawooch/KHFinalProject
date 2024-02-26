package com.kr.pawpawtrip.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

//	공지사항
	@GetMapping("/community/notice")
	public String notice() 
	{
		return "community/notice";
	}
	
//	자유 게시판
	@GetMapping("/community/board")
	public String board() {
		
		return "community/board";
	}
	
//	자유 게시판 > 수다
	@GetMapping("community/board/talk")
	public String talk() {
		
		return "community/board/talk";
	}
	
//	자유 게시판 > 마이펫 자랑
	@GetMapping("community/board/mypet")
	public String mypet() {
		
		return "community/board/mypet";
	}
	
//	게시글 작성
	@GetMapping("community/boardwrite")
	public String boardWrite() {
		
		return "community/boardwrite";
	}
	
//	공지사항 상세
	@GetMapping("community/noticedetail")
	public String noticeDetail() {
		
		return "community/noticedetail";
	}
	
//	자유 게시판(수다) 상세
	@GetMapping("community/board/talkdetail")
	public String talkDetail() {
		
		return "community/board/talkdetail";
	}
	
//	자유 게시판(마이펫 자랑) 상세
	@GetMapping("community/board/mypetdetail")
	public String mypetDetail() {
		
		return "community/board/mypetdetail";
	}
}




















