package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.mapper.TripMapper;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {
	
	private final TripMapper tripMapper;
	
	// 여행지 전체 게시물 수 조회
	@Override
//	public int getSpotCount(String select, String search) {
	public int getSpotCount() {
		
		return tripMapper.selectSpotCount();
	}
	
	
	// 여행지 전체 조회(선택/검색 기능 포함)
	@Override
//	public List<Spot> getSpotList(PageInfo pageInfo, String select, String search) {
	public List<Spot> getSpotList(PageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return tripMapper.selectSpotList(rowBounds);
	}
	
	// 여행지 상세 조회
	@Override
	public Spot getSpotById(int tripContentId) {
		
		return null;
	}
	
    @Override
    @Transactional
    public int savePetInfo(PetInfo petInfo)
    {
        int result = 0;
        
//        if (!petInfo.getPetinfoContentid().isEmpty()) {
//            // update
//            result = petInfo.updateBoard(petInfo);
//        } else {
//            // insert
//        }
        result = tripMapper.insertPetInfo(petInfo);
        
        return result;
    }
    
    
    @Override
    @Transactional
    public int saveTrip(Spot trip)
    {
        int result = 0;
        
//        if (trip.getTripContentId() > 0) {
//            // update
//            result = petInfo.updateBoard(petInfo);
//        } else {
//            // insert
//        }
        result = tripMapper.insertTrip(trip);
        
        return result;
    }
    
    
    @Override
    @Transactional
    public int saveStay(Stay stay)
    {
        int result = 0;
        
//        if (stay.getStayContentId() > 0) {
//            // update
//            result = petInfo.updateBoard(petInfo);
//        } else {
//            // insert
//        }
        result = tripMapper.insertStay(stay);
        
        return result;
    }
    
    
    @Override
    public int saveComm(Comm comm)
    {
        int result = 0;
        
//      if (stay.getStayContentId() > 0) {
//          // update
//          result = petInfo.updateBoard(petInfo);
//      } else {
//          // insert
//      }
      result = tripMapper.insertComm(comm);
      
      return result;
    }
    
    
    @Override
    public List<PetInfo> getPetTourListByContentId(List<Integer> contentIdList)
    {
        return tripMapper.selectPetInfoByContentId(contentIdList);
    }






}
