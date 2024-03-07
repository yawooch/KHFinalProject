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
		    <form action="${ path }/login" method="post">
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
		                    <input type="checkbox" name="" id="login_info_save"/>
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
		                <br>
		                <!--간편 로그인-->
		                <div class="hr-sect">간편 로그인</div>
		                <br>
		                <div class="kakao_btn" onclick="javascript:loginWithKakao()">
		                    <img src="https://madangs.com/re_public/images/social/kakao_symbol.svg" alt="" width="20px">
		                    <span>카카오 로그인</span>
		                </div>
		            </div>
		        </div>
		    </form>
		</div>
	</div>
</section>
    
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<!-- 카카오 JavaScript SDK 로드 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
	Kakao.init('3fc2a63b04c71eaa30a65586b28961cc'); // 사용하려는 앱의 JavaScript 키 입력
	console.log(Kakao.isInitialized()); // 초기화 판단 여부
	
	//카카오 로그인 후 토근 값 저장.
    function loginWithKakao() {
        Kakao.Auth.login({
            success: function (authObj) {
                console.log(authObj); // access토큰 값
                Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

                getInfo();
            },
            fail: function (err) {
                console.log(err);
            }
        });
    }
	
	// 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
	function getInfo() {
	    Kakao.API.request({
	        url: '/v2/user/me',
	        success: function (res) {
	            console.log(res);
	            // 이메일, 닉네임
	            var email = res.account_email;
	            var profile_nickname = res.profile_nickname;
				
	            console.log(email, profile_nickname);
	        },
	        fail: function (error) {
	            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
	        }
	    });
	}
	
</script>
	
	


