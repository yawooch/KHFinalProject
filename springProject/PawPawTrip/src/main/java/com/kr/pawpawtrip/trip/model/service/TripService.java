package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

public interface TripService {
	
	// 여행지 전체 게시물 수 조회
	int getSpotCount(String selectArea, String searchKeyword);
	
	// 여행지 리스트 조회 
	List<Spot> getSpotList(PageInfo pageInfo, String selectArea, String searchKeyword);
	
	// 여행지 상세 조회(여행지 ID 사용)
	Spot getSpotById(int id);
	
	// 숙박 전체 게시물 수 조회
	int getStayCount();
	
	// 숙박 리스트 조회
	List<Stay> getStayList(PageInfo pageInfo);
	
	// 숙박 상세 조회(숙박 ID 사용) 
	Stay getStayById(int id);
	
	//반려동물 동반정보 수정/저장
    int savePetInfo(PetInfo petInfo);

    //Trip 수정/저장
    int saveTrip(Spot trip);

    //Stay 수정/저장
    int saveStay(Stay stay);

    int saveComm(Comm comm);

    List<PetInfo> getPetTourListByContentIds(List<Integer> contentIdList);
    
    PetInfo getPetTourByContentId(int contentId);


	



}
