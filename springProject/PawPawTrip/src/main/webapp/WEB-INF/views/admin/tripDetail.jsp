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
				<table class="common-col-table" style="width: 100%;">
					<tbody>
						<tr>
							<td>콘텐츠ID</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.contentid}</td>
							<td>콘텐츠타입ID</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.contenttypeid}</td>
						</tr>
						<tr>
							<td>장소이름</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.title}</td>
							<td>DB 등록여부</td>
							<td class="common-text-left no-ellipsis"></td>
						</tr>
						<tr>
							<td>수정일</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.modifiedtime}</td>
							<td>등록일</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.createdtime}</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.tel}</td>
							<td>전화번호이름</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.telname}</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>교과서속여행지 여부</td> -->
<%-- 							<td class="common-text-left no-ellipsis">${detailCommonItem.booktour}</td> --%>
<!-- 						</tr> -->
						<tr>
							<td>대표이미지(원본)</td>
							<td colspan="3" class="common-text-left no-ellipsis"><img src="${detailCommonItem.firstimage}" style="width:100%;"/></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>대표이미지(썸네일)</td> -->
<%-- 							<td class="common-text-left no-ellipsis"><img src="${detailCommonItem.firstimage2}" style="width:100%;"/></td> --%>
<!-- 						</tr> -->
						<tr>
							<td>지역코드</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.areacode}</td>
							<td>시군구코드</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.sigungucode}</td>
						</tr>
						<tr>
							<td>대분류</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.cat1}</td>
							<td>중분류</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.cat2}</td>
						</tr>
						<tr>
							<td>소분류</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.cat3}</td>
							<td>저작권 유형</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.cpyrhtDivCd}</td>
						</tr>
						<tr>
							<td>주소</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.addr1}</td>
							<td>상세주소</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.addr2}</td>
						</tr>
						<tr>
							<td>GPS X좌표</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.mapx}</td>
							<td>GPS Y좌표</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.mapy}</td>
						</tr>
						<tr>
							<td>Map Level</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.mlevel}</td>
							<td>거리</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.dist}</td>
						</tr>
						<tr>
							<td>연관 URL 정보</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.homepage}</td>
							<td>우편번호</td>
							<td class="common-text-left no-ellipsis">${detailCommonItem.zipcode}</td>
						</tr>
						<tr>
							<td>개요설명</td>
							<td  colspan="3" class="common-text-left no-ellipsis">${detailCommonItem.overview}</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>콘텐츠ID</td> -->
<%-- 							<td class="common-text-left no-ellipsis">${selectedItem.petinfoContentid}</td> --%>
<!-- 						</tr> -->
                        <tr>
                            <td colspan="10" class="no-ellipsis">반려견 동반 정보</td>
                        </tr>
                        <tr>
                            <td>반려견관광정보</td>
                            <td colspan="3" class="common-text-left no-ellipsis">${selectedItem.tourInfo}</td>
                        </tr>
						<tr>
							<td>관련사고대비사항</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaAcdntRiskMtr}</td>
						</tr>
						<tr>
							<td>동반구분</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.acmpyTypeCd}</td>
						</tr>
						<tr>
							<td>관련구비시설</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaPosesFclty}</td>
						</tr>
						<tr>
							<td>동반가능동물</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.acmpyPsblCpam}</td>
						</tr>
						<tr>
							<td>관련비치품목</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaFrnshPrdlst}</td>
						</tr>
						<tr>
							<td>기타동반정보</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.etcAcmpyInfo}</td>
						</tr>
						<tr>
							<td>관련구매품목</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaPurcPrdlst}</td>
						</tr>
						<tr>
							<td>관련렌탈품목</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaRntlPrdlst}</td>
						</tr>
						<tr>
							<td>동반시필요사항</td>
							<td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.acmpyNeedMtr}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn-wrap">
				<button class="common-btn btn-filled">등록</button>
				<button class="common-btn" onClick="location.href='${path}/admin/tripList';">목록</button>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />