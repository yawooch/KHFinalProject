package com.kr.pawpawtrip.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kr.pawpawtrip.community.model.vo.Community;

@Mapper
public interface CommunityMapper {
	
	int selectBoardCount(@Param("select") String select, @Param("search") String search);

	List<Community> selectNoticeList();

	List<Community> selectBoardList(RowBounds rowBounds, 
			@Param("select") String select, 
			@Param("search") String search);
	
	int insertBoard(Community community);
	
}
