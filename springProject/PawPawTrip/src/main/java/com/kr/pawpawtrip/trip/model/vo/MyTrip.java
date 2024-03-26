package com.kr.pawpawtrip.trip.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyTrip 
{
   private int    contentId;   // 컨텡츠 아이디
   private int    memberNo;    // 멤버번호
   private String address;     // 장소 주소
   private String title;       // 장소 이름
   private String contentType; // 컨텐츠 타입(숫자형을 문자형으로 변경) // 12: 숙소, 32: 관광지
   private String image;       // 장소 이미지
}