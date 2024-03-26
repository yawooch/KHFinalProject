package com.kr.pawpawtrip.common.api.response;

import java.util.ArrayList;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kr.pawpawtrip.common.api.item.PetTourItem;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetTourResponse 
{
    private String resultCode;  // API 호출 결과의 상태 코드
    private String resultMsg;   // API 호출 결과의 상태
    private int    numOfRows;   // 한 페이지의 결과 수
    private int    pageNo;      // 현재 조회된 데이터의 페이지 번호
    private int    totalCount;  // 전체 데이터의 총 수
    
    private ArrayList<PetTourItem> petTourItems = new ArrayList<PetTourItem>();
    

    @JsonProperty("response")
    @SuppressWarnings("unchecked")
    public void unpackResponse(Map<String, Object> response)
    {
        Map<String, String> header                        = (Map<String, String>)response.get("header");
        Map<String, Object> body                          = (Map<String, Object>)response.get("body");
        Map<String, ArrayList<Map<String, Object>>> items = (Map<String, ArrayList<Map<String, Object>>>)body.get("items");
        ArrayList<Map<String, Object>>              item  = items.get("item");
        
        this.resultCode = header.get("resultCode");
        this.resultMsg  = header.get("resultMsg");
        
        this.pageNo     = (Integer)body.get("pageNo");
        this.numOfRows  = (Integer)body.get("numOfRows");
        this.totalCount = (Integer)body.get("totalCount");
        
        for (Map<String, Object> map : item)
        {
            ObjectMapper objectMapper = new ObjectMapper();
            PetTourItem petTourItem = objectMapper.convertValue(map, PetTourItem.class);

            this.petTourItems.add(petTourItem);
        }
        this.petTourItems.stream().forEach(System.out::println);
    }
}
