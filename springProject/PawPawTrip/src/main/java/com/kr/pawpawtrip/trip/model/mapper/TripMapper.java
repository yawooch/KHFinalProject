package com.kr.pawpawtrip.trip.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kr.pawpawtrip.trip.model.vo.Spot;

@Mapper
public interface TripMapper {
	
	// 여행지 전제 조회
	List<Spot> selectAll();
}
