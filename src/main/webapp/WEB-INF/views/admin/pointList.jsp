<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

선택하신 회원의 번호는 ${uNo }입니다


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
