<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/layout/headerMypageUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<style type="text/css">

boardtable{
position: relative;
top: 100px;
left: 600px;
}

table, th {
	text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}


#buttons{
position: relative;
top: -60px;
left: 780px;

}

#boardtitle{
position: relative;
top: -80px;
left: 260px;
font-family: 'NEXON Lv1 Gothic OTF';
}
#cont2 {
float: right;
top: -100px;
font-family: 'NEXON Lv1 Gothic OTF';
}

#page{
position: relative;
top: -100px;
left: 130px;
}
</style>
<script>
$(function(){
	
	//병원삭제
	$("#btnDelete").click(function(){
		var cnt = $("input[name=hNoArr]:checked").length;
		if( cnt<=0 ){
			alert("삭제할 병원을 선택해주세요");
			return false;
		}
		if(confirm("[확인]을 누르시면 선택된 병원이 삭제됩니다. 정말로 삭제하시겠습니까?") ) {
			$("#registerForm").submit();
  		}	
		else {
			return false;
		}
	})
	
	//전체선택
	$("#chkAll").click(function(){
		if($("#chkAll").prop("checked")){
            $("input[name=hNoArr]").prop("checked",true);
        }else{
            $("input[name=hNoArr]").prop("checked",false);
        }
	})
	
})



</script>

<div id="boardtitle">
<h1 style="display:inline;">병원 등록/삭제/조회 </h1><h6 style="display:inline; color: gray;">병원 데이터를 확인하는 페이지입니다</h6>
<hr align="left" width="830">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 

<form id="registerForm" action="/mypage/hospitalDelete" method="post">
<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th><label><input type="checkbox" id="chkAll"></label></th>
		<th style="width: 6%">번호</th>
		<th style="width: 6%">상태</th>
		<th style="width: 20%">병원</th>
		<th style="width: 20%">연락처</th>
		<th style="width: 20%">요청일</th>
		<th style="width: 15%">등록일</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${hoslist}" var="hoslist">
	<tr>
		<td><label><input type="checkbox" name="hNoArr" value="${hoslist.hNo}"></label></td>
		<td>${hoslist.hNo }</td>
		<td>
		<c:if test='${hoslist.hAdcheck eq "Y" }'>
		완료
		</c:if>
		<c:if test='${hoslist.hAdcheck eq "N" }'>
		반려
		</c:if>
		<c:if test='${hoslist.hAdcheck eq "W" }'>
		대기
		</c:if>
		</td>
		<td>${hoslist.hName }</td>
		<td>${hoslist.hTel }</td>
		<td><fmt:formatDate value="${hoslist.hRequestDate}" pattern="yy-MM-dd"/></td>
		<td><fmt:formatDate value="${hoslist.hEnrollDate}" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>
</form>

</div>
</div>
<div class="clearfix"></div>
<div id="page">
<!-- 페이징 JSP -->
<jsp:include page="/WEB-INF/views/util/mypagehospitalpaging.jsp" />
<div id="buttons">
<button type="button" class="btn btn-warning" id="btnResister" style="margin-right: 20px;"
onclick = "location.href = '/hospital/register' ">등록</button>
<button type="button" class="btn btn-warning" id="btnDelete" style="margin-right: 20px;">삭제</button>

</div>
</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>