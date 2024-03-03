package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

public interface TripService {
	
	// 여행지 전체 게시물 수 조회
	int getSpotCount(String select, String search);
	
	// 여행지 조회 
	List<Spot> getSpotList(PageInfo pageInfo, String select, String search);
	
	//반려동물 동반정보 수정/저장
    int savePetInfo(PetInfo petInfo);

    //Trip 수정/저장
    int saveTrip(Spot trip);

    //Stay 수정/저장
    int saveStay(Stay stay);

    int saveComm(Comm comm);

    List<PetInfo> getPetTourListByContentId(List<Integer> contentIdList);


}
