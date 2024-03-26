package com.kr.pawpawtrip.common.model.service;

import java.util.List;

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
    /** DB에서 소분류코드를 보내면 각 카테고리를 가져온다. */
    @Override
    public Category getAllCategory(String smlCategory)
    {
        return commonMapper.selectCategoryGroupBySml(smlCategory);
    }

    @Override
    public CommonArea getFullAreaName(String areaCode,String sigunguCode)
    {
        return commonMapper.selectCommonArea(areaCode, sigunguCode);
    }

    /** DB에서 area코드를 보내주면 시도코드와 함께 지역코드 세트를 가져온다. */
    @Override
    public List<CommonArea> getAreaByCode(String areaCode)
    {
        return commonMapper.selectAreaByCode(areaCode);
    }
}
