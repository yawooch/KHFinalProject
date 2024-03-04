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
//페이징 요소를 생성하기 위한 콜백용 함수
function clickPaging(){
    showList(($(this).attr('pageno')*1), $('#contentId').val());
};

let contentIdsArr = [];
function showList(pageNo, contentId)
{               
    let data = {};
    contentIdsArr = [];
    
    if(contentId ==''){
        data = {pageNo};
    }
    else
    {
        data = {pageNo, contentId};
    }
    $('#spinnerLoading').fadeIn();
    $('#spinnerLoading>div.spinner-border').css('top', '50%');
    $('#spinnerLoading>div.spinner-border').css('left', '50%');
    let pagingNum = 5;
    $.ajax(
    {
        type : 'GET',
        url  : '${path}/admin/tripListApi',
        data : data,
        success:function(data)
        {
//             console.log(data);
            let result = '';
            let startRowNo = 0;
            let {pageNo, numOfRows, totalCount, petTourItems} = data;

            startRowNo = totalCount - ((pageNo-1)*numOfRows);//DESC 용
//          startRowNo = ((pageNo-1)*numOfRows) + 1;         //ASC  용
            
            if(petTourItems.length==0){
                result += '<tr><td colspan="5">조회된 게시글이 없습니다.</td></tr>';
            }
            else{
                petTourItems.forEach((element, idx) => {
                	contentIdsArr.push(element.contentid);
                    result += '<tr>';
                    result += '     <td>' + (startRowNo - idx) + '</td>';//DESC 용
//                  result += '     <td>' + (startRowNo + idx) + '</td>';//ASC  용
                    result += '     <td><a href="${path}/admin/tripDetail?contentId=' + element.contentid + '&pageNo='+ pageNo +'">'+ element.contentid + '</a></td>';
                    result += '     <td ' + (element.dbExistYn=='등록'?'class="text-info"':'class="text-danger"') +'>' +   element.dbExistYn   + '</td>';
                    result += '     <td>' + (element.dbAcmpyTypeCd==null?'':element.dbAcmpyTypeCd) + '</td>';
                    result += '</tr>';
                });
            }
            
            $('.common-detail-list>table>tbody').empty();
            $('.common-detail-list>table>tbody').append(result);
            $('.common-search>div:nth-child(1)>span').text(totalCount)
            
            showPaging(pageNo , numOfRows, totalCount, pagingNum,clickPaging);
            $('#spinnerLoading').fadeOut();
        },
        error: function(error){
            console.log(`error : ${error}`);

            let result = '';
            result += '<tr><td colspan="5">요청 오류입니다 다시 시도해 주세요</td></tr>';
            $('.common-detail-list>table>tbody').empty();
            $('.common-detail-list>table>tbody').append(result);
            $('#spinnerLoading').fadeOut();
        }
     });
 };

function saveList()
{
	if(!confirm('해당 페이지를 일괄 등록 하시겠습니까?'))
	{
		return false;
	}
    $('#spinnerLoading').fadeIn();
    $('#spinnerLoading>div.spinner-border').css('top' , '50%');
    $('#spinnerLoading>div.spinner-border').css('left', '50%');
    $.ajax(
    {
        type    : 'POST',
        url     : '${path}/admin/tripList',
        data    : {contentIdsArr : contentIdsArr},
        success : (data)=>
        {
            console.log(data);
            if(data.petInfoCount == 0)
            {
                alert('일괄등록이 실패 하였습니다.');
            }
            else
            {
                alert('일괄등록 총'+ data.totalCount +'건 중, 여행/숙소가 '+ data.mainCount +'건,\n 공통 '+ data.commonCount +'건\n, 동반정보 '+ data.petInfoCount +'건\n저장 성공 하였습니다.');
            }
            $('#spinnerLoading').fadeOut();
            showList(1, $('#contentId').val());
        },
        error: function(error){
            console.log(`error : ${error}`);

            alert('일괄등록이 실패 하였습니다.');
            $('#spinnerLoading').fadeOut();
        }
    });
};
$(document).ready(() => {
	
	console.log(pageNo.detailNo);
    //리스트를 먼저 보여준다.
    showList($('#pageNo').val(), $('#contentId').val());
//     $('#spinnerLoading>div.spinner-border').css('top' , '50%');
//     $('#spinnerLoading>div.spinner-border').css('left', '50%');
    
    $('#contentId').on('change', (event) => {
        showList(1, $(event.target).val());
    });

    $('div.common-page-number>ul>li').on('click',  clickPaging);
});
</script>
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
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
                            <input type="text" name="contentId" id="contentId" placeholder="컨텐츠 ID를 입력해주세요."style="width:160px;" value="${contentId}">
                    </div>
                    <div>
                        <button>검색</button>
                    </div>
                </div>
            </div>
            <div class="common-detail-list" style="position:relative;">
                <div id="spinnerLoading" style="display:none;position:absolute;width:100%;height:100%;background-color:rgb(0 0 0 / 65%);">
                    <div class="spinner-border text-warning" style="position: absolute;width: 80px; height: 80px; border: 16px solid currentcolor; border-right-color: transparent;margin-left: -40px; margin-top: -40px;"></div>
                </div>
                <table>
                    <colgroup>
                        <col width="60">
                        <col width="250">
                        <col width="250">
                        <col width="250">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>콘텐츠 ID</tH>
                        <th>매핑여부</th>
                        <th>동반가능여부</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="5">
                                조회된 게시글이 없습니다.
                            </td>
                        </tr>   
                    
