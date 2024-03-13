package com.kr.pawpawtrip.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;

@Mapper
public interface AdminMapper
{
    List<CommunityRank> selectCommunityRanks();

    List<FavorSite> selectAllFavorSite(RowBounds rowBounds, @Param("select") String select, @Param("search") String search);

    int selectFavorSiteCount(@Param("select") String select, @Param("search") String search);

    List<FavorSite> selectFavoriteTopThree();


    //TRIP 테이블 FAVOR_RCMD_YN 전부 N
    int updateFavoriteTripInit();
    //STAY 테이블 FAVOR_RCMD_YN 전부 N
    int updateFavoriteStayInit();

    //TRIP 테이블 FAVOR_RCMD_YN = Y
    int updateFavoriteTrip(@Param("contentIds") List<String> contentIds);
    //STAY 테이블 FAVOR_RCMD_YN = Y
    int updateFavoriteStay(@Param("contentIds")List<String> contentIds);
}
