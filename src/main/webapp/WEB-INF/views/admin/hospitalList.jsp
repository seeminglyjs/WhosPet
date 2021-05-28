<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerAdmin.jsp" %>

<link href="/resources/css/hospital.css" rel="stylesheet">
<h2 class="mb15">병원 조회/승인</h2>
<form id="registerForm" method="post">
	<table class="table table-bordered">
		<tr>
			<th>
				<label><input type="checkbox" id="chkAll"></label>
			</th>
			<th>병원번호</th>
			<th>병원이름</th>
			<th>병원주소</th>
			<th>상세보기</th>
			<th>게시상태</th>
		</tr>
		
		<c:forEach items="${list }" var="item">
		<tr>
			<td><label><input type="checkbox" name="hNoArr" value="${item.H_NO }"></label></td>
			<td>${item.H_NO }</td>
			<td>${item.H_NAME }</td>
			<td>${item.H_ROAD_ADDRESS } ${item.H_DETAIL_ADDRESS }</td>
			<td><button class="btn btn-warning btn-sm" type="button" onclick="location.href='/hospital/registerComplete?hNo=${item.H_NO }' ">상세보기</a></td>
			<td>
				<c:if test="${item.H_ADCHECK eq 'W'}">
				<span style="color:orange;">승인 대기</span>
				</c:if>	
				<c:if test="${item.H_ADCHECK eq 'Y'}">
				<span style="color:skyblue;">게시 완료</span>
				</c:if>	
				<c:if test="${item.H_ADCHECK eq 'N'}">
				<span style="color:red;">반려</span>
				</c:if>	
			</td>
		</tr>
		</c:forEach>
	</table>
</form>
<div>
	<button type="button" id="btnApprove" class="btn btn-default">승인</button>
	<button type="button" id="btnReject" class="btn btn-default">반려</button>
</div>
<div class="text-center">
	<ul class="pagination pagination-sm">
		
		<c:if test="${paging.curPage != paging.startPage}">
		<li><a href="/admin/hospitalList?curPage=${paging.curPage-1 }">&lt;</a></li>
		</c:if>
		
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			<c:choose>
				<c:when test="${paging.curPage eq i}">
					<li class="active"><a href="/admin/hospitalList?curPage=${i }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/admin/hospitalList?curPage=${i }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		
		<c:if test="${paging.curPage != paging.endPage }">
		<li><a href="/admin/hospitalList?curPage=${paging.curPage+1 }">&gt;</a></li>
		</c:if>
		
	</ul>
</div>
<script>
$(function(){
	//승인
	$("#btnApprove").click(function(){
		var cnt = $("input[name=hNoArr]:checked").length;
		if( cnt<=0 ){
			alert("값을 선택해주세요!");
			return false;
		}
		$("#registerForm").attr("action","/admin/hospitalApprove");
		$("#registerForm").submit();
	})
	
	//거절
	$("#btnReject").click(function(){
		var cnt = $("input[name=hNoArr]:checked").length;
		if( cnt<=0 ){
			alert("값을 선택해주세요!");
			return false;
		}
		$("#registerForm").attr("action","/admin/hospitalReject");
		$("#registerForm").submit();
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



<%@ include file="/WEB-INF/views/layout/footerAdmin.jsp" %>