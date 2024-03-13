package com.kr.pawpawtrip.admin.model.service;

import java.util.List;

import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.Pet;
import com.kr.pawpawtrip.common.util.PageInfo;

public interface AdminService
{
    List<CommunityRank> getCommunityRanks();
    
    List<Pet> getMyPetRatio();

    List<FavorSite> getFavorSite(PageInfo pageInfo, String select, String search);

    int getFavorSiteCount(String select, String search);

    List<FavorSite> getFavoriteTopThree();

    int saveFavoriteTopThree(List<String> contentIdsArr);

}
