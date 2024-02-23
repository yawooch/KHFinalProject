package com.kr.pawpawtrip.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TripController {
	
	// 여행,관광 조회 페이지
	@GetMapping("/trip/spot")
	public String spot() {
		
		return "trip/spot";
	}
	
	// 숙박 조회 페이지
	@GetMapping("/trip/stay")
	public String stay() {
		
		return "trip/stay";
	}
	
	
}
