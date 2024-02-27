package com.kr.pawpawtrip.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AdminController {

	/* 대시보드 화면 이동 */
	@GetMapping("/admin/dashboard")
	public String dashboard() {
		return "admin/dashboard" ;
	}
	/* 숙소목록 화면 이동 */
	@GetMapping("/admin/stayList")
	public String stay() {
		return "admin/stayList" ;
	}
	/* 숙소상세 화면 이동 */
	@GetMapping("/admin/stayDetail")
	public String stayDetail() {
		return "admin/stayDetail" ;
	}
	/* 숙소수정 화면 이동 */
	@GetMapping("/admin/stayUpdate")
	public String stayUpdate() {
		return "admin/stayUpdate" ;
	}
	/* 공지사항입력 화면 이동 */
	@GetMapping("/admin/noticeWrite")
	public String noticeWrite() {
		return "admin/noticeWrite" ;
	}
	/* 공지사항수정 화면 이동 */
	@GetMapping("/admin/noticeUpdate")
	public String noticeUpdate() {
		return "admin/noticeUpdate" ;
	}
	
}
