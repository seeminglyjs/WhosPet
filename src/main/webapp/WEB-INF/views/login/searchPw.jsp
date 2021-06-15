<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>


<script type="text/javascript">
$(document).ready(function(){

	/* 메일 보내기 ajax */
	$("#emailSend").click(function(){
		$.ajax({
			type: "post"
			,url: "/login/mailSend"
			,data: {email : $("#email").val()}
			,dataType: "html"
			,success: function(res){
				console.log("AJAX성공")
			}
			,error: function(){
				console.log("AJA실패")
			}
		});	
	})
	


})
</script>





<script type="text/javascript">
$(document).ready(function(){
	// id 인풋창 정규식 체크
	$("#id").on("propertychange change keyup paste input blur", function(){
		var id = /^[A-Za-z\d]{4,12}$/ 
			if(!id.test($("#id").val())){
				$("#sp1").removeClass("green")
				$("#sp1").text("잘못된 아이디 형식입니다.").addClass("red")
		}else{
			$("#sp1").removeClass("red")
			$("#sp1").text("알맞은 아이디 형식입니다.").addClass("green")
		}
	})
	
	
	// email 인풋창 정규식 체크
	$("#email").on("propertychange change keyup paste input blur", function(){
		var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
			if(!email.test($("#email").val())){
				$("#sp5").removeClass("green")
				$("#sp5").text("잘못된 이메일 형식입니다.").addClass("red")
				$("#emailSend").attr('disabled', true)
		}else{
			$("#sp5").removeClass("red")
			$("#sp5").text("알맞은 이메일 형식입니다.").addClass("green")
			$("#emailSend").attr('disabled', false)
		}
	})
	
	// 전송문자 인풋창 정규식 체크
	$("#sendText").on("propertychange change keyup paste input blur", function(){
		var sendText = /^[A-Za-z\d]{4,4}$/ 
			if(!sendText.test($("#sendText").val())){
				$("#sp10").removeClass("green")
				$("#sp10").text("전송 문자는 4자리입니다.").addClass("red")
		}else{
			$("#sp10").removeClass("red")
			$("#sp10").text("입력 확인 되었습니다.").addClass("green")
		}
	})
	

})


/* form 전송전 체크 함수 */
function check(){

	// id 인풋창 정규식 체크
		var id = /^[A-Za-z\d]{4,12}$/ 
			if(!id.test($("#id").val())){
				$("#sp1").removeClass("green")
				$("#sp1").text("잘못된 아이디 형식입니다.").addClass("red")
				$("#name").focus()
				return false;
		}
	
	// email 인풋창 정규식 체크
	var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
			if(!email.test($("#email").val())){
				$("#sp5").removeClass("green")
				$("#sp5").text("잘못된 이메일 형식입니다.").addClass("red")
				$("#name").focus()
				return false;
		}
	
	
	// 전송문자 인풋창 정규식 체크
	var sendText = /^[A-Za-z\d]{4,4}$/ 
		if(!sendText.test($("#sendText").val())){
			$("#sp10").removeClass("green")
			$("#sp10").text("전송 문자는 4자리입니다.").addClass("red")
			return false;
		}
	
}
</script>

<style type="text/css">

/*  이메일 수평 유지위한 css */
#email{
	display: inline !important;
	width: 320px !important;
}


/* 폰트 크기 색 부여 클래스  */
.red{
	font-size: 0.8em;
	color: red;
}

.green{
	font-size: 0.8em;
	color: green;
}

#searchPwFullDiv{
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
<strong style="font-size: 18px;">Whospet </strong><span>SearchPw</span>
</div>
<hr>
<div id="searchPwFullDiv">
		
	<div style="width: 500px; height:300px; margin: 0 auto;">
	
	<div id="loginImg">
		<div style="padding: 40px;">
			<a href="/"><img alt="" src="/resources/img/logo2.png" style="width: 100%"></a>
		</div>
	</div>
	
	<form class="form-horizontal" action="/login/searchPw" method="post" onsubmit="return check()">
	    
	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="id" name ="id" placeholder="아이디" autocomplete="off">
	      <span id="sp1"></span>
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="email" class="col-sm-2 control-label">이메일</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="email" name ="email" placeholder="avc@abvd.com" autocomplete="off">
	      <button class="btn btn-sm btn-default" id="emailSend" type="button" disabled="disabled">이메일 전송</button>
    	 <span id="sp5"></span>
	    </div>
	  </div>
	  
	  
  	  <div class="form-group">
	    <label for="sendText" class="col-sm-2 control-label">전송문자</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="sendText" name ="sendText" placeholder="이메일전송문자 4자리" autocomplete="off">
    	 <span id="sp10"></span>
	    </div>
	  </div>
	  
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	       <button type="submit" class="btn btn-sm btn-primary">비밀번호 찾기</button>      
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