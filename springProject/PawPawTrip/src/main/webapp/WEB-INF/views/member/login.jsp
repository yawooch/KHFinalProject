<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/css/member/login.css">

<body>
    <!--메인 로그인 창-->
    <section>
        <form action="">
            <!--로고-->
            <div id="biglogo">
                <img src="${ path }/img/member/big_logo.png" alt="로고" style="width: 250px" />
            </div>
            <!--로그인 창-->
            <div class="first_div">
                <div class="login-box">
                    <input type="text" name="input_id" id="input_id" placeholder="아이디" />
                    <br />
                    <input type="password" name="input_pass" id="input_pass" placeholder="비밀번호" />
                    <div class="login_info_save">
                        <input type="checkbox" name="" id="login_info_save"/>
                        <label for="login_info_save">아이디 저장</label>
                    </div>
                    <button type="submit" class="login_btn">로그인</button>
                    <br /><br />
                    <div class="label_signAndIdPass">
                        <div class="label_signup">
                            <a href="#">회원가입</a>
                        </div>
                        <div class="label_id">
                            <a href="#">아이디 찾기</a>
                        </div>

                        <div class="label_pass">
                            <a href="#">비밀번호 찾기</a>
                        </div>
                    </div>
                    <br><br>
                    <!--간편 로그인-->
                    <div class="hr-sect">간편 로그인</div>
                    <br>
                    <div class="kakao">
                        <button type="button" class="kakao_btn"></button>
                    </div>
                </div>
            </div>
        </form>
    </section>
</body>