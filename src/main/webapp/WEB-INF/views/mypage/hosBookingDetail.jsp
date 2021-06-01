<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.2.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--JSTL라이브러리 영역  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="UTF-8">
<title>예약 상세정보</title>
<script>
$(function(){
	//승인
	$("#btnApprove").click(function(){

		$("#form").attr("action","/mypage/bookingApprove");
		$("#form").submit();
		opener.location.reload();



	})
	
	//반려
	$("#btnReject").click(function(){

		$("#form").attr("action","/mypage/bookingReject");
		$("#form").submit();
		opener.location.reload();
	})
	

	
})



</script>
</head>
<body>
<form method="post" id="form" >

<!-- 예약승인, 반려에 전달할 매개변수 -->
<input type="hidden" id="bookNo" name="bookNo" value="${view.bookNo }"/>
<%-- <input type="hidden" id="bookDate" name="bookDate" value="${view.bookDate }"/> --%>
<%-- <input type="hidden" id="bookHour" name="bookNo" value="${view.bookHour }"/> --%>

<!-- 테이블 시작 -->
<table class="table table-bordered">
<tr>
<td class="info" style="width: 30%;">
예약번호</td><td colspan="3">${view.bookNo }</td>
</tr>
<tr>
<td class="info">
예약상태</td><td colspan="3">${view.bookStatus }</td>
<tr>
<td class="info">
예약날짜</td><td colspan="3">${view.bookDate }</td>
</tr>
<tr>
<td class="info">
예약시간</td><td>${view.bookHour }</td>
</tr>
<tr>
<td class="info">
예약정보</td><td>${view.bookPetInfo }</td>
</tr>
<tr>
<td class="info">
예약내용</td><td>${view.bookText }</td>
</tr>
<tr>
<td class="info">
병원이름</td><td>${view.hospital.hName }</td>
</tr>
<tr>
<td class="info">
병원주소</td><td>${view.hospital.hRoadAddress } ${view.hospital.hDetailAddress }</td>
</tr>
<tr>
<td class="info">
병원시간</td><td>${view.hospital.hHour }</td>
</tr>
<tr>
<td class="info">
병원연락처</td><td>${view.hospital.hTel }</td>
</tr>
<tr>
<td class="info">
병원정보</td><td>${view.hospital.hInfo }</td>
</tr>
</table>
<!-- .테이블   -->
<div id="btnBox">
	<button id="btnApprove" class="btn btn-primary">예약 승인</button>
	<button id="btnReject" class="btn btn-primary">예약 반려</button>
</div>
</form>
</body>
</html>