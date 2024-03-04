package com.kr.pawpawtrip.admin.controller;

import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.api.CommonApiClient;
import com.kr.pawpawtrip.common.api.item.DetailCommonItem;
import com.kr.pawpawtrip.common.api.item.PetTourItem;
import com.kr.pawpawtrip.common.api.response.DetailCommonResponse;
import com.kr.pawpawtrip.common.api.response.PetTourResponse;
import com.kr.pawpawtrip.common.model.service.CommonService;
import com.kr.pawpawtrip.common.model.vo.Category;
import com.kr.pawpawtrip.common.model.vo.CommonArea;
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.Comm;
import com.kr.pawpawtrip.trip.model.vo.PetInfo;
import com.kr.pawpawtrip.trip.model.vo.Spot;
import com.kr.pawpawtrip.trip.model.vo.Stay;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes(
{
        "petTourInfos", "petTourDetail", "detailCommonItem"
})
public class AdminController
{
    private final CommonApiClient commonApiClient;
    private final CommonService   commonService;
    private final TripService     tripService;


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
    /** 트립 매핑 - 일괄등록 버튼 클릭시 */
    @PostMapping("/admin/tripList")
    @ResponseBody
    public ResponseEntity<Map<String,String>> saveTripList(
                                         @RequestParam(value="contentIdsArr[]") List<String>           contentIdsArr)
                                         throws RestClientException, URISyntaxException
    {
        int petTripResult = 0;
        int totalResult   = 0;
        Map<String,String> resultMap = new HashMap<String, String>();
        
        //세션에 저장된 petTourInfos로 for문을 돌면서 데이터를 저장한다.
        for (String contentIds : contentIdsArr)
        {
            int                  petInfoResult    = 0;
            int                  contentId        = Integer.parseInt(contentIds);
            DetailCommonResponse commonResponse   = commonApiClient.apiDetailCommonToContentId(contentId);
            PetTourResponse      petTourResponse  = commonApiClient.apiDetailPetTour("1", contentId);// ApiClient로 API response 객체를 받아온다.
            PetInfo              dbPetInfo        = tripService.getPetTourByContentId(contentId);
            DetailCommonItem     detailCommonItem = commonResponse.getDetailCommonItems().get(0);
            PetTourItem          petTourItem      = petTourResponse.getPetTourItems().get(0);
            
            String               contentTypeid    = detailCommonItem.getContenttypeid();

            //DB에 이미 저장된 내용은 건너뛴다
            if(dbPetInfo != null) 
            {
                continue;
            }
            
            // 컨텐츠타입아이디로 VO를 선언 후 저장
            if (contentTypeid.equals("12")) // 여행지- Trip
            {
                Spot spot = new Spot();
                // Spot와 DetailCommonItem객체를 매핑한다.
                mappingCommonItemVo(detailCommonItem, spot);

                // VO로 save처리를 한다.
                petTripResult = tripService.saveTrip(spot);
            }
            else if (contentTypeid.equals("32")) // 숙소- Stay
            {
                Stay stay = new Stay();
                // Stay와 DetailCommonItem객체를 매핑한다.
                mappingCommonItemVo(detailCommonItem, stay);

                // VO로 save처리를 한다.
                petTripResult = tripService.saveStay(stay);
            }
            Comm comm = new Comm();
            // Comm와 DetailCommonItem객체를 매핑한다.
            mappingCommonItemVo(detailCommonItem, comm);

            // VO로 save처리를 한다.
            petTripResult += tripService.saveComm(comm);

            // VO로 save처리를 한다.
            PetInfo petInfo = new PetInfo();
            // PetInfo와 PetTourItem객체를 매핑한다.
            mappingPetTourItemVo(petTourItem, petInfo);

            petInfoResult = tripService.savePetInfo(petInfo);

            //petinfo 와 comm , stay, trip 테이블등이 모두 저장될경우 totalResult를 ++ 해서 반환한다.
            if(petTripResult == 2 && petInfoResult == 1)
            {
                totalResult ++;
            }
        }

        resultMap.put("totalResult", Integer.toString(totalResult));
        return ResponseEntity.ok(resultMap);
    }

