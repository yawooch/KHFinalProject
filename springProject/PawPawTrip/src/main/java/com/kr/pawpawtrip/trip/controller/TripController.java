package com.kr.pawpawtrip.trip.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class TripController {
	private final TripService tripService;
	
	// 여행 조회 페이지(게시물 갯수 조회, 리스트 조회)
	@GetMapping("/trip/spot")
	public ModelAndView spot(ModelAndView modelAndView,
							 @RequestParam(defaultValue = "1") int page) {
		
		// spot을 List객체(spots)로 담기
		List<Spot> spots = null;
		
		// 페이징처리
		PageInfo pageInfo = null;
		
		// 전체 게시물 수 조회
		int listCount = tripService.getSpotCount();
		
		pageInfo = new PageInfo(page, 5, listCount, 9);
		
		// 여행지 리스트 조회
		spots = tripService.getSpotList(pageInfo);
		
		// log.info("Page Number : {}", page );
		// log.info(" Spot List : {}", spots);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("spots", spots);
		modelAndView.setViewName("trip/spot");
		
		return modelAndView;
	}
	
	// 여행 상세 페이지
	@GetMapping("/trip/spot/spotDetail")
	public ModelAndView spotDetail(ModelAndView modelAndView,
								   @RequestParam int id) {
				
		Spot spot = tripService.getSpotById(id);

		// log.info("view - {}", id);
		// log.info("spot - {}", spot);
			
		modelAndView.addObject("spot", spot);
		modelAndView.setViewName("trip/spotDetail");
		
		return modelAndView;
	}
	
	// --------------------------------------------------------------------------------------------
	
	// 숙박 조회 페이지(게시물 갯수 조회, 리스트 조회)
	@GetMapping("/trip/stay")
	public ModelAndView stay(ModelAndView modelAndView,
							 @RequestParam(defaultValue = "1") int page) {
		
		int listCount = tripService.getStayCount();
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 9);
		
		List<Stay> stays = tripService.getStayList(pageInfo);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("stays", stays);
		modelAndView.setViewName("trip/stay");		
		
		return modelAndView;
	}
	
	// 숙박 상세 페이지
	@GetMapping("/trip/stay/stayDetail")
	public String stayDetail() {
		
		return "trip/stayDetail";
	}
}
