<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- **************** 헤더 *************** -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/member/mypage/myTrip.css">

<!-- **************** 바디 *************** -->
<div class="content">
	<div class="container">
	
		<!-- 메인 메뉴 -->
		<div class="common-title">
			<p>내가 찜한 장소</p>
		</div>
		
		<!-- 사이드 바 메뉴 -->
		<div class="common-sideMenu">
			<ul>
				<li class="community-text">마이페이지</li>
				<li class="notice-text"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
				<li class="notice-text"><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a></li>
				<li class="board-text"><a href="${path}/member/mypage/my-trip">내가 찜한 장소</a></li>
			</ul>
		</div>
		
		<!-- 컨텐츠 -->
		<div class="common-list" style="margin-top: 28px;">
			<div class="common-detail-list no-row" >
				<div class="row">
					<div class="col-md-4">
						<a href="" style="text-decoration: none;">
                            <!-- 카드 이미지 -->
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
	                                <img class="card-img rounded-0 img-fluid" src="${ path }/img/trip/readyImage.png" alt="잠시후에 다시 시도해 주세요.">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <p class="readMore" style="font-size: 14px !important;">+<br>READ MORE</p>
                                    </div>
                                </div>
                                <!-- 카드 내용 -->
                                <div class="card-body">
                                	<div class="contentType">관광지</div>
                                    <p class="text-center mb-4" style="font-size: 18px !important; font-weight: bold; color: #4B4242; height: 54px !important;">
                                        장소 이름
                                    </p>
                                    <p class="text-decoration-none mb-2 !important" style="font-size: 14px !important; display: block; text-align: start !important; word-wrap: break-word; word-break: break-all; padding-left: 22px; top: 0; background: url(${path}/img/trip/map_icon.png)no-repeat; line-height: 19px;">
                                        장소 주소 
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
					<li><a href="">&lt;</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
					<li><a href="">&gt;</a></li>
				</ul>
			</div>		
		</div>		
	</div>
</div>

<!-- **************** 푸터 **************** -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />