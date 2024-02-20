<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
	<title>PawPawTrip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="${path}/img/common/favicon.png">
<!-- <link rel="preconnect" href="https://fonts.googleapis.com"> -->
<!-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/css/bootstrap.css">
    <link rel="stylesheet" href="${path}/css/templatemo.css">
    <link rel="stylesheet" href="${path}/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
<%--     <link rel="stylesheet" href="${path}/css/fontawesome.css"> --%>
    <script src="https://kit.fontawesome.com/36aedea311.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- Start Top Nav -->
<!--     <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top"> -->
<!--         <div class="container text-light"> -->
<!--             <div class="w-100 d-flex justify-content-between"> -->
<!--                 <div> -->
<!--                     <i class="fa fa-envelope mx-2"></i> -->
<!--                     <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a> -->
<!--                     <i class="fa fa-phone mx-2"></i> -->
<!--                     <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a> -->
<!--                 </div> -->
<!--                 <div> -->
<!--                     <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> -->
<!--                     <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a> -->
<!--                     <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a> -->
<!--                     <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </nav> -->
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="${path}/">
			    <img src="${path}/img/common/favicon.png" style="width:30.1px;"/>
			    <span style="color:#B29254;font-family: 'Noto Sans KR';font-weight:700;font-size:25px">포포</span><span style="color:#FFDE69;font-family: 'Noto Sans KR';font-weight:700;font-size:25px">트립</span>
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/">댕댕여행지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/about">여행</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/shop">커뮤니티</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/contact">소개</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
<!--                         <div class="input-group"> -->
<!--                             <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ..."> -->
<!--                             <div class="input-group-text"> -->
<!--                                 <i class="fa fa-fw fa-search"></i> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                    <a class="nav-icon d-lg-inline text-decoration-none common" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
<!--                         <i class="fa fa-fw fa-search text-dark mr-2"></i> -->
                        로그인
                    </a>
                    <a class="nav-icon position-relative text-decoration-none common" href="#">
<!--                         <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> -->
                        회원가입
<!--                         <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span> -->
                    </a>
<!--                     <a class="nav-icon position-relative text-decoration-none" href="#"> -->
<!--                         <i class="fa fa-fw fa-user text-dark mr-3"></i> -->
<!--                         <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span> -->
<!--                     </a> -->
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Banner Hero -->
    <div style="width:100%;">
    </div>
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
<!--                         <div class="mx-auto col-md-8 col-lg-6 order-lg-last"> -->
<!--                         </div> -->
<!--                         <div class="col-lg-6 mb-0 d-flex align-items-center"> -->
<!--                             <div class="text-align-left align-self-center"> -->
<!--                                 <h1 class="h1 text-success"><b>Zay</b> eCommerce</h1> -->
<!--                                 <h3 class="h2">Tiny and Perfect eCommerce Template</h3> -->
<!--                                 <p> -->
<!--                                     Zay Shop is an eCommerce HTML5 CSS template with latest version of Bootstrap 5 (beta 1).  -->
<!--                                     This template is 100% free provided by <a rel="sponsored" class="text-success" href="https://templatemo.com" target="_blank">TemplateMo</a> website.  -->
<!--                                     Image credits go to <a rel="sponsored" class="text-success" href="https://stories.freepik.com/" target="_blank">Freepik Stories</a>, -->
<!--                                     <a rel="sponsored" class="text-success" href="https://unsplash.com/" target="_blank">Unsplash</a> and -->
<!--                                     <a rel="sponsored" class="text-success" href="https://icons8.com/" target="_blank">Icons 8</a>. -->
<!--                                 </p> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="max-container">
                    <div class="row">
                            <img class="img-fluid" src="${path}/img/common/main-carousel-img2.png" alt="">
<!--                         <div class="mx-auto col-md-8 col-lg-6 order-lg-last"> -->
<%--                             <img class="img-fluid" src="${path}/img/banner_img_02.jpg" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="col-lg-6 mb-0 d-flex align-items-center"> -->
<!--                             <div class="text-align-left"> -->
<!--                                 <h1 class="h1">Proident occaecat</h1> -->
<!--                                 <h3 class="h2">Aliquip ex ea commodo consequat</h3> -->
<!--                                 <p> -->
<!--                                     You are permitted to use this Zay CSS template for your commercial websites.  -->
<!--                                     You are <strong>not permitted</strong> to re-distribute the template ZIP file in any kind of template collection websites. -->
<!--                                 </p> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="max-container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="${path}/img/banner_img_03.jpg" alt="">
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
            <div class="col-lg-4 col-md-12 p-5 mt-3" style=text-align:center;">
<%--                 <a href="#"><img src="${path}/img/category_img_01.jpg" class="rounded-circle img-fluid border"></a> --%>
                <a href="#"><img src="${path}/img/common/menuComponent1.png" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">포포맵</h5>
                <p class="text-center"><a class="btn btn-success">보러가기</a></p>
            </div>
            <div class="col-lg-4 col-md-12 p-5 mt-3" style=text-align:center;">
<%--                 <a href="#"><img src="${path}/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a> --%>
                <a href="#"><img src="${path}/img/common/menuComponent2.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">포포트립</h2>
                <p class="text-center"><a class="btn btn-success">보러가기</a></p>
            </div>
            <div class="col-lg-4 col-md-12 p-5 mt-3" style=text-align:center;">
