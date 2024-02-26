package com.kr.pawpawtrip.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TripController {
	
	// 여행지 조회페이지
	@GetMapping("/trip/spot")
	public String spot() {
		
		return "trip/spot";
	}
	
	// 여행지 상세페이지
	@GetMapping("/trip/spot/detail")
	public String spotDetail() {
		
		return "trip/spotDetail";
	}
	
	// --------------------------------------------------------------------------------------------
	
	// 숙박 조회 페이지
	@GetMapping("/trip/stay")
	public String stay() {
		
		return "trip/stay";
	}
	
	@GetMapping("/trip/stay/detail")
	public String stayDetail() {
		
		return "trip/stayDetail";
	}
	
	
	
}
