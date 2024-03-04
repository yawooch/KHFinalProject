<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- css 연결 -->
<link rel="stylesheet" href="${path}/css/common/bootstrap.css">
<link rel="stylesheet" href="${path}/css/common/templatemo.css">
<link rel="stylesheet" href="${path}/css/common/pawpawCommon.css">
<link rel="stylesheet" href="${path}/css/trip/spot.css">

<style>
	.disable {
		pointer-events: none;
		background-color: #B29254;
		color: white;
	}
</style>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 바디 -->
<section class="content">
    <div class="container">
    
        <!-- 페이지 타이틀 -->
        <div class="common-title"><p>여행</p></div>

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
            <!-- 검색바 -->
            <div class="common-search">
            	<!-- 조회된 게시물 건 수 -->
				<div>
					TOTAL <span>${ pageInfo.listCount }</span>건
				</div>
				<div>
					<!-- 지역 선택 -->
					<div>
						<select name="tripSelect" id="tripSelect">
							<option value="allArea" selected>지역</option>
	                        <!-- areaCode -->
	                        <option value="1">서울특별시</option>
	                        <option value="2">인천광역시</option>
	                        <option value="3">대전광역시</option>
	                        <option value="4">대구광역시</option>
	                        <option value="5">광주광역시</option>
	                        <option value="6">부산광역시</option>
	                        <option value="7">울산광역시</option>
	                        <option value="8">세종특별자치시</option>
	                        <option value="31">경기도</option>
	                        <option value="32">강원특별자치도</option>
	                        <option value="33">충청북도</option>
	                        <option value="34">충청남도</option>
	                        <option value="35">경상북도</option>
	                        <option value="36">경상남도</option>
	                        <option value="37">전북특별자치도</option>
	                        <option value="38">전라남도</option>
	                        <option value="39">제주특별자치도</option>
						</select>
					</div>
					<!-- 검색어 입력 -->
					<div>
						<img src="${ path }/img/community/search.png"> 
						<input type="text" name="tripSearch" id="tripSearch" placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<!-- 검색버튼 클릭 시, search()함수 실행 -->
						<button onclick=search()>검색</button>
					</div>
				</div>
			</div>

            <!-- 콘텐츠 내용 -->
            <div class="common-detail-list no-row">
                <div class="row">
                
                    <!-- c:forEach로 카드 반복 생성 -->
                    <c:forEach var="spot" items="${ spots }">
	                    <div class="col-md-4">
	                        <a href="${ path }/trip/spot/spotDetail" style="text-decoration: none;">
	                            <!-- 카드 이미지 -->
	                            <div class="card mb-4 product-wap rounded-0">
	                                <div class="card rounded-0">
	                                	<c:if test="${ empty spot.tripImage }">	                                		
		                                    <img class="card-img rounded-0 img-fluid" src="https://i.ibb.co/6wHGL3T/Kakao-Talk-20240215-211419884.jpg">
	                                	</c:if>
	                                	<c:if test="${ not empty spot.tripImage }">
		                                    <img class="card-img rounded-0 img-fluid" src="${ spot.tripImage }">
	                                	</c:if>
	                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
	                                        <p class="readMore" style="font-size: 14px !important;">
	                                            +<br>
	                                            READ MORE
	                                        </p>
	                                    </div>
	                                </div>
	                                <!-- 카드 내용 -->
	                                <div class="card-body">
	                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">
	                                        ${ spot.tripTitle }
	                                    </p>
	                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">
	                                        ${ spot.tripAddress }
	                                    </p>
	                                    <c:if test="${ empty spot.tripTel }">
		                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">
		                                        해당 장소로 별도 문의
		                                    </p>	                                    	
	                                    </c:if>
	                                    <c:if test="${ not empty spot.tripTel }">
		                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">
		                                        ${ spot.tripTel }
		                                    </p>
	                                    </c:if>
	                                </div>
	                            </div>
	                        </a>
	                    </div>
                    </c:forEach>
                </div>
            </div>

            <!-- 페이징 -->
            <div class="common-page-number">
                <ul>
                	<!-- 이전 페이지 --> 
                	<c:if test="${ empty searchInfoMap.search }">
	                    <li><a href="${ path }/trip/spot?page=${ pageInfo.prevPage }">&lt;</a></li>
                	</c:if>
                	<c:if test="${ not empty searchInfoMap.search }">
	                    <li><a href="${ path }/trip/spot?page=${ pageInfo.prevPage }&select=${ searchInfoMap.select }&search=${ searchInfoMap.search }">&lt;</a></li>
                	</c:if>
	                    
                	<!-- 현재 페이지 -->
                	<!-- 첫 페이지부터 마지막페이지까지 반복(5페이지씩 보이게 설정함) -->
                	<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
                		<c:choose>
                			<%-- 선택한 페이지와 pageInfo의 currentPage가 일치할 때 --%>
                			<c:when test="${ current == pageInfo.currentPage }">
				                <li class="disable"><a>${ current }</a></li>
                			</c:when>
                			<%-- 선택하지 않은 나머지 페이지 
                			<c:otherwise>
                				<c:if test="${ empty searchInfoMap.search }">
				                    <li><a href="${ path }/trip/spot?page=${ current }">${ current }</a></li>                					
                				</c:if>
                				<c:if test="${ not empty searchInfoMap.search }">
				                    <li><a href="${ path }/trip/spot?page=${ current }&select=${ searchInfoMap.select }&search=${ searchInfoMap.search }">${ current }</a></li>                					                					
                				</c:if>
                			</c:otherwise>
                			--%>
                			<c:otherwise>
				                <li><a href="${ path }/trip/spot?page=${ current }">${ current }</a></li>                					
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	
                    <!-- 다음 페이지 -->
                	<c:if test="${ empty searchInfoMap.search }">
	                    <li><a href="${ path }/trip/spot?page=${ pageInfo.nextPage }">&gt;</a></li>
                	</c:if>
                	<c:if test="${ not empty searchInfoMap.search }">
	                    <li><a href="${ path }/trip/spot?page=${ pageInfo.nextPage }&select=${ searchInfoMap.select }&search=${ searchInfoMap.search }">&gt;</a></li>
                	</c:if>
                </ul>
            </div>
            <!-- </div> -->
        </div>
    </div>
</section>

<script>
	// 검색바의 '검색버튼' 클릭시 실행할 함수
	function search() {
		var selectValue = document.getElementId("tripSelect").value;
		var searchValue = document.getElementId("tripSearch").value;
		
		// trim() : 양쪽에 있는 공백을 제거
		if (searchValue.trim() != '') {
			
		} else {
			var url = "${path}/trip/spot";
		}
	}
</script>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />