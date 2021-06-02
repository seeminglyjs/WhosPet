<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerAdmin.jsp" %>

<script type="text/javascript">
$(document).ready(function(){

})
</script>



<h1>유저 관리 리스트</h1>
<hr>

<div class="pull-right">
<form action="/admin/user/list" class="form-inline">
	<select  id= "searchCategory" name="searchCategory" class="form-control">	
		<option value="u_id" >아이디</option>						
		<option value="u_nick" >닉네임</option>						
		<option value="u_name" >이름</option>						
	</select>
	<input type="text" class="form-control" name="search" id="search"/><button class="btn btn-sm btn-default" style="margin-left: 5px;">검색</button>
</form>
</div>
<div class=”clearfix“></div>
<br>
<div style="margin-top: 25px"></div>
<div id="boardList"  class="text-center">
<table class="table table-bordered table-striped table-condensed">
	<tr>
		<td><strong>유저 번호</strong></td>
		<td><strong>유저 아이디</strong></td>
		<td><strong>유저 닉네임</strong></td>
		<td><strong>유저 이름</strong></td>
		<td><strong>유저 가입일자</strong></td>
	</tr>
	<c:choose>
	<c:when test="${listSize <= 0}">
		<td colspan="6" style="font-size: 25px; font-weight: bolder; padding: 30px;">해당 게시글은 존재하지 않습니다.</td>
	</c:when>
	
	<c:otherwise>
	<c:forEach var="user" begin="0" end="${listSize - 1}" items="${list }">
	<tr>
		<td style="width: 15%">${user.U_NO }</td>
		<td style="width: 20%"><a href="/admin/user/detail?uNo=${user.U_NO }">${user.U_ID }</a></td>
		<td style="width: 20%">${user.U_NICK }</td>
		<td style="width: 20%">${user.U_NAME }</td>
		<td style="width: 25%"><fmt:formatDate value="${user.U_JOIN_DATE }" pattern="yyyy/MM/dd"/></td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
</div>

<div class="pull-right">
<c:if test="${login }">
	<a href="/admin/user/enroll"><button class="btn btn-default">유저등록</button></a>
</c:if>
<a href="/admin"><button class="btn btn-default">홈으로</button></a>
</div>
<div class=”clearfix“></div>
<br>
<br>



<%@ include file="/WEB-INF/views/util/adminUserPaging.jsp" %>
<%@ include file="/WEB-INF/views/layout/footerAdmin.jsp" %>