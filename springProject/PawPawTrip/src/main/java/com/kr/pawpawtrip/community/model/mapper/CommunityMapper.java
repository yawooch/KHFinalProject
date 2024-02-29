package com.kr.pawpawtrip.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kr.pawpawtrip.community.model.vo.Community;

@Mapper
public interface CommunityMapper {
	
	int selectBoardCount();

	List<Community> selectNoticeList();

	List<Community> selectBoardList(RowBounds rowBounds);
	
	List<Community> selectBoardListFirstPage(RowBounds rowBounds);
	
	int insertBoard(Community community);
	
}
