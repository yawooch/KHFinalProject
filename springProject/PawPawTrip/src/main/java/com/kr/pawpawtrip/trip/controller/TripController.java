package com.kr.pawpawtrip.trip.controller;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.api.CommonApiClient;
import com.kr.pawpawtrip.common.api.item.DetailImageItem;
import com.kr.pawpawtrip.common.api.response.DetailImageResponse;
import com.kr.pawpawtrip.common.model.service.CommonService;
import com.kr.pawpawtrip.common.model.vo.CommonArea;
import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TripController {
    private final TripService tripService;
    private final CommonService commonService;
    private final CommonApiClient commonApiClient;
    
    // 여행 조회 페이지(게시물 갯수 조회, 리스트 조회)
    @GetMapping("/trip/spot")
    public ModelAndView spot(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
                                                        @RequestParam(defaultValue = "") String selectArea,
                                                        @RequestParam(defaultValue = "") String searchKeyword) throws RestClientException, URISyntaxException {
        
        // 전체 게시물 수 조회
        int listCount = tripService.getSpotCount(selectArea, searchKeyword);
        
        // 페이징처리
        PageInfo pageInfo = new PageInfo(page, 5, listCount, 9);
        
        // spot을 List객체(spots)로 담아 여행지 리스트 조회
        List<Spot> spots = tripService.getSpotList(pageInfo, selectArea, searchKeyword);
        
        // 이미지 대체 조건
        //  1. DB에 저장된 image데이터가 없을 경우, api를 호출하여 이미지를 update실행
        //  2. api에서도 없을 경우, 특정 이미지(이미지 준비 중) 노출
        for (Spot spot : spots) 
        {
            String apiImageURL = "";
            int id = spot.getTripContentId();
            
            // Spot객체에서 얻은 이미지 데이터값이 "-"라면, API에서 조회한 이미지 URL 사용 
            if (spot.getTripImage().equals("-") || spot.getTripImage() == null) {
                // 이미지 API 호출 + 예외던지기
                DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(id , 1);
                List<DetailImageItem> detailImageItems = detailImageResponse.getDetailImageItems();
                
                for (DetailImageItem detailImageItem : detailImageItems) {
                    apiImageURL = detailImageItem.getOriginimgurl();
                    
                    if (apiImageURL != null) {
                        tripService.saveSpotImage(id, apiImageURL);
                    }    
                    // Spot 객체의 이미지 데이터값이 없고, API 이미지에도 데이터가 존재하지 않을 때(둘 다 데이터가 없을 때)
                    spot.setTripImage(apiImageURL == null?"/pawpawtrip/img/trip/readyImage.png":apiImageURL);
                }
            }               
        }
        
        // 지역 선택
        List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");
        
        // 검색 (지역, 키워드)
        Map<String, String> map = new HashMap<>();
        map.put("selectArea", selectArea);
        map.put("searchKeyword", searchKeyword);
        
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("spots", spots);
        modelAndView.addObject("selectAndSearch", map);
        modelAndView.addObject("searchAreaOptions", searchAreaOptions);
        modelAndView.setViewName("trip/spot");
        
        return modelAndView;
    }
    
    // 여행 상세 페이지
    @GetMapping("/trip/spot/spotDetail")
    public ModelAndView spotDetail(ModelAndView modelAndView, @RequestParam int id) throws RestClientException, URISyntaxException {
                
        String slideImageURL = null;
        Spot spot = tripService.getSpotById(id);
        
        // 콘텐츠 ID값을 이용하여 응답 부분 호출 
        DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(id, 5);
        List<DetailImageItem> detailImageItems  = detailImageResponse.getDetailImageItems();
        
        for (DetailImageItem detailImageItem : detailImageItems) {
            slideImageURL = detailImageItem.getOriginimgurl();
            
            // API에서 조회된 이미지가 없을 시, 사용할 대체 이미지 지정
            if (slideImageURL == null) {
                detailImageItem.setOriginimgurl(spot.getTripImage());
                
                if (spot.getTripImage().equals("-")) {
                    detailImageItem.setOriginimgurl("/pawpawtrip/img/trip/readyImage.png");
                }
            }
        }
        
        modelAndView.addObject("spot", spot);
        modelAndView.addObject("detailImageItems", detailImageItems);
        modelAndView.setViewName("trip/spotDetail");
        
        return modelAndView;
    }
    
    // 숙박 조회 페이지(게시물 갯수 조회, 리스트 조회)
    @GetMapping("/trip/stay")
    public ModelAndView stay(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
                                                        @RequestParam(defaultValue = "") String selectArea,
                                                        @RequestParam(defaultValue = "") String searchKeyword) throws RestClientException, URISyntaxException 
    {
        int        listCount  = tripService.getStayCount(selectArea, searchKeyword);
        PageInfo   pageInfo   = new PageInfo(page, 5, listCount, 9);
        List<Stay> stays      = tripService.getStayList(pageInfo, selectArea, searchKeyword);
        List<CommonArea> searchAreaOptions = commonService.getAreaByCode("00");
        Map<String, String> map = new HashMap<>();
        
        for (Stay stay : stays) 
        {
            String apiImageURL = "";
            int id     = 0;
            
            id = stay.getStayContentId();
            
            if (stay.getStayImage().equals("-") || stay.getStayImage() == null) {
                DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(id, 1);
                List<DetailImageItem> detailImageItems = detailImageResponse.getDetailImageItems();
                
                for (DetailImageItem detailImageItem : detailImageItems) {
                    
                    apiImageURL = detailImageItem.getOriginimgurl();
                    
                    // stay에 바로 설정해주려 했으나 호출시간이 긴 이슈 발생하여, api 조회이미지를 DB에 저장 후 저장된 데이터 조회  
                    // stay.setStayImage(stayImageURL); 
                    
                    if (apiImageURL != null) {
                        tripService.saveStayImage(id, apiImageURL);
                    }
                    
                    else if (apiImageURL == null) {
                        stay.setStayImage("/pawpawtrip/img/trip/readyImage.png");                       
                    }
                }
            }
        }
        
        map.put("selectArea"   , selectArea);
        map.put("searchKeyword", searchKeyword);
        
        modelAndView.addObject("stays", stays);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("searchAreaOptions", searchAreaOptions);
        modelAndView.addObject("selectAndSearch", map);
        modelAndView.setViewName("trip/stay");      
        
        return modelAndView;
    }
    
    // 숙박 상세 페이지
    @GetMapping("/trip/stay/stayDetail")
    public ModelAndView stayDetail(ModelAndView modelAndView, @RequestParam int id) throws RestClientException, URISyntaxException 
    {
        String slideImageURL = null;
        Stay   stay          = tripService.getStayById(id);
        
        DetailImageResponse detailImageResponse = commonApiClient.apiDetailImageByContentId(id, 5);
        List<DetailImageItem> detailImageItems  = detailImageResponse.getDetailImageItems();
        
        for (DetailImageItem detailImageItem : detailImageItems)
        {
            slideImageURL = detailImageItem.getOriginimgurl();
            
            if (slideImageURL == null)
            {
                detailImageItem.setOriginimgurl(stay.getStayImage());
                
                if (stay.getStayImage().equals("-")) 
                {
                    detailImageItem.setOriginimgurl("/pawpawtrip/img/trip/readyImage.png");
                }
            }
        }
        
        modelAndView.addObject(stay);
        modelAndView.addObject("detailImageItems", detailImageItems);
        modelAndView.setViewName("trip/stayDetail");
        
        return modelAndView;
    }

    /** 찜기능 저장 Ajax */
    @GetMapping("/trip/isZZim")
    public ResponseEntity<String> isZZim(String contentId, String memberNo)
    {
        String isZzim = tripService.isZzimThis(contentId, memberNo);
        
        return ResponseEntity.ok(isZzim);
    }
}