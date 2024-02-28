package com.kr.pawpawtrip.community.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.community.model.mapper.CommunityMapper;
import com.kr.pawpawtrip.community.model.vo.Community;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
	private final CommunityMapper communityMapper;

	// 공지사항 리스트 조회
	@Override
	public List<Community> getNoticeList() {
		
		return communityMapper.selectNoticeList();
	}
	
	// 자유게시판 리스트 조회(수다, 마이펫 자랑 포함)
	@Override
	public List<Community> getBoardList() {
		
		return communityMapper.selectBoardList();
	}

	// 게시글 작성
	@Override
	@Transactional
	public int save(Community community) {
		
		int result = 0;
		
		if(community.getCommunityNo() > 0) {
			// 업데이트
		} else {
			// 인서트
			result = communityMapper.insertBoard(community);
		}
		
		return result;
	}

}
