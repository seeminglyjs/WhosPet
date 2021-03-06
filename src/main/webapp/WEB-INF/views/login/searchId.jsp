<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	// name 인풋창 정규식 체크
	$("#name").on("propertychange change keyup paste input blur", function(){
		var name = /^[가-힣]{2,6}$/
			if(!name.test($("#name").val())){
				$("#sp3").removeClass("green")
				$("#sp3").text("잘못된 이름 형식입니다.").addClass("red")
		}else{
			$("#sp3").removeClass("red")
			$("#sp3").text("멋진 이름입니다.").addClass("green")
		}
	})
	
	// phone 인풋창 정규식 체크
	$("#phone").on("propertychange change keyup paste input blur", function(){
		var phone = /^\d{3}-\d{3,4}-\d{4}$/ 
			if(!phone.test($("#phone").val())){
				$("#sp4").removeClass("green")
				$("#sp4").text("잘못된 번호 형식입니다.").addClass("red")
		}else{
			$("#sp4").removeClass("red")
			$("#sp4").text("알맞은 번호형식입니다.").addClass("green")
		}
	})
})


/* form 전송전 체크 함수 */
function check(){

	// name 인풋창 정규식 체크
		var name = /^[가-힣]{2,6}$/
			if(!name.test($("#name").val())){
				$("#sp3").removeClass("green")
				$("#sp3").text("잘못된 이름 형식입니다.").addClass("red")
				$("#name").focus()
				return false;
		}

	// phone 인풋창 정규식 체크
		var phone = /^\d{3}-\d{3,4}-\d{4}$/ 
			if(!phone.test($("#phone").val())){
				$("#sp4").removeClass("green")
				$("#sp4").text("잘못된 번호 형식입니다.").addClass("red")
				$("#phone").focus()
				return false;
			}

}
</script>

<style type="text/css">


/* 폰트 크기 색 부여 클래스  */
.red{
	font-size: 0.8em;
	color: red;
}

.green{
	font-size: 0.8em;
	color: green;
}


#searchIdFullDiv{
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
<strong style="font-size: 18px;">Whospet </strong><span>SearchId</span>
</div>
<hr>
<div id="searchIdFullDiv">
	<div style="width: 500px; height:300px; margin: 0 auto;">
	
	
	<div id="loginImg">
		<div style="padding: 40px;">
			<a href="/"><img alt="" src="/resources/img/logo2.png" style="width: 100%"></a>
		</div>
	</div>
	
	
	<form class="form-horizontal" action="/login/searchId" method="post" onsubmit="return check()">
	    
	  <div class="form-group">
	    <label for="name" class="col-sm-2 control-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="name" name ="name" placeholder="사용자이름" autocomplete="off">
	      <span id="sp3"></span>
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="phone" class="col-sm-2 control-label">전화번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phone" name ="phone" placeholder="010-0000-0000" autocomplete="off">
    	 <span id="sp4"></span>
	    </div>
	  </div>
	  

	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	       <button type="submit" class="btn btn-sm btn-primary">아이디 찾기</button>
	       <button type="button" class="btn btn-sm btn-default" onclick="history.back()">취소</button>      
	    </div> 
	  </div>
		
		<div class="form-group"> 
	   	<div class="col-sm-offset-2 col-sm-10">
			<span><a href="/login/login">로그인</a> / 
			<a href="/join/join">회원가입</a></span>
		</div>
		</div>
	  
	</form>
	</div>
</div>
<hr>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>