package com.kr.pawpawtrip.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TripController {
	
	// 여행 안내 페이지
	@GetMapping("/trip/spot")
	public String spot() {
		
		return "trip/spot";
	}
	
	// 여행 안내 상세 페이지
	@GetMapping("/trip/spot/spotDetail")
	public String spotDetail() {
		
		return "trip/spotDetail";
	}
	
	// --------------------------------------------------------------------------------------------
	
	// 숙소 안내 페이지
	@GetMapping("/trip/stay")
	public String stay() {
		
		return "trip/stay";
	}
	
	// 숙소 안내 상세 페이지
	@GetMapping("/trip/stay/stayDetail")
	public String stayDetail() {
		
		return "trip/stayDetail";
	}
	
	
	
}
