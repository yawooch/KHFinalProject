package com.kr.pawpawtrip.common.interceptor;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.admin.model.service.AdminService;
import com.kr.pawpawtrip.admin.model.vo.MemberAccsLog;
import com.kr.pawpawtrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberUrlCheckInterceptor implements HandlerInterceptor
{
    private final AdminService adminService;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        // 반환값이 false면 컨트롤러 실행 x

        log.info("preHandle() 호출");

        Member loginMember = (Member) request.getSession().getAttribute("loginMember");
        
        
        /********************************************************
         * request.getRequestURL()    http://localhost:8080/pawpawtrip/admin/dashboard 
         * request.getServletPath()   /admin/dashboard                                 
         * request.getServerPort()    8080                                             
         * request.getServerName()    localhost                                        
         * request.getContextPath()   /pawpawtrip                                      
         * request.getHeaderNames()   org.springframework.security.web.firewall.StrictHttpFirewall$StrictFirewalledRequest$2@6c6f4d2c
         * request.getRemoteAddr()    0:0:0:0:0:0:0:1                                                                                
         * request.getRemoteHost()    0:0:0:0:0:0:0:1                                                                                
         * request.getRemotePort()    62514                                                                                          
         * request.getRemoteUser()    null                                                                                           
         * request.getRequestURI()    /pawpawtrip/admin/tripList                                                                     
         ********************************************************/

        
        int memberNo = 0;
        MemberAccsLog memberAccsLog = new MemberAccsLog();
        memberAccsLog.setAccessAddr(request.getRemoteAddr());
        memberAccsLog.setAccessPath(request.getServletPath());
        
        
        
        if (loginMember != null)
        {
            String servletPath = request.getServletPath();
            if((loginMember.getMemberPetType() == null || loginMember.getMemberPetName() == null) && !servletPath.equals("/member/mypage/myInfo"))
            {
                request.setAttribute("msg", "필수정보 입력후 이용가능합니다.");
                request.getRequestDispatcher("/WEB-INF/views/member/mypage/myInfo.jsp").forward(request, response);
            }
            //로그인 객체가 있을때는 넣어준다.
            memberNo = loginMember.getMemberNo();
        }
        memberAccsLog.setMemberNo(memberNo);

        List<MemberAccsLog> todayVisitors = adminService.getVisitorLog(memberAccsLog);
        
        
        
        if (todayVisitors.size() == 0)
        {
            adminService.saveVisitorLog(memberAccsLog);
        }
        
        
        
        
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        
        System.out.println(today);
        
//        memberAccsLog.equals(remoteAddr);
        

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception
    {

        log.info("postHandle() 호출");

        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception
    {
        // 화면 처리까지 모두 끝나면 실행되는 메소드

        log.info("afterCompletion");

        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }

}
