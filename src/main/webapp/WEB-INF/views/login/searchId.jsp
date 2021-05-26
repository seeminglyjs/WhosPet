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
			$("#sp3").removeClass("red")
			$("#sp3").text("멋진 이름입니다.").addClass("green")
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
				return false;
		}else{
			//중복검사ajax
			$.ajax({
				url : '/join/overlap/id'
				,type : 'post'
				,data : {id : $("#id").val() }
				,dataType : 'html'
				,success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);										
					if (data == 1) {
						$("#sp1").removeClass("green")
						$("#sp1").text("이미 존재하는 아이디입니다.").addClass("red")
						return false;
					}else {
						$("#sp1").removeClass("red")
						$("#sp1").text("사용 가능한 아이디입니다.").addClass("green")
					}
				}
				, error : function() {
					console.log("실패");
					return false;
				}
			}); //ajax 끝	
		}
	
	// pw 인풋창 정규식 체크	
		var pw = /^[A-Za-z\d]{4,12}$/ 
		if(!pw.test($("#pw").val())){
				$("#sp2").removeClass("green")
				$("#sp2").text("잘못된 비밀번호 형식입니다.").addClass("red")
				$("#pw").focus()
				return false;
		}

	
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
			}else{
				//중복검사ajax
				$.ajax({
					url : '/join/overlap/phone'
					,type : 'post'
					,data : {phone : $("#phone").val() }
					,dataType : 'html'
					,success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : "+ data);										
						if (data == 1) {
							$("#sp4").removeClass("green")
							$("#sp4").text("이미 존재하는 번호입니다.").addClass("red")
							return false;
						}else {
							$("#sp4").removeClass("red")
							$("#sp4").text("알맞은 전화 번호 입니다.").addClass("green")
						}
					}
					, error : function() {
						console.log("실패");
						return false;
					}
				}); //ajax 끝	
			}

		
		// email 인풋창 정규식 체크
			var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
				if(!email.test($("#email").val())){
					$("#sp5").removeClass("green")
					$("#sp5").text("잘못된 이메일 형식입니다.").addClass("red")
					return false;
			}else{
				//중복검사ajax
				$.ajax({
					url : '/join/overlap/email'
					,type : 'post'
					,data : {email : $("#email").val() }
					,dataType : 'html'
					,success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : "+ data);										
						if (data == 1) {
							$("#sp5").removeClass("green")
							$("#sp5").text("이미 존재하는 이메일입니다..").addClass("red")
							return false;
						}else {
							$("#sp5").removeClass("red")
							$("#sp5").text("사용 가능한 이메일입니다.").addClass("green")
						}
					}
					, error : function() {
						console.log("실패");
						return false;
					}
				}); //ajax 끝	
			}
		
	
	
}


</script>

<style type="text/css">

.breadcrumb{
	background-color: white;
	
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

</style>





<div>
<h3>아이디 찾기 페이지</h3>
<hr>
</div>

	<div style="width: 500px; height:300px; margin: 0 auto;">
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
	       <button type="submit" class="btn btn-primary" style="margin-left: 20px">아이디 찾기</button>
	      <!-- 카카오톡 로그인  -->
	      <a id="custom-login-btn" href="javascript:loginWithKakao()"><button type="button" class="btn btn-warning">Kakao 로그인</button></a>      
	    </div> 
	  </div>
	  
	</form>
	
	<div class="col-sm-offset-4 col-sm-10">
		<ol class="breadcrumb">
		  <li><a href="/login/login">로그인</a></li>
		  <li><a href="/join/join">회원가입</a></li>
		</ol>
	</div>
	
	</div>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>