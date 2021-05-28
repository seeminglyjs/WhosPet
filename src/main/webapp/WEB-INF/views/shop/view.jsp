<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerAdmin.jsp" /> 

<div class="container">

<h1>상품 상세 정보</h1>

<table class="table table-striper table-hover">
<tr>
	<th>상품번호</th><td>${shop.sNo }</td>
</tr>

<tr>
	<th>상품명</th><td>${shop.sName }</td>
</tr>

<tr>
	<th>상품종류</th><td>${shop.sProductType }</td>
</tr>

<tr>
	<th>상품금액</th><td>${shop.sAmount }원</td>
</tr>

<tr>
	<th>상품수량</th><td>${shop.sQuantity }개</td>
</tr>

<tr>
	<th>등록날짜</th><td><fmt:formatDate value="${shop.sDate }" pattern="yy년MM월dd일 HH시mm분"/></td>
</tr>

<tr>
	<th>상품소개</th><td>${shop.sContent }</td>
</tr>


</table>
</div>
	

<!-- 페이징 임포트 -->
<!-- <c:import url="/WEB-INF/views/util/shopPaging.jsp" /> -->

<c:import url="/WEB-INF/views/layout/footerAdmin.jsp" />