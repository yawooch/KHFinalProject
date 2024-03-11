package com.kr.pawpawtrip.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kr.pawpawtrip.admin.model.mapper.AdminMapper;
import com.kr.pawpawtrip.admin.model.vo.CommunityRank;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService
{
    private final AdminMapper adminMapper;
    @Override
    public List<CommunityRank> getCommunityRanks()
    {
        return adminMapper.selectCommunityRanks();
    }

}