<%--                    <c:if test="${ empty response }"> --%>
<!--                        <tr> -->
<!--                            <td colspan="6"> -->
<!--                                조회된 게시글이 없습니다. -->
<!--                            </td> -->
<!--                        </tr>    -->
<%--                    </c:if> --%>
<%--                    <c:if test="${ not empty response }"> --%>
<%--                        <c:forEach var="petTour" items="${ response.petTourItems }" varStatus="eachStatus"> --%>
<!--                            <tr> -->
<%--                                <td>${eachStatus.count}</td> --%>
<%--                                <td><a href="${path}/admin/tripDetail?contentId=${petTour.petinfoContentid}"> --%>
<%--                                        ${petTour.petinfoContentid}</a> --%>
<!--                                </td> -->
<!--                                <td>N</td> -->
<!--                                <td>여행</td> -->
<!--                                <td>2024-02-28</td> -->
<%--                                <td>${ petTour.writerId }</td> --%>
<%--                                <td><fmt:formatDate value="${ petTour.createDate }" dateStyle="short"/></td> --%>
<!--                                <td> -->
<%--                                    <c:if test="${ empty petTour.originalFilename }">                            --%>
<!--                                        <span> - </span> -->
<%--                                    </c:if> --%>
                                    
<%--                                    <c:if test="${ not empty petTour.originalFilename }">                            --%>
<!--                                        <span class="material-symbols-outlined">attach_file</span> -->
<%--                                    </c:if> --%>
<!--                                </td> -->
<%--                                <td>${ petTour.readCount }</td> --%>
<!--                            </tr> -->
<%--                        </c:forEach> --%>
<%--                    </c:if> --%>
<!--                    <tr> -->
<!--                        <td>49</td> -->
<!--                        <td> -->
<%--                            <a href="${path}/admin/stayDetail">[공지사항] 2023 춘천 반려동물 페스티벌</a></td> --%>
<!--                        <td>관리자</td> -->
<!--                        <td>350</td> -->
<!--                        <td>2023-05-04</td> -->
<!--                    </tr> -->
<!--                    <tr> -->
<!--                        <td> -->
<%--                            <img src="${ path }/img/community/ant-design_sound-filled.png" alt=""> --%>
<!--                        </td> -->
<!--                        <td> -->
<%--                            <a href="${path}/admin/stayDetail">[공지사항] '전국댕댕자랑' 수상작 발표~!!!!</a></td> --%>
<!--                        <td>관리자</td> -->
<!--                        <td>1236</td> -->
<!--                        <td>2022-12-12</td> -->
<!--                    </tr> -->
                    </tbody>
                </table>
            </div>
            <div class="btn-wrap">
                <button class="common-btn" onClick="saveList();">일괄등록</button>
            </div>
            
            <div class="common-page-number">
                <ul>
                    <li pageNo="1"><a href="#">&lt;</a></li>
                    <li pageNo="1"><a href="#">1</a></li>
                    <li pageNo="2"><a href="#">2</a></li>
                    <li pageNo="3"><a href="#">3</a></li>
                    <li pageNo="4"><a href="#">4</a></li>
                    <li pageNo="5"><a href="#">5</a></li>
                    <li pageNo="5"><a href="#">&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />