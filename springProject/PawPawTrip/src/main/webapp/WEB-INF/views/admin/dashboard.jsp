<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/admin/dashboard.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>대시보드</p>
        </div>
        <div class="common-sideMenu">
            <ul>
                <li>관리자</li>
                <li><a href="${path}/admin/dashboard" style="font-weight: bold; color: #B29254;">대시보드</a></li>
                <li><a href="${path}/admin/tripList">포포트립 매핑</a></li>
                <li><a href="${path}/admin/noticeWrite">공지사항 입력</a></li>
                <li><a href="${path}/admin/favoritesite">인추장 선정</a></li>
            </ul>
        </div>
        <div class="common-list">
            <div class="mypet-graph">
                <p>마이펫 비율</p>
                <canvas id="myPetGraph" width="400" height="400"></canvas>
            </div>
            <div class="board-ranking">
                <p>게시글 조회 순위</p>
                <table border="1">
                <thead>
                    <tr style="background-color: #FDFAEF;">
                        <td>순위</td>
                        <td>작성자</td>
                        <td style="text-align: center;">제목</td>
                        <td style="text-align: center;">조회수</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="rank" items="${ ranks }">
                
                   <tr>
                       <td>${ rank.rownum }</td>
                       <td>${ rank.memberId }</td>
                       <td style="display: block; padding-top: 10px; padding-left: 5px; border-style: none;">
                            <a href="${ path }/community/board/${rank.communityCategory=='[수다]'?'talkdetail':'mypetdetail'}?no=${rank.communityNo}">${ rank.communityTitle }</a></td>
                       <td>${ rank.communityCount }</td>
                   </tr>
                </c:forEach>
                </tbody>
                </table>
            </div>
            <div class="user-graph">
                <canvas id="userGraph" width="750vw"></canvas>
            </div>
        </div>
    </div>
</div>
<script>
    const myPetGraph = document.getElementById('myPetGraph');
    const userGraph = document.getElementById('userGraph');

    // Ajax
    $.getJSON('${path}/admin/mypetRatioAjax')
    .done((obj) => {
    	console.log(obj);
    	
    	let petTypeArr = [];
    	let petCountArr = [];
    	
    	for(let i = 0; i < obj.length; i++) {
    		petTypeArr.push(obj[i].petType);
    		petCountArr.push(obj[i].petCount);
    	}
    	
    	console.log(petTypeArr);
    	console.log(petCountArr);
    
	    // 원형 그래프
	    new Chart(myPetGraph, {
	        type     : 'pie',
	        data     : {
	        		
	                   labels   : petTypeArr,
	                   datasets : [ {
	                                data            : petCountArr,
	                                borderWidth     : 1,
	                                backgroundColor : [ '#ED6C40', '#F1AC53', '#F7CA45', '#A7CF4A', '#59C37C', '#659CF4', '#3785BA', '#32558C', '#1D3660']
	                              } ]
	                   },
	        options  : {
	                   plugins  : {
	                              legend   : {
	                                          display  : true,
	                                          position : 'right'
	                                         }
	                              },
	                   scales   : {
	                              y        : {
	                                         beginAtZero : true,
	                                         display     : false
	                                         }
	                              }
	                   }
	        })
    })

    // 막대 그래프
    new Chart(userGraph,
        {
        type         : 'bar',
        data         : {
        labels       : [ '1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일', '11일', '12일', '13일', '14일', '15일' ],
        datasets     : [ {
                       label           : '일 별 방문자 수(2월)',
                       data            : [ 12, 19, 3, 5, 2, 3, 20, 31, 35, 11, 50, 45, 7, 19, 33 ],
                       borderWidth     : 1,
                       backgroundColor : '#6D6E71'
                       } ]
        },
        options      : {
                       scales              : {
                                             y : { beginAtZero : true, }
                                             },
                       responsive          : true,
                       maintainAspectRatio : false
                       }
        });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />