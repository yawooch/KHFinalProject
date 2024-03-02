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
function showDetail(contentId)
{               
    $('#spinnerLoading').fadeIn();
    $.ajax(
    {
        type : 'GET',
        url  : '${path}/admin/tripDetailAjax',
        data : 
        {
            contentId
        },
        success:function(data)
        {
            console.log(data);
            $('#spinnerLoading').fadeOut();
            $('#contentid').html(data.detailCommonItem.contentid);
            $('#contenttypeid').html(data.detailCommonItem.contenttypeid);
            $('#title').html(data.detailCommonItem.title);
            $('#modifiedtime').html(data.detailCommonItem.modifiedtime);
            $('#createdtime').html(data.detailCommonItem.createdtime);
            $('#tel').html(data.detailCommonItem.tel);
            $('#telname').html(data.detailCommonItem.telname);
            $('#firstimage').html('<img src="'+ data.detailCommonItem.firstimage +'" style="width:100%;"/>');
            $('#areacode').html(data.detailCommonItem.areacode);
            $('#sigungucode').html(data.detailCommonItem.sigungucode);
            $('#cat1').html(data.detailCommonItem.cat1);
            $('#cat2').html(data.detailCommonItem.cat2);
            $('#cat3').html(data.detailCommonItem.cat3);
            $('#cpyrhtDivCd').html(data.detailCommonItem.cpyrhtDivCd);
            $('#addr1').html(data.detailCommonItem.addr1);
            $('#addr2').html(data.detailCommonItem.addr2);
            $('#mapx').html(data.detailCommonItem.mapx);
            $('#mapy').html(data.detailCommonItem.mapy);
            $('#mlevel').html(data.detailCommonItem.mlevel);
            $('#dist').html(data.detailCommonItem.dist);
            $('#homepage').html(data.detailCommonItem.homepage);
            $('#zipcode').html(data.detailCommonItem.zipcode);
            $('#overview').html(data.detailCommonItem.overview);
            $('#tourInfo').html(data.petTourItem.tourInfo);
            $('#relaAcdntRiskMtr').html(data.petTourItem.relaAcdntRiskMtr);
            $('#acmpyTypeCd').html(data.petTourItem.acmpyTypeCd);
            $('#relaPosesFclty').html(data.petTourItem.relaPosesFclty);
            $('#acmpyPsblCpam').html(data.petTourItem.acmpyPsblCpam);
            $('#relaFrnshPrdlst').html(data.petTourItem.relaFrnshPrdlst);
            $('#etcAcmpyInfo').html(data.petTourItem.etcAcmpyInfo);
            $('#relaPurcPrdlst').html(data.petTourItem.relaPurcPrdlst);
            $('#relaRntlPrdlst').html(data.petTourItem.relaRntlPrdlst);
            $('#acmpyNeedMtr').html(data.petTourItem.acmpyNeedMtr);

        },
        error: function(error){
            console.log(`error : ${error}`);
            $('#spinnerLoading').fadeOut();
        }
       });
    };
$(document).ready(() => {
    //상세를 먼저 보여준다.
    showDetail($('#contentId').val());
});
</script>

<form action="${path}/admin/tripDetail" name="tripSaveForm" method="POST">
<input type="hidden" name="contentId" id="contentId" value="${contentId}"/>
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
            <div class="common-detail-list no-margin-top" style="position:relative;">
                <div id="spinnerLoading" style="display:block;position:absolute;width:100%;height:100%;background-color:rgb(0 0 0 / 65%);">
                    <div class="spinner-border text-warning" style="width: 100px; height: 100px; border: 16px solid currentcolor; border-right-color: transparent;"></div>
                </div>
                <table class="common-col-table" style="width: 100%;">
                    <tbody>
                        <tr>
                            <td>콘텐츠ID</td>
                            <td class="common-text-left ml-1 no-ellipsis" id="contentid"></td>
<%--                             <td class="common-text-left ml-1 no-ellipsis">${detailCommonItem.contentid}</td> --%>
                            <td>콘텐츠타입ID</td>
                            <td class="common-text-left no-ellipsis" id="contenttypeid"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.contenttypeid}</td> --%>
                        </tr>
                        <tr>
                            <td>장소이름</td>
                            <td class="common-text-left no-ellipsis" id="title"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.title}</td> --%>
                            <td>DB 등록여부</td>
                            <td class="common-text-left no-ellipsis" id=""></td>
                        </tr>
                        <tr>
                            <td>수정일</td>
                            <td class="common-text-left no-ellipsis" id="modifiedtime"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.modifiedtime}</td> --%>
                            <td>등록일</td>
                            <td class="common-text-left no-ellipsis" id="createdtime"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.createdtime}</td> --%>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td class="common-text-left no-ellipsis" id="tel"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.tel}</td> --%>
                            <td>전화번호이름</td>
                            <td class="common-text-left no-ellipsis" id="telname"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.telname}</td> --%>
                        </tr>
<!--                        <tr> -->
<!--                            <td>교과서속여행지 여부</td> -->
<%--                            <td class="common-text-left no-ellipsis">${detailCommonItem.booktour}</td> --%>
<!--                        </tr> -->
                        <tr>
                            <td>대표이미지(원본)</td>
                            <td colspan="3" class="common-text-left no-ellipsis" id="firstimage"></td>
<%--                             <td colspan="3" class="common-text-left no-ellipsis"><img src="${detailCommonItem.firstimage}" style="width:100%;"/></td> --%>
                        </tr>
