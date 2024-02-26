<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/community/talkdetail.css">

<div class="content">
	<div class="container">
		<div class="common-title">
			<p>자유 게시판</p>
		</div>
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">커뮤니티</li>
				<li class="notice-text"><a href="${path}/community/notice">공지사항</a></li>
				<li class="board-text"><a href="${path}/community/board">자유 게시판</a>

					<ul class="community-detail-sideMenu">
						<li><a href="${ path }/community/board/talk" style="font-weight: bold; color: #B29254;">수다</a></li>
						<li><a href="${ path }/community/board/mypet">마이펫 자랑</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="common-list">

			<div class="community-detail-list">
				<table border="1">
					<tr>
						<td style="background-color: #FDFAEF;">제목</td>
						<td colspan="5" class="community-td-title" style="text-align: left;">[수다] 해상도 어떻게 하면
							좋아지나요?</td>
					</tr>
					<tr>
						<td style="background-color: #FDFAEF;">작성자</td>
						<td>comwang00</td>
						<td style="background-color: #FDFAEF;">등록일</td>
						<td>2023-10-30</td>
						<td style="background-color: #FDFAEF;">조회수</td>
						<td>11</td>
					</tr>
					<tr>
						<td colspan="6" class="community-td-content"
							style="text-align: left;">모니터가 이상한건지 컴퓨터가 이상한건지..<br>
							해상도가 엉망이네요..<br> 스트레스 장난아닙니다 -_-;;
						</td>
					</tr>
				</table>
			</div>
			<div class="btn-wrap"">
				<button class="community-btn" onclick="location.href='${ path }/community/board/talk'">목록</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />