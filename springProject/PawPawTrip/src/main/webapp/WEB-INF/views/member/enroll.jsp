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
<link rel="stylesheet" href="${path}/css/member/enroll.css">
<link rel="stylesheet" href="${path}/css/member/member.css">

<!-- 메인 -->
<section class="content container-fluid">
	<div class="container">
		<div class="member-content">
	    <!-- navi -->
	    <div class="navi">
	        <div class="findbyid">
	            <a href="#" style="color: #FFF;">회원가입</a>
	        </div>
	    </div>
	    <form action="${ path }/enroll" method="POST">
	     <div class="main_div">
	         <h3>약관 동의</h3>
	         <div class="inner_top_div">
	             <input type="checkbox" name="" id="all_Agree" />
	             <label for="all_Agree">전체 동의하기</label> <br />
	             <input type="checkbox" name="" id="required_option1" />
	             <label for="required_option1"
	                 ><span class="required_option">(필수)</span> 만 15세 이상입니다. <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" name="" id="required_option2" />
	             <label for="required_option2"
	                 ><span class="required_option">(필수)</span> 서비스 이용약관동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" name="" id="required_option3" />
	             <label for="required_option3"
	                 ><span class="required_option">(필수)</span> 개인정보 수집 및 이용 동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" name="" id="select_option1" />
	             <label for="select_option1"
	                 ><span class="select_option">(선택)</span> 개인정보수집 및 이용 동의 - 마케팅 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" name="" id="select_option2" />
	             <label for="select_option2"
	                 ><span class="select_option">(선택)</span> 광고성 정보 이메일/SMS 수신 동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	             <input type="checkbox" name="" id="select_option3" />
	             <label for="select_option3"
	                 ><span class="select_option">(선택)</span> 위치 정보 수집 및 이용 동의 <span class="manual"><a href="#">(약관보기)</a></span></label
	             >
	             <br />
	         </div>
	         <table>
	             <tr>
	                 <th>이름</th>
	                 <td><input type="text" class="user_info_input_tag2" /></td>
	             </tr>
	             <tr>
	                 <th>생년월일</th>
	                 <td class="info" id="info_birth">
	                     <select name="" id="">
	                         <option value="">출생 연도</option>
	                     </select>
	                     <select name="" id="">
	                         <option value="">월</option>
	                     </select>
	                     <select name="" id="">
	                         <option value="">일</option>
	                     </select>
	                 </td>
	             </tr>
	             <tr>
	                 <th>아이디</th>
	                 <td><input type="text" class="user_info_input_tag2" placeholder="5~12자 영문, 숫자 포함" /></td>
	                 <td><input type="button" class="algo_btn200" value="중복확인" /></td>
	             </tr>
	             <tr>
	                 <th>비밀번호</th>
	                 <td><input type="text" class="user_info_input_tag2" placeholder="8~15자 영문, 숫자 포함" /></td>
	             </tr>
	             <tr>
	                 <th>비밀번호 확인</th>
	                 <td><input type="text" class="user_info_input_tag2" placeholder="8~15자 영문, 숫자 포함" /></td>
	             </tr> 
	             <tr>
	                 <th>휴대폰 번호</th>
	                 <td><input type="text" class="user_info_input_tag2" placeholder="휴대폰 번호 '-' 제외하고 입력" /></td>
	                 <td><input type="button" class="algo_btn200" value="인증받기" /></td>
	             </tr>
	             <tr>
	                 <th></th>
	                 <td><input type="text" class="user_info_input_tag2" placeholder="인증번호 입력" /></td>
	                 <td><input type="button" class="algo_btn200" value="확인" /></td>
	             </tr>
	             <tr>
	                 <th>이메일</th>
	                 <td class="e-mail">
	                     <input type="text" />
	                     @
	                     <select name="" id="">
	                         <option value="">직접 입력</option>
	                         <option value="">naver.com</option>
	                     </select>
	                 </td>
	             </tr>
	             <tr>
	                 <th>마이펫 이름</th>
	                 <td><input type="text" class="user_info_input_tag2" /></td>
	             </tr>
	             <tr>
	                 <th>마이펫 타입</th>
	                 <td class="pet-type">
	                 	<select name="" id="">
	                         <option value="">골든 리트리버</option>
	                         <option value="">포메라니안</option>
	                         <option value="">프렌치 불도그</option>
	                         <option value="">비숑 프리제</option>
	                         <option value="">말티즈</option>
	                         <option value="">푸들</option>
	                         <option value="">시츄</option>
	                         <option value="">요크셔 테리어</option>
	                         <option value="">기타</option>
	                        </select>
	                 </td>
	             </tr>
	             <!-- <tr>
	                 <th>이메일</th>
	                 <td>
	                     <input type="text" class="user_info_input_tag1"/>
	                     <input class="box" id="domain-txt" type="text"/>
	                     <select class="box" id="domain-list">
	                     <option value="naver.com">naver.com</option>
	                     <option value="google.com">google.com</option>
	                     <option value="hanmail.net">hanmail.net</option>
	                     <option value="nate.com">nate.com</option>
	                     <option value="kakao.com">kakao.com</option>
	                     </select>
	                 </td>
	             </tr> -->
	         </table>
	     </div>
	     <div class="signInBtn">
	         <input type="submit" class="algo_btn100" value="회원가입" />
	     </div>
	    </form>
		</div>
    </div>
</section>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

