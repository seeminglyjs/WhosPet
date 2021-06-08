<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>


<style type="text/css">


#noneDiv{
	margin-top: 130px;
	text-align: center;
}

#eMark{
	width: 40px; 
	height: 40px; 
	background-color: #e1701a;
	border-radius: 20px;
	margin: 0 auto;
	text-align: center;
	padding-bottom: 20px;
}

</style>


<div id="noneDiv">

	<div id ="eMark">
	<span style="font-size: 30px; color: white; font-weight: bolder;">!</span>
	</div>
	
	<h3><strong>요청하신 검색어에 대한 검색 결과가 없습니다.</strong></h3>
	
	<p style="color:#aaaaaa"><strong>입력한 검색어를 확인해주세요.</strong></p>

	<br>
	
	<a href="/treatment/treatmain"><button class="btn btn-sm btn-default">치료항목</button></a>
	<a href="/"><button class="btn btn-sm btn-default">메인으로</button></a>
</div>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>