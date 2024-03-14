<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- **************** 헤더 *************** -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/member/mypage/myTrip.css">

<!-- **************** 바디 *************** -->
<div class="content">
	<div class="container">
	
		<!-- 메인 메뉴 -->
		<div class="common-title">
			<p>내가 찜한 장소</p>
		</div>
		
		<!-- 사이드 바 메뉴 -->
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">마이페이지</li>
				<li class="notice-text"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
				<li class="notice-text"><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a></li>
				<li class="board-text"><a href="${path}/member/mypage/my-trip">내가 찜한 장소</a></li>
			</ul>
		</div>
		
		<!-- 컨텐츠 -->
		<div class="common-list">
			
		</div>		
	</div>
</div>

<!-- **************** 푸터 **************** -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />