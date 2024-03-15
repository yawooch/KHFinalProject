package com.kr.pawpawtrip.trip.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyTrip {
	
	// 컨텡츠 아이디
	private int contentId;
	
	// 멤버번호
	private int memberNo;
	
	// 숙소 객체
	private List<Stay> stays;
	
	// 관광지 객체
	private List<Spot> spots;
}
