package com.kr.pawpawtrip.trip.controller;

import java.util.List;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.Spot;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class TripController {
	private final TripService tripService;
	
	private final ResourceLoader resourceLoader;
	
	// 여행 조회 페이지
	@GetMapping("/trip/spot")
	public ModelAndView spot(ModelAndView modelAndView) {
		List<Spot> spots = null;
		
		spots = tripService.getSpotList();
		
		log.info(" Spot List : {}", spots);
		
		modelAndView.addObject("spots", spots);
		modelAndView.setViewName("trip/spot");	// 이동할 view
		
		return modelAndView;
	}
	
	// 여행 상세 페이지
	@GetMapping("/trip/spot/spotDetail")
	public String spotDetail() {
		
		return "trip/spotDetail";
	}
	
	// --------------------------------------------------------------------------------------------
	
	// 숙박 조회 페이지
	@GetMapping("/trip/stay")
	public String stay() {
		
		return "trip/stay";
	}
	
	// 숙박 상세 페이지
	@GetMapping("/trip/stay/stayDetail")
	public String stayDetail() {
		
		return "trip/stayDetail";
	}
	
	
	
}
