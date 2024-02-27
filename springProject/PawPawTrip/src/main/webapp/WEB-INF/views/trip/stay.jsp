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
<link rel="stylesheet" href="${path}/css/trip/stay.css">


<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 바디 -->
<section class="content">
    <div class="container">
        <!-- 페이지 타이틀 -->
        <!-- 높이 150으로 통일 -->
        <div class="common-title">
            <p> 숙소</p>
        </div>

        <!-- 콘텐츠 -->
        <!-- <div class="community-container"> -->
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
				<div>
					TOTAL <span>26</span>건
				</div>
				<div>
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
					<div>
						<img src="${ path }/img/community/search.png"> <input type="text"
							name="communitySearch" id="communitySearch"
							placeholder="검색어를 입력해주세요.">
					</div>
					<div>
						<button>검색</button>
					</div>
				</div>
			</div>

            <!-- 콘텐츠 내용 -->
            <div class="common-detail-list">
                <div class="row">
                    <!-- 카드 -->
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(${path}/img/trip/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="https://dangdangmap.net/upload/mapdata/C0646/thumb/list/C0646_F20240122174932001.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 10px;">
                                            +<br>
                                            READ MORE
                                        </p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242;">
                                        숙소 이름
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block; text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/map_icon.png)no-repeat; line-height: 19px;">
                                        숙소 주소
                                    </p>
                                    <p class="text-start mb-2" style="font-size: 16px !important; display: inline-block;  text-align: start; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(./resource_icon/tel_icon.png)no-repeat; line-height: 19px;">
                                        숙소 문의처(전화번호)
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
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