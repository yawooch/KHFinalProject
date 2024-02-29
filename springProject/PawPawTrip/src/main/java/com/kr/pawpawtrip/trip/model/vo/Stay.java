package com.kr.pawpawtrip.trip.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Stay
{
    // 숙박 콘텐츠 ID (기본키)
    private int stayContentId;

    // 숙박 주소
    private String stayAddress;

    // 숙박 상세주소
    private String stayDetailAddress;

    // 숙소 이름
    private String stayTitle;

    // 지역 코드
    private int areaCode;

    // 숙박 카테고리 대분류
    private String stayCategory1;

    // 숙박 카테고리 중분류
    private String stayCategory2;

    // 숙박 카테고리 소분류
    private String stayCategory3;

    // 숙박 콘텐츠 타입ID
    private int stayContentTypeId;

    // 등록일
    private LocalDate stayCrateTime;

    // 수정일
    private LocalDate stayModifyTime;

    // 숙소 이미지
    private String stayImage;

    // x좌표
    private int mapX;

    // y좌표
    private int mapY;

    // 축척
    private int mapLevel;

    // 숙박 전화번호
    private String stayTel;

    // 시군구 코드
    private int sigunguCode;

    // 홈페이지주소
    private int homepage;

    // 소개설명
    private int overview;
}
