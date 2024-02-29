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
			<div class="common-detail-list no-margin-top">
				<table style="width:100%;">
				<colgroup>
					<col width="120px"/>
					<col width="690px"/>
<%-- 					<col width="280px"/> --%>
<%-- 					<col width="120px"/> --%>
<%-- 					<col width="280px"/> --%>
				</colgroup>
				<tbody>
					<tr>
						<td>콘텐츠ID</td>
						<td>${selectedItem.petinfoContentid}</td>
					</tr>
					<tr>
						<td>반려견관광정보</td>
						<td  >${selectedItem.tourInfo}</td>
					</tr>
					<tr>
						<td>관련사고대비사항</td>
						<td >${selectedItem.relaAcdntRiskMtr}</td>
					</tr>
					<tr>
						<td>동반구분</td>
						<td >${selectedItem.acmpyTypeCd}</td>
					</tr>
					<tr>
						<td>관련구비시설</td>
						<td >${selectedItem.relaPosesFclty}</td>
					</tr>
					<tr>
						<td>동반가능동물</td>
						<td >${selectedItem.acmpyPsblCpam}</td>
					</tr>
					<tr>
						<td>관련비치품목</td>
						<td >${selectedItem.relaFrnshPrdlst}</td>
					</tr>
					<tr>
						<td>기타동반정보</td>
						<td style="text-align: left;text-wrap: wrap;">${selectedItem.etcAcmpyInfo}</td>
					</tr>
					<tr>
						<td>관련구매품목</td>
						<td>${selectedItem.relaPurcPrdlst}</td>
					</tr>
					<tr>
						<td>관련렌탈품목</td>
						<td >${selectedItem.relaRntlPrdlst}</td>
					</tr>
					<tr>
						<td>동반시필요사항</td>
						<td >${selectedItem.acmpyNeedMtr}</td>
					</tr>
					<tr>
						<td  colspan="2" style="text-align: left;overflow:hidden;width:800px;">산을 통째로 빌렸어요!<br>
							댕댕트레킹, 프라이빗 반려견 트레킹 코스<br> <br> 일시 : 2023년 5월 19일(금) ~
							21일(일)<br> 장소 : 하늘길 트레킹 코스 + 정선 하이원 리조트<br> <br>
							주요내용 : 6k, 4k, 3k 코스 자유 선택<br> 보듬 훈련사와 함께 대규모 트레킹 클래스<br>
							트레킹 대장(강형욱 훈련사)과 다양한 프로그램<br> 대상 : 보호자 3,500명 with 반려견<br>
							티켓 : 일반 참가권 49,000원 및 일부 할인적용 할인권 (숙박권 별도)<br> 링크 :
							https://dangdangtrekking.com/<br> <br> 
							<img src="${ path }/img/community/ddtrekking_1.jpg" alt="" style="width:100%;">
						</td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class="btn-wrap">
				<button class="common-btn" onClick="location.href='${path}/admin/tripList';">목록</button>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />