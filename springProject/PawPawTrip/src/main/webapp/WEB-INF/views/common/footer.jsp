<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                    <span class="footer-span-left">
	                    <span style="float: left;">
	                    	<img src="${path}/img/common/footerLogoImg.png"/>
	                    	<img src="${path}/img/common/footerLogoText.png"/>
	                    </span>
	                    <span class="footer-span-left">
	                        <span class="text-left text-white">서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
	                        <span class="text-left text-white">사업자 등록번호 :  185-82-00643</span><br>
	                        <span class="text-left text-white">대표자명 : 양우찬 , 김정아, 이영우, 송은정</span><br>
	                    </span>
                    </span>
                    <span class="footer-span-right">
                        <p class="text-left text-white" >
                            Copyright &copy; PAWPAWTRIP JONGRO-GO, Inc.<br>
                            All Right Reserved
                        </p>
                    </span>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->
</body>
</html>

