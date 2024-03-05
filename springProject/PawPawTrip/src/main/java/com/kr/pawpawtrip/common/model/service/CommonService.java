package com.kr.pawpawtrip.common.model.service;

import com.kr.pawpawtrip.common.model.vo.Category;
import com.kr.pawpawtrip.common.model.vo.CommonArea;

public interface CommonService
{
    Category getAllCategory(String smlCategory);
    
    CommonArea getFullAreaName(String areaCode, String sigunguCode);
}
