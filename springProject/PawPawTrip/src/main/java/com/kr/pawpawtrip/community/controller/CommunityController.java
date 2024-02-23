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
}
