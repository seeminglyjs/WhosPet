<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerAdmin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<script type="text/javascript">
$(document).ready(function(){

})
</script>


<style type="text/css">


#detailFullDiv{
	width: 700px;
	height: 980px;
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
<strong style="font-size: 18px;">Whospet </strong><span>User_Detail</span>
</div>
<hr>
<div id="detailFullDiv">
	<div style="width: 500px; height:300px; margin: 0 auto;">
	
	<div id="loginImg">
		<div style="padding: 40px;">
			<a href="/"><img alt="" src="/resources/img/logo2.png" style="width: 100%"></a>
		</div>
	</div>
	
	<br>
	<div  class="text-center" >
	<h3><strong>${user.uId }님의 정보</strong></h3>
	</div>
	<br>
	
	<form class="form-horizontal" action="/admin/user/delete" method="post">
	  
		<!-- 유저번호 -->
		<input type="hidden" name="uNo" value="${user.uNo }">

	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="id" name="id" placeholder="${user.uId }" readonly="readonly">
	    </div>
	  </div>

	  
   	  <div class="form-group">
	    <label for="name" class="col-sm-2 control-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="name" name ="name" placeholder="${user.uName }" readonly="readonly">
	      <span id="sp3"></span>
	    </div>
	  </div>
	  
	  
  	  <div class="form-group">
	    <label for="phone" class="col-sm-2 control-label">전화번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phone" name ="phone" placeholder="${user.uPhone }" readonly="readonly">
	      <span id="sp4"></span>
	    </div>
	  </div>
	  

		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="email" id="email" placeholder="${user.uEmail }" readonly="readonly">
				<span id="sp5"></span>
			</div>
		</div>
	
	  <div class="form-group">
	    <label for="nick" class="col-sm-2 control-label">닉네임</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="nick" name ="nick" placeholder="${user.uNick }" readonly="readonly">
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="postcode" class="col-sm-2 control-label">우편번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="postcode" name ="postcode" placeholder="${user.uPost }" readonly="readonly">
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="address" class="col-sm-2 control-label">주소</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="address" name ="address" placeholder="${user.uAddress }" readonly="readonly">
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="detailAddress" class="col-sm-2 control-label">상세주소</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="detailAddress" name ="detailAddress" placeholder="${user.uDetailAddress }" readonly="readonly">
	    </div>
	  </div>
	  


	  <div class="form-group">
	    <label for="ugrade" class="col-sm-2 control-label">유저유형</label>
	    <div class="col-sm-10">
			<input type="text" class="form-control" id="ugrade" name ="ugrade" placeholder="${user.uGrade }" readonly="readonly">		
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="pet" class="col-sm-2 control-label">반려동물</label>
	    <div class="col-sm-10">
			<input type="text" class="form-control" id="pet" name ="pet" placeholder="${user.uPet }" readonly="readonly">						
	    </div>
	  </div>

	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">    
	      <button type="button" class="btn btn-sm btn-default" onclick="history.back()">뒤로</button>   
	      <c:if test='${sessionScope.user.uGrade eq "M" }'>
		 <button class="btn btn-sm btn-danger" type="submit">회원삭제</button>
		  </c:if>
	    </div>
	  </div>
	
	</form>
	</div>
	
	</div>
<hr>


<%@ include file="/WEB-INF/views/layout/footerAdmin.jsp" %>