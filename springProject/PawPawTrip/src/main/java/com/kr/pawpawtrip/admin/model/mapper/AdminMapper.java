package com.kr.pawpawtrip.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kr.pawpawtrip.admin.model.vo.CommunityRank;

@Mapper
public interface AdminMapper
{
    List<CommunityRank> selectCommunityRanks();
}
