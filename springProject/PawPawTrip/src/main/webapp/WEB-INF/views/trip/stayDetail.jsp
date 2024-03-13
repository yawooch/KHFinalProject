<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	
<% 
	pageContext.setAttribute("LF", "\n");
	pageContext.setAttribute("NL1", ".\\n");
%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="${path}/css/common/bootstrap.css">
<link rel="stylesheet" href="${path}/css/common/templatemo.css">
<link rel="stylesheet" href="${path}/css/common/pawpawCommon.css">
<link rel="stylesheet" href="${path}/css/trip/stayDetail.css">

<!-- 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 슬라이드 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
* { 
    font-family: 'Noto Sans KR'; 
}

/* ------------------------------ */
.swiper {
	display: inline-block;
	position: absolute;    
	width: 55%;
	height: 330px;
	/* margin: 15px 0px; */
	flex-direction: row;
	z-index: 5;
	left: 0; 
	border-radius: 10px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper-button-next {
	color: #FDFAEF;
}

:root {
	--swiper-theme-color: #FDFAEF;
}
</style>

<!-- 바디 -->
<section class="content">
	<div class="container">
		
	    <!-- 페이지 타이틀 -->
	    <div class="common-title"><p>숙소</p></div>
	
        <!-- 사이드 메뉴 -->
        <div class="common-sideMenu">
            <ul>
                <li class="community-text">포포트립</li>
                <li class="notice-text"><a href="${ path }/trip/spot">관광지</a></li>
                <li class="board-text"><a href="${ path }/trip/stay">숙소</a>
            </ul>
        </div>
	        
        <!-- 내부 콘텐츠 -->
        <div class="common-list">
            <!-- 메인 정보 -->
            <div class="tripDetail-mainInfo-wrap">
                <!-- 장소 이미지(슬라이드) -->
                <div class="swiper Swiper">
                    <div class="swiper-wrapper">
                    	<c:forEach var="detailImageItem" items="${ detailImageItems }">
	                        <div class="swiper-slide">
	                            <img src="${ detailImageItem.originimgurl }" alt="숙소 이미지">
	                        </div>
                    	</c:forEach>
                    	<!--  
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0472/thumb/content/C0472_F20211210134434003.jpg" alt="숙소 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0472/thumb/content/C0472_F20211210134434005.jpg" alt="숙소 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0472/thumb/content/C0472_F20211210134434007.jpg" alt="숙소 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0472/thumb/content/C0472_F20211210134435008.jpg" alt="숙소 예시">
                        </div>
                    	-->
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>


                <!-- 장소 정보 -->
                <div class="tripDetail-mainInfo">
                    <div class="tripNameAndLike">
                        <!-- 숙소 이름 -->
                        <p class="tripName">${ stay.stayTitle }</p>
                        <!-- 관심등록 -->
                        <span class="material-icons" id="heart-icon">favorite_border</span>
                    </div>

                    <div class="mainInfo">
                        <img class="infoIcon" src="${ path }/img/trip/map_icon.png" alt="주소 아이콘">
                        <span>주소</span>
                        <p>${ stay.stayAddress }</p>
                        <img class="infoIcon" src="${ path }/img/trip/tel_icon.png" alt="문의처 아이콘">
                        <span>문의처</span>
                        <c:if test="${ stay.stayTel == '-' || empty stay.stayTel }">
                        	<p>- 별도 문의</p>
                        </c:if>
                        <c:if test="${ stay.stayTel != '-' }">
	                        <p>${ stay.stayTel }</p>
                        </c:if>

                        <!-- 새 창으로 해당 홈페이지 열기! -->
                        <img class="infoIcon" src="${ path }/img/trip/homepage_icon.png" alt="홈페이지 아이콘">
                        <span>홈페이지</span>
                        <c:if test="${ empty stay.homepage }">
                        	<p>- 별도 문의</p>
                        </c:if>
                        <c:if test="${ not empty stay.homepage }">
	                        <p>${ stay.homepage }</p>
                        </c:if>
                    </div>
                </div>
            </div>


            <!-- 세부 정보 -->
            <div class="tripDetail-subInfo-wrap">
                <!-- 소개 -->
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>소개</span>
                    </div>
                    <p>${ fn:replace(stay.overview, LF, "<br>") }</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>이용 가이드 & 동반 정보</span>
                    </div>
                    <p>${ fn:replace(stay.petInfo.etcAcmpyInfo, LF, "<br>") }<br><br>
                       ${ fn:replace(stay.petInfo.acmpyPsblCpam, LF, "<br>") }
                    </p>
                </div>                
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>주요시설</span>
                    </div>
                    <p>${ fn:replace(stay.petInfo.relaPosesFclty, LF, "<br>") }</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>비품 정보</span>
                    </div>
                    <p>비치 품목 : ${ stay.petInfo.relaFrnshPrdlst }<br> 
                       구매 품목 : ${ stay.petInfo.relaPurcPrdlst } <br> 
                       렌탈 품목 : ${ stay.petInfo.relaRntlPrdlst }
                    </p>
                </div>                
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>필수</span>
                    </div>
                    <p style="color: red; font-size: 16px;">
                    	${ fn:replace(stay.petInfo.acmpyNeedMtr, LF, "<br>") }
                    </p>
                </div>

            </div>

            <!-- 목록으로 가는 버튼 -->
            <div class="btn-wrap">
            	<button onclick="location.href='${path}/trip/stay'" class="btnList">목록으로</button>
            </div>
        </div>
    </div>
</section>

<script>
    // 슬라이드 스크립트
    var swiper = new Swiper(".Swiper", {
        spaceBetween: 0,
        centeredSlides: true,
//         loop: true,
//         autoplay: {
//             delay: 2000,
//             disableOnInteraction: false,
//         },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
</script>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />