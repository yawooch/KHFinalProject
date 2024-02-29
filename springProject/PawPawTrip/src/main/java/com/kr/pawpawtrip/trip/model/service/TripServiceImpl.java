package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kr.pawpawtrip.trip.model.mapper.TripMapper;
import com.kr.pawpawtrip.trip.model.vo.Spot;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {
	
	private final TripMapper tripMapper;
	
	// 여행지 전체 조회
	@Override
	public List<Spot> getSpotList() {
		
		return tripMapper.selectAll();
	}
}
