<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>



<!-- 카카오 맵 API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr =extraAddr;
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<!-- 폼태그 정규식 및 중복성 체크 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function(){
	
	// id 인풋창 정규식 체크
	$("#id").on("propertychange change keyup paste input blur", function(){
		var id = /^[A-Za-z\d]{4,12}$/ 
			if(!id.test($("#id").val())){
				$("#sp1").removeClass("green")
				$("#sp1").text("잘못된 아이디 형식입니다.").addClass("red")
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
					}else {
						$("#sp1").removeClass("red")
						$("#sp1").text("사용 가능한 아이디입니다.").addClass("green")
					}
				}
				, error : function() {
					console.log("실패");
				}
			}); //ajax 끝	
		}
	})
	
		
	// pw 인풋창 정규식 체크
	$("#pw").on("propertychange change keyup paste input blur", function(){		
		var pw = /^[A-Za-z\d]{4,12}$/ 
		if(!pw.test($("#pw").val())){
				$("#sp2").removeClass("green")
				$("#sp2").text("잘못된 비밀번호 형식입니다.").addClass("red")
		}else{
			$("#sp2").removeClass("red")
			$("#sp2").text("알맞은 비밀번호 형식입니다.").addClass("green")
		} 
	})
	
	
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
					}else {
						$("#sp4").removeClass("red")
						$("#sp4").text("사용 가능한 번호입니다.").addClass("green")
					}
				}
				, error : function() {
					console.log("실패");
				}
			}); //ajax 끝	
		}
	})
	
	// email 인풋창 정규식 체크
	$("#email").on("propertychange change keyup paste input blur", function(){
		var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
			if(!email.test($("#email").val())){
				$("#sp5").removeClass("green")
				$("#sp5").text("잘못된 이메일 형식입니다.").addClass("red")
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
					}else {
						$("#sp5").removeClass("red")
						$("#sp5").text("사용 가능한 이메일입니다.").addClass("green")
					}
				}
				, error : function() {
					console.log("실패");
				}
			}); //ajax 끝	
		}
	})
	
		// nick 인풋창 정규식 체크
	$("#nick").on("propertychange change keyup paste input blur", function(){
		var nick = /^[0-9a-zA-Z가-힣]{2,10}$/i
			if(!nick.test($("#nick").val())){
				$("#sp6").removeClass("green")
				$("#sp6").text("잘못된 닉네임 형식입니다.").addClass("red")
		}else{
			//중복검사ajax
			$.ajax({
				url : '/join/overlap/nick'
				,type : 'post'
				,data : {nick : $("#nick").val() }
				,dataType : 'html'
				,success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);										
					if (data == 1) {
						$("#sp6").removeClass("green")
						$("#sp6").text("이미 존재하는 닉네임입니다..").addClass("red")
					}else {
						$("#sp6").removeClass("red")
						$("#sp6").text("사용 가능한 닉네임입니다.").addClass("green")
					}
				}
				, error : function() {
					console.log("실패");
				}
			}); //ajax 끝	
		}
	})
	

	// 우편번호 인풋창 체크
	$("#sample6_postcode").on("propertychange change keyup paste input blur", function(){
	    if(typeof $("#sample6_postcode").val() == "undefined" || $("#sample6_postcode").val() == null || $("#sample6_postcode").val() == ""){
	    	$("#sp7").removeClass("green")
			$("#sp7").text("필수 항목입니다.").addClass("red")
	    }else{
	    	$("#sp7").removeClass("red")
			$("#sp7").text("우편번호 입력 확인되었습니다.").addClass("green")
        }
	})
	
	/* 우편번호 찾기 버튼  클릭시 */
	$("#postBtn").click(function(){
	    	$("#sp7").html("<span/>");
	    	$("#sp8").html("<span/>");
	})
	
	// 주소 인풋창 체크
	$("#sample6_address").on("propertychange change keyup paste input blur", function(){
    if(typeof $("#sample6_address").val() == "undefined" || $("#sample6_address").val() == null || $("#sample6_address").val() == ""){
    	$("#sp8").removeClass("green")
		$("#sp8").text("필수 항목입니다.").addClass("red")
    }else{
    	$("#sp8").removeClass("red")
		$("#sp8").text("주소 입력 확인되었습니다.").addClass("green")
       }
	})
	
	
	// 상세주소 인풋창 체크
	$("#sample6_detailAddress").on("propertychange change keyup paste input blur", function(){
	var detailAddress = /^[a-zA-Z가-힣0-9\s]{2,}$/    
	if(!detailAddress.test($("#sample6_detailAddress").val())){
    	$("#sp9").removeClass("green")
		$("#sp9").text("2글자 이상 필수 항목입니다.").addClass("red")
    }else{
    	$("#sp9").removeClass("red")
		$("#sp9").text("상세주소 입력 확인되었습니다.").addClass("green")
       }
	})
	
}) // document 끝


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
		
			// nick 인풋창 정규식 체크
			var nick = /^[0-9a-zA-Z가-힣]{2,10}$/i
				if(!nick.test($("#nick").val())){
					$("#sp6").removeClass("green")
					$("#sp6").text("잘못된 닉네임 형식입니다.").addClass("red")
					return false;
			}else{
				//중복검사ajax
				$.ajax({
					url : '/join/overlap/nick'
					,type : 'post'
					,data : {nick : $("#nick").val() }
					,dataType : 'html'
					,success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : "+ data);										
						if (data == 1) {
							$("#sp6").removeClass("green")
							$("#sp6").text("이미 존재하는 닉네임입니다..").addClass("red")
							return false;
						}else {
							$("#sp6").removeClass("red")
							$("#sp6").text("사용 가능한 닉네임입니다.").addClass("green")
						}
					}
					, error : function() {
						console.log("실패");
						return false;
					}
				}); //ajax 끝	
			}
		

	// 우편번호 인풋창 체크
	    if(typeof $("#sample6_postcode").val() == "undefined" || $("#sample6_postcode").val() == null || $("#sample6_postcode").val() == ""){
	    	$("#sp7").removeClass("green")
			$("#sp7").text("필수 항목입니다.").addClass("red")
			return false;
	    }else{
	    	$("#sp7").removeClass("red")
			$("#sp7").text("우편번호 입력 확인되었습니다.").addClass("green")
	    }	
	
	// 주소 인풋창 체크
		if(typeof $("#sample6_address").val() == "undefined" || $("#sample6_address").val() == null || $("#sample6_address").val() == ""){
	    	$("#sp8").removeClass("green")
			$("#sp8").text("필수 항목입니다.").addClass("red")
			return false;
	    }else{
	    	$("#sp8").removeClass("red")
			$("#sp8").text("주소 입력 확인되었습니다.").addClass("green")
	    }
	
	// 상세주소 인풋창 체크
		var detailAddress = /^[a-zA-Z가-힣0-9\s]{2,}$/  
		if(!detailAddress.test($("#sample6_detailAddress").val())){
	    	$("#sp9").removeClass("green")
			$("#sp9").text("2글자 이상 필수 항목입니다.").addClass("red")
			return false;
	    }else{
	    	$("#sp9").removeClass("red")
			$("#sp9").text("상세주소 입력 확인되었습니다.").addClass("green")
	       }
}

