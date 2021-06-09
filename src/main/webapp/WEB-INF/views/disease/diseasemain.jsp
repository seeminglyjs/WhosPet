<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<div class="container list">
	     <ul class="content-list">
	     <h1>눈</h1>
	     <hr>
	     	<c:forEach var="eye" items="${eyeList}">
	     		<li>
	     			<a href="/disease/diseasedetail?dQNo=${eye.dQNo}">${eye.dQuestion}</a>
	     		</li>
	     	</c:forEach>
	     	
	     </ul>
	     
	     <ul class="content-list">
	     <h1>행동</h1>
	     	<c:forEach var="behavior" items="${behaviorList}">
	     		<li>
	     			<a href="/disease/diseasedetail?dQNo=${behavior.dQNo}">${behavior.dQuestion}</a>
	     		</li>
	     	</c:forEach>
	     	
	     </ul>
	     
	     
	     
	     
     </div>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>