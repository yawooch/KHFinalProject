package com.kr.pawpawtrip.admin.controller;

import java.net.URISyntaxException;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.admin.api.AdminApiClient;
import com.kr.pawpawtrip.admin.api.PetTourResponse;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AdminController 
{
	
    private final AdminApiClient adminApiClient; 

	/* 대시보드 화면 이동 */
	@GetMapping("/admin/dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}

	/* 트립 매핑 - 목록 조회  */
	@GetMapping("/admin/tripListApi")
	public ResponseEntity<PetTourResponse> tripListApi(
								@RequestParam(defaultValue = "1") String pageNo,
								@RequestParam(defaultValue = "") String contentId) throws RestClientException, URISyntaxException 
	{
		log.info("pageNo : {}, contentId : {}", pageNo, contentId);

		PetTourResponse response = adminApiClient.apiDetailPetTour(pageNo, contentId);
//		String response = adminApiClient.apiDetailPetTour(pageNo, contentId);

		System.out.println("response : " + response);
		
		return ResponseEntity.ok(response);
	}
	/* 트립 매핑 - 목록 화면으로 이동 */
	@GetMapping("/admin/tripList")
	public ModelAndView tripList(ModelAndView modelAndView) 
	{
		modelAndView.setViewName("/admin/tripList");

		return modelAndView;
	}
	/* 트립 매핑 - 목록 화면으로 이동 */
//	@GetMapping("/admin/tripList")
//    @ResponseBody
//	public ModelAndView tripList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") String pageNo) throws RestClientException, URISyntaxException 
//	{
//		
//		
//		PetTourResponse response = adminApiClient.apiDetailPetTour(pageNo);
//		
//		log.info("response : {}", response);
//		
//		modelAndView.addObject("response", response);
//		modelAndView.setViewName("/admin/tripList");
//
//		return modelAndView;
//	}

	/* 트립 매핑 - 상세 화면으로 이동 */
	@GetMapping("/admin/tripDetail")
	public ModelAndView stayDetail(ModelAndView modelAndView,
							@RequestParam(defaultValue = "") String contentId) 
	{
		System.out.println("contentId : " + contentId);
		
		modelAndView.setViewName("/admin/tripDetail");

		return modelAndView;
	}

	/* 숙소수정 화면 이동 */
	@GetMapping("/admin/stayUpdate")
	public String stayUpdate() {
		return "admin/stayUpdate";
	}

	/* 공지사항입력 화면 이동 */
	@GetMapping("/admin/noticeWrite")
	public String noticeWrite() {
		return "admin/noticeWrite";
	}

	/* 공지사항수정 화면 이동 */
	@GetMapping("/admin/noticeUpdate")
	public String noticeUpdate() {
		return "admin/noticeUpdate";
	}

}
