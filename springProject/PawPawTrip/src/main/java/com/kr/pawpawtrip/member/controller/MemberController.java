package com.kr.pawpawtrip.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.service.CommunityService;
import com.kr.pawpawtrip.community.model.vo.Community;
import com.kr.pawpawtrip.member.model.service.MemberService;
import com.kr.pawpawtrip.member.model.vo.Member;
import com.kr.pawpawtrip.trip.model.service.TripService;
import com.kr.pawpawtrip.trip.model.vo.MyTrip;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
    @Autowired // 빈을 만들어 주입
    private MemberService    service;
    private CommunityService communityService;
    private TripService      tripService;
    
    
    // 로그인 화면
    @GetMapping("/login")
    public String login() {
        
        return "member/login";
    }
    
    // SessionAttributes와 ModelAndView(데이터와 뷰에 대한 정보를 담는 객체) 객체를 사용
    // 로그인
    @PostMapping("/login")
    public ModelAndView login(ModelAndView modelAndView,
                              HttpSession session,
                              HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestParam String memberId,
                              @RequestParam String memberPw,
                              @RequestParam String saveId) {
        
        // 로그인 후 바로 메인화면으로 이동 (좌측 상단 로그인 > 로그아웃)
//      modelAndView.setViewName("redirect:/");
        
        if (saveId.equals("true")) {
            // 전달된 아이디를 쿠키에 저장
            // 1. 쿠키 생성
            Cookie cookie = new Cookie("saveId", memberId);
            cookie.setMaxAge(259200); // 3일 동안 유지
            
            // 2. response 객체에 쿠키 추가
            response.addCookie(cookie);
        } else {
            // 쿠키 삭제
            Cookie cookie = new Cookie("saveId", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        Member loginMember = service.login(memberId, memberPw);
        
        System.out.println("loginMember : " + loginMember);
        
        if (loginMember != null) {
            modelAndView.setViewName("redirect:/");
            session.setAttribute("loginMember", loginMember);
        } else {
            modelAndView.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
            modelAndView.addObject("location", "/login");
            modelAndView.setViewName("common/msg");
        }
        
        return modelAndView;
    }
    
    // 로그아웃(SessionStatus 객체 사용)
    @GetMapping("/logout")
    public String logout(SessionStatus status) {
        
        // 세션 영역으로 확장된 Attribute를 지워준다.
        status.setComplete();
        
        return "redirect:/";
    }
    
    // 카카오 로그인
    @GetMapping("/kakaoLogin")
    public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, ModelAndView modelAndView) throws IOException 
    {
        System.out.println("#########" + code);
        
        // code를 보내 access_Token 얻기
        String access_Token = service.getAccessToken(code);
        
        // access_Token을 보내 사용자 정보 얻기
        Member userInfo = service.getUserInfo(access_Token);
        
        session.setAttribute("loginMember", userInfo);
        
        // 나의 펫 이름, 타입 정보가 없을 경우 회원정보 수정으로 보낸다.
        if(userInfo.getMemberPetName() == null && userInfo.getMemberPetType() == null) 
        {
            modelAndView.addObject("msg", "마이펫 이름, 타입 수정 후 페이지 이용 가능합니다.");
            modelAndView.addObject("location", "/member/mypage/my-info");
            modelAndView.setViewName("common/msg");
        }
        else
        {
            modelAndView.setViewName("redirect:/");
        }
        return modelAndView;
    }

    
    // 아이디 찾기
    @GetMapping("/member/find-id")
    public String findId() {
        
        return "member/findId";
    }
  
    // 아이디 찾기 완료
    @PostMapping("/member/complete-id")
    public ModelAndView findIdComplete(ModelAndView modelAndView,
                                        @RequestParam String memberName,
                                        @RequestParam String memberPhone) {
        
        
        String memberId = service.findMemberId(memberName, memberPhone);
        
        if(memberId != null) {
            modelAndView.addObject("memberId", memberId);
            modelAndView.setViewName("member/findIdComplete");
        } else {
            modelAndView.addObject("msg", "회원을 찾을 수 없습니다. 다시 확인 해주세요.");
            modelAndView.addObject("location", "/member/find-id");
            modelAndView.setViewName("common/msg");
        }
        
        return modelAndView;
    }
     
    // 비밀번호 찾기 페이지
    @GetMapping("/member/find-pw")
    public String findPw() {
        
        return "member/findPw";
    }
    
    // 비밀번호 찾기
    @PostMapping("/member/change-pw")
    public ModelAndView changePw(ModelAndView modelAndView,
                                 HttpSession session,
                                 @RequestParam String memberId,
                                 @RequestParam String memberName,
                                 @RequestParam String memberPhone) {
        
        Member member = service.findMemberAndChangePw(memberId, memberName, memberPhone);
        
        session.setAttribute("updateMember", member);
        
        if(member != null) {
            modelAndView.addObject("member", member);
            modelAndView.setViewName("member/changePw");
        } else {
            modelAndView.addObject("msg", "회원을 찾을 수 없습니다. 다시 확인 해주세요.");
            modelAndView.addObject("location", "/member/find-pw");
            modelAndView.setViewName("common/msg");
        }
        
        return modelAndView;
    }
    
    // 비밀번호 변경 
    @PostMapping("/member/complete-pw")
    public ModelAndView findPwComplete(HttpSession session,
                                       ModelAndView modelAndView,
                                       Member member) {
        
        Member updateMember = (Member) session.getAttribute("updateMember");
        
        member.setMemberNo(updateMember.getMemberNo());
        
        int result = service.save(member);
        
        if (result > 0) {
            // 비밀번호 변경 완료
            modelAndView.addObject("updateMember", service.findMemberById(updateMember.getMemberId()));
            modelAndView.setViewName("member/findPwComplete");
        } else {
            // 비밀번호 변경 실패
            modelAndView.addObject("msg", "비밀번호 변경에 실패하였습니다.");
            modelAndView.addObject("location", "redirect:/member/find-pw");
            modelAndView.setViewName("common/msg");
        }
        
        return modelAndView;
    }
    
    // 마이페이지 - 회원 정보 수정
    @GetMapping("/member/mypage/my-info")
    public String myInfo() {
        log.info("myInfo() 호출 마이페이지 요청");
        
        return "member/mypage/myInfo";
    }
    
    @PostMapping("/member/mypage/update")
    public ModelAndView update(ModelAndView modelAndView, Member member, @SessionAttribute("loginMember") Member loginMember, HttpSession session) {

        member.setMemberNo(loginMember.getMemberNo()); // 실제 로그인 멤버의 정보
        
        int result = service.save(member);
        
        System.out.println(result);
        
        if (result > 0) {
            // 회원정보 수정 완료
            loginMember = service.findMemberById(member.getMemberId());
            session.setAttribute("loginMember", loginMember);
            modelAndView.addObject("loginMember", service.findMemberById(loginMember.getMemberId()));
            modelAndView.addObject("msg", "회원 정보 수정 완료");
        } else {
            // 회원정보 수정 실패
            modelAndView.addObject("msg", "회원 정보 수정 실패");
        }
        
        modelAndView.addObject("location", "/member/mypage/my-info");
        modelAndView.setViewName("common/msg");
        
        return modelAndView;
    }
    
    // 회원 탈퇴 (status 변경)
    @GetMapping("/member/mypage/delete")
    public ModelAndView delete(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember) {
        
        int result = service.delete(loginMember.getMemberNo());
        
        if (result > 0) {
            modelAndView.addObject("msg", "정상적으로 탈퇴되었습니다.");
            modelAndView.addObject("location", "/logout");
        } else {
            modelAndView.addObject("msg", "탈퇴에 실패하였습니다.");
            modelAndView.addObject("location", "/member/mypage/my-info");
        }
        
        modelAndView.setViewName("common/msg");
        
        return modelAndView;
    }
    
    // 마이페이지 - 내가 쓴 게시글
    @GetMapping("/member/mypage/my-board")
    public ModelAndView myBoard(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
        
        List<Community> community = null;
        Member loginMember = (Member) session.getAttribute("loginMember");
        // 페이징 처리
        PageInfo pageInfo = null;
        // 내가 쓴 게시글 수
        int listCount = 0;
        
        if(loginMember != null) {
            listCount = communityService.getBoardByMemberCount(loginMember.getMemberNo());
            
            pageInfo = new PageInfo(page, 5, listCount, 15);
            
            System.out.println("내가 쓴 게시글 수 : " + listCount);
            
            // 회원 번호를 통해 게시글 조회
            community = communityService.getBoardByMember(pageInfo, loginMember.getMemberNo());
            
            System.out.println(community);
            
            modelAndView.addObject("pageInfo", pageInfo);
            modelAndView.addObject("community", community);
            modelAndView.setViewName("member/mypage/myBoard");
        } else {
            modelAndView.addObject("msg", "로그인 후 이용해주세요.");
            modelAndView.addObject("location", "/login");
            modelAndView.setViewName("common/msg");
        }
        
        
        log.info("myBoard() - 호출");

        
        return modelAndView;
    }
    
    // 회원가입 화면
    @GetMapping("/enroll")
    public String enroll() {
        
        return "member/enroll";
    }
    
    // 회원가입
    @PostMapping("/enroll")
    public ModelAndView enroll(ModelAndView modelAndView, Member member) {
        //log.info("enroll() 호출 - 회원 가입 페이지 호출");
        
        member.setMrktAgreeYn(member.getMrktAgreeYn()==null?"N":"Y");
        member.setRecvAgreeYn(member.getRecvAgreeYn()==null?"N":"Y");
        member.setLocaAgreeYn(member.getLocaAgreeYn()==null?"N":"Y");
        
        int result = service.save(member);
        
        System.out.println("member : " + member);
        if (result > 0) {
            // 회원가입 성공 페이지로 이동
            modelAndView.setViewName("member/enrollComplete");
        } else {
            modelAndView.addObject("msg", "회원 가입 실패");
            modelAndView.addObject("location", "/enroll");
            modelAndView.setViewName("common/msg");
        }
        
        return modelAndView;
    }
    
    // 회원가입 완료창
    @GetMapping("/member/complete")
    public String enrollComplete() {
        
        return "member/enrollComplete";
    }
    
    // 아이디 중복확인
    @GetMapping("/member/idCheck")
    @ResponseBody
    public Map<String, Boolean> idCheck(@RequestParam String memberId) {
        Map<String, Boolean> map = new HashMap<>();
        
        log.info("MemberId : {}", memberId);
        
        map.put("duplicate", service.isDuplicateId(memberId));
        
        return map;
    }


    
    // 내가 찜한 장소(관광지, 숙소) 조회
   @GetMapping("/member/mypage/my-trip")
   public ModelAndView myTrip(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
      
      // 찜한 장소의 정보가 담겨있는 클래스 사용(내부에 spot, stay 객체가 있음)
      List<MyTrip> myTrips = null;
      
      // 로그인한 멤버 객체만 해당 페이지를 사용할 수 있도록 설정
      Member loginMember = (Member) session.getAttribute("loginMember");
      
      // 페이징 처리
      PageInfo pageInfo = null;
      
      // 조회된 전체 게시물 수
      int listCount = 0;
      
      // 로그인한 멤버와 로그인하지 않은 멤버를 구분한 뒤 포워딩
      if (loginMember != null) {
         int memberNo = loginMember.getMemberNo();
         
         // 로그인한 멤버일 경우, 해당 멤버가 찜한 장소 목록 노출
         listCount = tripService.getMyTripByMemberNo(memberNo);
         
         // 페이징 처리
         pageInfo = new PageInfo(page, 5, listCount, 9);
         myTrips = tripService.getMyTripListByMemberNo(pageInfo, memberNo);
         
         for (MyTrip myTrip : myTrips) {
            myTrip.setMemberNo(memberNo);
            
            // 만약 이미지가 없을 시, 특정 이미지 노출
            if (myTrip.getImage() == null) {
               myTrip.setImage("/pawpawtrip/img/trip/readyImage.png");
            }
         }
         
         modelAndView.addObject("pageInfo", pageInfo);
         modelAndView.addObject("myTrips", myTrips);
         modelAndView.setViewName("member/mypage/myTrip");
         
      } else {
         // 로그인 하지 않은 멤버일 경우, msg 출력 & 로그인페이지로 이동
            modelAndView.addObject("msg", "로그인 후 이용해주세요.");
            modelAndView.addObject("location", "/login");
            modelAndView.setViewName("common/msg");
      }
      
      return modelAndView; 
   }
   
   // 찜 목록에 추가
   @GetMapping("/member/mypage/my-trip/insert")
   public ModelAndView insertSpotToZzim(ModelAndView modelAndView, @RequestParam("contentId") String contentId, @RequestParam("memberNo") int memberNo, HttpSession session) {
      
      // contentId와 memberNo를 받아 한 행(My Trip) 추가
      tripService.saveMyTrip(contentId, memberNo);
      
      modelAndView.addObject(contentId, session);
      modelAndView.addObject("msg", "찜 목록에 추가되었습니다.");
      modelAndView.setViewName("common/msg");
      
      return modelAndView;
   }

   // 찜 목록에서 삭제
   @GetMapping("/member/mypage/my-trip/delete")
   public ModelAndView deleteSpotToZzim(ModelAndView modelAndView, @RequestParam("contentId") String contentId, @RequestParam("memberNo") int memberNo, HttpSession session) {
       
       // contentId와 memberNo를 받아 한 행(My Trip) 삭제
       tripService.deleteMyTrip(contentId, memberNo);
       
       modelAndView.addObject(contentId, session);
       modelAndView.addObject("msg", "찜 목록에서 삭제되었습니다.");
       modelAndView.setViewName("common/msg");
       
       return modelAndView;
   }
}