<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>


<form action="#" method="post">


<!-- 카카오로그인에서 미가입 유저가 회원가입 폼으로 넘어왔을때 체크할 요소  -->
<c:choose>
	<c:when test="${empty kakaoEmail }">
	<input type="text" name="email" id="email">
	</c:when>
	
	<c:otherwise >
	<input type="text" name="email" id="email" value="${kakaoEmail }">
	</c:otherwise>
</c:choose>




</form>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>