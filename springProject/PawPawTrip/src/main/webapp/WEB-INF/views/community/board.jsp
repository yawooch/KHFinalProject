<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/css/community/board.css">

<style>
	.disable {
		pointer-events: none;
		background-color: #B29254;
		color: white;
	}
</style>

<div class="content">
	<div class="container">
		<div class="common-title">
			<p>자유 게시판</p>
		</div>
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">커뮤니티</li>
				<li class="notice-text"><a href="${path}/community/notice">공지사항</a></li>
				<li class="board-text"><a href="${path}/community/board">자유
						게시판</a>

					<ul class="community-detail-sideMenu">
						<li><a href="${ path }/community/board/talk">수다</a></li>
						<li><a href="${ path }/community/board/mypet">마이펫 자랑</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="common-list">
			<div class="common-search">
				<div>
					TOTAL <span>${ pageInfo.listCount }</span>건
				</div>
				<div>
					<div>
						<select name="communitySelect" id="communitySelect">
							<!-- <c:if test="searchInfoMap"></c:if> -->
							<option value="title" <c:if test="${searchInfoMap.select == 'title'}">selected</c:if>>제목</option>
							<option value="name" <c:if test="${searchInfoMap.select == 'name'}">selected</c:if>>작성자</option>
							<option value="content" <c:if test="${searchInfoMap.select == 'content'}">selected</c:if>>내용</option>
						</select>
					</div>
					<div>
						<img src="${ path }/img/community/search.png"> 
						<input type="text" name="communitySearch" id="communitySearch" placeholder="검색어를 입력해주세요." value="${ searchInfoMap.search }">
					</div>
					<div>
						<button onclick=search()>검색</button>
						<!--<button onclick="location.href='${path}/community/board'">검색</button>  -->
					</div>
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
					<c:if test="${ empty boardList }">
						<tr>
							<td colspan="5">조회된 데이터가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ not empty boardList }">
						<c:forEach var="board" items="${ boardList }">
							<tr>
								<c:if test="${ board.communityCategory eq '[공지사항]' }">
									<td>
										<img src="${ path }/img/community/ant-design_sound-filled.png" alt="">
									</td>
									<td class="common-text-left" style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;">
										<a href="${ path }/community/noticedetail" style="font-size: 16px;">${ board.communityCategory } ${ board.communityTitle }</a>
									</td>
									<td>${ board.communityWriterId }</td>
									<td class="common-text-right">${ board.communityCount }</td>
									<td>${ board.communityEd }</td>
								</c:if>
								<c:if test="${ board.communityCategory ne '[공지사항]' }">
									<td>${ board.communityRNUM }</td>
									<c:if test="${ board.communityCategory eq '[수다]' }">
										<td class="common-text-left" style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;">
											<a href="${ path }/community/board/talkdetail" style="font-size: 16px;">${ board.communityCategory } ${ board.communityTitle }</a>
										</td>
									</c:if>
									<c:if test="${ board.communityCategory eq '[마이펫 자랑]' }">
										<td class="common-text-left" style="display: block; padding-top: 20px; padding-left: 5px; border-style: none;">
											<a href="${ path }/community/board/mypetdetail" style="font-size: 16px;">${ board.communityCategory } ${ board.communityTitle }</a>
										</td>
									</c:if>
									
									<td>${ board.communityWriterId }</td>
									<td class="common-text-right">${ board.communityCount }</td>
									<td>${ board.communityEd }</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div class="btn-wrap">
				<button class="community-btn"
					onclick="location.href='${ path }/community/boardwrite'">글쓰기</button>
			</div>
			<div class="common-page-number">
				<ul>
					<!-- 페이징 처리 -->
					<!-- 이전 페이지 -->
					<li><a href="${ path }/community/board?page=${ pageInfo.prevPage }&select=${searchInfoMap.select}&search=${searchInfoMap.search}">&lt;</a></li>
					<!-- 5개 페이지 목록 -->
					<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
						<c:choose>
							<c:when test="${ current == pageInfo.currentPage }">
								<li class="disable"><a>${ current }</a></li>
							</c:when>
							<c:otherwise>
								<!--  
								<li><a href="${ path }/community/board?page=${ current }">${ current }</a></li>
								-->
								<li><a href="${ path }/community/board?page=${ current }&select=${searchInfoMap.select}&search=${searchInfoMap.search}">${ current }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<li><a href="${ path }/community/board?page=${ pageInfo.nextPage }&select=${searchInfoMap.select}&search=${searchInfoMap.search}">&gt;</a></li>
				</ul>
			</div>
		</div>
	</div>

</div>

<script>
function search() {
    var selectValue = document.getElementById("communitySelect").value;
    var searchValue = document.getElementById("communitySearch").value;
    var url = "${path}/community/board?select=" + selectValue + "&search=" + encodeURIComponent(searchValue);
    window.location.href = url;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />