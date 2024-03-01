package com.kr.pawpawtrip.community.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.mapper.CommunityMapper;
import com.kr.pawpawtrip.community.model.vo.Community;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
	private final CommunityMapper communityMapper;

	// 전체 게시글 수(공지사항 제외)
	@Override
	public int getBoardCount(String select, String search) {
		
		return communityMapper.selectBoardCount(select, search);
	}
	
	// 공지사항 리스트 조회
	@Override
	public List<Community> getNoticeList() {
		
		return communityMapper.selectNoticeList();
	}
	
	// 전체 리스트 조회(검색기능 포함)
	@Override
	public List<Community> getBoardList(PageInfo pageInfo, String select, String search) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return communityMapper.selectBoardList(rowBounds, select, search);
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
