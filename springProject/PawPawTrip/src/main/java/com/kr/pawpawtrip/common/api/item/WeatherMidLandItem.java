package com.kr.pawpawtrip.common.api.item;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WeatherMidLandItem 
{
    private String regId;  // 예보구역코드
    private String wf3Am;  // 3일 후 오전 날씨
    private String wf3Pm;  // 3일 후 오후 날씨
    private String wf4Am;  // 4일 후 오전 날씨
    private String wf4Pm;  // 4일 후 오후 날씨
    private String wf5Am;  // 5일 후 오전 날씨
    private String wf5Pm;  // 5일 후 오후 날씨
    private String wf6Am;  // 6일 후 오전 날씨
    private String wf6Pm;  // 6일 후 오후 날씨
    private String wf7Am;  // 7일 후 오전 날씨
    private String wf7Pm;  // 7일 후 오후 날씨
    private String wf8;    // 8일 날씨
}