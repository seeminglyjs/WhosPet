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
top: -100px;
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
<h1>게시판 정보</h1>
<hr align="left" width="630">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 


<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%">글번호</th>
		<th style="width: 20%">카테고리</th>
		<th style="width: 45%">제목</th>
		<th style="width: 10%">조회수</th>
		<th style="width: 15%">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${ublist }" var="ublist">
	<tr>
		<td>${ublist.bNo }</td>
		<td>${ublist.bType }</td>
		<td>${ublist.bTitle }</td>
		<td>${ublist.bHit }</td>
		<td><fmt:formatDate value="${ublist.bWriteDate }" pattern="yy-MM-dd HH:mm:ss" /></td>
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
<jsp:include page="/WEB-INF/views/util/paging.jsp" />

</div><!-- .container -->