<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<style type="text/css">

#searchIdResFullDiv{
	width: 700px;
	height: 600px;
	margin: 0 auto;
	border: 1px solid #ccc;
	border-radius: 15px;
	padding-top: 90px;
}


#loginImg{
	display: flex;
	justify-content: center;
}

</style>
<div>
<strong style="font-size: 18px;">Whospet </strong><span>IDRes</span>
</div>
<hr>
<div id="searchIdResFullDiv">
<div style="width: 500px; height:300px; margin: 0 auto; text-align: center">

	<div id="loginImg">
		<div style="padding: 40px;">
			<a href="/"><img alt="" src="/resources/img/logo2.png" style="width: 100%"></a>
		</div>
	</div>

<c:choose>
	<c:when test="${empty user }">
		<div>
		<h3><strong>회원님의 아이디를 찾을 수 없습니다.</strong></h3>
		<strong>정보를 다시 확인해 주세요.</strong>
		<hr>
		<button class="btn btn-sm btn-default" onclick="history.back()">뒤로</button>
		</div>
	</c:when>
	
	<c:otherwise>
		<div>
		<h3><strong>회원님의 아이디는: ${user.uId } 입니다.</strong></h3>
		<hr>
		<a href="/login/login"><button class="btn btn-sm btn-primary">로그인</button></a>	
		</div>
	</c:otherwise>
</c:choose>    
</div>
</div>
<hr>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>