<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
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

</body>
</html>