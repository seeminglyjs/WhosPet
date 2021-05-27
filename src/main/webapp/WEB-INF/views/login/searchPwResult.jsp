<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<div style="width: 500px; height:300px; margin: 0 auto; text-align: center">
<c:choose>
	<c:when test="${empty user }">
		<div>
		<h3>회원님의 비밀번호를 찾을 수 없습니다.</h3>
		<h4>인증번호 및 정보를 다시 확인해 주세요</h4>
		<button class="btn btn-danger" onclick="history.back()">뒤로가기</button>
		</div>
	</c:when>
	
	<c:otherwise>
		<div>
		<h3>회원님의 비밀번호는: ${user.uPw } 입니다.</h3>
		<a href="/login/login"><button class="btn btn-primary">로그인</button></a>	
		</div>
	</c:otherwise>
</c:choose>    
</div>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>