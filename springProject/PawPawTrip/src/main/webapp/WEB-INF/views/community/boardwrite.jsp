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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<div class="community-wrap content">
	<div class="community-content">
		<div class="common-title">
			<p>자유 게시판</p>
		</div>
		<div class="community-container">
			<div class="common-sideMenu">
				<ul>
					<li class="community-text">커뮤니티</li>
					<li class="notice-text"><a href="${path}/community/notice">공지사항</a></li>
					<li class="board-text"><a href="${path}/community/board">자유 게시판</a>

						<ul class="community-detail-sideMenu">
							<li><a href="${ path }/community/board/talk">수다</a></li>
							<li><a href="${ path }/community/board/mypet">마이펫 자랑</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="community-list">
				<form action="" method="post">
					<table border="1">
						<tr>
							<td style="text-align: center;">제목</td>
							<td class="community-td-title"><select name="comunityCate"
								id="comunityCate">
									<option value="" selected>분류</option>
									<option value="">수다</option>
									<option value="">마이펫 자랑</option>
							</select> <input type="text" name="communityTitle" id="communityTitle"
								placeholder="제목을 입력해주세요." /></td>
						</tr>
						<tr>
							<td style="text-align: center;">작성자</td>
							<td class="community-td-name"><input type="text"
								name="comunityName" id="comunityName" value="ywlee0000" readonly />
							</td>
						</tr>
						<tr>
							<td style="text-align: center;">내용</td>
							<td><textarea resize="none" name="summernote"
									id="summernote" class="summernote" cols="30" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;" class="community-td-file">
								첨부파일<br> ※ 30MB까지 첨부 가능
							</td>
							<td><input type="file" name="talkWriteFile"
								id="talkWriteFile"></td>
						</tr>
					</table>
					<div class="btn-wrap">
						<button type="submit" class="community-add-btn">등록</button>
						<button type="button" class="community-list-btn" onclick="location.href='${ path }/community/board'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
        $(document).ready(function () {
            $("#summernote").summernote({
                // width: 710,
                height: 100,
                // maxHeight: 500,
                // minHeight: 500,
                placeholder: '내용을 입력해주세요.',
                lang: 'ko-KR',
                toolbar: [
                        ['Font Style', ['fontname']],
                        ['style', ['bold', 'italic', 'underline']],
                        ['font', ['strikethrough']],
                        ['fontsize', ['fontsize']],
                        ['color', ['color']],
                        ['para', ['paragraph']],
                        ['height', ['height']],
                        ['Insert', ['picture']],
                        ['Insert', ['link']],
                        ['Misc', ['fullscreen']]
                ],
            });
            
        });
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />