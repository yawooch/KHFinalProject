package com.kr.pawpawtrip.trip.model.vo;
import java.time.LocalDate;

import com.kr.pawpawtrip.common.model.vo.CommonArea;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Stay
{
    private int        stayContentId;     // 숙박 콘텐츠 ID (기본키)
    private String     stayAddress;       // 숙박 주소
    private String     stayDetailAddress; // 숙박 상세주소
    private String     stayTitle;         // 숙소 이름
    private String     areaCode;          // 지역 코드
    private String     stayCategory1;     // 숙박 카테고리 대분류
    private String     stayCategory2;     // 숙박 카테고리 중분류
    private String     stayCategory3;     // 숙박 카테고리 소분류
    private String     stayContentTypeId; // 숙박 콘텐츠 타입ID
    private LocalDate  stayCreateTime;    // 등록일
    private LocalDate  stayModifyTime;    // 수정일
    private String     stayImage;         // 숙소 이미지
    private String     mapX;              // x좌표
    private String     mapY;              // y좌표
    private String     mapLevel;          // 축척
    private String     stayTel;           // 숙박 전화번호
    private String     sigunguCode;       // 시군구 코드
    private String     homepage;          // 홈페이지주소
    private String     overview;          // 소개설명
    private PetInfo    petInfo;           // 반려동물 동반 정보
    private CommonArea commonArea;
}