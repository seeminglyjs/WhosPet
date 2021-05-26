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

	//탈퇴버튼 동작
	$("#btnOut").click(function() {
		//<form> submit
		$("#form").submit();
		window.opener.location.href="/";
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		window.close();
	});
})
</script>
<style type="text/css">
h2 {
color: #e1701a;
padding: 6px;
font-size: 30px;
}
table {
margin-left: auto; margin-right: auto;

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
</style>
</head>
<body>
<h2>정말로 탈퇴하시겠습니까?</h2>
<span>탈퇴 시 회원정보는 개인정보 보호방침에 따라 관리되며 사용되고 있는 모든 회원정보가 삭제됩니다.</span>
<form action="/mypage/userout" method="post" id="form">
<input type="hidden" id="uNo" name="uNo" value="${uinfo.uNo }"/><br>
<div id="formframe">
<table>
<tr>
<td>비밀번호 입력</td>
</tr>
<tr>
<td><input type="password" id="uPw" name="uPw" value="${uinfo.uPw }"/></td>
</tr>
<tr>
<td>비밀번호 확인</td>
</tr>
<tr>
<td><input type="password" id="uPwCk" value="${uinfo.uPw }"/></td>
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