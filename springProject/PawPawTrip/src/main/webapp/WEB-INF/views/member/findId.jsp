<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="${path}/css/member/findId.css">
	<link rel="stylesheet" href="${path}/css/member/member.css">
	
<section class="content container-fluid">
	<!-- 메인 -->
	<form class="container" action="${ path }/member/find-id" method="post">
        <!-- 아이디찾기 -->
        <section class="member-content main-box">
            <!-- navi -->
            <div class="navi">
                <div class="findbyid">
                    <a href="${ path }/member/find-id" style="color: #FFF;">아이디 찾기</a>
                </div>
                <div class="findbypwd">
                    <a href="${ path }/member/find-pw" style="color: #B29254;">비밀번호 찾기</a>
                </div>
            </div>
            
            <!-- 메인 아이디 찾기 창 -->
            <div class="main-table">
                <div class="findId-table">
                    <div class="findId-tr row">
                        <div class="col-lg-3">이름</div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag1" type="text" name="" id="" />
                            <button class="paw_btn2" type="button" style="visibility: hidden;">숨기기</button>
                        </div>
                    </div>
                    <div class="findId-tr row">
                        <div class="col-lg-3">휴대폰 번호</div>
                        <div class="col-lg-9 findId-contain" style="display:inline-flex;">
                            <input class="contain-button" type="text" name="" id="" placeholder="휴대폰 번호 '-' 제외하고 입력" />
                            <button class="col-12 paw_btn2">인증받기</button>
                        </div>
                    </div>
                    <div class="findId-tr row">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag2" type="text" name="" id="" placeholder="인증번호 입력" />
                        	<button class="paw_btn2">확인</button>
                        </div>
                    </div>
                </div>
                <div style="text-align: center">
                    <button class="paw_btn1" type="submit">아이디 찾기</button>
                </div>
            </div>
        </section>
    </form>
</section>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
