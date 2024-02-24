<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="${path}/css/trip/spotDetail.css">

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

.swiper {
display: inline-block;
position: absolute;    
width: 500px;
height: 350px;
/* margin: 15px 0px; */
flex-direction: row;
z-index: 5;
/* right: 0; */
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
<section class="tripDetail-wrap">
    <!-- 페이지 타이틀 -->
    <div class="tripDetail-title"><p>여행</p></div>


    <!-- 사이드 바 + 내부 콘텐츠 -->
    <div class="tripDetail-container">
        <!-- 사이드 메뉴바 -->
        <div class="menu-area">
            <div class="side-menu">
                <a href="#">포포트립</a>
                <a href="#">여행</a>
                <a href="#">숙박</a>
            </div>
        </div>
        

        <!-- 내부 콘텐츠 -->
        <div class="tripDetail-content">
            <!-- 메인 정보 -->
            <div class="tripDetail-mainInfo-wrap">
                <!-- 장소 이미지(슬라이드) -->
                <div class="swiper Swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0517/thumb/content/C0517_F20221201111723001.jpg" alt="안반데기 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0517/thumb/content/C0517_F20221201111723002.jpg" alt="안반데기 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0517/thumb/content/C0517_F20221201111723003.jpg" alt="안반데기 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0517/thumb/content/C0517_F20221201112429006.jpg" alt="안반데기 예시">
                        </div>
                        <div class="swiper-slide">
                            <img src="https://dangdangmap.net/upload/mapdata/C0517/thumb/content/C0517_F20221201111724005.jpg" alt="안반데기 예시">
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>


                <!-- 장소 정보 -->
                <div class="tripDetail-mainInfo">
                    <div class="tripNameAndLike">
                        <p class="tripName">강릉안반데기관광농원</p>
                        <!-- 관심등록 -->
                        <span class="material-icons" id="heart-icon">favorite_border</span>
                    </div>

                    <div class="mainInfo">
                        <img class="infoIcon" src="${ path }/img/trip/map_icon.png" alt="주소 아이콘">
                        <span>주소</span>
                        <p>강원 강릉시 왕산면 안반데기 1길</p>
                        <img class="infoIcon" src="${ path }/img/trip/tel_icon.png" alt="문의처 아이콘">
                        <span>문의처</span>
                        <p>033-644-8552</p>

                        <img class="infoIcon" src="${ path }/img/trip/time_icon.png" alt="이용시간 아이콘">
                        <span>이용시간</span>
                        <p>11시 부터 14시까지(관광,견학)</p>

                        <!-- 새 창으로 해당 홈페이지 열기! -->
                        <img class="infoIcon" src="${ path }/img/trip/homepage_icon.png" alt="홈페이지 아이콘">
                        <span>홈페이지</span>
                        <a href="https://blog.naver.com/sanai4744" target="_blank"><p>https://blog.naver.com/sanai4744</p></a>
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
                    <p>해발1,100m 구름위의 땅 강릉 안반데기 치유 체험 관광 휴양지, 강원도 민간정원2호, 강릉시 민간정원 1호</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>주요시설</span>
                    </div>
                    <p>관리사, 화장실, 개수대, 주차장, 체험장, 치유길</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>이용요금</span>
                    </div>
                    <p>관광 체험 - 30,000원 <br> 관광 휴식(카크닉) - 40,000원(소형 차량1대) <br> 관광 휴양(별 보기 차박 체험 - 60,000원 (차량1대, 2인 기준, 산나물 2통 제공) 14시 ~ 11시,</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>애견 정책 및 주의사항</span>
                    </div>
                    <p>배변 관리 철저</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>기타</span>
                    </div>
                    <p>일반 쓰레기는 가져가셔야 함, 준비해온 음식물 반입 가능</p>
                </div>
            </div>

            <!-- 목록으로 가는 버튼 -->
            <button onclick="" class="btnList">목록으로</button>
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