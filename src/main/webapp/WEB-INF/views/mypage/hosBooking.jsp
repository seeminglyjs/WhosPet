<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/layout/headerMypageUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<style type="text/css">

boardtable{
position: relative;
top: 100px;
left: 600px;
}

table, th {
	text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}



#boardtitle{
position: relative;
top: -120px;
left: 220px;
font-family: 'InfinitySans-RegularA1';
}
#cont2 {
float: right;
top: -100px;
font-family: 'InfinitySans-RegularA1';
}

#page{
position: relative;
top: -100px;
left: 130px;
}
</style>

<div id="boardtitle">
<h1>예약 현황</h1>
<hr align="left" width="630">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 


<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 6%">번호</th>
		<th style="width: 6%">상태</th>
		<th style="width: 20%">병원</th>
		<th style="width: 20%">날짜</th>
		<th style="width: 20%">시간</th>
		<th style="width: 15%">정보</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${booklist }" var="booklist">
	<tr>
		<td><a href="#" onclick="window.open
('/mypage/hosBookingDetail?bookno=${booklist.bookNo }','write','width=450,height=600,left=300, top=260, location=no,status=no,scrollbars=yes')">${booklist.bookNo }</a></td>
		<td><a href="#" onclick="window.open
('/mypage/hosBookingDetail?bookno=${booklist.bookNo }','write','width=450,height=600,left=300, top=260, location=no,status=no,scrollbars=yes')">${booklist.bookStatus }</a></td>
		<td><a href="#" onclick="window.open
('/mypage/hosBookingDetail?bookno=${booklist.bookNo }','write','width=450,height=600,left=300, top=260, location=no,status=no,scrollbars=yes')">${booklist.hospital.hName }</a></td>
		<td><fmt:formatDate value="${booklist.bookDate }" pattern="yy-MM-dd"/></td>
		<td>${booklist.bookHour }</td>
		<td><a href="#" onclick="window.open
('/mypage/hosBookingDetail?bookno=${booklist.bookNo }','write','width=450,height=600,left=300, top=260, location=no,status=no,scrollbars=yes')">${booklist.bookPetInfo }</a></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>


</div>
</div>
<div class="clearfix"></div>
<div id="page">
<!-- 페이징 JSP -->
<jsp:include page="/WEB-INF/views/util/mypagehosbookingpaging.jsp" />

</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>