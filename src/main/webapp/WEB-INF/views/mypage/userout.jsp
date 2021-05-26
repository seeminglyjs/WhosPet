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
})
</script>
</head>
<body>
<h3>정말로 탈퇴하시겠습니까?</h3>
<form action="/mypage/userout" method="post" id="form">
<input type="hidden" id="uNo" name="uNo" value="${uinfo.uNo }"/><br>
<div>
비밀번호 입력<br>
<input type="password" id="uPw" name="uPw" value="${uinfo.uPw }"/><br>
비밀번호 확인<br>
<input type="password" id="uPwCk" value="${uinfo.uPw }"/>
</div>
<button id="btnOut">탈퇴</button>
</form>
</body>
</html>