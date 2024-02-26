<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container content">
	<div class="common-title">
		<p>Error 페이지 입니다만? 호오</p>
	</div>
	<p style="font-size:180px;opacity:0.18;font-weight:900;overflow: hidden;">*ฅ^•ﻌ•^ฅ*</p>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />