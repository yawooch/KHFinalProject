<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel" style="margin:auto;">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="max-container">
                    <div class="row">
                        <img class="img-fluid" src="${path}/img/common/main-carousel-img1.png" alt="">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="max-container">
                    <div class="row">
                        <img class="img-fluid" src="${path}/img/common/main-carousel-img2.png" alt="">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="max-container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="${path}/img/template/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Repr in voluptate</h1>
                                <h3 class="h2">Ullamco laboris nisi ut </h3>
                                <p>
                                    We bring you 100% free CSS templates for your websites. 
                                    If you wish to support TemplateMo, please make a small contribution via PayPal or tell your friends about our website. Thank you.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">자주 쓰는 메뉴</h1>
                <p>강아지와 함께 떠나는 특별한 여행
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-12 p-5 mt-3" style="text-align:center;">
                <a href="#"><img src="${path}/img/common/menuComponent1.png" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">포포맵</h5>
                <p class="text-center"><a class="btn btn-success">보러가기</a></p>
            </div>
            <div class="col-lg-4 col-md-12 p-5 mt-3" style="text-align:center;">
                <a href="#"><img src="${path}/img/common/menuComponent2.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">포포트립</h2>
                <p class="text-center"><a class="btn btn-success">보러가기</a></p>
            </div>
            <div class="col-lg-4 col-md-12 p-5 mt-3" style="text-align:center;">
                <a href="#"><img src="${path}/img/common/menuComponent3.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">커뮤니티</h2>
                <p class="text-center"><a class="btn btn-success">보러가기</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-pawpaw">
        <div class="container py-5">
            <div class="row py-3">
                <div class="col-lg-6">
                    <h1 class="favoriteTitle"><img src="${path}/img/common/favSiteMarker.png" style="margin-right: 10px;"/>인기 추천 장소</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-12 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="${path}/img/common/tempStay.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <a href="" class="h2 text-decoration-none text-dark">숙박</a><br>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">소노펫클럽앤리조트</a>
                            <p class="text-muted"><img src="${path}/img/common/marker.png" >강원 홍천군 서면 한치골길 262</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="${path}/img/common/tempStay.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <a href="" class="h2 text-decoration-none text-dark">숙박</a><br>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">소노펫클럽앤리조트</a>
                            <p class="text-muted"><img src="${path}/img/common/marker.png" >강원 홍천군 서면 한치골길 262</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="${path}/img/common/tempStay.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <a href="" class="h2 text-decoration-none text-dark">숙박</a><br>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">소노펫클럽앤리조트</a>
                            <p class="text-muted"><img src="${path}/img/common/marker.png" >강원 홍천군 서면 한치골길 262</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

