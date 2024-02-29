package com.kr.pawpawtrip.admin.controller;

import java.net.URISyntaxException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.api.CommonApiClient;
import com.kr.pawpawtrip.common.api.item.DetailCommonItem;
import com.kr.pawpawtrip.common.api.item.PetTourItem;
import com.kr.pawpawtrip.common.api.response.DetailCommonResponse;
import com.kr.pawpawtrip.common.api.response.PetTourResponse;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes({"petTourInfos", "petTourItem", "detailCommonItem"})
public class AdminController
{
    private final CommonApiClient commonApiClient;

    /** 대시보드 화면 이동 */
    @GetMapping("/admin/dashboard")
    public String dashboard()
    {
        return "admin/dashboard";
    }


    /** 트립 매핑 - 목록 화면으로 이동 */
    @GetMapping("/admin/tripList")
    public ModelAndView tripList(ModelAndView modelAndView)
    {
        modelAndView.setViewName("/admin/tripList");

        return modelAndView;
    }

    /** 트립 매핑 - 목록 조회 */
    @GetMapping("/admin/tripListApi")
    public ResponseEntity<PetTourResponse> tripListApi(             HttpSession session,
                                  @RequestParam(defaultValue = "1") String      pageNo ,
                                  @RequestParam(defaultValue = "")  String      contentId)
    throws RestClientException, URISyntaxException
    {
        //ApiClient로 API response 객체를 받아온다.
        PetTourResponse response = commonApiClient.apiDetailPetTour(pageNo, contentId);
        
        //@SessionAttributes("petTourInfos") 에 설정한 이름으로 session에 저장한다. - Detail 페이지로 갈때 다시 Api 호출하면 느려지므로
        session.setAttribute("petTourInfos", response.getPetTourItems());

        return ResponseEntity.ok(response);
    }
    
    /** 트립 매핑 - 상세 화면으로 이동 */
    @GetMapping("/admin/tripDetail")
    public ModelAndView stayDetail(@SessionAttribute("petTourInfos") ArrayList<PetTourItem> petTourInfos,
                                   @RequestParam(defaultValue = "")  String                 contentId,
                                                                     ModelAndView           modelAndView,
                                                                     HttpSession            session)
    throws RestClientException, URISyntaxException
    {
        /* 1. 파라미터로 가져온 contentId 를 가지고 공통 API 객체를 받아온다(petTour쪽은 List<> 타입으로 세션에 저장 해놓음) */
        /* 2. 가져온 트립 객체를 세션에 저장한다(DB에 insert 할때는 세션에서 객체만 가져오도록) */
        /* 3. List에서 contentId에 해당하는 객체만 세션에 저장한다. */
        /* 4. 페이지 이동  */
        PetTourItem selectedItem = null;

        DetailCommonResponse response = commonApiClient.apiDetailCommonToContentId(contentId);
        
        
        log.info("response : {}", response);
        
        // TODO:stream으로 정리 안됨?
        for (PetTourItem petTourItem : petTourInfos)
        {
            String selectContentId = petTourItem.getPetinfoContentid();

            // 파라미터로 넘어온 contentId를 list 중에서 찾는다.
            if (selectContentId.equals(contentId))
            {
                selectedItem = petTourItem;
            }
        }
        DetailCommonItem detailCommonItem = response.getDetailCommonItems().get(0);
        session.setAttribute("detailCommonItem", detailCommonItem);//일단은... 1개만 가져온다고 가정.
        session.setAttribute("petTourItem", selectedItem);
        
//        System.out.println("contentId    : "     + contentId);
        System.out.println("+*********************************************************************************");
        System.out.println(detailCommonItem);
        System.out.println("+*********************************************************************************");
//        System.out.println("petTourInfos : "     + selectedItem);

        modelAndView.addObject("selectedItem", selectedItem);
        modelAndView.setViewName("/admin/tripDetail");

        return modelAndView;
    }

    /** 숙소수정 화면 이동 */
    @GetMapping("/admin/stayUpdate")
    public String stayUpdate()
    {
        return "admin/stayUpdate";
    }

    /** 공지사항입력 화면 이동 */
    @GetMapping("/admin/noticeWrite")
    public String noticeWrite()
    {
        return "admin/noticeWrite";
    }

    /** 공지사항수정 화면 이동 */
    @GetMapping("/admin/noticeUpdate")
    public String noticeUpdate()
    {
        return "admin/noticeUpdate";
    }

}
