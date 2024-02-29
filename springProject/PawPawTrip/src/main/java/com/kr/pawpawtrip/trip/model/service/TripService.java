package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import com.kr.pawpawtrip.trip.model.vo.Spot;

public interface TripService {
	
	// 여행지 조회 
	List<Spot> getSpotList();

}