    /** 트립 매핑 - 목록 조회 */
    @GetMapping("/admin/tripListApi")
    @ResponseBody
    public ResponseEntity<PetTourResponse> tripListApi(      HttpSession session,
                           @RequestParam(defaultValue = "1") String      pageNo,
                           @RequestParam(defaultValue = "0") int         contentId)
            throws RestClientException, URISyntaxException
    {
        // ApiClient로 API response 객체를 받아온다.
        PetTourResponse response = commonApiClient.apiDetailPetTour(pageNo, contentId);

        // @SessionAttributes("petTourInfos") 에 설정한 이름으로 session에 저장한다. - Detail 페이지로 갈때 다시 Api 호출하면 느려지므로
        ArrayList<PetTourItem> petTourInfos = response.getPetTourItems();
        
        //컨텐츠 아이디만 List<Integer>으로 만든다
        List<Integer> contentIdList = petTourInfos.stream().map(petTourItem -> Integer.parseInt(petTourItem.getPetinfoContentid())).collect(Collectors.toList());
        
        //TODO: Comm 에서 데이터를 가져와야하는데 PetInfo에서 가져왔네
        List<PetInfo> dbPetTours= tripService.getPetTourListByContentIds(contentIdList);
        
        log.info("petTourInfos : {} , petTourInfos : {}", petTourInfos.size(), dbPetTours.size());
        
        //리스트에 보여줄 petInfo정보에 DB정보를 담아서 보내준다.
        for(PetTourItem petTourItem : response.getPetTourItems()) 
        {
            petTourItem.setDbExistYn("미등록");
            petTourItem.setDbAcmpyTypeCd(null);
            
            //DB에서 가져온 정보로 for문
            for (PetInfo dbPetTour : dbPetTours)
            {
                //DB에서 가져온 contentId 가 있을때 
                if(dbPetTour.getPetinfoContentid() == Integer.parseInt(petTourItem.getPetinfoContentid()))
                {
                    petTourItem.setDbExistYn("등록");
                    petTourItem.setDbAcmpyTypeCd(dbPetTour.getAcmpyTypeCd());
                }
            }
        }

        petTourInfos = response.getPetTourItems();
        session.setAttribute("petTourInfos", petTourInfos);//detail화면을 위한 세션저장

        return ResponseEntity.ok(response);
    }
    /** 트립 매핑 - 상세 화면으로 이동 */
    @GetMapping("/admin/tripDetail")
    public ModelAndView stayDetail(@SessionAttribute("petTourInfos") ArrayList<PetTourItem> petTourInfos,
                                   @RequestParam(defaultValue = "")  int                    contentId,
                                                                     ModelAndView           modelAndView,
                                                                     HttpSession            session)
            throws RestClientException, URISyntaxException
    {
        PetTourItem petTourDetail = new PetTourItem();

        List<PetTourItem> selectedItems = petTourInfos.stream().filter(petTourInfo -> Integer.parseInt(petTourInfo.getPetinfoContentid()) == contentId).collect(Collectors.toList());
        
        if(!selectedItems.isEmpty()) 
        {
            petTourDetail = selectedItems.get(0);
        }
        session.setAttribute("petTourDetail", petTourDetail);
        modelAndView.addObject("contentId", contentId);
        modelAndView.setViewName("/admin/tripDetail");

        return modelAndView;
    }

