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
}
#cont2 {
float: right;
top: -100px;
}

#page{
position: relative;
top: -100px;
left: 130px;
}
</style>

<div id="boardtitle">
<h1>병원 등록/삭제/조회</h1>
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
		<th style="width: 20%">연락처</th>
		<th style="width: 20%">요청일</th>
		<th style="width: 15%">등록일</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${hoslist }" var="hoslist">
	<tr>
		<td>${hoslist.hNo }</td>
		<td>${hoslist.hAdcheck }</td>
		<td>${hoslist.hName }</td>
		<td>${hoslist.hTel }</td>
		<td><fmt:formatDate value="${hoslist.hRequestDate}" pattern="yy-MM-dd"/></td>
		<td><fmt:formatDate value="${hoslist.hEnrollDate}" pattern="yy-MM-dd"/></td>
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
<jsp:include page="/WEB-INF/views/util/mypagehospitalpaging.jsp" />

</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>