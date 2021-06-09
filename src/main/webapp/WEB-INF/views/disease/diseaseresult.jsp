<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<c:forEach var="result" items="${resultList}">
<br>
${result.dResult }
<hr>
${result.dRExplain }
<hr>

<c:choose>
<c:when test="${result.dCategory == 'eye' }">
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
</c:when>

<c:when test="${result.dCategory == 'behavior'}">
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>
</c:when>

</c:choose>

<hr>
${result.dEMain }
<hr>
${result.dTreatment }

</c:forEach>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>