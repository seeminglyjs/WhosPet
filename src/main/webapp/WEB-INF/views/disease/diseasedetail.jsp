<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


${view.dQuestion}

<c:forEach var="view" items="${viewList}">
<br>
<a href="/disease/diseaseresult?dNo=${view.dNo}">${view.dQSymptom}</a>
</c:forEach>


<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>