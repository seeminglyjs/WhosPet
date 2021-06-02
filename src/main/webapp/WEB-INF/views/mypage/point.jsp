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
<h1 style="display:inline;">나의 포인트  </h1><h4 style="display:inline; color: gray;">MyPoint</h4>
<hr align="left" width="630">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 


<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 20%">날짜</th>
		<th style="width: 10%">적립</th>
		<th style="width: 10%">사용</th>
		<th style="width: 10%">총계</th>
		<th style="width: 25%">+사유</th>
		<th style="width: 25%">-사유</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${pointlist }" var="pointlist">
	
		
	
	<tr>
	<td><fmt:formatDate value="${pointlist.poDate }" pattern="yy-MM-dd HH:mm" /></td>
		<c:choose>
		<c:when test ="${pointlist.poPlus != 0 }">
		<td style="color:green;">${pointlist.poPlus }pt</td>
		</c:when>
		<c:otherwise><td></td></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test ="${pointlist.poMinus != 0 }">
		<td style="color:red;">${pointlist.poMinus }pt</td>
		</c:when>
		<c:otherwise><td></td></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test ="${pointlist.poSum != 0 }">
		<td style="font-weight:bold;">${pointlist.poSum }pt</td>
		</c:when>
		<c:otherwise><td></td></c:otherwise>
		</c:choose>
		<td>${pointlist.poPlusY }</td>
		<td>${pointlist.poMinusY }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right" style="font-size: 24px;">현재포인트 : ${curpoint.poSum }pt</span>


</div>
</div>
<div class="clearfix"></div>
<div id="page">
<!-- 페이징 JSP -->
<jsp:include page="/WEB-INF/views/util/mypagepointpaging.jsp" />

</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>