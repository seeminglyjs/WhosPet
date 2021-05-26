<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}



</style>

<div class="container-fluid">
<div class="w-75">
<h1>게시판 정보</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
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
<c:forEach items="${list }" var="board">
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


<div class="clearfix"></div>
<div>
<!-- 페이징 JSP -->
<jsp:include page="/WEB-INF/views/util/paging.jsp" />

</div><!-- .container -->