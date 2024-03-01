package com.kr.pawpawtrip.trip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.trip.model.mapper.TripMapper;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

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
}
