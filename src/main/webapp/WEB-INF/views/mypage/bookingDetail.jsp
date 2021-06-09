<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerMypageUser.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	//글쓰기 버튼 누르면 이동
	$("#btnCancel").click(function() {
			if(confirm("[확인]을 누르시면 예약이 취소됩니다. 정말로 취소하시겠습니까?") ) {
				$("#form").submit();
	  		}	
			else {
				return false;
			}
	});
})
</script>
<style type="text/css">
#boardtitle{
position: relative;
top: -80px;
left: 260px;
font-family: 'NEXON Lv1 Gothic OTF';
}
#cont2 {
float: right;
top: -100px;
font-family: 'InfinitySans-RegularA1';
}
#btnCancel{
position: relative;
top: 20px;
left: 300px;
}
td {
 text-align: center;
}
</style>
</head>
<body>
<div id="boardtitle">
<h1 style="display:inline">예약 상세 정보 </h1><h4 style="display:inline; color: gray;">MyBooking</h4>
<hr align="left" width="830">
</div>

<div id="cont2" class="container-fluid col-md-9">
<div class="w-50">
<form action="/mypage/bookingDetail" method="post" id="form" >

<!-- 예약취소에 전달할 매개변수 -->
<input type="hidden" id="bookNo" name="bookNo" value="${view.bookNo }"/>
<%-- <input type="hidden" id="bookDate" name="bookDate" value="${view.bookDate }"/> --%>
<%-- <input type="hidden" id="bookHour" name="bookNo" value="${view.bookHour }"/> --%>

<!-- 테이블 시작 -->
<table class="table table-bordered">
<tr>
<td class="active" style="width: 30%;">
예약번호</td><td colspan="3">${view.bookNo }</td>
</tr>
<tr>
<td class="active">
예약상태</td><td colspan="3">${view.bookStatus }</td>
<tr>
<td class="active">
예약날짜</td><td colspan="3">${view.bookDate }</td>
</tr>
<tr>
<td class="active">
예약시간</td><td>${view.bookHour }</td>
</tr>
<tr>
<td class="active">
예약정보</td><td>${view.bookPetInfo }</td>
</tr>
<tr>
<td class="active">
예약내용</td><td>${view.bookText }</td>
</tr>
<tr>
<td class="active">
병원이름</td><td>${view.hospital.hName }</td>
</tr>
<tr>
<td class="active">
병원주소</td><td>${view.hospital.hRoadAddress } ${view.hospital.hDetailAddress }</td>
</tr>
<tr>
<td class="active">
병원시간</td><td>${view.hospital.hHour }</td>
</tr>
<tr>
<td class="active">
병원연락처</td><td>${view.hospital.hTel }</td>
</tr>
<tr>
<td class="active">
병원정보</td><td>${view.hospital.hInfo }</td>
</tr>
</table>
<!-- .테이블   -->
<div id="btnBox">
	<button id="btnCancel" class="btn btn-warning">예약 취소</button>
</div>
</form>
</div>
</div>
<div class="clearfix"></div>
</body>
</html>