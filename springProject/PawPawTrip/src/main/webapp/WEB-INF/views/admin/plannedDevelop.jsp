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
                        <table>
                            <colgroup>
                                <col width="60">
                                <col width="250">
                                <col width="250">
                                <col width="250">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>콘텐츠 ID</tH>
                                <th>매핑여부</th>
                                <th>동반가능여부</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="5">
                                        조회된 게시글이 없습니다.
                                    </td>
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
                                <div class="col-lg-12">
                                    <div class="myInfo-td col-12">핸드폰 번호</div>
                                    <div class="myInfo-td col-12 padding-bottom">
                                        <input type="text" class="contain-button" id="memberPhone" name="memberPhone" value="" placeholder="ex) 01012345678">
                                        <button class="paw_btn btn-filled" id="sendMessage" type="button">보내기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="myInfo-tr row">
                                <div class="col-lg-12">
                                    <div class="myInfo-td col-12">보낼 내용</div>
                                    <div class="myInfo-td col-12 padding-bottom"><textarea id="sendingMessage" name="sendingMessage" placeholder="[포포트립 안내] " >[포포트립 안내]
포포트립 개발하시느라 고생많으셨습니다~!</textarea></div>
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
    //보내기 버튼 클릭 시
    $('#sendMessage').click(function()
    {
        let memberPhone    = $('#memberPhone').val(); // 휴대폰 번호 입력란의 값을 가져와 'memberPhone' 변수에 할당
        let sendingMessages = $('#sendingMessage').val();
        
        $.ajax({
            type: "POST",
            url:'/pawpawtrip/sendMessages',
            data: {
                memberPhone,
                sendingMessages
            },
            success: function(res){
                alert('메세지가 전송되었습니다.');
            },
            error: function(error) {
                alert('메세지 전송에 실패하였습니다.');
            }
        })
    });     
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

});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />