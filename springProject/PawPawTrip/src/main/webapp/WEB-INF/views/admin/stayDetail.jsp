<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="content">
	<div class="container">
		<div class="common-title">
			<p>관리자</p>
		</div>
		<!-- <div class="community-container"> -->
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">관리자</li>
				<li class="notice-text"><a href="${path}/admin/dashboard">대시보드</a></li>
				<li class="board-text"><a href="${path}/admin/board">자유 게시판</a>

				<ul class="community-detail-sideMenu">
					<li><a href="${path}/admin/board/talk">수다</a></li>
					<li><a href="${path}/admin/board/mypet">마이펫 자랑</a></li>
				</ul></li>
			</ul>
		</div>
		<div class="common-list">
			<div class="common-search">
				<div></div>
				<div>
					<div></div>
					<div>
						<img src="${ path }/img/community/search.png"> <input type="text"
							name="communitySearch" id="communitySearch"
							placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<button>검색</button>
					</div>
				</div>
			</div>
			<div class="common-detail-list">
				<table border="1">
					<tr>
						<td style="background-color: #FDFAEF;">제목</td>
						<td colspan="5" class="community-td-title" style="text-align: left;">[공지사항] 댕댕트레킹, 프라이빗
							반려견 트레킹 코스</td>
					</tr>
					<tr>
						<td style="background-color: #FDFAEF;">작성자</td>
						<td>관리자</td>
						<td style="background-color: #FDFAEF;">등록일</td>
						<td>2023-05-09</td>
						<td style="background-color: #FDFAEF;">조회수</td>
						<td>251</td>
					</tr>
					<tr>
						<td colspan="6" class="community-td-content"
							style="text-align: left">산을 통째로 빌렸어요!<br>
							댕댕트레킹, 프라이빗 반려견 트레킹 코스<br> <br> 일시 : 2023년 5월 19일(금) ~
							21일(일)<br> 장소 : 하늘길 트레킹 코스 + 정선 하이원 리조트<br> <br>
							주요내용 : 6k, 4k, 3k 코스 자유 선택<br> 보듬 훈련사와 함께 대규모 트레킹 클래스<br>
							트레킹 대장(강형욱 훈련사)과 다양한 프로그램<br> 대상 : 보호자 3,500명 with 반려견<br>
							티켓 : 일반 참가권 49,000원 및 일부 할인적용 할인권 (숙박권 별도)<br> 링크 :
							https://dangdangtrekking.com/<br> <br> 
							<img src="${ path }/img/community/ddtrekking_1.jpg" alt="" width="800px">
						</td>
					</tr>
				</table>
			</div>
			<div class="btn-wrap"">
				<button class="common-btn">목록</button>
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


<jsp:include page="/WEB-INF/views/common/footer.jsp" />