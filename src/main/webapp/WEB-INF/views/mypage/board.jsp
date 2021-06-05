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
font-family: 'NEXON Lv1 Gothic OTF';
}

table, th {
	text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}

a{
color:black;
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
</style>

<div id="boardtitle">
<h1 style="display:inline;">나의 게시글  </h1><h4 style="display:inline; color: gray;">MyBoard</h4>
<hr align="left" width="830">
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
		<td><a href="/board/detail?bNo=${ublist.bNo }">${ublist.bNo }</a></td>
		<td>
		<c:if test='${ublist.bType eq "T" }'>
		[치료]
		</c:if>
		<c:if test='${ublist.bType eq "F" }'>
		[자유]
		</c:if>
		<c:if test='${ublist.bType eq "R" }'>
		[리뷰]
		</c:if>
		</td>
		<td><a href="/board/detail?bNo=${ublist.bNo }">${ublist.bTitle }</a></td>
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
<jsp:include page="/WEB-INF/views/util/mypageboardpaging.jsp" />

</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>