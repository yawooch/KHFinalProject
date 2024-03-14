package com.kr.pawpawtrip.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberUrlCheckInterceptor implements HandlerInterceptor
{

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

        if (loginMember != null)
        {
            String servletPath = request.getServletPath();
            if((loginMember.getMemberPetType() == null || loginMember.getMemberPetName() == null) && !servletPath.equals("/member/mypage/myInfo"))
            {
                request.setAttribute("msg", "필수정보 입력후 이용가능합니다.");
                request.setAttribute("location", "/member/mypage/myInfo");
//                response.sendRedirect(request.getContextPath() + "/common/msg");
//                request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
                request.getRequestDispatcher("/WEB-INF/views/member/mypage/myInfo.jsp").forward(request, response);
//                request.getRequestDispatcher("/member/mypage/myInfo").forward(request, response);
            }
        }

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
