<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
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
	    <div class="common-title"><p>숙박</p></div>
	
        <!-- 사이드 메뉴 -->
        <div class="common-sideMenu">
            <ul>
                <li class="community-text">포포트립</li>
                <li class="notice-text"><a href="${ path }/trip/spot">여행</a></li>
                <li class="board-text"><a href="${ path }/trip/stay">숙박</a>
            </ul>
        </div>
	        
        <!-- 내부 콘텐츠 -->
        <div class="common-list">
            <!-- 메인 정보 -->
            <div class="tripDetail-mainInfo-wrap">
                <!-- 장소 이미지(슬라이드) -->
                <div class="swiper Swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0472/thumb/content/C0472_F20211210134433001.jpg" alt="숙소 예시">
                        </div>
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
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>


                <!-- 장소 정보 -->
                <div class="tripDetail-mainInfo">
                    <div class="tripNameAndLike">
                        <!-- 숙소 이름 -->
                        <p class="tripName">헤이춘천</p>
                        <!-- 관심등록 -->
                        <span class="material-icons" id="heart-icon">favorite_border</span>
                    </div>

                    <div class="mainInfo">
                        <img class="infoIcon" src="${ path }/img/trip/map_icon.png" alt="주소 아이콘">
                        <span>주소</span>
                        <p>강원 춘천시 남춘로 49</p>
                        <img class="infoIcon" src="${ path }/img/trip/tel_icon.png" alt="문의처 아이콘">
                        <span>문의처</span>
                        <p>033-243-5566</p>

                        <img class="infoIcon" src="${ path }/img/trip/time_icon.png" alt="이용시간 아이콘">
                        <span>이용시간</span>
                        <p>15:00 ~ 다음날 12:00</p>

                        <!-- 새 창으로 해당 홈페이지 열기! -->
                        <img class="infoIcon" src="${ path }/img/trip/homepage_icon.png" alt="홈페이지 아이콘">
                        <span>홈페이지</span>
                        <a href="http://heyy.kr" target="_blank"><p>http://heyy.kr</p></a>
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
                    <p>heyy는 당신의 취향과 목적에 어울리는 여가에 관한 새로운 라이프스타일을 제안합니다.<br>
                        일상의 틈을 풍요롭게 채우고 싶을 때,
                        자신에게 꼭 맞는 여가를 누리고 싶을 때,<br>
                        짧은 휴식을 최대한 만끽하고 싶을 때,
                        자연스럽게 떠오르는 브랜드, 지금 heyy가 당신에게 대답합니다.<br>
                        잔잔한 공지천과 맞닿아 있는 heyy, chuncheon 호텔은 충분히 경험하며 느끼는 로컬 기반의 여가를 제안하는 공간으로 반려견 동반이 가능합니다.</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>주요시설</span>
                    </div>
                    <p>- 주차장</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>이용요금</span>
                    </div>
                    <p>- 펫룸 요금은 호텔로 문의 필요 <br> * 반려견 동반 시 추가 요금</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>애견 정책 및 주의사항</span>
                    </div>
                    <p> - 8kg이하 반려견 동반 가능합니다.<br>
                        - 동반 반려견은 객실당 최대 2마리까지 입실 가능합니다.<br>
                        - 1마리당 배변패드 최대 2장 프런트에서 제공해드리니 필요하신 분은 체크인시 문의 바랍니다.<br>
                        - 체크인 시 애견 확인 필수, 산책시 리드줄 착용 필수 및 관리해주셔야 합니다.<br>
                        - 부주의로 인한 사고발생시 견주 책임입니다.<br>
                        - 1객실 당 성인 최대 2명, 반려견 2마리까지 가능합니다.<br>
                        
                        * 반려견 동반 운영정책은 현지 사정에 따라 변동될 수 있습니다.</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>비품제공</span>
                    </div>
                    <p>- 배변패드</p>
                </div>
            </div>

            <!-- 목록으로 가는 버튼 -->
            <div class="btn-wrap">
            	<button onclick="location.href='${path}/trip/spot'" class="btnList">목록으로</button>
            </div>
        </div>
    </div>
</section>

<script>
    // 슬라이드 스크립트
    var swiper = new Swiper(".Swiper", {
        spaceBetween: 0,
        centeredSlides: true,
        loop: true,
        autoplay: {
            delay: 2000,
            disableOnInteraction: false,
        },
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