    /** 트립 매핑 - 상세 화면 ajax */
    @GetMapping("/admin/tripDetailAjax")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> tripDetailAjax(ModelAndView           modelAndView,
                           @RequestParam("contentId")         int                    contentId , 
                           @SessionAttribute("petTourInfos")  ArrayList<PetTourItem> petTourInfos,
                                                                                     HttpSession  session)
            throws RestClientException, URISyntaxException
    {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        /* 1. 파라미터로 가져온 contentId 를 가지고 공통 API 객체를 받아온다(petTour쪽은 List<> 타입으로 세션에 저장 해놓음) */
        /* 2. 가져온 트립 객체를 세션에 저장한다(DB에 insert 할때는 세션에서 객체만 가져오도록) */
        /* 3. List에서 contentId에 해당하는 객체만 세션에 저장한다. */
        DetailCommonResponse commonResponse = commonApiClient.apiDetailCommonToContentId(contentId);
        PetTourResponse petTourResponse     = commonApiClient.apiDetailPetTour("1", contentId);// ApiClient로 API response 객체를 받아온다.
        DetailCommonItem detailCommonItem   = commonResponse.getDetailCommonItems().get(0);
        PetTourItem petTourReponseItem      = petTourResponse.getPetTourItems().get(0);

        

        Category category = commonService.getAllCategory(detailCommonItem.getCat3());
        
        CommonArea commonArea = commonService.getFullAreaName(detailCommonItem.getAreacode() + detailCommonItem.getSigungucode());

        
        log.info("tripDetailAjax petTourInfos : {}", petTourInfos);
        
        log.info("tripDetailAjax detailCommonItem : {}, petTourReponseItem : {}", detailCommonItem, petTourReponseItem);

        petTourReponseItem.setDbExistYn("미등록");
        petTourReponseItem.setDbAcmpyTypeCd(null);
        
        for (PetTourItem petTourInfo : petTourInfos)
        {
            if(Integer.parseInt(petTourInfo.getPetinfoContentid()) == contentId)
            {
                petTourReponseItem.setDbExistYn("등록");
                petTourReponseItem.setDbAcmpyTypeCd(petTourInfo.getAcmpyTypeCd());
            }
        }
        session.setAttribute("detailCommonItem", detailCommonItem  );
        session.setAttribute("petTourDetail"   , petTourReponseItem);
        
        resultMap.put("detailCommonItem", detailCommonItem);
        resultMap.put("petTourDetailMap", petTourReponseItem);
        resultMap.put("category"        , category);
        resultMap.put("commonArea"      , commonArea);

        return ResponseEntity.ok(resultMap);
    }

    /** 컨텐츠 등록 처리 */
    @PostMapping("/admin/tripDetail")
    @ResponseBody
    public ModelAndView tripSave(                             ModelAndView     modelAndView,
                           @RequestParam("contentId")         int              contentId , 
                                                              HttpSession      session)
                           throws RestClientException, URISyntaxException
    {
        DetailCommonResponse commonResponse   = commonApiClient.apiDetailCommonToContentId(contentId);
        PetTourResponse      petTourResponse  = commonApiClient.apiDetailPetTour("1", contentId);// ApiClient로 API response 객체를 받아온다.
        PetInfo              dbPetInfo        = tripService.getPetTourByContentId(contentId);
        DetailCommonItem     detailCommonItem = commonResponse.getDetailCommonItems().get(0);
        PetTourItem          petTourItem      = petTourResponse.getPetTourItems().get(0);
        String contentTypeId = null;
        int petTripResult = 0;
        int petInfoResult = 0;
        
        //이미 저장되어 있는 컨텐츠라면 insert하지 않는다. TODO: 시간나면 수정기능 추가 예정
        if(dbPetInfo !=null)
        {
            modelAndView.addObject("requestMsg", "이미 저장되어있는 컨텐츠입니다.");
            modelAndView.addObject("contentId"   , detailCommonItem.getContentid());
            modelAndView.setViewName("admin/tripDetail");
    
            return modelAndView;
        }
        
        // 1. DetailCommonItem 에서 컨텐츠타입아이디를 가져온다.
        contentTypeId = detailCommonItem.getContenttypeid();

        // 2. 컨텐츠타입아이디로 VO를 선언한다
        if (contentTypeId.equals("12")) // 여행지- Trip
        {
            Spot spot = new Spot();
            // Spot와 DetailCommonItem객체를 매핑한다.
            mappingCommonItemVo(detailCommonItem, spot);

            // 3. VO로 save처리를 한다.
            petTripResult = tripService.saveTrip(spot);

        } else if (contentTypeId.equals("32")) // 숙소- Stay
        {
            Stay stay = new Stay();
            // Stay와 DetailCommonItem객체를 매핑한다.
            mappingCommonItemVo(detailCommonItem, stay);

            // 3. VO로 save처리를 한다.
            petTripResult = tripService.saveStay(stay);
        }
        Comm comm = new Comm();
        // Comm와 DetailCommonItem객체를 매핑한다.
        mappingCommonItemVo(detailCommonItem, comm);

        // 3. VO로 save처리를 한다.
        petTripResult += tripService.saveComm(comm);

        // 4. PetInfo를 저장처리한다.
        PetInfo petInfo = new PetInfo();
        // PetInfo와 PetTourItem객체를 매핑한다.
        mappingPetTourItemVo(petTourItem, petInfo);

        petInfoResult = tripService.savePetInfo(petInfo);

        if ((petInfoResult + petTripResult) == 3)
        {
            // 입력성공
            modelAndView.addObject("requestMsg", "성공적으로 저장되었습니다.");
        }
        else if ((petInfoResult + petTripResult) == 0)
        {
            modelAndView.addObject("requestMsg", "저장에 실패하였습니다.");
        }
        else
        {
            // 메인테이블 insert 실패
            modelAndView.addObject("requestMsg", "일부 테이블만 저장되었습니다.");
        }
        modelAndView.addObject("contentId"   , detailCommonItem.getContentid());
        modelAndView.setViewName("admin/tripDetail");

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

    /**
     * DetailCommonItem 을 다른 VO로 매핑해준다.
     * 
     * @param detailCommonItem
     * @param comm
     */
    private void mappingCommonItemVo(DetailCommonItem detailCommonItem, Spot spot)
    {
        spot.setTripContentId(Integer.parseInt(detailCommonItem.getContentid())); // 여행 콘텐츠 ID (기본키)
        spot.setTripAddress(detailCommonItem.getAddr1()); // 여행지 주소
        spot.setTripDetailAddress(detailCommonItem.getAddr2()); // 여행지 상세주소
        spot.setTripTitle(detailCommonItem.getTitle()); // 여행지 이름
        spot.setAreaCode(detailCommonItem.getAreacode()); // 지역 코드
        spot.setTripCategory1(detailCommonItem.getCat1()); // 여행 카테고리 대분류
        spot.setTripCategory2(detailCommonItem.getCat2()); // 여행 카테고리 중분류
        spot.setTripCategory3(detailCommonItem.getCat3()); // 여행 카테고리 소분류
        spot.setTripContentTypeId(detailCommonItem.getContenttypeid()); // 여행 콘텐츠 타입 ID
        if(detailCommonItem.getCreatedtime().length() ==12)
        {
            detailCommonItem.setCreatedtime(detailCommonItem.getCreatedtime()+"00");
        }
        if(detailCommonItem.getModifiedtime().length() ==12)
        {
            detailCommonItem.setModifiedtime(detailCommonItem.getModifiedtime()+"00");
        }
        LocalDate createdtime = LocalDateTime
                .parse(detailCommonItem.getCreatedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        LocalDate modifiedtime = LocalDateTime
                .parse(detailCommonItem.getModifiedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        spot.setTripCreateTime(createdtime); // 등록일
        spot.setTripModifyTime(modifiedtime); // 수정일
        spot.setTripImage(detailCommonItem.getFirstimage()); // 여행 이미지
        spot.setMapX(detailCommonItem.getMapx()); // x좌표
        spot.setMapY(detailCommonItem.getMapy()); // y좌표
        spot.setMapLevel(detailCommonItem.getMlevel()); // 축척
        spot.setTripTel(detailCommonItem.getTel()); // 여행 전화번호
        spot.setSigunguCode(detailCommonItem.getSigungucode()); // 시군구 코드
        spot.setHomepage(detailCommonItem.getZipcode()); // 홈페이지주소
        spot.setOverview(detailCommonItem.getOverview()); // 소개설명
    }

    private void mappingCommonItemVo(DetailCommonItem detailCommonItem, Stay stay)
    {
        stay.setStayContentId(Integer.parseInt(detailCommonItem.getContentid())); // 숙소 콘텐츠 ID (기본키)
        stay.setStayAddress(detailCommonItem.getAddr1()); // 숙소 주소
        stay.setStayDetailAddress(detailCommonItem.getAddr2()); // 숙소 상세주소
        stay.setStayTitle(detailCommonItem.getTitle()); // 숙소 이름
        stay.setAreaCode(detailCommonItem.getAreacode()); // 숙소 코드
        stay.setStayCategory1(detailCommonItem.getCat1()); // 숙소 카테고리 대분류
        stay.setStayCategory2(detailCommonItem.getCat2()); // 숙소 카테고리 중분류
        stay.setStayCategory3(detailCommonItem.getCat3()); // 숙소 카테고리 소분류
        stay.setStayContentTypeId(detailCommonItem.getContenttypeid()); // 숙소 콘텐츠 타입 ID
        if(detailCommonItem.getCreatedtime().length() ==12)
        {
            detailCommonItem.setCreatedtime(detailCommonItem.getCreatedtime()+"00");
        }
        if(detailCommonItem.getModifiedtime().length() ==12)
        {
            detailCommonItem.setModifiedtime(detailCommonItem.getModifiedtime()+"00");
        }
        LocalDate createdtime = LocalDateTime
                .parse(detailCommonItem.getCreatedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        LocalDate modifiedtime = LocalDateTime
                .parse(detailCommonItem.getModifiedtime(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")).toLocalDate();
        stay.setStayCreateTime(createdtime); // 등록일
        stay.setStayModifyTime(modifiedtime); // 수정일
        stay.setStayImage(detailCommonItem.getFirstimage()); // 숙소 이미지
        stay.setMapX(detailCommonItem.getMapx()); // x좌표
        stay.setMapY(detailCommonItem.getMapy()); // y좌표
        stay.setMapLevel(detailCommonItem.getMlevel()); // 축척
        stay.setStayTel(detailCommonItem.getTel()); // 숙소 전화번호
        stay.setSigunguCode(detailCommonItem.getSigungucode()); // 시군구 코드
        stay.setHomepage(detailCommonItem.getZipcode()); // 홈페이지주소
        stay.setOverview(detailCommonItem.getOverview()); // 소개설명
    }

    private void mappingCommonItemVo(DetailCommonItem detailCommonItem, Comm comm)
    {
        comm.setCommContentId(Integer.parseInt(detailCommonItem.getContentid())); // 공통 콘텐츠 ID (기본키)
        comm.setCommAddress(detailCommonItem.getAddr1()); // 공통컨텐츠 주소
        comm.setCommDetailAddress(detailCommonItem.getAddr2()); // 공통컨텐츠 상세주소
        comm.setCommTitle(detailCommonItem.getTitle()); // 공통컨텐츠 이름
        comm.setAreaCode(detailCommonItem.getAreacode()); // 지역 코드
        comm.setCommCategory1(detailCommonItem.getCat1()); // 공통 카테고리 대분류
        comm.setCommCategory2(detailCommonItem.getCat2()); // 공통 카테고리 중분류
        comm.setCommCategory3(detailCommonItem.getCat3()); // 공통 카테고리 소분류
        comm.setCommContentTypeId(detailCommonItem.getContenttypeid()); // 공통 콘텐츠 타입 ID
        comm.setCommCreateTime(detailCommonItem.getCreatedtime()); // 등록일
        comm.setCommModifyTime(detailCommonItem.getModifiedtime()); // 수정일
        comm.setCommImage(detailCommonItem.getFirstimage()); // 공통 이미지
        comm.setMapX(detailCommonItem.getMapx()); // x좌표
        comm.setMapY(detailCommonItem.getMapy()); // y좌표
        comm.setMapLevel(detailCommonItem.getMlevel()); // 축척
        comm.setCommTel(detailCommonItem.getTel()); // 공통 전화번호
        comm.setSigunguCode(detailCommonItem.getSigungucode()); // 시군구 코드
        comm.setHomepage(detailCommonItem.getZipcode()); // 홈페이지주소
        comm.setOverview(detailCommonItem.getOverview()); // 소개설명
    }

    /**
     * PetInfo와 PetTourItem객체를 매핑한다.
     * 
     * @param petTourItem
     * @param petInfo
     */
    private void mappingPetTourItemVo(PetTourItem petTourItem, PetInfo petInfo)
    {
        petInfo.setPetinfoContentid(Integer.parseInt(petTourItem.getPetinfoContentid())); // 콘텐츠아이디
        petInfo.setTourInfo(petTourItem.getTourInfo()); // 반려견관광정보
        petInfo.setAcmpyTypeCd(petTourItem.getAcmpyTypeCd()); // 동반구분
        petInfo.setRelaPosesFclty(petTourItem.getRelaPosesFclty()); // 관련구비시설
        petInfo.setRelaFrnshPrdlst(petTourItem.getRelaFrnshPrdlst()); // 관련비치품목
        petInfo.setRelaPurcPrdlst(petTourItem.getRelaPurcPrdlst()); // 관련구매품목
        petInfo.setRelaRntlPrdlst(petTourItem.getRelaRntlPrdlst()); // 관련렌탈품목
        petInfo.setAcmpyPsblCpam(petTourItem.getAcmpyPsblCpam()); // 동반가능동물
        petInfo.setEtcAcmpyInfo(petTourItem.getEtcAcmpyInfo()); // 기타동반정보
        petInfo.setAcmpyNeedMtr(petTourItem.getAcmpyNeedMtr()); // 동반시필요사항
    }
}
