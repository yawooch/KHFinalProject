package com.kr.pawpawtrip.admin.controller;

import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes({"petTourInfos", "petTourItem", "detailCommonItem"})
public class AdminController
{
    private final CommonApiClient commonApiClient;
    private final TripService tripService;

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
        Optional<PetTourItem> streamItem = null;

        DetailCommonResponse response = commonApiClient.apiDetailCommonToContentId(contentId);
        
        
        log.info("contentId : {}", contentId);
        log.info("response : {}", response);
        
        streamItem = petTourInfos.stream().filter(petTourItem-> petTourItem.getPetinfoContentid().equals(contentId)).findFirst();
        selectedItem = streamItem.get();
        
        
        DetailCommonItem detailCommonItem = response.getDetailCommonItems().get(0);
        session.setAttribute("detailCommonItem", detailCommonItem);//일단은... 1개만 가져온다고 가정.
        session.setAttribute("petTourItem", selectedItem);
        
        System.out.println("contentId    : "     + contentId);
        System.out.println("+*********************************************************************************");
        System.out.println(detailCommonItem);
        System.out.println("+*********************************************************************************");
        System.out.println("petTourInfos : "     + selectedItem);

        modelAndView.addObject("selectedItem", selectedItem);
        modelAndView.setViewName("/admin/tripDetail");

