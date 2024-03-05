<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d3729bf88f29d9ac1dd719a6bcd5fd14"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3729bf88f29d9ac1dd719a6bcd5fd14&libraries=services,clusterer,drawing"></script>

<script type="text/javascript" src="${path}/js/map/map.js"></script>
<div class="content">
    <div class="container">
        <div class="common-title">
            <p>포포맵</p>
        </div>
        <div class="container-fluid" style="margin-top:35px;">
            <div class="common-search">
                <div>
                </div>
                <div>
                    <div>
                        <select name="communitySelect" id="communitySelect">
                            <option value="title" selected>제목</option>
                            <option value="name">작성자</option>
                            <option value="content">내용</option>
                        </select>
                    </div>
                    <div>
                        <img src="${ path }/img/community/search.png">
                        <input type="text" name="communitySearch" id="communitySearch" placeholder="검색어를 입력해주세요.">
                    </div>
                    <div>
                        <button>검색</button>
                    </div>
                </div>
            </div>
            <div style="padding-bottom:10px;margin-top:35px;">
            
                <div id="map" style="width:100%;height:400px;"></div>
            
            </div>
            <div class="container-fluid" style="width:100%; height:400px; background-color:#FDFAEF;margin-bottom:50px;">
                <div class="row" style="height: 100%;">
                    <div class="col-4" style="height:100%;background-color: aliceblue;">
                        <div class="row" id="clickLatlng">

                        </div>
                    </div>
                    <div class="col-4" style="height:100%;background-color: aquamarine;">
                    </div>
                    <div class="col-4" style="height:100%;background-color: bisque;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />