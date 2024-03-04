package com.kr.pawpawtrip.common.model.service;

import org.springframework.stereotype.Service;

import com.kr.pawpawtrip.common.model.mapper.CommonMapper;
import com.kr.pawpawtrip.common.model.vo.Category;
import com.kr.pawpawtrip.common.model.vo.CommonArea;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommonServiceImpl implements CommonService
{
    private final CommonMapper commonMapper;
    @Override
    public Category getAllCategory(String smlCategory)
    {
        return commonMapper.selectCategoryGroupBySml(smlCategory);
    }

    @Override
    public CommonArea getFullAreaName(String areaCode)
    {
        return commonMapper.selectCommonArea(areaCode);
    }
}
