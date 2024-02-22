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
    <link rel="stylesheet" href="${path}/css/common/pawpawHeader.css"    >

    <script src="https://kit.fontawesome.com/36aedea311.js" crossorigin="anonymous"></script>

    <script src="${path}/js/common/jquery-3.7.1.min.js"></script>
    <script src="${path}/js/common/jquery-migrate-1.2.1.min.js"></script>
    <script src="${path}/js/common/bootstrap.bundle.min.js"></script>
    <script src="${path}/js/common/templatemo.js"></script>
 	 	  
	<!-- summernote cdn -->
<!--     <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->
	<script>
		$(document).ready(()=>{
			
			let menuSubId = false;//서브메뉴가 있는 ul의 id저장되어 hide()가 되지 않게 한다.
			
			$('.nav-item').on('mouseover', (event)=>
			{
				menuSubId = $(event.target).parent().children('ul.menu-sub').attr('id');
				
				//원인 불명, event.target이 되는 a태그 주변의 ul.menu-sub 의 id를 넣는다  
				if(menuSubId == undefined){
					menuSubId = $(event.target).parents('ul.menu-sub').attr('id');
				}
				
				let windowsWidth = $(window).width();

				//모바일형태(992px 미만)로 메뉴가 보일때는 서브메뉴 보이지 않게
				if(windowsWidth>=992)
				{
					$('#submenu_bg').show();
					if(menuSubId == 'menuUlsecond'){
						$('#menuUlsecond').show();
						$('#menuUlthird').hide();
					}
					else if(menuSubId == 'menuUlthird'){
						$('#menuUlsecond').hide();
						$('#menuUlthird').show();
					}
					else{
						$('#menuUlsecond').hide();
						$('#menuUlthird').hide();
						$('#submenu_bg').hide();
					}
				}
			});
			$('.nav-item').on('mouseleave', (event)=>
			{
 				//event.preventDefault();
 				//event.stopPropagation();
				let windowsWidth = $(window).width();

				//모바일형태(992px 미만)로 메뉴가 보일때는 서브메뉴 보이지 않게
				if(windowsWidth>=992)
				{
					if(menuSubId == 'menuUlsecond'){
						$('#menuUlsecond').show();
						$('#menuUlthird').hide();
					}
					else if(menuSubId == 'menuUlthird'){
						$('#menuUlsecond').hide();
						$('#menuUlthird').show();
					}
				}
			});
			$('#submenu_bg').on('mouseleave', (event)=>
			{
				$('#menuUlsecond').hide();
				$('#menuUlthird').hide();
				$('#submenu_bg').hide();
			});
			
		})
	
	</script>
</head>
<body>

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand logo h1 align-self-center" href="${path}/">
                <img src="${path}/img/common/pawpawLogo.png"/>
                <span>포포</span><span>트립</span>
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/map">포포맵</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/trip/trip">포포트립</a>
                            <ul class="menu-sub" id="menuUlsecond">
                                <li class="on"><a href="${path}/trip/trip">여행</a></li>
                                <li class=""><a href="${path}/trip/stay">숙박</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/community/notice">커뮤니티</a>
                            <ul class="menu-sub" id="menuUlthird">
                                <li class=""><a href="${path}/community/notice">공지사항</a></li>
                                <li class=""><a href="${path}/community/board">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/about">소개</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    </div>
                    <a class="nav-icon d-lg-inline text-decoration-none common" href="${path}/login">로그인</a>
                    <a class="nav-icon position-relative text-decoration-none common" href="${path}/enroll">회원가입</a>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    <div id="submenu_bg" class="container-fluid shadow" style="background-color:#FDFAEF;height:50px;display:none;position: absolute; z-index: 2;"></div>
