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
            let result = '';
            let contenttypeid = {'12':'관광지', '14':'문화시설', '15':'축제공연행사', '25':'여행코스', '28':'레포츠', '32':'숙박', '38':'쇼핑', '39':'음식점'};
            let cpyrhtDivCd = {'Type1':'제1유형(출처표시-권장)', 'Type3':'제3유형(제1유형+변경금지)'};
            
            console.log(data);
            $('#spinnerLoading').fadeOut();
            
            result += '<tr><td>콘텐츠ID</td>';
            result += '    <td class="common-text-left ml-1 no-ellipsis">'+ data.detailCommonItem.contentid +'</td>';
            result += '    <td>콘텐츠타입ID</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ contenttypeid[data.detailCommonItem.contenttypeid] +'</td></tr>';
            result += '<tr><td>장소이름</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.title +'</td>';
            result += '    <td>DB 등록여부</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.petTourItem.dbExistYn +'</td></tr>';
            result += '<tr><td>수정일</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ (data.detailCommonItem.modifiedtime).replaceAll(/(20[0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})/gi, '$1-$2-$3 $4:$5:$6') +'</td>';
            result += '    <td>등록일</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ (data.detailCommonItem.createdtime).replaceAll(/(20[0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})/gi, '$1-$2-$3 $4:$5:$6') +'</td></tr>';
            
            if(data.detailCommonItem.tel != '' && data.detailCommonItem.telname != '')
            {
                result += '<tr><td>전화번호</td>';
                result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.tel +'</td>';
                result += '    <td>전화번호이름</td>';
                result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.telname +'</td></tr>';
            }
            
            if(data.detailCommonItem.firstimage != '')
            {
                result += '<tr><td>대표이미지 (원본)</td>';
                result += '    <td colspan="3" class="common-text-left no-ellipsis"><img src="'+ data.detailCommonItem.firstimage +'" style="width:100%;"/></td></tr>';
            }
            result += '<tr><td>지역코드</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.areacode +'</td>';
            result += '    <td>시군구코드</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.sigungucode +'</td></tr>';
            result += '<tr><td>대분류</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.cat1 +'</td>';
            result += '    <td>중분류</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.cat2 +'</td></tr>';
            result += '<tr><td>소분류</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.cat3 +'</td>';
            result += '    <td>저작권 유형</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ (data.detailCommonItem.cpyrhtDivCd==''?'':cpyrhtDivCd[data.detailCommonItem.cpyrhtDivCd]) +'</td></tr>';
            result += '<tr><td>주소</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.addr1 +'</td>';
            result += '    <td>상세주소</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.addr2 +'</td></tr>';
            result += '<tr><td>GPS X좌표</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.mapx +'</td>';
            result += '    <td>GPS Y좌표</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.mapy +'</td></tr>';
            result += '<tr><td>Map Level</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.mlevel +'</td>';
            result += '    <td>거리</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.dist +'</td></tr>';
            result += '<tr><td>연관 URL 정보</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.homepage +'</td>';
            result += '    <td>우편번호</td>';
            result += '    <td class="common-text-left no-ellipsis">'+ data.detailCommonItem.zipcode +'</td></tr>';
            result += '<tr><td>개요설명</td>';
            result += '    <td  colspan="3" class="common-text-left no-ellipsis">'+ data.detailCommonItem.overview +'</td></tr>';
            result += '<tr><td colspan="10" class="no-ellipsis">반려견 동반 정보</td></tr>';
            if(data.petTourItem.petTursmInfo != '')
            {
                result += '<tr><td>반려견관광정보</td>';
                result += '    <td colspan="3" class="common-text-left no-ellipsis">'+ data.petTourItem.petTursmInfo +'</td></tr>';
            }
            if(data.petTourItem.relaAcdntRiskMtr != '')
            {
                result += '<tr><td>관련사고대비사항</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.relaAcdntRiskMtr +'</td></tr>';
            }
            if(data.petTourItem.acmpyTypeCd != '')
            {
                result += '<tr><td>동반구분</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.acmpyTypeCd +'</td></tr>';
            }
            if(data.petTourItem.relaPosesFclty != '')
            {
                result += '<tr><td>관련구비시설</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.relaPosesFclty +'</td></tr>';
            }
            if(data.petTourItem.acmpyPsblCpam != '')
            {
                result += '<tr><td>동반가능동물</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.acmpyPsblCpam +'</td></tr>';
            }
            if(data.petTourItem.relaFrnshPrdlst != '')
            {
                result += '<tr><td>관련비치품목</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.relaFrnshPrdlst +'</td></tr>';
            }
            if(data.petTourItem.etcAcmpyInfo != '')
            {
                result += '<tr><td>기타동반정보</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.etcAcmpyInfo +'</td></tr>';
            }
            if(data.petTourItem.relaPurcPrdlst != '')
            {
                result += '<tr><td>관련구매품목</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.relaPurcPrdlst +'</td></tr>';
            }
            if(data.petTourItem.relaRntlPrdlst != '')
            {
                result += '<tr><td>관련렌탈품목</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.relaRntlPrdlst +'</td></tr>';
            }
            if(data.petTourItem.acmpyNeedMtr != '')
            {
                result += '<tr><td>동반시필요사항</td>';
                result += '    <td colspan="3"  class="common-text-left no-ellipsis">'+ data.petTourItem.acmpyNeedMtr +'</td></tr>';
            }

            $('#detailBody').empty();
            $('#detailBody').append(result);
        },
        error: function(error){
            console.log(`error : ${error}`);
            $('#spinnerLoading').fadeOut();

            let result = '';
            result += '<tr><td colspan="10" class="no-ellipsis">조회된 정보가 없습니다. 다시 새로고침해주세요</td></tr>';

            $('#detailBody').empty();
            $('#detailBody').append(result);
        }
       });
    };
$(document).ready(() => {
    //상세를 먼저 보여준다.
    showDetail($('#contentId').val());
    
    $('form[name=tripSaveForm]').on('submit',function()
    {
    	if(!confirm('해당 컨텐츠를 등록 하시겠습니까?'))
    	{
    		return false;
    	}
    });

    if('${requestMsg}'.length !== 0)
    {
        alert('${requestMsg}');
    }
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
                    <tbody id="detailBody">
                    <tr><td colspan="10" class="no-ellipsis">조회된 정보가 없습니다. 다시 새로고침해주세요</td></tr>
                    <tr><td>콘텐츠ID</td>
                        <td class="common-text-left ml-1 no-ellipsis"></td>
                        <td>콘텐츠타입ID</td>
                        <td class="common-text-left no-ellipsis"></td>
                        </tr>
                    <tr><td>장소이름</td>
                        <td class="common-text-left no-ellipsis"></td>
                        <td>DB 등록여부</td>
                        <td class="common-text-left no-ellipsis"></td>
                    </tr>
                    <tr><td>수정일</td>
                        <td class="common-text-left no-ellipsis"></td>
                        <td>등록일</td>
                        <td class="common-text-left no-ellipsis"></td>
                    </tr>
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