<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/member/changePw.css">
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 메인 -->
	<section>
        <form class="content" action="${ path }/member/change-pw" method="post">
            <!--navi-->
            <div class="navi">
                <div class="findbyid">
                    <a href="${ path }/member/find-id" style="color: #B29254;">아이디 찾기</a>
                </div>
                <div class="findbypwd">
                    <a href="#" style="color: #FFF;">비밀번호 찾기</a>
                </div>
            </div>
            <div>
            <div class="acc-table">
                <table>
                <tr>
                    <th>새 비밀번호</th>
                    <td>
                    <input
                        class="user_info_input_tag1"
                        type="password"
                        name=""
                        id=""
                        placeholder="8~15자 영문, 숫자 포함"
                    />
                    </td>
                </tr>
                <tr>
                    <th>새 비밀번호 확인</th>
                    <td>
                    <input
                        class="user_info_input_tag1"
                        type="password"
                        name=""
                        id=""
                        placeholder="8~15자 영문, 숫자 포함"
                    />
                    </td>
                </tr>
                </table>
                <div style="margin: -40px 0 auto; text-align: center">
                <button class="paw_btn1" type="submit">변경하기</button>
                </div>
            </div>
            </div>
        </form>
    </section>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>