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
<link rel="stylesheet" href="${path}/css/member/mypage/myBoard.css">

<!-- 메인 -->
<div class="content">
	<div class="container">
		<!-- 메인 메뉴 -->
		<div class="common-title">
			<p>마이페이지</p>
		</div>
		<!-- 사이드 바 메뉴 -->
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">마이페이지</li>
				<li class="notice-text"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
				<li class="board-text"><a href="${path}/memebr/mypage/my-board">내가 쓴 게시글</a>
			</ul>
		</div>
		<!-- 컨텐츠 -->
		<div class="common-list">
			<div class="common-detail-list myboard-detail-list">
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
							href="#" style="font-size: 16px;">[마이펫 자랑] 리드줄 어디꺼가 좋은간가요?</a></td>
						<td>ismoney</td>
						<td>139</td>
						<td>2023-10-13</td>
					</tr>
					<tr>
						<td>2</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[마이펫 자랑] 우리집 춘식이를 소개합니다.</a></td>
						<td>ismoney</td>
						<td>247</td>
						<td>2023-05-09</td>
					</tr>
					<tr>
						<td>3</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 오늘 저녁 뭐먹죠?</a></td>
						<td>ismoney</td>
						<td>18</td>
						<td>2024-01-05</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
					</tr>
					<tr>
						<td>4</td>
						<td
							style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
							href="#" style="font-size: 16px;">[수다] 강아지 간식 추천 부탁드립니다.</a></td>
						<td>ismoney</td>
						<td>27</td>
						<td>2023-12-28</td>
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

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />