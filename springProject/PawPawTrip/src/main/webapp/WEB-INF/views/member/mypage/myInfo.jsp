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
	<link rel="stylesheet" href="${path}/css/member/mypage/myInfo.css">
	
	<!-- 메인 -->
<div class="content">
	<div class="container"> 
	<form action="${ path }/member/mypage/update" method="post">
		<!-- 타이틀 -->
		<div class="common-title">
			<p>마이페이지</p>
		</div>
			
        <!-- 사이드 바 메뉴 -->
		<div class="common-sideMenu">
			<ul>
				<li class="">마이페이지</li>
				<li class="on"><a href="${path}/member/mypage/my-info">회원 정보 수정</a></li>
				<li class=""><a href="${path}/member/mypage/my-board">내가 쓴 게시글</a>
			</ul>
		</div>
		<div class="common-list">
			<div class="myInfo-list">
				<!-- 회원 정보 -->
				<div class="myinfo-inner-content">
					<div class="myInfo-table">
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">아이디</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberId" value="${ loginMember.memberId }" readonly></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">비밀번호</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberPw" placeholder="8~15자 영문,숫자 포함"></div>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">이름</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberName" value="${ loginMember.memberName }" readonly></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">비밀번호 확인</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" placeholder="8~15자 영문,숫자 포함"></div>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">생년월일</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberBirth" value="${ loginMember.memberBirth }" readonly></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">핸드폰 번호</div>
								<div class="myInfo-td col-12 padding-bottom">
									<input type="text" class="contain-button" name="memberPhone" value="${ loginMember.memberPhone }">
									<button class="paw_btn btn-filled">인증받기</button>
								</div>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">마이펫 이름</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberPetName" value="${ loginMember.memberPetName }"></div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">인증번호</div>
								<div class="myInfo-td col-12 padding-bottom">
									<input type="text" class="contain-button">
									<button class="paw_btn btn-filled">확인</button>
								</div>
							</div>
						</div>
						<div class="myInfo-tr row">
							<div class="col-lg-6">
								<div class="myInfo-td col-12">마이펫 타입</div>
								<div class="myInfo-td col-12 padding-bottom">
									<select name="memberPetType" id="memberPetType">
										 <option value="골든 리트리버">골든 리트리버</option>
				                         <option value="포메라니안">포메라니안</option>
				                         <option value="프렌치 불도그">프렌치 불도그</option>
				                         <option value="비숑 프리제">비숑 프리제</option>
				                         <option value="말티즈">말티즈</option>
				                         <option value="푸들">푸들</option>
				                         <option value="시츄">시츄</option>
				                         <option value="요크셔 테리어">요크셔 테리어</option>
				                         <option value="믹스견">믹스견</option>
				                         <option value="기타">기타</option>
									</select>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="myInfo-td col-12">이메일</div>
								<div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberEmail" value="${ loginMember.memberEmail }"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 하단 버튼 -->
				<div class="bottom-btn">
					<button type="submit" class="paw_btn">수정</button>
					<button type="button" class="paw_btn btn-filled">회원탈퇴</button>
				</div>
			</div>
		</div>
		</form>
    </div>
</div>
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
<script>
	$(document).ready(() => {
		$('.btn-filled').on('click', () => {
			if (confirm('정말로 탈퇴하시겠습니까?')) {
				location.replace('${ path }/member/mypage/delete');
			}
		});
	});
</script>

