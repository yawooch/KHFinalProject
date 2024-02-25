<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/member/findIdComplete.css">
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 메인 -->
    <section class="content">
        <div class="first_div">
            <img src="${ path }/img/member/big_logo.png" alt="" />
            <div class="second_div">
                <h3>보호자님 아이디는 아래와 같습니다.</h3>
                <br />
                <h2>
                <b style="color: #B29254;">woochan</b> <br> 
                </h2>
                <br />
                <input class="paw_btn_long" type="button" value="로그인 하기" onclick="location.href='${ path }/login'"/>
            </div>
        </div>
    </section>
    
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>