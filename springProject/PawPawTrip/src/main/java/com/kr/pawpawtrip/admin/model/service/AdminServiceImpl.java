package com.kr.pawpawtrip.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kr.pawpawtrip.admin.model.mapper.AdminMapper;
import com.kr.pawpawtrip.admin.model.vo.CommunityRank;
import com.kr.pawpawtrip.admin.model.vo.FavorSite;
import com.kr.pawpawtrip.admin.model.vo.MemberAccsLog;
import com.kr.pawpawtrip.admin.model.vo.Pet;
import com.kr.pawpawtrip.common.util.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService
{
    private final AdminMapper adminMapper;

    // 대쉬보드에서 공지사항을 제외한 커뮤니티 조회수를 가장 많이 받은 TOP7을 가져온다.
    @Override
    public List<CommunityRank> getCommunityRanks()
    {
        return adminMapper.selectCommunityRanks();
    }

    // 대쉬보드에서 마이펫 비율 정보를 가져온다.
    @Override
    public List<Pet> getMyPetRatio()
    {
        return adminMapper.selectMypetRatio();
    }

    // 관리자화면 인기추천장소에서 사용할 숙박/여행지 목록
    @Override
    public List<FavorSite> getFavorSite(PageInfo pageInfo, String select, String search)
    {
        int limit = pageInfo.getListLimit();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);

        return adminMapper.selectAllFavorSite(rowBounds, select, search);
    }

    // 관리자화면 인기추천장소에서 사용할 페이징용 카운트
    @Override
    public int getFavorSiteCount(String select, String search)
    {
        return adminMapper.selectFavorSiteCount(select, search);
    }

    // 선택된 인기추천 장소의 목록을 가져온다.
    @Override
    public List<FavorSite> getFavoriteTopThree()
    {
        return adminMapper.selectFavoriteTopThree();
    }

    @Override
    // 선택된 인기추천 장소의 목록을 저장한다.
    public int saveFavoriteTopThree(List<String> contentIdsArr)
    {
        int result = 0;

        // delete - 샤실은 전부 N으로 update
        result += adminMapper.updateFavoriteTripInit();
        result += adminMapper.updateFavoriteStayInit();

        if (contentIdsArr.size() != 0)
        {
            // update
            result += adminMapper.updateFavoriteTrip(contentIdsArr);
            result += adminMapper.updateFavoriteStay(contentIdsArr);
        }

        return result;
    }

    @Override
    public int saveVisitorLog(MemberAccsLog memberAccsLog)
    {
        return adminMapper.insertMemberAccsLog(memberAccsLog);
    }

    @Override
    public MemberAccsLog getVisitorLog(String remoteAddr,  int memberNo)
    {
        return adminMapper.selectMemberAccsLog(remoteAddr,  memberNo);
    }

}
