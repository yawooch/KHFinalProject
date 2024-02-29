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
					TOTAL <span>26</span>건
				</div>
				<div>
					<!-- 지역 선택 -->
					<div>
						<select name="communitySelect" id="communitySelect">
							<option value="title" selected>지역</option>
	                        <!-- areaCode -->
	                        <option value="area-1">서울특별시</option>
	                        <option value="area-2">인천광역시</option>
	                        <option value="area-3">대전광역시</option>
	                        <option value="area-4">대구광역시</option>
	                        <option value="area-5">광주광역시</option>
	                        <option value="area-6">부산광역시</option>
	                        <option value="area-7">울산광역시</option>
	                        <option value="area-8">세종특별자치시</option>
	                        <option value="area-31">경기도</option>
	                        <option value="area-32">강원특별자치도</option>
	                        <option value="area-33">충청북도</option>
	                        <option value="area-34">충청남도</option>
	                        <option value="area-35">경상북도</option>
	                        <option value="area-36">경상남도</option>
	                        <option value="area-37">전북특별자치도</option>
	                        <option value="area-38">전라남도</option>
	                        <option value="area-39">제주특별자치도</option>
						</select>
					</div>
					<!-- 검색어 입력 -->
					<div>
						<img src="${ path }/img/community/search.png"> 
						<input type="text"
							   name="communitySearch" id="communitySearch"
							   placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<button>검색</button>
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
	                                    <img class="card-img rounded-0 img-fluid" 
	                                    	 src="${ spot.tripImage }">
	                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
	                                        <p class="readMore" style="font-size: 14px !important;">
	                                            +<br>
	                                            READ MORE
	                                        </p>
	                                    </div>
	                                </div>
	                                <!-- 카드 내용 -->
	                                <div class="card-body">
	                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
	                                        ${ spot.tripTitle }
	                                    </p>
	                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">
	                                        ${ spot.tripAddress }
	                                    </p>
	                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block;  text-align: start !important; word-wrap: break-word; word-break: break-word; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">
	                                        ${ spot.tripTel }
	                                    </p>
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
                    <li><a href="#"><</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">></a></li>
                </ul>
            </div>
            <!-- </div> -->
        </div>
    </div>
</section>


<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />