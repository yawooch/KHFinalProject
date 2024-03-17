<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/community/boardwrite.css">
<!--  
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
-->
<link rel="stylesheet" href="${path}/css/community/summernote-lite.css">
<link rel="stylesheet" href="${path}/css/admin/plannedDevelop.css">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>개발예정 기능</p>
        </div>
        <div class="common-sideMenu">
            <ul>
                <li>관리자</li>
                <li class=""  ><a href="${path}/admin/dashboard"     >대시보드     </a></li>
                <li class=""  ><a href="${path}/admin/tripList"      >포포트립 매핑</a></li>
                <li class=""  ><a href="${path}/admin/noticeWrite"   >공지사항 입력</a></li>
                <li class=""  ><a href="${path}/admin/favoritesite"  >인추장 선정  </a></li>
                <li class="on"><a href="${path}/admin/plannedDevelop">개발예정 기능</a></li>
            </ul>
        </div>
        <div class="common-list">
            <div class="community-detail-list">
            
              <!-- Nav tabs -->
              <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home">날씌</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu1">문자</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu2">날씌2</a>
                </li>
              </ul>
            
              <!-- Tab panes -->
              <div class="tab-content">
                <div id="home" class="container tab-pane active"><br>
                
                    <div class="common-detail-list" style="position:relative;">
                        <div id="spinnerLoading" style="display:none;position:absolute;width:100%;height:100%;background-color:rgb(0 0 0 / 65%);">
                            <div class="spinner-border text-warning" style="position: absolute;width: 80px; height: 80px; border: 16px solid currentcolor; border-right-color: transparent;margin-left: -40px; margin-top: -40px;"></div>
                        </div>
                        <div style="text-align: left; margin-bottom: 10px;">
                        	<select id="regId">
                        		<option value="choice">----- 선택 -----</option>
                        		<c:forEach var="weatherArea" items="${ weatherAreas }" >
	                        		<option value="${weatherArea.areaCode }">
	                        			<c:out value="${ weatherArea.areaName }" />
	                        		</option>
	                        		
                        		</c:forEach>
                        	</select>
                        </div>
                        <table>
                            <thead>
                            <tr>
								<td style="width: 70px;">3일 후</td>
								<td style="width: 70px;">4일 후</td>
								<td style="width: 70px;">5일 후</td>
								<td style="width: 70px;">6일 후</td>
								<td style="width: 70px;">7일 후</td>
								<td style="width: 70px;">8일 후</td>
                            </tr>
                            </thead>
                            <tbody>
