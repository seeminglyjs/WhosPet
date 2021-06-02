<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#btnOut").attr("disabled", "disabled");
	
	//비밀번호와 확인창 체크
	$("input").keyup(function(){
		var pwd1=$("#uPw").val();
		var pwd2=$("#uPwCk").val();
		if(pwd1 != "" || pwd2 != ""){
			if(pwd1 == pwd2){
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#btnOut").removeAttr("disabled")
				return true;
				
			} else {
				$("#alert-danger").show();
				$("#alert-success").hide();
				$("#btnOut").attr("disabled", "disabled");
			}
	 }
	})
	
	
	//탈퇴버튼 동작
	$("#btnOut").click(function() {
		var pw = ${uinfo.uPw }
		var putpw = $("#uPw").val()
		
		if(pw == putpw){
			
		//<form> submit
		$("#form").submit();
		window.opener.location.href="/";
		} 
		
		else {
			alert("회원님의 비밀번호와 일치하지 않습니다");
			return false;
		}
		
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		window.close();
	});
	
	
	})

</script>
<style type="text/css">
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h2 {
color: #e1701a;
padding: 6px;
font-size: 30px;
}
table {
margin-left: auto; margin-right: auto;

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
#buttons{
width: 300px; height: 50px;
margin-left: 130px;
}
#formframe {
margin-left: auto; margin-right: auto;
padding: 20px;
width: 200px;
border: 20px outset #aaaaaa;
font-family: 'InfinitySans-RegularA1';
}
button{
margin-right: 10px;
display: inline;
border: none;
background-color: #f7a440;
border-radius: .25em;
width: 100px;
color: #fff;
font-size: inherit;
padding: .5em .75em;
}
#warn {
font-family: 'InfinitySans-RegularA1';
background-color:#f6dcbf;
}
</style>
</head>
<body>
<div id="warn">
<h2>정말로 탈퇴하시겠습니까?</h2>
</div>
<span style="text-decoration: underline gray; text-underline-position:under; font-family: 'InfinitySans-RegularA1';" >탈퇴 시 회원정보는 개인정보 보호방침에 따라 관리되며 사용되고 있는 모든 회원정보가 삭제됩니다.</span>

<form action="/mypage/userout" method="post" id="form">
<input type="hidden" id="uNo" name="uNo" value="${uinfo.uNo }"/><br>
<div id="formframe">
<table>
<tr>
<td>비밀번호 입력</td>
</tr>
<tr>
<td><input type="password" id="uPw" name="uPw"/></td>
</tr>
<tr>
<td>비밀번호 확인</td>
</tr>
<tr>
<td><input type="password" id="uPwCk"/></td>
</tr>
<tr> 
<td id="alert-success">비밀번호가 일치합니다</td>
</tr>
<tr> 
<td id="alert-danger">비밀번호가 일치하지 않습니다</td>
</tr>
</table>
</div>
<br>
<div id="buttons">
<button id="btnOut">탈퇴</button> <button id="btnCancle">취소</button>
</div>
</form>
</body>
</html>