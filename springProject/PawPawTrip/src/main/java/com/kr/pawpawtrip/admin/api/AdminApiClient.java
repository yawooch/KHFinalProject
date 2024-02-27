package com.kr.pawpawtrip.admin.api;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class AdminApiClient {

    private String baseURL    = "https://apis.data.go.kr/B551011/KorService1/";
    private String serviceKey = "ZvQj%2BdF7Qii%2FQOORAN4qLXkSnfUuR%2Bcf8Wg00ku7ZWwfnLmNlS%2F%2Bpi2YaWjmGJIXxLWSI5uHZp%2FIwqDDFO5VFA%3D%3D";
//    @Bean
//    private final RestTemplate restTemplate = new RestTemplate();

    @Bean
    private RestTemplate restTemplate() {
    	return new RestTemplate();
    } 
    
    public PetTourResponse apiDetailPetTour(String pageNo) throws RestClientException, URISyntaxException 
    {
        StringBuilder urlBuilder          = null;
        
        urlBuilder     = new StringBuilder(baseURL + "detailPetTour1");
        urlBuilder.append("?ServiceKey=").append(serviceKey);
        urlBuilder.append("&pageNo=").append(pageNo);
        urlBuilder.append("&numOfRows=").append("10");
        urlBuilder.append("&MobileOS=").append("ETC");
        urlBuilder.append("&MobileApp=").append("pawpawtrip");
        urlBuilder.append("&_type=").append("json");
//            urlBuilder.append("&contentId=").append("");
        
        log.info("Request URL : {}", urlBuilder.toString());

        return restTemplate().getForObject(new URI(urlBuilder.toString()), PetTourResponse.class);
    }
}
