package com.kr.pawpawtrip.community.model.service;

import java.util.List;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.vo.Community;

public interface CommunityService {
	
	// 공지사항 수
	int getNoticeCount(String select, String search);
	
	// 전체 게시글 수
	int getBoardCount(String select, String search);
	
	// 수다 게시글 수
	int getBoardTalkCount(String select, String search);
	
	// 마이펫 게시글 수
	int getBoardMypetCount(String select, String search);

	// 공지사항 리스트 조회
	List<Community> getNoticeList(PageInfo pageInfo, String select, String search);

	// 전체 리스트 조회(검색기능 포함)
	List<Community> getBoardList(PageInfo pageInfo, String select, String search);
	
	// 수다 리스트 조회(검색기능 포함)
	List<Community> getBoardTalkList(PageInfo pageInfo, String select, String search);
	
	// 마이펫 리스트 조회(검색기능 포함)
	List<Community> getBoardMypetList(PageInfo pageInfo, String select, String search);
	
	// 자유 게시판(수다) 상세 조회
	Community getBoardNo(int no);
	
	// 게시글 작성,수정
	int save(Community community);

	// 게시글 삭제
	int delete(int no);

}
