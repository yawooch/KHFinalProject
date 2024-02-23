<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/member/mypage/myBoard.css">
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	
	<!-- 메인 -->
	<div class="notice-wrap">
		<div class="notice-content">
			<div class="notice-title">
				<p>마이페이지</p>
			</div>
			<div class="notice-container">
				<div class="notice-sideMenu">
					<ul>
						<li class="community-text">마이페이지</li>
						<li class="notice-text"><a href="#">회원 정보 수정</a></li>
						<li class="board-text"><a href="#">내가 쓴 게시글</a></li>
					</ul>
				</div>
				<div class="notice-list">
					<div class="notice-detail-list">
						<table border="1">
							<tr style="background-color: #FDFAEF;">
								<td>번호</td>
								<td style="text-align: center; cursor: default;">제목</td>
								<td>작성자</td>
								<td style="text-align: center;">조회수</td>
								<td>등록일</td>
							</tr>
							<tr>
								<td><img src="../resources/img/ant-design_sound-filled.png"
									alt=""></td>
								<td
									style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
									href="#">[공지사항] 2023 영월 댕댕트레인 안내!</a></td>
								<td>관리자</td>
								<td>139</td>
								<td>2023-10-13</td>
							</tr>
							<tr>
								<td><img src="../resources/img/ant-design_sound-filled.png"
									alt=""></td>
								<td
									style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
									href="#">[공지사항] 댕댕트레킹, 프라이빗 반려견 트레킹 코스</a></td>
								<td>관리자</td>
								<td>247</td>
								<td>2023-05-09</td>
							</tr>
							<tr>
								<td><img src="../resources/img/ant-design_sound-filled.png"
									alt=""></td>
								<td
									style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
									href="#">[공지사항] 2023 춘천 반려동물 페스티벌</a></td>
								<td>관리자</td>
								<td>350</td>
								<td>2023-05-04</td>
							</tr>
							<tr>
								<td><img src="../resources/img/ant-design_sound-filled.png"
									alt=""></td>
								<td
									style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
									href="#">[공지사항] '전국댕댕자랑' 수상작 발표~!!!!</a></td>
								<td>관리자</td>
								<td>1236</td>
								<td>2022-12-12</td>
							</tr>
						</table>
					</div>
					<div class="notice-page-number">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
