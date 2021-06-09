<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerUser.jsp" /> 
<link href="/resources/css/shop.css" rel="stylesheet"> 

<style>
ul {
	list-style:none;
}

</style>



<ul class="baby-product-list">
<c:forEach var="thumbnail" items="${userListThumbnail }" varStatus="status">
  
  <c:if test="${!empty thumbnail.siStoredFilename }">
  <li class="baby-product">
  	<div>
		<a href="/shop/view?sNo=${thumbnail.sNo }"><img alt="섬네일" src="/resources/shopimgupload/${thumbnail.siStoredFilename }" style="width: 200px;"><br>
		<c:forEach var="userList" items="${list }" begin="${status.index }" end="${status.index }" >
		<span>${userList.sName }</span><br>
		<span>${userList.sAmount }</span><br>
		</c:forEach>  
		</a>
  	</div>
  </li>
  </c:if>

  <c:if test="${empty thumbnail.siStoredFilename }">
  <li>
  	<div>
		<label>	
		<c:forEach var="userList" items="${list }" begin="${status.index }" end="${status.index }" >
		<a href="/shop/view?sNo=${userList.sNo }"><img alt="섬네일" src="/resources/shopimgupload/default.png" style="width: 200px;"><br>
		<span>${userList.sName }</span><br>
		<span>${userList.sAmount }</span><br>
		</a>
		</c:forEach>  
		</label>
  	</div>
  </li>
  </c:if>
  
  
  <br>
  <br>
</c:forEach>
</ul>

















<!-- 페이징 임포트 -->
<c:import url="/WEB-INF/views/util/shopUserPaging.jsp" />

<c:import url="/WEB-INF/views/layout/footerUser.jsp" />