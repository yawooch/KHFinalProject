<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3729bf88f29d9ac1dd719a6bcd5fd14&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet" href="${path}/css/map/map.css"></link>
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
                        <select name="searchArea" id="searchArea">
                            <option value="">전체</option>
                            <c:forEach var="searchAreaOption" items="${searchAreaOptions}">
                            <option value="${searchAreaOption.cityCode}">${searchAreaOption.areaName}</option>
                            </c:forEach>
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
            <div class="container-fluid" style="width:100%; background-color:#FDFAEF;margin-bottom:50px;">
                <div class="row" style="">
                    <div class="col-lg-4" style="background-color: aliceblue;">
                        <div class="row" id="clickLatlng" style="font-size:18px;">

                        </div>
                    </div>
                    <div class="col-lg-4" id="zoomInfo" style="background-color: aquamarine;">
                    </div>
                    <div class="col-lg-4" id="addressInfo" style="background-color: bisque;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />