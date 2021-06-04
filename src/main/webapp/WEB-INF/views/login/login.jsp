<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>

<%-- 쿠키를 가져오는 코드 --%>
<%Cookie[] cookies = request.getCookies();  %>
<% String idCookie = null; %>
<% String idCheck = null; %>

<%-- 쿠키가 있을시 변수로 담는다. --%>
<% for(Cookie c : cookies){
	if("idCookie".equals(c.getName())){
		idCookie = c.getValue();
	}else if("idCheck".equals(c.getName())){
		idCheck = c.getValue();
	}	
}%>

<%--페이지 스코프에 저장 --%>
<c:set value="<%=idCookie %>" var="idCookie"/>
<c:set value="<%=idCheck %>" var="idCheck"/>

<!-- 카카오톡 로그인 API 영역  -->
<script>  
     function loginWithKakao(){
    	 Kakao.Auth.login({
 		    scope: 'profile, account_email', // 가져올 정보
 		    success: function(authObj) { // 로그인 성공시
	 		    console.log(authObj);
	 		   	Kakao.Auth.authorize({ 
	 			  redirectUri: 'http://localhost:8088/login/kakaoLogin',
	 			  scope: 'profile, account_email'
	 			});
 		    },
 		    fail: function(error) {
 		        console.log(error);
 		    }
 		});
	} 
</script>

<style type="text/css">

#logingFullDiv{
	width: 700px;
	height: 600px;
	margin: 0 auto;
	border: 1px solid #ccc;
	border-radius: 15px;
	padding-top: 90px;
}

.breadcrumb{
	background-color: white;
	
}

#loginImg{
	display: flex;
	justify-content: center;
}

</style>

<div>
<strong style="font-size: 18px;">Whospet </strong><span>Account</span>
</div>
<hr>
<div id="logingFullDiv" style="border: 1px solid #ccc;">
	<div style="width: 500px; height:300px; margin: 0 auto;">
	
	<div id="loginImg">
		<div style="padding: 40px;">
			<a href="/"><img alt="" src="/resources/img/logo2.png" style="width: 100%"></a>
		</div>
	
	</div>
	
	
	<form class="form-horizontal" action="/login/login" method="post">
	  
	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	    <c:choose>
	    <c:when test="${empty idCookie }">
	      <input type="text" class="form-control" id="id" name="id" placeholder="아이디..">
	    </c:when>
	    
	    <c:otherwise>
	    	<input type="text" class="form-control" id="id" name="id" value="${idCookie }">
	    </c:otherwise>	
	    </c:choose>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="pw" class="col-sm-2 control-label">비밀번호</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="pw" name ="pw" placeholder="비밀번호.." autocomplete="off">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
     	  <c:choose>
	      <c:when test="${empty idCheck }">
	        <label>
	          <input type="checkbox" id="memoryId" name="memoryId"> 아이디 기억하기
	        </label>
     	  </c:when>
	    	
	      <c:otherwise>
	      	<label>
	          <input type="checkbox" id="memoryId" name="memoryId" checked="checked"> 아이디 기억하기
	        </label>
	      </c:otherwise>	
	      </c:choose>  
			<span style="padding-left: 50px;"><a href="/login/searchId">아이디 찾기</a> / 
			<a href="/login/searchPw">비밀번호 찾기</a></span>
	      </div>
	    </div> 
	  </div>
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	       <button type="submit" class="btn btn-sm btn-primary">로그인</button>
	      <!-- 카카오톡 로그인  -->
	      <a id="custom-login-btn" href="javascript:loginWithKakao()"><button type="button" class="btn btn-sm btn-warning">Kakao 로그인</button></a>      
	    </div> 
	  </div>
	  
	</form>
	</div>
</div>
<hr>	
<p id="token-result"></p>
	
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>