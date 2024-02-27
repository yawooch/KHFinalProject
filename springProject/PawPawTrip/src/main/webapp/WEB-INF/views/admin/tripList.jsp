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
		<div class="common-sideMenu">
			<ul>
				<li class="">관리자</li>
				<li class=""><a href="${path}/admin/dashboard">대시보드</a></li>
				<li class="on"><a href="${path}/admin/tripList">포포트립 매핑</a>
				<li class=""><a href="${path}/admin/noticeWrite">공지사항 입력</a></li>
			</ul>
		</div>
		<div class="common-list">
			<div class="common-search">
				<div>
					TOTAL <span>51</span>건
				</div>
				<div>
					<div></div>
					<div>
						<img src="${ path }/img/community/search.png"> 
							<input type="text" name="communitySearch" id="communitySearch" placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<button>검색</button>
					</div>
				</div>
			</div>
			<div class="common-detail-list">
<!-- 				<table class="table table-bordered table-sm"> -->
				<table>
					<colgroup>
						<col width="45">
						<col width="520">
						<col width="82">
						<col width="82">
						<col width="82">
					</colgroup>
					<thead>
					<tr>
						<th>번호</th>
						<th>제목</tH>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
					</thead>
					<tbody>
					
	                <c:if test="${ empty response }">
	                    <tr>
	                        <td colspan="6">
	                            조회된 게시글이 없습니다.
	                        </td>
	                    </tr>	
	                </c:if>
	                <c:if test="${ not empty response }">
	                    <c:forEach var="petTour" items="${ response.petTourItems }">
	                        <tr>
	                            <td>${ petTour.petinfoContentid }</td>
<!-- 	                            <td> -->
<%-- 	                                <a href="${ path }/board/view?no=${petTour.no}"> --%>
<%-- 	                                    ${ petTour.title } --%>
<!-- 	                                </a> -->
<!-- 	                            </td> -->
	                            <td></td>
	                            <td></td>
	                            <td></td>
<%-- 	                            <td>${ petTour.writerId }</td> --%>
<%-- 	                            <td><fmt:formatDate value="${ petTour.createDate }" dateStyle="short"/></td> --%>
<!-- 	                            <td> -->
<%-- 	                                <c:if test="${ empty petTour.originalFilename }">							 --%>
<!-- 	                                    <span> - </span> -->
<%-- 	                                </c:if> --%>
	                                
<%-- 	                                <c:if test="${ not empty petTour.originalFilename }">							 --%>
<!-- 	                                    <span class="material-symbols-outlined">attach_file</span> -->
<%-- 	                                </c:if> --%>
<!-- 	                            </td> -->
<%-- 	                            <td>${ petTour.readCount }</td> --%>
	                        </tr>
	                    </c:forEach>
	                </c:if>
<!-- 					<tr> -->
<!-- 						<td>49</td> -->
<!-- 						<td> -->
<%-- 							<a href="${path}/admin/stayDetail">[공지사항] 2023 춘천 반려동물 페스티벌</a></td> --%>
<!-- 						<td>관리자</td> -->
<!-- 						<td>350</td> -->
<!-- 						<td>2023-05-04</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td> -->
<%-- 							<img src="${ path }/img/community/ant-design_sound-filled.png" alt=""> --%>
<!-- 						</td> -->
<!-- 						<td> -->
<%-- 							<a href="${path}/admin/stayDetail">[공지사항] '전국댕댕자랑' 수상작 발표~!!!!</a></td> --%>
<!-- 						<td>관리자</td> -->
<!-- 						<td>1236</td> -->
<!-- 						<td>2022-12-12</td> -->
<!-- 					</tr> -->
					</tbody>
				</table>
			</div>
			<div class="btn-wrap"">
				<button class="common-btn">목록</button>
			</div>
			
			<div class="common-page-number">
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


<jsp:include page="/WEB-INF/views/common/footer.jsp" />