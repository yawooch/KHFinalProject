package com.kr.pawpawtrip.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TripController {
	
	// ���� �ȳ� ������
	@GetMapping("/trip/spot")
	public String spot() {
		
		return "trip/spot";
	}
	
	// ���� �ȳ� �� ������
	@GetMapping("/trip/spot/spotDetail")
	public String spotDetail() {
		
		return "trip/spotDetail";
	}
	
	// --------------------------------------------------------------------------------------------
	
	// ���� �ȳ� ������
	@GetMapping("/trip/stay")
	public String stay() {
		
		return "trip/stay";
	}
	
	// ���� �ȳ� �� ������
	@GetMapping("/trip/stay/stayDetail")
	public String stayDetail() {
		
		return "trip/stayDetail";
	}
	
	
	
}
