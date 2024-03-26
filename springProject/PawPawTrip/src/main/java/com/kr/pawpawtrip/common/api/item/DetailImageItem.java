package com.kr.pawpawtrip.common.api.item;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailImageItem 
{
    private String contentid;    // 기본정보 : 콘텐츠ID
    private String imgname;      // 이미지명
    private String originimgurl; // 원본이미지   
    private String smallimageurl;// 썸네일이미지
    private String cpyrhtDivCd;  // 저작권 유형 (Type1:제1유형(출처표시-권장), Type3:제3유형(제1유형+변경금지)
    private String serialnum;    // 이미지일련번호 
}
