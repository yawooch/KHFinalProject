package com.kr.pawpawtrip.admin.api;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
/** 관리자 화면용 API Class  */
public class AdminApiClient {

    private String baseURL    = "https://apis.data.go.kr/B551011/KorService1/";
    private String serviceKey = "ZvQj%2BdF7Qii%2FQOORAN4qLXkSnfUuR%2Bcf8Wg00ku7ZWwfnLmNlS%2F%2Bpi2YaWjmGJIXxLWSI5uHZp%2FIwqDDFO5VFA%3D%3D";
    @Qualifier("restTemplate")
    private final RestTemplate restTemplate;

    /** 관리자 - 포포트립 매핑 화면에서 사용하기위한 detailPetTour1 API 사용 메소드 
     * @param contentId */
//    public String apiDetailPetTour(String pageNo, String contentId) throws RestClientException, URISyntaxException 
    public PetTourResponse apiDetailPetTour(String pageNo, String contentId) throws RestClientException, URISyntaxException 
    {
        StringBuilder urlBuilder = new StringBuilder(baseURL + "detailPetTour1");
        urlBuilder.append("?ServiceKey=").append(serviceKey);
        urlBuilder.append("&pageNo=").append(pageNo);
        urlBuilder.append("&numOfRows=").append("10");
        urlBuilder.append("&MobileOS=").append("ETC");
        urlBuilder.append("&MobileApp=").append("pawpawtrip");
        urlBuilder.append("&_type=").append("json");
        
        
        if(!contentId.isEmpty())
        {
        	urlBuilder.append("&contentId=").append(contentId);
        }
        
        log.info("Request URL : {}", urlBuilder.toString());

//		return restTemplate.getForObject(new URI(urlBuilder.toString()), String.class);
    	return restTemplate.getForObject(new URI(urlBuilder.toString()), PetTourResponse.class);
    }
}
