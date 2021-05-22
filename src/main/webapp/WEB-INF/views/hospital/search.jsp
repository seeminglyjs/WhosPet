<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<style>
.box{
	border:1px solid #e5e5e5;
	border-radius:10px;
	padding:10px;
}

.box+.box{
	margin-top:10px;
}

.mb15{
	margin-bottom:15px;
}

</style>

	<h1>' ${info.keyword } '에 대한 검색 결과입니다.</h1>
	
	<p>총 ${info.CNT }건이 검색되었습니다.</p>
	
	<div class="row">
		<div class="col-md-6 pull-left">
			<c:forEach items="${list }" var="list">
			<div class="box">
				<p>${list.hName }</p>
				<p>${list.hRoadAddress} ${list.hDetailAddress }</p>
				<p>${list.hHour }</p>
				<p><i class="glyphicon glyphicon-earphone"></i> ${list.hTel }</p>
			</div>
			</c:forEach>
		</div>
		<div class="col-md-6 pull-left">지도영역</div>
	
	</div>
	
	
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>