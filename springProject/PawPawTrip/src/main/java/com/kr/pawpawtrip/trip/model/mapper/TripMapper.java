package com.kr.pawpawtrip.trip.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

@Mapper
public interface TripMapper {
	
	// 여행지 전제 조회
	List<Spot> selectAll();
	
	// 동물동반 정보 insert
    int insertPetInfo(PetInfo petInfo);

    // Trip insert
    int insertTrip(Spot trip);

    // Stay insert
    int insertStay(Stay stay);
}
