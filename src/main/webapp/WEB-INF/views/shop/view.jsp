<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerAdmin.jsp" /> 

<style>

div.left {
	float: left;
	width: 50%;	
}

div.right {
	float: right;
	width: 50%;
}

</style>



<div class="container">

<h1>상품 상세 정보</h1>

<div class="left">
<img alt="섬네일" src="/resources/shopimgupload/${thumbnail.siStoredFilename }" style="width: 400px; height: 350px;">
</div>

<div class="right">
<table class="table table-striper table-hover">

<tr hidden="">
	<th>상품번호</th><td>${shop.sNo }</td>
</tr>
<tr hidden="">
	<th>상품종류</th><td>${shop.sProductType }</td>
</tr>

<tr>
	<td>${shop.sName }</td>
</tr>


<tr>
	<td>${shop.sAmount } 원</td>
</tr>

<tr>
	<td>${shop.sQuantity } 개</td>
</tr>

<tr>
	<th>등록날짜</th><td><fmt:formatDate value="${shop.sDate }" pattern="yy년MM월dd일 HH시mm분"/></td>
</tr>

<tr>
	<th>상품소개</th><td>${shop.sContent }</td>
</tr>


</table>
</div><!-- .right -->
</div>

<c:forEach var="contentImg" items="${shopImg }">
<div>
<img alt="이미지" src="/resources/shopimgupload/${contentImg.siStoredFilename }" style="width: 900px;">
</div>
</c:forEach>

<br><br><br>

<div align="center">
	<a href="/admin/shopUpdate?sNo=${shop.sNo }"><button class="btn btn-primary">수정</button></a>
	<a href="/admin/shopDelete?sNo=${shop.sNo }"><button class="btn btn-danger">삭제</button></a>
</div>
	

<!-- 페이징 임포트 -->

<c:import url="/WEB-INF/views/layout/footerAdmin.jsp" />