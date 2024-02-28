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
	<link rel="stylesheet" href="${path}/css/member/changePw.css">
	<link rel="stylesheet" href="${path}/css/member/member.css">
	
<section class="content container-fluid">
	<!-- 메인 -->
	<form class="container" action="${ path }/member/change-pw" method="post">
        <!-- 비밀번호 변경 -->
        <section class="member-content main-box">
            <!-- navi -->
            <div class="navi">
                <div class="findbyid">
                    <a href="${ path }/member/find-id" style="color: #B29254;">아이디 찾기</a>
                </div>
                <div class="findbypwd">
                    <a href="${ path }/member/find-pw" style="color: #FFF;">비밀번호 찾기</a>
                </div>
            </div>
            
            <!-- 메인 비밀번호 변경 창 -->
            <div class="main-table">
                <div class="findId-table">
                    <div class="findId-tr row">
                        <div class="col-lg-3">새 비밀번호</div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag1" type="text" name="" id="" />
                        </div>
                    </div>
                    <div class="findId-tr row">
                        <div class="col-lg-3">비밀번호 확인</div>
                        <div class="col-lg-9 findId-contain">
                            <input class="user_info_input_tag1" type="text" name="" id="" />
                        </div>
                    </div>
                    
                <div style="text-align: center">
                    <button class="paw_btn1" type="submit">변경하기</button>
                </div>
            </div>
        </section>
    </form>
</section>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
