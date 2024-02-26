<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/member/mypage/myBoard.css">

<div class="community-wrap content">
	<div class="community-content">
		<div class="common-title">
			<p>마이페이지</p>
		</div>
				
        <div class="community-container">
        	<!-- 사이드 바 메뉴 -->
            <div class="common-sideMenu">
				<ul>
					<li class="community-text">마이페이지</li>
					<li class="notice-text"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
					<li class="board-text"><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a></li>
				</ul>
			</div>
					
			<!-- 메인 -->
			<div class="community-list">
				<div class="common-detail-list">
					<table border="1">
						<tr style="background-color: #FDFAEF;">
							<td>번호</td>
							<td style="text-align: center; cursor: default;">제목</td>
							<td>작성자</td>
							<td style="text-align: center;">조회수</td>
							<td>등록일</td>
						</tr>
						
						<tr>
							<td>1</td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
							<td>ismoney</td>
							<td>350</td>
							<td>2023-05-04</td>
						</tr>
						<tr>
							<td>2</td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[수다] 오늘 저녁 뭐먹죠?</a></td>
							<td>ismoney</td>
							<td>1236</td>
							<td>2022-12-12</td>
						</tr>
						<tr>
							<td>3</td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[마이펫 자랑] 우리집 춘식이를 소개합니다.</a></td>
							<td>ismoney</td>
							<td>24</td>
							<td>2024-01-03</td>
						</tr>
						<tr>
							<td>4</td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[마이펫 자랑] 리드줄 어디꺼가 좋은간가요?</a></td>
							<td>ismoney</td>
							<td>28</td>
							<td>2023-11-03</td>
						</tr>
					</table>
				</div>
				
				<div class="common-page-number">
					<ul>
						<li><a href="#"><</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

