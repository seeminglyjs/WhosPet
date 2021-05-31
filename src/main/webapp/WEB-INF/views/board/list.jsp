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
	<label for="category" >게시판종류</label>
	<select  id= "category" name="category" onchange="chageSelect()">
		<option value="X" selected="selected" >카테고리</option>
		<option value="F" >자유게시판</option>		
		<option value="T" >치료게시판</option>
		<option value="R" >리뷰게시판</option>						
	</select>
</div>
		<div class=”clearfix“></div>
<div id="boardList"  class="text-center">

<table class="table table-bordered table-striped table-condensed">
	<tr>
		<td><strong>글번호</strong></td>
		<td><strong>게시글 제목</strong></td>
		<td><strong>작성자</strong></td>
		<td><strong>작성일</strong></td>
		<td><strong>조회수</strong></td>
	</tr>
	
	<c:forEach var="board" begin="0" end="${listSize - 1}" items="${list }">
	<tr>
		<td style="width: 7%">${board.B_NO }</td>
		<td style="width: 52%"><a href="/board/detail?boardNo=${board.B_NO }">${board.B_TITLE }</a></td>
		<td style="width: 16%">${board.U_NICK }</td>
		<td style="width: 16%"><fmt:formatDate value="${board.B_WRITE_DATE }" pattern="yyyy/MM/dd"/></td>
		<td style="width: 9%">${board.B_HIT }</td>
	</tr>
	</c:forEach>
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