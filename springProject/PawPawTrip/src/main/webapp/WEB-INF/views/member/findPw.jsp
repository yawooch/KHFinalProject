<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/member/findPw.css">
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<!-- 메인 -->
	<form class="content" action="">
        <section class="main-box">  
            <!--navi-->
            <div class="navi">
                <div class="findbyid">
                    <a href="#" style="color: #B29254;">아이디 찾기</a>
                </div>
                <div class="findbypwd">
                    <a href="#" style="color: #FFF;">비밀번호 찾기</a>
                </div>
            </div>
            
            <!-- 메인 비밀번호 찾기 창 -->
            <sec>
                <div class="acc-table">
                    <table>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input class="user_info_input_tag1" type="text" name="" id="" />
                            </td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input class="user_info_input_tag1" type="text" name="" id="" />
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰 번호</th>
                            <td>
                                <input class="user_info_input_tag2" type="text" name="" id="" placeholder="휴대폰 번호 '-' 제외하고 입력" />
                            </td>
                            <td>
                                <input class="paw_btn2" type="button" value="인증받기" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input class="user_info_input_tag2" type="text" name="" id="" placeholder="인증번호 입력" />
                            </td>
                            <td><input class="paw_btn2" type="button" value="확인" /></td>
                        </tr>
                    </table>
                    <div style="margin: -50px auto; text-align: center">
                        <button class="paw_btn1" type="submit">비밀번호 찾기</button>
                    </div>
                </div>
            </section>
        </form>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
