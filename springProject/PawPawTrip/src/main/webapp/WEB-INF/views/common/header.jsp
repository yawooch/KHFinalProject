<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>PawPawTrip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="${path}/img/common/favicon.png">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/css/common/bootstrap.css" >
    <link rel="stylesheet" href="${path}/css/common/templatemo.css"> 
    <link rel="stylesheet" href="${path}/css/common/custom.css"    >

    <script src="https://kit.fontawesome.com/36aedea311.js" crossorigin="anonymous"></script>

    <script src="${path}/js/common/jquery-3.7.1.min.js"></script>
    <script src="${path}/js/common/jquery-migrate-1.2.1.min.js"></script>
    <script src="${path}/js/common/bootstrap.bundle.min.js"></script>
    <script src="${path}/js/common/templatemo.js"></script>
    <script src="${path}/js/common/custom.js"></script>
 	 	  
	<!-- summernote cdn -->
<!--     <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->
    
	<style>
	
	@media (min-width: 576px) 
	{
		.nav-item ul.menu-sub li
		{
			padding-top:10px;
			margin-right:20px;
	        float:left;
		}
		.nav-item ul.menu-sub li a{
	        text-decoration:none;
	        color:#222222;
		}
		.nav-item ul.menu-sub li
		{
			padding-top:10px;
			margin-right:20px;
	        float:left;
		}
		.nav-item ul.menu-sub li a{
	        text-decoration:none;
	        color:#222222;
		}
		#templatemo_main_nav .nav-item ul.menu-sub li.on a{
			color:#B29254;
	        font-weight:700;
		}
		.nav-item ul.menu-sub{
	        list-style-type: none;
	        float:left;
	        margin:0;
	        padding:0;
	        position: absolute;
	        z-index: 3; 
	        top: 193px;
	        width: 200px;
	        display:none;
		}
		.nav-item:nth-child(3) ul.menu-sub{
	        top: 152px;
		}
	}

	@media (min-width: 992px) 
	{
		.nav-item ul.menu-sub li a{
	        text-decoration:none;
	        color:#222222;
		}
		.nav-item ul.menu-sub li
		{
			padding-top:10px;
			margin-right:20px;
	        float:left;
		}
		.nav-item ul.menu-sub li a{
	        text-decoration:none;
	        color:#222222;
		}
		.nav-item ul.menu-sub li
		{
			padding-top:10px;
			margin-right:20px;
	        float:left;
		}
		#templatemo_main_nav .nav-item ul.menu-sub li.on a{
			color:#B29254;
	        font-weight:700;
		}
		.nav-item ul.menu-sub{
	        list-style-type: none;
	        float:left;
	        margin:0;
	        padding:0;
	        position: absolute;
	        z-index: 3; 
	        top: 68px;
	        left: -18px;
	        width: 200px;
	        display:none;
		}
		.nav-item:nth-child(3) ul.menu-sub{
   	        top: 68px; 
	        left: -32px;
		}
	}
	
	#tempaltemo_footer .footer-span-left{
		float: left;
	}
	#tempaltemo_footer .text-white{
		font-size:12px;
	}
	#tempaltemo_footer .footer-span-right{
		float: right;
	}
	
	/* #templatemo_main_nav a:hover+ul.menu-sub{display:block;} */
	</style>
</head>
<body>

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="${path}/">
                <img src="${path}/img/common/pawpawLogo.png" style="width:30.1px;"/>
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
                        <li class="nav-item" style="position:relative;">
                            <a class="nav-link" href="${path}/about">여행</a>
                            <ul class="menu-sub">
                                <li class="on"><a href="#">여행</a></li>
                                <li class=""><a href="#">숙박</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" style="position:relative;">
                            <a class="nav-link" href="${path}/shop">커뮤니티</a>
                            <ul class="menu-sub">
                                <li class=""><a href="#">공지사항</a></li>
                                <li class=""><a href="#">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/contact">소개</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    </div>
                    <a class="nav-icon d-lg-inline text-decoration-none common" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">로그인</a>
                    <a class="nav-icon position-relative text-decoration-none common" href="#">회원가입</a>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    <div id="submenu_bg" class="container-fluid shadow" style="background-color:#FDFAEF;height:50px;display:none;position: absolute; z-index: 2;"></div>
