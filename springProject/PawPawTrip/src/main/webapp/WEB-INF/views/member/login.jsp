<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />


<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/css/member/login.css">
<link rel="stylesheet" href="${path}/css/member/member.css">

    <!--메인 로그인 창-->
<section class="content container-fluid">
	<div class="container">
		<div class="member-content member-login">
		    <form action="${ path }/login" id="login-form" method="post">
		        <!--로고-->
		        <div id="biglogo" onclick="location.href='${path}/'">
		            <img src="${ path }/img/member/big_logo.png" alt="로고" style="width: 250px" />
		        </div>
		        <!--로그인 창-->
		        <div class="first_div">
		            <div class="login-box">
		                <input type="text" name="memberId" id="input_id" placeholder="아이디" />
		                <br />
		                <input type="password" name="memberPw" id="input_pass" placeholder="비밀번호" />
		                <div class="login_info_save">
		                    <!-- 아이디 저장 체크박스 -->
			                <input type="checkbox" name="rememberId" id="login_info_save" />
			                <label for="login_info_save">아이디 저장</label>
		                </div>
		                <button type="submit" class="login_btn">로그인</button>
		                <br /><br />
		                <div class="label_signAndIdPass">
		                    <div class="label_signup">
		                        <a class="a_btn" href="${ path }/enroll">회원가입</a>
		                    </div>
		                    <div class="label_id">
		                        <a class="a_btn" href="${ path }/member/find-id">아이디 찾기</a>
		                    </div>
		
		                    <div class="label_pass">
		                        <a class="a_btn" href="${ path }/member/find-pw">비밀번호 찾기</a>
		                    </div>
		                </div>
		    </form>
		                <br>
		                <!--간편 로그인-->
		                <div class="hr-sect">간편 로그인</div>
		                <br>
		                <a class="kakao_btn" href="https://kauth.kakao.com/oauth/authorize?client_id=5e374f58b3157eda0c7846d4ebda25f1&redirect_uri=	
	http://localhost:8080/pawpawtrip/kakaoLogin&response_type=code">
		                    <img src="https://madangs.com/re_public/images/social/kakao_symbol.svg" alt="" width="20px">
		                    <span>카카오 로그인</span>
		                </a>
		                <!--  
		                <div class="kakao_btn" onclick="javascript:loginWithKakao()">
		                </div>
		                -->
		            </div>
		        </div>
		</div>
	</div>
</section>
    
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
$(document).ready(function() {
	// 폼 제출 시 아이디 저장 여부 확인 
    $('#login-form').submit(function() {
    	if ($('#login_info_save').is('checked:checked')) {
            // 아이디 저장 체크 박스가 선택되었을 때
            let inputId = $('#input_id').val();
            setCookie("rememberedId", inputId, 7); // 7일 동안 쿠키 유지
        } else {
            // 아이디 저장 체크 박스가 선택되지 않았을 때, 저장한 쿠키 삭제
            deleteCookie("rememberedId");
        }
    });
	
    // 쿠키에서 아이디 가져오기
    let rememberedId = getCookie("rememberedId");
    if (rememberedId) {
        $('#input_id').val(rememberedId); // 입력란에 아이디 설정
        $('#login_info_save').prop('checked', true); // 체크박스 선택 상태로 변경
    }


    // 쿠키 설정 함수
    function setCookie(name, value, days) {
    	// 만료 날짜 설정
        let expires = "";
        if (days) {
            let date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000)); // 현재 날짜에 days일을 더한다.
            expires = "; expires=" + date.toUTCString(); // 만료 날짜를 UTC 형식으로 설정
        }
        // 쿠키 설정
        document.cookie = name + "=" + (value || "") + expires + "; path=/";
    }

    // 쿠키 가져오기 함수
    function getCookie(name) {
    	// 쿠키 이름에 해당하는 값을 찾아서 반환
        let nameEQ = name + "=";
        let ca = document.cookie.split(';');
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length); // 앞쪽의 공백을 제거
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);  // 쿠키 이름이 일치하는 경우 해당 값을 반환
        }
        return null; // 일치하는 쿠키를 찾지 못한 경우 null을 반환
    }

    // 쿠키 삭제 함수
    function deleteCookie(name) {
        document.cookie = name + '=; Max-Age=-99999999;'; // 만료 기간을 과거로 설정하여 즉시 만료시킴
    }
});
</script>
	
	


