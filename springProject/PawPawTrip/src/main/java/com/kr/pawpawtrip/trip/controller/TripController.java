package com.kr.pawpawtrip.trip.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.PageInfo;
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
	public ModelAndView spot(ModelAndView modelAndView,
							 @RequestParam(defaultValue = "1") int page,
							 @RequestParam(defaultValue = "") String select,
							 @RequestParam(defaultValue = "") String search) {
		
		// spot을 List객체(spots)로 담기
		List<Spot> spots = null;
		
	    /**
	    * @param currentPage 현재 페이지
	    * @param pageLimit 한 페이지에 보이는 페이지의 수 
	    * @param listCount 전체 리스트의 수
	    * @param listLimit 한 페이지에 표시될 리스트의 수
	    */
		
		// 페이징처리
		PageInfo pageInfo = null;
		
		// 전체 게시물 수
		int listCount = 0;
		
		// 검색할 때 전달되는 파라미터를 Hashmap객체에 담기 
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("select", select);	// 지역 선택
		map.put("search", search);	// 검색 기능
		
		// select(지역선택)와 search(검색)를 매개변수로 하여 여행지 게시물 수 조회
		listCount = tripService.getSpotCount(select, search);
		pageInfo = new PageInfo(page, 5, listCount, 9);
		
		// 여행지 리스트 조회
		spots = tripService.getSpotList(pageInfo, select, search);
		
		log.info(" Spot List : {}", spots);
		
		modelAndView.addObject("searchInfoMap", map);
		modelAndView.addObject("pageInfo", pageInfo);
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
	public ModelAndView stay(ModelAndView modelAndView) {
		
		
		
		return modelAndView;
	}
	
	// 숙박 상세 페이지
	@GetMapping("/trip/stay/stayDetail")
	public String stayDetail() {
		
		return "trip/stayDetail";
	}
	
	
	
}