<%--                 <a href="#"><img src="${path}/img/category_img_03.jpg" class="rounded-circle img-fluid border"></a> --%>
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
<!--                             <ul class="list-unstyled d-flex justify-content-between"> -->
<!--                                 <li> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-muted fa fa-star"></i> -->
<!--                                     <i class="text-muted fa fa-star"></i> -->
<!--                                 </li> -->
<!--                                 <li class="text-muted text-right">$240.00</li> -->
<!--                             </ul> -->
                            <a href="" class="h2 text-decoration-none text-dark">숙박</a><br>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">소노펫클럽앤리조트</a>
<!--                             <p class="card-text"> -->
                            
<!--                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt in culpa qui officia deserunt. -->
<!--                             </p> -->
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
<!--                             <ul class="list-unstyled d-flex justify-content-between"> -->
<!--                                 <li> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-muted fa fa-star"></i> -->
<!--                                     <i class="text-muted fa fa-star"></i> -->
<!--                                 </li> -->
<!--                                 <li class="text-muted text-right">$480.00</li> -->
<!--                             </ul> -->
                            <a href="" class="h2 text-decoration-none text-dark">숙박</a><br>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">소노펫클럽앤리조트</a>
<!--                             <p class="card-text"> -->
                            
<!--                                 Aenean gravida dignissim finibus. Nullam ipsum diam, posuere vitae pharetra sed, commodo ullamcorper. -->
<!--                             </p> -->
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
<!--                             <ul class="list-unstyled d-flex justify-content-between"> -->
<!--                                 <li> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                     <i class="text-warning fa fa-star"></i> -->
<!--                                 </li> -->
<!--                                 <li class="text-muted text-right">$360.00</li> -->
<!--                             </ul> -->
                            <a href="" class="h2 text-decoration-none text-dark">숙박</a><br>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">소노펫클럽앤리조트</a>
<!--                             <p class="card-text"> -->
                            
<!--                                 Curabitur ac mi sit amet diam luctus porta. Phasellus pulvinar sagittis diam, et scelerisque ipsum lobortis nec. -->
<!--                             </p> -->
                            <p class="text-muted"><img src="${path}/img/common/marker.png" >강원 홍천군 서면 한치골길 262</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->


    <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
<!--         <div class="container"> -->
<!--             <div class="row"> -->

<!--                 <div class="col-md-4 pt-5"> -->
<!--                     <h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay Shop</h2> -->
<!--                     <ul class="list-unstyled text-light footer-link-list"> -->
<!--                         <li> -->
<!--                             <i class="fas fa-map-marker-alt fa-fw"></i> -->
<!--                             123 Consectetur at ligula 10660 -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <i class="fa fa-phone fa-fw"></i> -->
<!--                             <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <i class="fa fa-envelope fa-fw"></i> -->
<!--                             <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->

<!--                 <div class="col-md-4 pt-5"> -->
<!--                     <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2> -->
<!--                     <ul class="list-unstyled text-light footer-link-list"> -->
<!--                         <li><a class="text-decoration-none" href="#">Luxury</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Sport Wear</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Men's Shoes</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Women's Shoes</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Popular Dress</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Gym Accessories</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Sport Shoes</a></li> -->
<!--                     </ul> -->
<!--                 </div> -->

<!--                 <div class="col-md-4 pt-5"> -->
<!--                     <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2> -->
<!--                     <ul class="list-unstyled text-light footer-link-list"> -->
<!--                         <li><a class="text-decoration-none" href="#">Home</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">About Us</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Shop Locations</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">FAQs</a></li> -->
<!--                         <li><a class="text-decoration-none" href="#">Contact</a></li> -->
<!--                     </ul> -->
<!--                 </div> -->

<!--             </div> -->

<!--             <div class="row text-light mb-4"> -->
<!--                 <div class="col-12 mb-3"> -->
<!--                     <div class="w-100 my-3 border-top border-light"></div> -->
<!--                 </div> -->
<!--                 <div class="col-auto me-auto"> -->
<!--                     <ul class="list-inline text-left footer-icons"> -->
<!--                         <li class="list-inline-item border border-light rounded-circle text-center"> -->
<!--                             <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a> -->
<!--                         </li> -->
<!--                         <li class="list-inline-item border border-light rounded-circle text-center"> -->
<!--                             <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a> -->
<!--                         </li> -->
<!--                         <li class="list-inline-item border border-light rounded-circle text-center"> -->
<!--                             <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a> -->
<!--                         </li> -->
<!--                         <li class="list-inline-item border border-light rounded-circle text-center"> -->
<!--                             <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <div class="col-auto"> -->
<!--                     <label class="sr-only" for="subscribeEmail">Email address</label> -->
<!--                     <div class="input-group mb-2"> -->
<!--                         <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address"> -->
<!--                         <div class="input-group-text btn-success text-light">Subscribe</div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                    <span style="float: left;">
	                    <span style="float: left;">
	                    	<img src="${path}/img/common/footerLogoImg.png"/>
	                    	<img src="${path}/img/common/footerLogoText.png"/>
	                    </span>
	                    <span style="float: left;">
	                        <span class="text-left text-white">서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
	                        <span class="text-left text-white">사업자 등록번호 :  185-82-00643</span><br>
	                        <span class="text-left text-white">대표자명 : 양우찬 , 김정아, 이영우, 송은정</span><br>
	                    </span>
                    </span>
                    <span style="float: right;">
                        <p class="text-left text-white" style="float: right; text-align: right;">
                            Copyright &copy; PAWPAWTRIP JONGRO-GO, Inc.<br>
                            All Right Reserved
<!--                             | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a> -->
                        </p>
                    </span>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="${path}/js/jquery-3.7.1.min.js"></script>
    <script src="${path}/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${path}/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/js/templatemo.js"></script>
    <script src="${path}/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>