<!--                        <tr> -->
<!--                            <td>대표이미지(썸네일)</td> -->
<%--                            <td class="common-text-left no-ellipsis"><img src="${detailCommonItem.firstimage2}" style="width:100%;"/></td> --%>
<!--                        </tr> -->
                        <tr>
                            <td>지역코드</td>
                            <td class="common-text-left no-ellipsis" id="areacode"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.areacode}</td> --%>
                            <td>시군구코드</td>
                            <td class="common-text-left no-ellipsis" id="sigungucode"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.sigungucode}</td> --%>
                        </tr>
                        <tr>
                            <td>대분류</td>
                            <td class="common-text-left no-ellipsis" id="cat1"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.cat1}</td> --%>
                            <td>중분류</td>
                            <td class="common-text-left no-ellipsis" id="cat2"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.cat2}</td> --%>
                        </tr>
                        <tr>
                            <td>소분류</td>
                            <td class="common-text-left no-ellipsis" id="cat3"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.cat3}</td> --%>
                            <td>저작권 유형</td>
                            <td class="common-text-left no-ellipsis" id="cpyrhtDivCd"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.cpyrhtDivCd}</td> --%>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td class="common-text-left no-ellipsis" id="addr1"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.addr1}</td> --%>
                            <td>상세주소</td>
                            <td class="common-text-left no-ellipsis" id="addr2"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.addr2}</td> --%>
                        </tr>
                        <tr>
                            <td>GPS X좌표</td>
                            <td class="common-text-left no-ellipsis" id="mapx"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.mapx}</td> --%>
                            <td>GPS Y좌표</td>
                            <td class="common-text-left no-ellipsis" id="mapy"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.mapy}</td> --%>
                        </tr>
                        <tr>
                            <td>Map Level</td>
                            <td class="common-text-left no-ellipsis" id="mlevel"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.mlevel}</td> --%>
                            <td>거리</td>
                            <td class="common-text-left no-ellipsis" id="dist"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.dist}</td> --%>
                        </tr>
                        <tr>
                            <td>연관 URL 정보</td>
                            <td class="common-text-left no-ellipsis" id="homepage"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.homepage}</td> --%>
                            <td>우편번호</td>
                            <td class="common-text-left no-ellipsis" id="zipcode"></td>
<%--                             <td class="common-text-left no-ellipsis">${detailCommonItem.zipcode}</td> --%>
                        </tr>
                        <tr>
                            <td>개요설명</td>
                            <td  colspan="3" class="common-text-left no-ellipsis" id="overview"></td>
<%--                             <td  colspan="3" class="common-text-left no-ellipsis">${detailCommonItem.overview}</td> --%>
                        </tr>
<!--                        <tr> -->
<!--                            <td>콘텐츠ID</td> -->
<%--                            <td class="common-text-left no-ellipsis">${selectedItem.petinfoContentid}</td> --%>
<!--                        </tr> -->
                        <tr>
                            <td colspan="10" class="no-ellipsis">반려견 동반 정보</td>
                        </tr>
                        <tr>
                            <td>반려견관광정보</td>
                            <td colspan="3" class="common-text-left no-ellipsis" id="tourInfo"></td>
<%--                             <td colspan="3" class="common-text-left no-ellipsis">${selectedItem.tourInfo}</td> --%>
                        </tr>
                        <tr>
                            <td>관련사고대비사항</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="relaAcdntRiskMtr"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaAcdntRiskMtr}</td> --%>
                        </tr>
                        <tr>
                            <td>동반구분</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="acmpyTypeCd"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.acmpyTypeCd}</td> --%>
                        </tr>
                        <tr>
                            <td>관련구비시설</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="relaPosesFclty"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaPosesFclty}</td> --%>
                        </tr>
                        <tr>
                            <td>동반가능동물</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="acmpyPsblCpam"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.acmpyPsblCpam}</td> --%>
                        </tr>
                        <tr>
                            <td>관련비치품목</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="relaFrnshPrdlst"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaFrnshPrdlst}</td> --%>
                        </tr>
                        <tr>
                            <td>기타동반정보</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="etcAcmpyInfo"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.etcAcmpyInfo}</td> --%>
                        </tr>
                        <tr>
                            <td>관련구매품목</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="relaPurcPrdlst"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaPurcPrdlst}</td> --%>
                        </tr>
                        <tr>
                            <td>관련렌탈품목</td>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="relaRntlPrdlst"></td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.relaRntlPrdlst}</td> --%>
                        </tr>
                        <tr>
                            <td>동반시필요사항</td>
<%--                             <td colspan="3"  class="common-text-left no-ellipsis">${selectedItem.acmpyNeedMtr}</td> --%>
                            <td colspan="3"  class="common-text-left no-ellipsis" id="acmpyNeedMtr"></td>
                        </tr>
<%--                         <c:if test="${not empty requestMsg}"> --%>
<!--                             <tr> -->
<!--                                 <td colspan="10" class="no-ellipsis">반려견 동반 정보</td> -->
<!--                             </tr> -->
<%--                         </c:if> --%>
                    </tbody>
                </table>
            </div>
            <div class="btn-wrap">
                <button type="submit" class="common-btn btn-filled">등록</button>
                <button type="button" class="common-btn" onClick="location.href='${path}/admin/tripList';">목록</button>
            </div>
        </div>
    </div>
</div>
</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />