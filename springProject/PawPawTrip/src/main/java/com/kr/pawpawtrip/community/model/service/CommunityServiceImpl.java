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
	public int getBoardCount() {
		
		return communityMapper.selectBoardCount();
	}
	
	// 공지사항 리스트 조회
	@Override
	public List<Community> getNoticeList() {
		
		return communityMapper.selectNoticeList();
	}
	
	// 자유게시판 리스트 조회(수다, 마이펫 자랑 포함)
	@Override
	public List<Community> getBoardList(PageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		int currentPage = pageInfo.getCurrentPage();
		
		System.out.println("현재 페이지 : " + currentPage);
		
		return communityMapper.selectBoardListFirstPage(rowBounds);
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
