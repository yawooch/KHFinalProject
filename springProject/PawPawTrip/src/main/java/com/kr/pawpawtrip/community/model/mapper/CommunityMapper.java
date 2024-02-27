package com.kr.pawpawtrip.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kr.pawpawtrip.community.model.vo.Community;

@Mapper
public interface CommunityMapper {

	List<Community> selectNoticeList();
}
