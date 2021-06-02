<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>

<script type="text/javascript">
$(document).ready(function(){

})

function chageSelect(){ 
	
	var selectList = document.getElementById("category")
	
	if(selectList.options[selectList.selectedIndex].value == "F"){
		location.href = "/board/list?bType=F";
	}
	if(selectList.options[selectList.selectedIndex].value == "T"){
		location.href = "/board/list?bType=T";
	}
	if(selectList.options[selectList.selectedIndex].value == "R"){
		location.href = "/board/list?bType=R";
	}
}

</script>



<h1>유저 게시판 리스트</h1>
<hr>

<div class="pull-left">
	<select  id= "category" name="category" onchange="chageSelect()" class="form-control">
		<option value="X" selected="selected" style="background-color: #ccc">카테고리</option>
		<option value="F" >자유게시판</option>		
		<option value="T" >치료게시판</option>
		<option value="R" >리뷰게시판</option>						
	</select>
</div>

<div class="pull-right">
<form action="/board/list" class="form-inline">
	<select  id= "searchCategory" name="searchCategory" class="form-control">
		<option value="b_title" >제목</option>		
		<option value="b_content" >내용</option>						
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
		<td><strong>No</strong></td>
		<td><strong>게시글 제목</strong></td>
		<td><strong>작성자</strong></td>
		<td><strong>작성일</strong></td>
		<td><strong>조회수</strong></td>
	</tr>
	<c:choose>
	<c:when test="${listSize <= 0}">
		<td colspan="6" style="font-size: 25px; font-weight: bolder; padding: 30px;">해당 게시글은 존재하지 않습니다.</td>
	</c:when>
	
	<c:otherwise>
	<c:forEach var="board" begin="0" end="${listSize - 1}" items="${list }">
	<tr>
		<td style="width: 6%">${board.B_NO }</td>
		<td style="width: 55%"><a href="/board/detail?bNo=${board.B_NO }">
		<c:if test='${board.B_TYPE eq "T" }'>
		[치료]
		</c:if>
		<c:if test='${board.B_TYPE eq "F" }'>
		[자유]
		</c:if>
		<c:if test='${board.B_TYPE eq "R" }'>
		[리뷰]
		</c:if>
		${board.B_TITLE }</a></td>
		<td style="width: 15%">${board.U_NICK }</td>
		<td style="width: 15%"><fmt:formatDate value="${board.B_WRITE_DATE }" pattern="yyyy/MM/dd"/></td>
		<td style="width: 9%">${board.B_HIT }</td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
</div>

<div class="pull-right">
<c:if test="${login }">
	<a href="/board/write"><button class="btn btn-default">글쓰기</button></a>
</c:if>
<a href="/"><button class="btn btn-default">홈으로</button></a>
</div>
<div class=”clearfix“></div>
<br>
<br>




<%@ include file="/WEB-INF/views/util/boardPaging.jsp" %>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>