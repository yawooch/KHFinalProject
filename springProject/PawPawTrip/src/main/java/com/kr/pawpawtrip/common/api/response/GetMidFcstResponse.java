package com.kr.pawpawtrip.common.api.response;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.kr.pawpawtrip.common.api.item.DetailImageItem;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GetMidFcstResponse 
{
    private String resultCode;  // API 호출 결과의 상태 코드
    private String resultMsg;   // API 호출 결과의 상태
    private String dataType;    // 데이터 타입
    private int    numOfRows;   // 한 페이지의 결과 수
    private int    pageNo;      // 현재 조회된 데이터의 페이지 번호
    private int    totalCount;  // 전체 데이터의 총 수
    private List<DetailImageItem> detailImageItems = new ArrayList<>();  // 데이터가 담겨 있는 객체배열
    
    @JsonProperty("response")
    @SuppressWarnings("unchecked")
    public void unpackResponse(Map<String, Object> response) 
    {
        Map<String, String> header = (Map<String, String>)response.get("header");
        Map<String, Object> body   = (Map<String, Object>)response.get("body");
        
        //간혹 Items가 없을때(조회된 결과가 없을때) 빈값"" 이 들어온다
        if(!body.get("items").equals("")) 
        {
            Map<String, ArrayList<Map<String, Object>>> items = (Map<String, ArrayList<Map<String, Object>>>)body.get("items");
            ArrayList<Map<String, Object>>              item  = items.get("item");
            
            this.resultCode = header.get("resultCode");
            this.resultMsg  = header.get("resultMsg");
            this.numOfRows  = (Integer)body.get("numOfRows");
            this.pageNo     = (Integer)body.get("pageNo");
            this.totalCount = (Integer)body.get("totalCount");
            for (Map<String, Object> map : item) {
                DetailImageItem detailImageItem = new DetailImageItem();
                
                detailImageItem.setContentid((String) map.get("contentid"));
                detailImageItem.setImgname((String) map.get("imgname"));
                detailImageItem.setOriginimgurl((String) map.get("originimgurl"));
                detailImageItem.setSmallimageurl((String) map.get("smallimageurl"));
                detailImageItem.setCpyrhtDivCd((String) map.get("cpyrhtDivCd"));
                detailImageItem.setSerialnum((String) map.get("serialnum"));
                
                detailImageItems.add(detailImageItem);
            }
            
        } else {
            DetailImageItem detailImageItem = new DetailImageItem();
            detailImageItems.add(detailImageItem);
        }
    }   
    
}