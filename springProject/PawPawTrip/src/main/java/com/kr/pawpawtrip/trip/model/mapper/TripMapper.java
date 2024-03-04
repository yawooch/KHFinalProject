package com.kr.pawpawtrip.trip.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

@Mapper
public interface TripMapper {
	
	// 여행지 게시글 수 조회
	int selectSpotCount();
	
	// 여행지 전제 조회
	List<Spot> selectSpotList(RowBounds rowBounds);
	
	// 여행지 상세 조회
	Spot selectSpotById(@Param("id") int id);
	
	// 동물동반 정보 insert
    int insertPetInfo(PetInfo petInfo);

    // Trip insert
    int insertTrip(Spot trip);

    // Stay insert
    int insertStay(Stay stay);

    int insertComm(Comm comm);

    List<PetInfo> selectPetInfoByContentIds(@Param("contentIdList") List<Integer> contentIdList);
    
    PetInfo selectPetInfoByContentId(@Param("contentId") int contentId);
}
