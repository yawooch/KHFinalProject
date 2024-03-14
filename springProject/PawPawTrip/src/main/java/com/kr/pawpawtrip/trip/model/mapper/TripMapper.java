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
	
	// 관광지 게시물 수 조회
	int selectSpotCount(@Param("selectArea")    String selectArea,
						@Param("searchKeyword") String searchKeyword);
	
	// 관광지 리스트 조회
	List<Spot> selectSpotList(RowBounds rowBounds, @Param("selectArea")    String selectArea, 
							  					   @Param("searchKeyword") String searchKeyword);
	
	// 관광지 API 이미지 저장
	int updateSpotApiImage(@Param("id") int id, @Param("apiImageURL") String apiImageURL);
	
	// 관광지 상세 조회(콘텐츠 ID 사용)
	Spot selectSpotById(@Param("id") int id);
	
	// 숙소 게시물 수 조회
	int selectStayCount(@Param("selectArea") String selectArea, 
						@Param("searchKeyword") String searchKeyword);
	
	// 숙소 리스트 조회
	List<Stay> selectStaytList(RowBounds rowBounds, @Param("selectArea") String selectArea, 
												    @Param("searchKeyword") String searchKeyword);
	
	// 숙소 API 이미지 저장
	int updateStayApiImage(int id, String apiImageURL);
	
	// 숙소 상세 조회
	Stay selectStayById(@Param("id") int id);
	
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
