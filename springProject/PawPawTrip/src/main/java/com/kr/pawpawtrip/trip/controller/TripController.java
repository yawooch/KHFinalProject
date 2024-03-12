package com.kr.pawpawtrip.trip.controller;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.api.CommonApiClient;
import com.kr.pawpawtrip.common.api.item.DetailImageItem;
import com.kr.pawpawtrip.common.api.response.DetailImageResponse;
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
	private final CommonApiClient commonApiClient;
	
	// 여행 조회 페이지(게시물 갯수 조회, 리스트 조회)
	@GetMapping("/trip/spot")
	public ModelAndView spot(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
							 							@RequestParam(defaultValue = "") String selectArea,
							 							@RequestParam(defaultValue = "") String searchKeyword) throws RestClientException, URISyntaxException {
		
		// 전체 게시물 수 조회
		int listCount = tripService.getSpotCount(selectArea, searchKeyword);
		
		// 페이징처리
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 9);
		
		// spot을 List객체(spots)로 담아 여행지 리스트 조회
		List<Spot> spots = tripService.getSpotList(pageInfo, selectArea, searchKeyword);
		
		// 이미지 대체 조건
		// 	1. spot 객체에 저장된 image데이터가 없을 경우, api에서 조회한 이미지로 대체
		// 	2. api에서도 없을 경우, 지정 URL 노출
		for (Spot spot : spots) {
			String tripImageURL = "";			
			
			// Spot객체에서 얻은 이미지 데이터값이 "-"라면, API에서 조회한 이미지 URL 사용 
			if (spot.getTripImage().equals("-")) {
				
				// 이미지 API 호출 + 예외던지기
				DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(spot.getTripContentId() , 1);
				List<DetailImageItem> detailImageItems = detailImageResponse.getDetailImageItems();
				
				for (DetailImageItem detailImageItem : detailImageItems) {
					
					// System.out.println("***************************************************************************");
					// System.out.println(detailImageItem.getOriginimgurl());
					
					tripImageURL = detailImageItem.getOriginimgurl();
					spot.setTripImage(tripImageURL);
					
					// Spot 객체의 이미지 데이터값이 없고, API 이미지에도 데이터가 존재하지 않을 때(둘 다 데이터가 없을 때)
					if(detailImageItem.getOriginimgurl() == null) {
						
						// tripImageURL = "https://i.ibb.co/9tKP6gJ/image.jpg";
						tripImageURL = "/pawpawtrip/img/common/replacedImage.png";
						
						spot.setTripImage(tripImageURL);
					}
				}
			}				
		}
		
		// 지역 선택
		List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");
		
		// 검색 (지역, 키워드)
		Map<String, String> map = new HashMap<>();
		map.put("selectArea", selectArea);
		map.put("searchKeyword", searchKeyword);
		
		// log.info("Area Option Values : {}", searchAreaOptions);
		// log.info("Page Number : {}", page );
		// log.info(" Spot List : {}", spots);
		// log.info("searchKeyword : {}", searchKeyword);
		// log.info("selectArea : {}", selectArea);
		// log.info("searchAreaOptions : {}", searchAreaOptions);
		// log.info("pageInfo : {} ", pageInfo);
		// log.info("listCount : {} ", listCount);
		
		spots.stream().forEach(System.out::println);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("spots", spots);
		modelAndView.addObject("selectAndSearch", map);
		modelAndView.addObject("searchAreaOptions", searchAreaOptions);
		modelAndView.setViewName("trip/spot");
		
		return modelAndView;
	}
	
	// 여행 상세 페이지
	@GetMapping("/trip/spot/spotDetail")
	public ModelAndView spotDetail(ModelAndView modelAndView, @RequestParam int id) throws RestClientException, URISyntaxException {
				
		// int contentid = id;
		String slideImageURL = null;
		Spot spot = tripService.getSpotById(id);
		
		// 콘텐츠 ID값을 이용하여 응답 부분 호출 
		DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(id, 5);
		List<DetailImageItem> detailImageItems = detailImageResponse.getDetailImageItems();
		
		// log.info("detailImageItems.size() : {}" ,detailImageItems.size());
		
		
		for (DetailImageItem detailImageItem : detailImageItems) {
			slideImageURL = detailImageItem.getOriginimgurl();
			
			// API에서 조회된 이미지가 없을 시, 사용할 대체 이미지 지정
			if (slideImageURL == null) {
				detailImageItem.setOriginimgurl(spot.getTripImage());
				
				if (spot.getTripImage().equals("-")) {
					detailImageItem.setOriginimgurl("/pawpawtrip/img/common/replacedImage.png");
				}
			}
		}

		// log.info("detailImageItem.setOriginimgurl(slideImageURL) : {}" ,detailImageItems.get(0).getOriginimgurl());
		// log.info("view - {}", id);
		// log.info("spot - {}", spot);
		// log.info("imageResponse : {}",imageResponse);
		// log.info("detailImageItems : {}", detailImageItems);
		
		modelAndView.addObject("spot", spot);
		modelAndView.addObject("detailImageItems", detailImageItems);
		modelAndView.setViewName("trip/spotDetail");
		
		return modelAndView;
	}
	
	// 숙박 조회 페이지(게시물 갯수 조회, 리스트 조회)
	@GetMapping("/trip/stay")
	public ModelAndView stay(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
														@RequestParam(defaultValue = "") String selectArea,
														@RequestParam(defaultValue = "") String searchKeyword) throws RestClientException, URISyntaxException {
		
		int listCount = tripService.getStayCount(selectArea, searchKeyword);
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 9);
		
		List<Stay> stays = tripService.getStayList(pageInfo, selectArea, searchKeyword);
		
		List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");
		
		for (Stay stay : stays) {
			String stayImageURL = "";
			
			if (stay.getStayImage().equals("-")) {
				DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(stay.getStayContentId(), 1);
				List<DetailImageItem> detailImageItems = detailImageResponse.getDetailImageItems();
				
				for (DetailImageItem detailImageItem : detailImageItems) {
					
					stayImageURL = detailImageItem.getOriginimgurl();
					stay.setStayImage(stayImageURL);
					
					if (stayImageURL == null) {
						stay.setStayImage("/pawpawtrip/img/common/replacedImage.png");
					}
				}
			}
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("selectArea", selectArea);
		map.put("searchKeyword", searchKeyword);
		
		modelAndView.addObject("stays", stays);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("searchAreaOptions", searchAreaOptions);
		modelAndView.addObject("searchKeyword", map);
		modelAndView.setViewName("trip/stay");		
		
		return modelAndView;
	}
	
	// 숙박 상세 페이지
	@GetMapping("/trip/stay/stayDetail")
	public ModelAndView stayDetail(ModelAndView modelAndView, @RequestParam int id) throws RestClientException, URISyntaxException {
		
		String slideImageURL = null;
		Stay stay = tripService.getStayById(id);
		
		DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(id, 5);
		List<DetailImageItem> detailImageItems = detailImageResponse.getDetailImageItems();
		
		for (DetailImageItem detailImageItem : detailImageItems) {
			slideImageURL = detailImageItem.getOriginimgurl();
			
			if (slideImageURL == null) {
				detailImageItem.setOriginimgurl(stay.getStayImage());
				
				if (stay.getStayImage().equals("-")) {
					detailImageItem.setOriginimgurl("/pawpawtrip/img/common/replacedImage.png");
				}
			}
		}
		
		//modelAndView.addObject("stay", stay);
		modelAndView.addObject(stay);
		modelAndView.addObject("detailImageItems", detailImageItems);
		modelAndView.setViewName("trip/stayDetail");
		
		return modelAndView;
	}
}