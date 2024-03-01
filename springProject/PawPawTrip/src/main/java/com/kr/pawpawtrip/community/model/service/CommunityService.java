package com.kr.pawpawtrip.community.model.service;

import java.util.List;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.vo.Community;

public interface CommunityService {
	
	// 전체 게시글 수
	int getBoardCount(String select, String search);

	// 공지사항 리스트 조회
	List<Community> getNoticeList();

	// 전체 리스트 조회(검색기능 포함)
	List<Community> getBoardList(PageInfo pageInfo, String select, String search);
	
	// 게시글 작성
	int save(Community community);

}