        return modelAndView;
    }

    /** 숙소등록 처리 */
    @PostMapping("/admin/tripDetail")
    public ModelAndView tripSave(                      ModelAndView     modelAndView,
                 @SessionAttribute("petTourItem")      PetTourItem      petTourItem,
                 @SessionAttribute("detailCommonItem") DetailCommonItem detailCommonItem
                                      )
    {
        log.info("petTourItem : {}, detailCommonItem : {}", petTourItem, detailCommonItem);
        
        String contentTypeId = null;
        int petTripResult    = 0;
        int petInfoResult    = 0;
        //1. DetailCommonItem 에서 컨텐츠타입아이디를 가져온다.
        contentTypeId = detailCommonItem.getContenttypeid();
        
        //2. 컨텐츠타입아이디로 VO를 선언한다
        if (contentTypeId.equals("12")) //여행지- Trip
        {
            System.out.println("여기는 들어오니!!!!!!!!!!!!!!!!!");
            
            Spot spot = new Spot();
            spot.setTripContentId(Integer.parseInt(detailCommonItem.getContentid()));  // 여행 콘텐츠 ID (기본키) 
            spot.setTripAddress(      detailCommonItem.getAddr1());                    // 여행지 주소          
            spot.setTripDetailAddress(detailCommonItem.getAddr2());                    // 여행지 상세주소        
            spot.setTripTitle(        detailCommonItem.getTitle());                    // 여행지 이름          
            spot.setAreaCode(         detailCommonItem.getAreacode());                 // 지역 코드           
            spot.setTripCategory1(    detailCommonItem.getCat1());                     // 여행 카테고리 대분류     
            spot.setTripCategory2(    detailCommonItem.getCat2());                     // 여행 카테고리 중분류     
            spot.setTripCategory3(    detailCommonItem.getCat3());                     // 여행 카테고리 소분류     
            spot.setTripContentTypeId(detailCommonItem.getContenttypeid());            // 여행 콘텐츠 타입 ID    
            LocalDate createdtime   = LocalDateTime.parse(detailCommonItem.getCreatedtime() , DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
            LocalDate modifiedtime  = LocalDateTime.parse(detailCommonItem.getModifiedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
            spot.setTripCreateTime(   createdtime);                                    // 등록일      
            spot.setTripModifyTime(   modifiedtime);                                   // 수정일      
            spot.setTripImage(        detailCommonItem.getFirstimage());               // 여행 이미지   
            spot.setMapX(             detailCommonItem.getMapx());                     // x좌표      
            spot.setMapY(             detailCommonItem.getMapy());                     // y좌표      
            spot.setMapLevel(         detailCommonItem.getMlevel());                   // 축척       
            spot.setTripTel(          detailCommonItem.getTel());                      // 여행 전화번호  
            spot.setSigunguCode(      detailCommonItem.getSigungucode());              // 시군구 코드   
            spot.setHomepage(         detailCommonItem.getZipcode());                  // 홈페이지주소   
            spot.setOverview(         detailCommonItem.getOverview());                 // 소개설명     
         
            
            //3. VO로 save처리를 한다.
            petTripResult = tripService.saveTrip(spot);
            //4. PetInfo를 저장처리한다.
            PetInfo petInfo = new PetInfo();
            petInfo.setPetinfoContentid(petTourItem.getPetinfoContentid()); //콘텐츠아이디  
            petInfo.setTourInfo(        petTourItem.getTourInfo());         //반려견관광정보
            petInfo.setAcmpyTypeCd(     petTourItem.getAcmpyTypeCd());      //동반구분      
            petInfo.setRelaPosesFclty(  petTourItem.getRelaPosesFclty());   //관련구비시설  
            petInfo.setRelaFrnshPrdlst( petTourItem.getRelaFrnshPrdlst());  //관련비치품목  
            petInfo.setRelaPurcPrdlst(  petTourItem.getRelaPurcPrdlst());   //관련구매품목  
            petInfo.setRelaRntlPrdlst(  petTourItem.getRelaRntlPrdlst());   //관련렌탈품목  
            petInfo.setAcmpyPsblCpam(   petTourItem.getAcmpyPsblCpam());    //동반가능동물  
            petInfo.setEtcAcmpyInfo(    petTourItem.getEtcAcmpyInfo());     //기타동반정보  
            petInfo.setAcmpyNeedMtr(    petTourItem.getAcmpyNeedMtr());     //동반시필요사항
            
            petInfoResult = tripService.savePetInfo(petInfo);
            //처리 실패시에는 0, 처리성공시에는 2 가 나오도록 한다.
            petInfoResult = petInfoResult < 0? petInfoResult : petInfoResult++; //주 테이블 급 결과 성공시 int에 1을 더해 구분한다.
        }
        if (contentTypeId.equals("32")) //숙소- Stay
        {
            System.out.println("여기는 들어오니!!!!!!!!!!!!!!!!!");
            Stay stay = new Stay();
            stay.setStayContentId( Integer.parseInt(detailCommonItem.getContentid()));  // 여행 콘텐츠 ID (기본키) 
            stay.setStayAddress(      detailCommonItem.getAddr1());                    // 여행지 주소          
            stay.setStayDetailAddress(detailCommonItem.getAddr2());                    // 여행지 상세주소        
            stay.setStayTitle(        detailCommonItem.getTitle());                    // 여행지 이름          
            stay.setAreaCode(         detailCommonItem.getAreacode());                 // 지역 코드           
            stay.setStayCategory1(    detailCommonItem.getCat1());                     // 여행 카테고리 대분류     
            stay.setStayCategory2(    detailCommonItem.getCat2());                     // 여행 카테고리 중분류     
            stay.setStayCategory3(    detailCommonItem.getCat3());                     // 여행 카테고리 소분류     
            stay.setStayContentTypeId(detailCommonItem.getContenttypeid());            // 여행 콘텐츠 타입 ID    
            LocalDate createdtime   = LocalDateTime.parse(detailCommonItem.getCreatedtime() , DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
            LocalDate modifiedtime  = LocalDateTime.parse(detailCommonItem.getModifiedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
            stay.setStayCreateTime(   createdtime);                                    // 등록일      
            stay.setStayModifyTime(   modifiedtime);                                   // 수정일      
            stay.setStayImage(        detailCommonItem.getFirstimage());               // 여행 이미지   
            stay.setMapX(             detailCommonItem.getMapx());                     // x좌표      
            stay.setMapY(             detailCommonItem.getMapy());                     // y좌표      
            stay.setMapLevel(         detailCommonItem.getMlevel());                   // 축척       
            stay.setStayTel(          detailCommonItem.getTel());                      // 여행 전화번호  
            stay.setSigunguCode(      detailCommonItem.getSigungucode());              // 시군구 코드   
            stay.setHomepage(         detailCommonItem.getZipcode());                  // 홈페이지주소   
            stay.setOverview(         detailCommonItem.getOverview());                 // 소개설명     
         
            
            //3. VO로 save처리를 한다.
            petTripResult = tripService.saveStay(stay);

            //처리 실패시에는 0, 처리성공시에는 2 가 나오도록 한다.
            petInfoResult = petInfoResult < 0? petInfoResult : petInfoResult++; //주 테이블 급 결과 성공시 int에 1을 더해 구분한다.
            
            //4. PetInfo를 저장처리한다.
            PetInfo petInfo = new PetInfo();
            petInfo.setPetinfoContentid(petTourItem.getPetinfoContentid()); //콘텐츠아이디  
            petInfo.setTourInfo(        petTourItem.getTourInfo());         //반려견관광정보
            petInfo.setAcmpyTypeCd(     petTourItem.getAcmpyTypeCd());      //동반구분      
            petInfo.setRelaPosesFclty(  petTourItem.getRelaPosesFclty());   //관련구비시설  
            petInfo.setRelaFrnshPrdlst( petTourItem.getRelaFrnshPrdlst());  //관련비치품목  
            petInfo.setRelaPurcPrdlst(  petTourItem.getRelaPurcPrdlst());   //관련구매품목  
            petInfo.setRelaRntlPrdlst(  petTourItem.getRelaRntlPrdlst());   //관련렌탈품목  
            petInfo.setAcmpyPsblCpam(   petTourItem.getAcmpyPsblCpam());    //동반가능동물  
            petInfo.setEtcAcmpyInfo(    petTourItem.getEtcAcmpyInfo());     //기타동반정보  
            petInfo.setAcmpyNeedMtr(    petTourItem.getAcmpyNeedMtr());     //동반시필요사항
            
            petInfoResult = tripService.savePetInfo(petInfo);
            //처리 실패시에는 0, 처리성공시에는 2 가 나오도록 한다.
            petInfoResult = petInfoResult < 0? petInfoResult : petInfoResult++; //주 테이블 급 결과 성공시 int에 1을 더해 구분한다.
            
        }
        
        if ((petInfoResult + petTripResult) == 3)
        {
            //입력성공
            modelAndView.addObject("requestMsg" , "성공적으로 처리되었습니다.");
            log.info("requestMsg : {}" , "성공적으로 처리되었습니다.");
        }

        else if ((petInfoResult + petTripResult) == 2)
        {
            //petInfo insert실패 
            modelAndView.addObject("requestMsg" , "메인테이블만 저장되었습니다.");
            log.info("requestMsg : {}" , "메인테이블만 저장되었습니다.");
        }
        else if ((petInfoResult + petTripResult) == 1)
        {
            //메인테이블 insert 실패 
            modelAndView.addObject("requestMsg" , "반려동물 동반정보만 저장되었습니다.");
            log.info("requestMsg : {}" , "반려동물 동반정보만 저장되었습니다.");
        }
        else
        {
            log.info("requestMsg : {}" , "저장에 실패하였습니다.");
        }
        
        log.info("petInfoResult : {} ,petTripResult : {} " ,petInfoResult, petTripResult);
        modelAndView.setViewName("admin/tripList");
        
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