</script>


<style type="text/css">

/*  우편 번호만 수평 유지위한 css */
#sample6_postcode{
	display: inline !important;
	width: 270px !important;
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

#joinFullDiv{
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
<strong style="font-size: 18px;">Whospet </strong><span>Join</span>
</div>
<hr>
<div id="joinFullDiv">
	<div style="width: 500px; height:300px; margin: 0 auto;">
	
	<div id="loginImg">
		<div style="padding: 40px;">
			<a href="/"><img alt="" src="/resources/img/logo2.png" style="width: 100%"></a>
		</div>
	</div>
	<form class="form-horizontal" action="/join/join" method="post" onsubmit="return check()">
	  
	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="id" name="id" placeholder="아이디...">
		  <span id="sp1"></span>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="pw" class="col-sm-2 control-label">비밀번호</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="pw" name ="pw" placeholder="비밀번호..." autocomplete="off">
  		  <span id="sp2"></span>
	    </div>
	  </div>
	  
   	  <div class="form-group">
	    <label for="name" class="col-sm-2 control-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="name" name ="name" placeholder="홍길동...">
	      <span id="sp3"></span>
	    </div>
	  </div>
	  
	  
  	  <div class="form-group">
	    <label for="phone" class="col-sm-2 control-label">전화번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phone" name ="phone" placeholder="010-1234-1234...">
	      <span id="sp4"></span>
	    </div>
	  </div>
	  
	  
	<!-- 카카오로그인에서 미가입 유저가 회원가입 폼으로 넘어왔을때 체크할 요소  -->
	<c:choose>
		<c:when test="${empty kakaoEmail }">
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="email" id="email" placeholder="abcd@gmail.com...">
				<span id="sp5"></span>
			</div>
		</div>
		</c:when>
		
		<c:otherwise >
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="email" id="email" value="${kakaoEmail }">
				<span id="sp5"></span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
	
	
	  <div class="form-group">
	    <label for="nick" class="col-sm-2 control-label">닉네임</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="nick" name ="nick" placeholder="닉네임123...">
	      <span id="sp6"></span>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="postcode" class="col-sm-2 control-label">주소</label>
	    <div class="col-sm-10">
	    <input type="text" class="form-control" id="sample6_postcode" name="postcode" placeholder="우편번호" readonly="readonly">
	    <input type="button" class="btn btn-sm btn-default" onclick="sample6_execDaumPostcode()" id="postBtn" value="우편번호 찾기"><br>
	    <span id="sp7"></span>
	    <input type="text" class="form-control" id="sample6_address" name="address" placeholder="주소" readonly="readonly" style="margin-top: 10px;" >
		<span id="sp8"></span>
		<input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" style="margin-top: 10px;">
		<span id="sp9"></span>
		<input type="hidden" class="form-control" id="sample6_extraAddress" name ="extraAddress" placeholder="참고항목" style="margin-top: 10px;">
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="ugrade" class="col-sm-2 control-label">유저유형</label>
	    <div class="col-sm-10">
			<select class="form-control" id= "ugrade" name="ugrade">
				<option value="U" >일반 사용자</option>
				<option value="H" >병원 사용자</option>						
			</select>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="pet" class="col-sm-2 control-label">반려동물</label>
	    <div class="col-sm-10">
			<select class="form-control" id= "pet" name="pet">
				<option value="D" >반려견</option>
				<option value="C" >반려묘</option>						
				<option value="A" >반려견 + 반려묘</option>						
			</select>
	    </div>
	  </div>

	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-sm btn-primary" id="joinBtn">회원가입</button>    
	      <a href="/"><button type="button" class="btn btn-sm btn-default" >홈으로</button></a>   
	      <button type="button" class="btn btn-sm btn-default" onclick="history.back()">취소</button>  
	    </div>
	  </div>
	
	</form>
	</div>
</div>
<hr>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>