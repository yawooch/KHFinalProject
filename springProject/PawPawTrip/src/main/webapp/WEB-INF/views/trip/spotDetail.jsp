<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="security"%>
   
<% 
   pageContext.setAttribute("LF", "\n");
%>
   
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

@media (min-width: 1200px) {
   .tripDetail-mainInfo-wrap{
      height: 350px;
   }
   .tripDetail-mainInfo{
      width: 44%;
      height: 100%
   }
   .swiper {
      width: 55%;
      height: 100%;
   }
}

@media (max-width: 1200px) {
   .tripDetail-mainInfo-wrap{
      height: 350px;
   }
   .tripDetail-mainInfo{
      width: 44%;
      height: 100%
   }
   .swiper {
      width: 55%;
      height: 100%;
   }
}

@media (max-width: 992px) {
   .tripDetail-mainInfo-wrap{
      height: 350px;
   }
   .tripDetail-mainInfo{
      display: block;
      width: 44%;
      top: 0;
      height: inherit;
   }
   
}

@media (max-width: 768px) {
   .tripDetail-mainInfo-wrap{
      height: 660px;
   }
   .tripDetail-mainInfo{
      display: block;
      width: 100%;
      height: 48%;
      padding-left: 20px !important;
      top: 340px;
   }
   .mainInfo{
      padding-left: 20px !important;
   }
   .swiper {
      display: block ;
      width: 100%;
      height: 50%;
      top: 0;
   }   
}

.swiper {
display: inline-block;
position: absolute;    
/* margin: 15px 0px; */
flex-direction: row;
/* width: 55%; */
/* height: 330px; */
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
       <div class="common-title"><p>관광지</p></div>
   
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
                               <img src="${ detailImageItem.originimgurl }" alt="여행지 이미지">
                           </div>
                       </c:forEach>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>


                <!-- 장소 정보 -->
                <div class="tripDetail-mainInfo">
                    <div class="tripNameAndLike">
                        <p class="tripName">${ spot.tripTitle }</p>
                        <!-- 관심등록 -->
                        <div>
                           <input type="checkbox" id="heart">
                           <label for="heart"></label>
                        </div>
                    </div>

                    <div class="mainInfo">
                        <img class="infoIcon" src="${ path }/img/trip/map_icon.png" alt="주소 아이콘">
                        <span>주소</span>
                        <p>${ spot.tripAddress }</p>
                        <img class="infoIcon" src="${ path }/img/trip/tel_icon.png" alt="문의처 아이콘">
                        <span>문의처</span>
                        <c:if test="${ spot.tripTel == '-' || empty spot.tripTel }">
                           <p>- 별도 문의</p>
                        </c:if>
                        <c:if test="${ spot.tripTel != '-' }">
                           <p>${ spot.tripTel }</p>
                        </c:if>
                  
                        <!-- 새 창으로 해당 홈페이지 열기! -->
                        <img class="infoIcon" src="${ path }/img/trip/homepage_icon.png" alt="홈페이지 아이콘">
                        <span>홈페이지</span>
                        <c:if test="${ empty spot.homepage }">
                           <p>- 별도 문의</p>
                        </c:if>
                        <c:if test="${ not empty spot.homepage }">
                           <p>${ spot.homepage }</p>
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
                   <p>${ fn:replace(spot.overview, LF, "<br>") }</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>장소 이용 가이드</span>
                    </div>
                    <p>${ fn:replace(spot.petInfo.etcAcmpyInfo, LF, "<br>") }</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>주요시설</span>
                    </div>
                   <p>${ fn:replace(spot.petInfo.relaPosesFclty, LF, "<br>") }</p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>비품 정보</span>
                    </div>
                    <p>- 비치 품목 : ${ spot.petInfo.relaFrnshPrdlst }<br> 
                       - 구매 품목 : ${ spot.petInfo.relaPurcPrdlst } <br> 
                       - 렌탈 품목 : ${ spot.petInfo.relaRntlPrdlst }
                    </p>
                </div>
                <div class="subInfo-div">
                    <div class="iconAndInfo">
                        <img class="dog-ion" src="${ path }/img/trip/dog_icon.png" alt="메뉴아이콘">
                        <span>반려동물 동반 정보</span>
                    </div>
                    <p>${ fn:replace(spot.petInfo.acmpyPsblCpam, LF, "<br>") }</p>
                    <p style="color: red; font-size: 16px;">
                       * ${ fn:replace(spot.petInfo.acmpyNeedMtr, LF, "<br>") }
                    </p>
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
    
    
    // 찜하기(하트) 이벤트
    $('#heart').on('change', (event) => {
       
       //console.log(${loginMember});
       
       // 비로그인 상태
       if (${loginMember == null}) {
          if (confirm('로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?')) {
             // 로그인 페이지 이동
             location.href='${ path }/login';            
         } else {
            // 해당 페이지 새로 고침
            location.reload();
         }
          
       // 로그인 상태
       // 찜하기 버튼을 누르면 해당 장소의 contentId와 memberNo를 가져온다.
      } else {
         let contentId = '${spot.tripContentId}';
         let memberNo = '${loginMember.memberNo}';
         
         // console.log("contentId : " + contentId);
         // console.log("memberNo : " + memberNo);
         
         if($(event.target).prop('checked')){
            //찜 장소 추가   
            $.ajax({
               type: 'GET',
               url: '${path}/member/mypage/my-trip/add',
               data: {
                  contentId: contentId,
                  memberNo: memberNo
               },	
               		// 찜 성공 시
                    success: function(data){
                       if (confirm('관심 목록에 추가되었습니다. 내가 찜한 장소로 이동하시겠습니까?')) {
                    	   location.href = '${path}/member/mypage/my-trip';								
					   } else {
						   location.reload();
					   };
                    },
                    // 찜 실패 시
                    error: function(){
                    	alert('실패했습니다. 다시 시도해주세요');
                    }
            });

         } else {
            //찜 장소 제거   
                $.ajax({
                    type: 'GET',
                    url: '${path}/trip/spot/spotDetail/remove',
                    data: { contentId: contentId, memberNo: memberNo },
                    success: function(data){
                        console.log('Data removed successfully.');
                    },
                    error: function(){
                        console.log('Error removing data.');
                    }
                });
         }
         
      }
      
    });
</script>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />