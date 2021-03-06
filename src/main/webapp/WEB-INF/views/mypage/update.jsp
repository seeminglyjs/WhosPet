<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript">
//비밀번호 일치 확인
$(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#alert-length").hide();
	$("#alert-mix").hide();
	$("#btnConfirm").attr("disabled", "disabled");
	$("input").keyup(function(){
		var pwd1=$("#uPw").val();
		var pwd2=$("#uPwCk").val();
		var num = pwd1.search(/[0-9]/g);
		var eng = pwd1.search(/[a-z]/ig);
		
		if(pwd1.length < 4 || pwd1.length > 12){
			  $("#alert-length").show();
			  return false;
		 }else if(pwd1.search(/\s/) != -1){	
				$("#alert-success").hide();
				$("#alert-danger").hide();
				$("#alert-length").hide();
				$("#alert-mix").hide();
			  alert("비밀번호는 공백 없이 입력해주세요.");
			  return false;
			 }else if(num < 0 || eng < 0){
					$("#alert-success").hide();
					$("#alert-danger").hide();
					$("#alert-length").hide();
				 $("#alert-mix").show();
			  return false;
			 }else {
					$("#alert-success").hide();
					$("#alert-danger").hide();
					$("#alert-length").hide();
					$("#alert-mix").hide();
				console.log("통과"); 
				if(pwd1 != "" || pwd2 != ""){
					if(pwd1 == pwd2){
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#btnConfirm").removeAttr("disabled")
						return true;
						
					} else {
						$("#alert-danger").show();
						$("#alert-success").hide();
						$("#btnConfirm").attr("disabled", "disabled");
					}
			 }
		

		}
	})
	
	//등록버튼 동작
	$("#btnConfirm").click(function() {
		//<form> submit
		$("#form").submit();
		opener.location.reload();
		$("#alert-success").hide();
		$("#alert-danger").hide();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		window.close();
	});
})
</script>
<style>
table {
margin-left: 0px; 
margin-right: 0px;
border-left: 10px double #f7a440;
}
tr{
border: 4px solid #f6dcbf;

}

td{
padding: 10px;
}

button{
border: none;
background-color: #f7a440;
border-radius: .25em;
color: #fff;
font-size: inherit;
padding: .5em .75em;
cursor:pointer;
}
button:disabled {
border: none;
background-color: gray;
border-radius: .25em;
color: #fff;
font-size: inherit;
padding: .5em .75em;
cursor:Default;
}
#colname {
padding-left: 10px;
padding-right: 80px;
}

#colval{
padding-right: 20px;
}

#picture{
position: relative;
top: 100px;
left: 30px;
}
#buttons{
position: relative;
top: 50px;
left: 0px;
}
#alert-success{
color: green;
font-size: small;
padding-left: 10px;
}
#alert-danger{
color: red;
font-size: small;
padding-left: 10px;
}
#alert-length{
color: red;
font-size: small;
padding-left: 10px;
}
#alert-mix{
color: red;
font-size: small;
padding-left: 10px;
}
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  width: 50px;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f7a440;
  cursor: pointer;

  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #f6dcbf;
}

.filebox label:active {
  background-color: #f6dcbf;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>
</head>
<body>
<form action="/mypage/update" method="post" id="form">
<input type="hidden" id="uNo" name="uNo" value="${uinfo.uNo }"/>
<table>
<tr>
<td id="colname">회원명</td>
<td id="colval">${uinfo.uName }</td>
</tr>
<tr>
<td id="colname">비밀번호 변경</td>
<td id="colval"><input type="password" id="uPw" name="uPw" value="${uinfo.uPw }"/></td>
</tr>
<tr>
<td id="colname">비밀번호 변경 확인</td>
<td id="colval"><input type="password" id="uPwCk"/></td>
</tr>
<tr> 
<td id="alert-success">비밀번호가 일치합니다</td>
</tr>
<tr> 
<td id="alert-danger">비밀번호가 일치하지 않습니다</td>
</tr>
<tr> 
<td id="alert-length">비밀번호는 4자리 ~ 12자리 이내로 입력해주세요</td>
</tr>
<tr> 
<td id="alert-mix">비밀번호는 영문, 숫자를 혼합하여 입력해주세요</td>
</tr>
<tr>
<td id="colname">닉네임</td>
<td id="colval"><input type="text" id="uNick" name="uNick" value="${uinfo.uNick }"/></td>
</tr>
<tr>
<td id="colname">휴대폰</td>
<td id="colval"><input type="text" id="uPhone" name="uPhone" value="${uinfo.uPhone }"/></td>
</tr>
<tr>
<td id="colname">이메일</td>
<td id="colval"><input type="text" id="uEmail" name="uEmail" value="${uinfo.uEmail }"/></td>
</tr>
<tr>
<td id="colname">주소</td>
<td id="colval"><input type="text" id="uAddress" name="uAddress" value="${uinfo.uAddress }"/></td>
</tr>
</table>
<div id="buttons">
<button type="button" id="btnConfirm" style="margin-right: 20px;">수정 완료</button>
<button type="button" id="btnCancel">취소</button>
</div>
</form>
</body>
</html>