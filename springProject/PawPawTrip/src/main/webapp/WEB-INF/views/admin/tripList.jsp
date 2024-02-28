<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script>
function showPaging(pageNo , numOfRows, totalCount, pagingNum)
{
	pageNo = pageNo<1?1:pageNo;
	let pagingTagResult = '';
	let maxPagingNo   = totalCount/pagingNum;
	let strPagingNo   = 0;
	let endPagingNo   = 0;
	console.log('pageNo : ' + pageNo);
	console.log('maxPagingNo : ' + maxPagingNo);
	//pageNo
	//numOfRows
	//totalCount

	//strPagingNo = pageNo / pagingNum + 1
	//endPagingNo = pageNo / pagingNum + pagingNum
	console.log(Math.floor(pageNo / pagingNum)*pagingNum);
	strPagingNo = Math.floor(pageNo / pagingNum)*pagingNum + 1;
	endPagingNo = strPagingNo + pagingNum;
	$('div.common-page-number').empty();
		
	
	pagingTagResult += '<ul>';
	pagingTagResult += '    <li><a href="#">&laquo</a></li>';
	pagingTagResult += '    <li><a href="#">&lt;&lt;</a></li>';
	pagingTagResult += '    <li><a href="#">&lt;</a></li>';
	for(let idx = strPagingNo; idx<endPagingNo; idx++)
	{
		pagingTagResult += '    <li'+ (idx==pageNo?' class="on"':'') +'><a href="#">'+ idx +'</a></li>';
	}
	pagingTagResult += '    <li><a href="#">&gt;</a></li>';
	pagingTagResult += '    <li><a href="#">&gt;&gt;</a></li>';
	pagingTagResult += '    <li><a href="#">&raquo;</a></li>';
	pagingTagResult += '</ul>';
	$('div.common-page-number').append(pagingTagResult);
}

function showList(pageNo, contentId)
{				
	console.log(pageNo, contentId);
// 	console.log(`pageNo : ${pageNo}, contentId : ${contentId}`);
	
// 	$.getJSON('${path}/admin/tripListApi', {pageNo, contentId}).done((data) =>
// 	{
// 		console.log(data);
// 		let result = '';
// // 		let {pageNo, numOfRows, totalCount, items} = data.response.body;
// 		let {pageNo, numOfRows, totalCount, petTourItems} = data;
// 		console.log(petTourItems);
// // 		let {item} = items;
// // 		item.forEach((element, idx) => {
// 		petTourItems.forEach((element, idx) => {
// 			result += '<tr>';
// 			result += '		<td>' + idx + '</td>'
// 			result += '		<td><a href="${path}/admin/tripDetail?contentId=' + element.contentid + '">'
// 			result += '			' + element.contentid + '</a>'
// 			result += '		</td>'
// 			result += '		<td>' + idx + 'N</td>'
// 			result += '		<td>' + idx + '여행</td>'
// 			result += '		<td>' + idx + '2024-02-28</td>'
// 			result += '</tr>';
// 		});
		
// 		$('.common-detail-list>table>tbody').empty();
// 		$('.common-detail-list>table>tbody').append(result);
// 		$('.common-search>div:nth-child(1)>span').text(totalCount)
// 		console.log($('.common-search>div:nth-child(1)>span').text(totalCount));
		
// 		//  $('#currentPage').text(pageNo);
// 		//  $('#lastPage').text(Math.ceil(totalCount / numOfRows));
// 	});
	showPaging(pageNo , 10, 1010, 5);
}

$(document).ready(() => {
	//리스트를 먼저 보여준다.
	showList(102, $('#contentId').val());
	
	$('#contentId').on('change', (event) => {
		showList(1, $(event.target).val());
	});
	
	// $('#prevPage').on('click', () => {
	// 	let prevPage = Number.parseInt($('#currentPage').text()) - 1;
	
	// 	prevPage = prevPage > 0 ? prevPage : 1;
		
	// 	console.log(`Prev Page : ${prevPage}`);
		
	// 	showList(prevPage, $('#courseId').val());
	// });
	
	// $('#nextPage').on('click', () => {
	// 	let nextPage = Number.parseInt($('#currentPage').text()) + 1;
	// 	let lastPage = Number.parseInt($('#lastPage').text());
		
	// 	nextPage = nextPage > lastPage ? lastPage : nextPage;
		
	// 	console.log(`Next Page : ${nextPage}`);
		
	// 	showList(nextPage, $('#courseId').val());
		
	// });
	
});
</script>
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
				<div style="width:100px;">
					TOTAL <span>51</span>건
				</div>
				<div>
					<div></div>
					<div style="width:200px;">
						<img src="${ path }/img/community/search.png"> 
							<input type="text" name="contentId" id="contentId" placeholder="컨텐츠 ID를 입력해주세요."style="width:160px;">
					</div>
					<div>
						<button>검색</button>
					</div>
				</div>
			</div>
			<div class="common-detail-list">
				<table>
					<colgroup>
						<col width="45">
						<col width="222">
						<col width="222">
						<col width="222">
						<col width="100">
					</colgroup>
					<thead>
					<tr>
						<th>번호</th>
						<th>콘텐츠 ID</tH>
						<th>매핑여부</th>
						<th>여행/숙박 구분</th>
						<th>등록일</th>
					</tr>
					</thead>
					<tbody>
	                    <tr>
	                        <td colspan="5">
	                            조회된 게시글이 없습니다.
	                        </td>
	                    </tr>	
					
<%-- 	                <c:if test="${ empty response }"> --%>
<!-- 	                    <tr> -->
<!-- 	                        <td colspan="6"> -->
<!-- 	                            조회된 게시글이 없습니다. -->
<!-- 	                        </td> -->
<!-- 	                    </tr>	 -->
<%-- 	                </c:if> --%>
<%-- 	                <c:if test="${ not empty response }"> --%>
<%-- 	                    <c:forEach var="petTour" items="${ response.petTourItems }" varStatus="eachStatus"> --%>
<!-- 	                        <tr> -->
<%-- 	                            <td>${eachStatus.count}</td> --%>
<%-- 	                            <td><a href="${path}/admin/tripDetail?contentId=${petTour.petinfoContentid}"> --%>
<%-- 	                                    ${petTour.petinfoContentid}</a> --%>
<!-- 	                            </td> -->
<!-- 	                            <td>N</td> -->
<!-- 	                            <td>여행</td> -->
<!-- 	                            <td>2024-02-28</td> -->
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
<!-- 	                        </tr> -->
<%-- 	                    </c:forEach> --%>
<%-- 	                </c:if> --%>
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
			<div class="btn-wrap">
				<button class="common-btn">일괄등록</button>
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