package com.kr.pawpawtrip.admin.controller;

import java.net.URISyntaxException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	/* 트립목록 화면 이동 */
	@GetMapping("/admin/tripList")
    @ResponseBody
	public ModelAndView stay(ModelAndView modelAndView, @RequestParam(defaultValue = "1") String pageNo) throws RestClientException, URISyntaxException {
//	public ModelAndView stay(ModelAndView modelAndView, @RequestParam(defaultValue = "1") String pageNo){
//		List<City> cities = weatherService.getCities();

		PetTourResponse response = adminApiClient.apiDetailPetTour(pageNo);

//response.setWeatherItems(null);

//		modelAndView.addObject("cities", cities);
		
		log.info("response : {}", response);
		
		modelAndView.addObject("response", response);
		modelAndView.setViewName("/admin/tripList");

		return modelAndView;
	}

	/* 숙소상세 화면 이동 */
	@GetMapping("/admin/stayDetail")
	public String stayDetail() {
		return "admin/stayDetail";
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
