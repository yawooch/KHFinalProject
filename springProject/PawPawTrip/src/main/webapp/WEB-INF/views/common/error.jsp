<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid">
	<div class="container">
		<div class="community-title">
			<p>Error 페이지 입니다만? 호오</p>
		</div>
		<div class="community-title">
			<p style="font-size:200px;opacity:0.3;">*ฅ^•ﻌ•^ฅ*</p>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />