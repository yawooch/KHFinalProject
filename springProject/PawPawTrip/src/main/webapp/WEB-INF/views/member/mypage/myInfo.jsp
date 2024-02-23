<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/member/mypage/myInfo.css">
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	
	<!-- 메인 -->
	<form action="">
        <div class="notice-wrap">
            <div class="notice-content">
                <div class="notice-title">
                    <p>마이페이지</p>
                </div>
                <div class="notice-container">
                    <!-- 사이드 바 메뉴 -->
                    <div class="notice-sideMenu">
                        <ul>
                            <li class="community-text">마이페이지</li>
                            <li class="notice-text"><a href="#">회원 정보 수정</a></li>
                            <li class="board-text"><a href="#">내가 쓴 게시글</a></li>
                        </ul>
                    </div>
                    <div class="notice-list">
                        <!-- 회원 정보 -->
                        <div class="notice-detail-list">
                            <table>
                                <tr>
                                    <td>아이디</td>
                                    <td>비밀번호</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><b><input type="text" value="woochan" readonly></b></td>
                                    <td><input type="text" placeholder="8~15자 영문,숫자 포함"></td>
                                    <td></td>
                                </tr>
                                <tr height="20px">
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>비밀번호 확인</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="양우찬" readonly></td>
                                    <td><input type="text" placeholder="8~15자 영문,숫자 포함"></td>
                                    <td></td>
                                </tr>
                                <tr height="20px">
                                </tr>
                                <tr>
                                    <td>생년월일</td>
                                    <td>핸드폰 번호</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="2023-12-21" readonly></td>
                                    <td><input type="text" value="01012345678"></td>
                                    <td><button class="paw_btn2">인증받기</button></td>
                                </tr>
                            <tr height="20px">
                            </tr>
                            <tr>
                                <td>마이펫 이름</td>
                                <td>인증번호</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="text" value="복Siri"></td>
                                <td><input type="text"></td>
                                <td><button class="paw_btn2">확인</button></td>
                            </tr>
                            <tr height="20px">
                            </tr>
                            <tr>
                                <td>마이펫 타입</td>
                                <td>이메일</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="text"></td>
                                <td><input type="text" value="woochan@pawpaw.com"></td>
                                <td></td>
                            </tr>
						</table>
					</div>
                    <!-- 하단 버튼 -->
                    <div class="bottom-btn">
                        <button class="paw_btn1">수정</button>
                        <button class="paw_btn2">회원탈퇴</button>
                    </div>
				</div>
			</div>
		</div>
    </form>
    
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>