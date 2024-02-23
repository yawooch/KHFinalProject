<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--  
<link rel="stylesheet" href="${path}/css/common/pawpawCommon.css">
-->
<link rel="stylesheet" href="${path}/css/community/notice.css">
<div class="community-wrap content">
	<div class="community-content">
		<div class="common-title">
			<p>공지사항</p>
		</div>
		<div class="community-container">
			<div class="common-sideMenu">
				<ul>
					<li class="community-text">커뮤니티</li>
					<li class="notice-text"><a href="${path}/community/notice">공지사항</a></li>
					<li class="board-text"><a href="${path}/community/board">자유 게시판</a>

						<ul class="community-detail-sideMenu">
							<li><a href="${ path }/community/board/talk">수다</a></li>
							<li><a href="#">마이펫 자랑</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="community-list">
				<div class="common-search">
					<div>
						TOTAL <span>26</span>건
					</div>
					<div>
						<select name="communitySelect" id="communitySelect">
							<option value="title" selected>제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div>
						<img src="${ path }/img/community/search.png"> <input type="text"
							name="communitySearch" id="communitySearch"
							placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<button>검색</button>
					</div>
				</div>
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
							<td><img src="${ path }/img/community/ant-design_sound-filled.png"
								alt=""></td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[공지사항] 2023 영월 댕댕트레인 안내!</a></td>
							<td>관리자</td>
							<td>139</td>
							<td>2023-10-13</td>
						</tr>
						<tr>
							<td><img src="${ path }/img/community/ant-design_sound-filled.png"
								alt=""></td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[공지사항] 댕댕트레킹, 프라이빗 반려견 트레킹 코스</a></td>
							<td>관리자</td>
							<td>247</td>
							<td>2023-05-09</td>
						</tr>
						<tr>
							<td><img src="${ path }/img/community/ant-design_sound-filled.png"
								alt=""></td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[공지사항] 2023 춘천 반려동물 페스티벌</a></td>
							<td>관리자</td>
							<td>350</td>
							<td>2023-05-04</td>
						</tr>
						<tr>
							<td><img src="${ path }/img/community/ant-design_sound-filled.png"
								alt=""></td>
							<td
								style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;"><a
								href="#" style="font-size: 16px;">[공지사항] '전국댕댕자랑' 수상작 발표~!!!!</a></td>
							<td>관리자</td>
							<td>1236</td>
							<td>2022-12-12</td>
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
<!--  
<script>
	const move = function() {
		const boardText = document.querySelector('#test1');
		
		boardText.style.color = "#B29254";
		
		location.href='${ path }/community/board'
		
	}
</script>
-->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />