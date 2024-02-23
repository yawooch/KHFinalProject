package com.kr.pawpawtrip.admin.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminApiClient {

	public static void main(String[] args) {
		ObjectMapper mapper = new ObjectMapper();
		
		String result = new AdminApiClient().apiTourStnVliageV1("1", "1");
		
		System.out.println(result);
	}
    private String baseURL    = "https://apis.data.go.kr/B551011/KorService1/";
    private String serviceKey = "ZvQj%2BdF7Qii%2FQOORAN4qLXkSnfUuR%2Bcf8Wg00ku7ZWwfnLmNlS%2F%2Bpi2YaWjmGJIXxLWSI5uHZp%2FIwqDDFO5VFA%3D%3D";
    
    public String apiTourStnVliageV1(String pageNo, String courseId) 
    {
        URL url                           = null;
        BufferedReader reader             = null;
        StringBuilder urlBuilder          = null;
        StringBuilder responseTextBuilder = null;
        HttpURLConnection connection      = null;
        
        try
        {
            urlBuilder     = new StringBuilder(baseURL + "detailPetTour1");
            urlBuilder.append("?ServiceKey=").append(serviceKey);
            urlBuilder.append("&pageNo=").append(pageNo);
            urlBuilder.append("&numOfRows=").append("10");
            urlBuilder.append("&MobileOS=").append("ETC");
            urlBuilder.append("&MobileApp=").append("pawpawtrip");
            urlBuilder.append("&_type=").append("json");
//            urlBuilder.append("&contentId=").append("");
            
            log.info("Request URL : {}", urlBuilder.toString());
        
            url      = new URL(urlBuilder.toString());
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            
            reader      = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            responseTextBuilder    = new StringBuilder();
            String line = null;
            
            while((line = reader.readLine())!=null) {
                responseTextBuilder.append(line);
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        finally 
        {
            try
            {
                reader.close();
                connection.disconnect();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        
        return responseTextBuilder.toString();
    }
}