<!--                                 <tr> -->
<!-- 	                                <td colspan="7"> -->
<!-- 	                                    조회된 게시글이 없습니다. -->
<!-- 	                                </td> -->
<!--                                 </tr> -->
                                <tr id="test">
                                	<td colspan="7">조회된 게시글이 없습니다. 지역을 선택해 주세요.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="menu1" class="container tab-pane fade"><br>
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
                                    <div class="myInfo-td col-12 padding-bottom"><input type="password" id="password" name="memberPw" placeholder="8~15자 영문,숫자 포함"
                                        <c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>></div>
                                    <p class="strongPassword-message hide" style="color:red; font-size: 12px; margin-top: -30px;">8~15자 영문, 숫자를 포함하여 입력하세요.</p>
                                </div>
                            </div>
                            <div class="myInfo-tr row">
                                <div class="col-lg-6">
                                    <div class="myInfo-td col-12">이름</div>
                                    <div class="myInfo-td col-12 padding-bottom"><input type="text" name="memberName" value="${ loginMember.memberName }" readonly></div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="myInfo-td col-12">비밀번호 확인</div>
                                    <div class="myInfo-td col-12 padding-bottom"><input type="password" id="password-retype" placeholder="8~15자 영문,숫자 포함"
                                        <c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>></div>
                                     <p class="mismatch-message hide" style="color:red; font-size: 12px; margin-top: -30px;">비밀번호가 일치하지 않습니다.</p>
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
                                        <input type="text" class="contain-button" id="memberPhone" name="memberPhone" value="${ loginMember.memberPhone }"
                                            <c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>>
                                        <button class="paw_btn btn-filled" id="sendVerificationCodeBtn" type="button"
                                            <c:if test="${loginMember.memberId.matches('[0-9]+')}">disabled</c:if>>인증받기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="myInfo-tr row">
                                <div class="col-lg-6">
                                    <div class="myInfo-td col-12">마이펫 이름</div>
                                    <div class="myInfo-td col-12 padding-bottom"><input type="text" id="memberPetName" name="memberPetName" value="${ loginMember.memberPetName }"></div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="myInfo-td col-12">인증번호</div>
                                    <div class="myInfo-td col-12 padding-bottom">
                                        <input type="text" id="verificationCode" class="contain-button"
                                            <c:if test="${loginMember.memberId.matches('[0-9]+')}">readonly</c:if>>
                                        <button class="paw_btn btn-filled" id="verifyCodeBtn" type="button"
                                            <c:if test="${loginMember.memberId.matches('[0-9]+')}">disabled</c:if>>확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="menu2" class="container tab-pane fade"><br>
                  <p>구현중이지롱</p>
                </div>
              </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() 
{
//     $('#submitCheck').on('submit', (event) => {
//         let category = $('#comunityCate').val();
//         let title = $('#communityTitle').val();
//         let content = $('#summernote').val();
//         let file = $('#talkWriteFile').val().split('.').pop();
//         let noticeImportantYN = $('#noticeImportantYN option:selected').val();
        
        
//         if(noticeImportantYN == '') {
//             alert('공지구분을 선택해주세요.');
//             return false;
//         }
//         if(category === '분류') {
//             alert('카테고리를 선택해주세요.');
//             return false;
//         }
        
//         if(title === '') {
//             alert('제목을 입력해주세요.');
//             return false;
//         }
        
//         if(content === '') {
//             alert('내용을 입력해주세요.');
//             return false;
//         }
        
//         if(!(file === 'jpg' || file === 'png' || file === 'gif' || file === '')) {
//             alert('이미지 파일을 등록해주세요.');
//             return false;
//         }
        
//     });
    
//     $("#summernote").summernote(
//     {
//         width     : 650,
//         // height: 100,
//         maxHeight : 500,
//         minHeight : 500,
//         placeholder : '내용을 입력해주세요.',
//         lang        : 'ko-KR',
//         toolbar   : [
//                     [ 'Font Style', [ 'fontname'      ] ],
//                     [ 'style'     , [ 'bold', 'italic', 'underline' ] ],
//                     [ 'font'      , [ 'strikethrough' ] ],
//                     [ 'fontsize'  , [ 'fontsize'      ] ],
//                     [ 'color'     , [ 'color'         ] ],
//                     [ 'para'      , [ 'paragraph'     ] ],
//                     [ 'height'    , [ 'height'        ] ],
//                     [ 'Insert'    , [ 'picture'       ] ],
//                     [ 'Insert'    , [ 'link'          ] ],
//                     [ 'Misc'      , [ 'fullscreen'    ] ] ],
//         fontNames : [ 'Arial', 
//                       'Arial Black',
//                       'Comic Sans MS',
//                       'Courier New',
//                       '맑은 고딕',
//                       '궁서',
//                       '굴림체',
//                       '굴림',
//                       '돋움체',
//                       '바탕체' 
//                     ],
//         fontSizes : [ '8', '9' , '10', '11', '12',
//                      '14', '16', '18', '20', '22',
//                      '24', '28', '30', '36', '50', '72' ]
//     });
	
	// 중기 예보
	$('#regId').on('change', (e) => {
		let regId = $(e.target).val();
		
		console.log(regId);
		
		let result = '';
		
		if(regId !== 'choice') {
			$.getJSON('${path}/weather/midta', {regId})
			.done((data) => {
				
				let {weatherMidItems} = data;
				let item = weatherMidItems[0];
				console.log(item);
				console.log(item.regId);
				
				result = '<td>' + item.taMin3 + '℃ / ' + item.taMax3 + '℃</td>' +
						 '<td>' + item.taMin4 + '℃ / ' + item.taMax4 + '℃</td>' +
						 '<td>' + item.taMin5 + '℃ / ' + item.taMax5 + '℃</td>' +
						 '<td>' + item.taMin6 + '℃ / ' + item.taMax6 + '℃</td>' +
						 '<td>' + item.taMin7 + '℃ / ' + item.taMax7 + '℃</td>' +
						 '<td>' + item.taMin8 + '℃ / ' + item.taMax8 + '℃</td>';
				console.log(result);
				$('#test').html(result);
			});
		} else {
			
			result = '<td colspan="6">' + '조회된 게시글이 없습니다. 지역을 선택해 주세요.' + '</td>';
			$('#test').html(result);
		}
		
		
	})
	
	

});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />