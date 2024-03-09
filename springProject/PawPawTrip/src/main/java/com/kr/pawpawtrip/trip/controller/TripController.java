package com.kr.pawpawtrip.trip.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.model.service.CommonService;
import com.kr.pawpawtrip.common.model.vo.CommonArea;
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
	private final CommonService commonService;
	
	// 여행 조회 페이지(게시물 갯수 조회, 리스트 조회)
	@GetMapping("/trip/spot")
	public ModelAndView spot(ModelAndView modelAndView,
							 @RequestParam(defaultValue = "1") int page,
							 @RequestParam(defaultValue = "") String selectArea,
							 @RequestParam(defaultValue = "") String searchKeyword) {
		
		// 전체 게시물 수 조회
		int listCount = tripService.getSpotCount(selectArea, searchKeyword);
		
		// 페이징처리
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 9);
		
		// spot을 List객체(spots)로 담아 여행지 리스트 조회
		List<Spot> spots = tripService.getSpotList(pageInfo, selectArea, searchKeyword);
		
		// 지역 선택
		List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");
		
		// 검색 (지역, 키워드)
		Map<String, String> map = new HashMap<>();
		map.put("selectArea", selectArea);
		map.put("searchKeyword", searchKeyword);
		
		// log.info("Area Option Values : {}", searchAreaOptions);
		// log.info("Page Number : {}", page );
		// log.info(" Spot List : {}", spots);
		log.info("searchKeyword : {}", searchKeyword);
		log.info("selectArea : {}", selectArea);
		log.info("searchAreaOptions : {}", searchAreaOptions);
		log.info("pageInfo : {} ", pageInfo);
		log.info("listCount : {} ", listCount);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("spots", spots);
		modelAndView.addObject("selectAndSearch", map);
		modelAndView.addObject("searchAreaOptions", searchAreaOptions);
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
		
		List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");
		
		modelAndView.addObject("searchAreaOptions", searchAreaOptions);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("stays", stays);
		modelAndView.setViewName("trip/stay");		
		
		return modelAndView;
	}
	
	// 숙박 상세 페이지
	@GetMapping("/trip/stay/stayDetail")
	public ModelAndView stayDetail(ModelAndView modelAndView,
								   @RequestParam int id) {
		
		Stay stay = tripService.getStayById(id);
		
		//modelAndView.addObject("stay", stay);
		modelAndView.addObject(stay);
		modelAndView.setViewName("trip/stayDetail");
		
		return modelAndView;
	}
}
