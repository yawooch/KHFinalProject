package com.kr.pawpawtrip.trip.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Spot {	// DB 테이블명 = TRIP
	
	// 여행 콘텐츠 ID (기본키)
	private int tripContentId;
	
	// 여행지 주소
	private String tripAddress;
	
	// 여행지 이름
	private String tripTitle;
	
	// 지역 코드
	private int areaCode;
	
	// 여행 카테고리 대분류
	private String tripCategory1;
		
	// 여행 카테고리 중분류	
	private String tripCategory2;
	
	// 여행 카테고리 소분류	
	private String tripCategory3;
	
	// 여행 콘텐츠 타입 ID
	private int tripContentTypeId;
	
	// 등록일
	private LocalDate tripCreateTime;
	
	// 수정일
	private LocalDate tripModifyTime;
	
	// 여행 이미지
	private String tripImage;
	
	// x좌표
	private int mapX;
	
	// y좌표
	private int mapY;
	
	// 축척
	private int mapLevel;
	
	// 여행 전화번호
	private String tripTel;
	
	// 시군구 코드
	private int sigunguCode;
}
