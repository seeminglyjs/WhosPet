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
top: -80px;
left: 260px;
font-family: 'NEXON Lv1 Gothic OTF';
}
#cont2 {
float: right;
top: -100px;
font-family: 'NEXON Lv1 Gothic OTF';
}

#page{
position: relative;
top: -100px;
left: 130px;
}

a{
color: black;
}
</style>

<div id="boardtitle">
<h1 style="display:inline;">예약 현황 </h1><h6 style="display:inline; color: gray;">예약 데이터를 확인하는 페이지입니다</h6>
<hr align="left" width="830">
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
('/mypage/hosBookingDetail?bookno=${booklist.bookNo }','write','width=450,height=600,left=300, top=260, location=no,status=no,scrollbars=yes')">
	
		<c:if test='${booklist.bookStatus eq "Y" }'>
		<button type="button" class="btn btn-warning">예약완료</button>
		</c:if>
		<c:if test='${booklist.bookStatus eq "N" }'>
		<button type="button" class="btn btn-secondary">예약반려</button>
		</c:if>
		<c:if test='${booklist.bookStatus eq "W" }'>
		<button type="button" class="btn btn-default">예약대기</button>
		</c:if></a></td>
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