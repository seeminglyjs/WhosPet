<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<script type="text/javascript">
$(document).ready(function(){
	
	$("#commentBtn").click(function(){
		$.ajax({
			type: "post"
			,url: "/board/comment"
			,data: {bNo : "${board.bNo }"
				, uNo : "${sessionScope.user.uNo }"
				, content : $("#commentInput").val()}
			,dataType: "html"
			,success: function(res){
				console.log("AJAX성공")
				$("#commentList").html(res)
				$("#commentInput").val("")
			}
			,error: function(){
				console.log("AJA실패")
			}
		});	
	})
	
	$(document).on("click","#commentDel",function(){
		console.log("click")
		$.ajax({
			type: "post"
			,url: "/board/commentDelete"
			,data: { cNo : $("#commentNo").val()
				, bNo : "${board.bNo }"}
			,dataType: "html"
			,success: function(res){
				console.log("게시판 댓글 삭제 성공")
				$("#commentList").html(res)
			}
			,error: function(){
				console.log("게시판 댓글 삭제 실패")
			}
		});	
	})
	
})
</script>


<style type="text/css">

#boardDetailDiv{
	margin: 30px;
	border: 1px solid #ccc;
	padding: 25px;

}

#boardDetailText{
	font-size: 20px;
}



</style>

<div id="boardDetailDiv">

	<div class="text-left">
	<h5>${board.bType } 게시판 <span>></span></h5>
	</div>
	<div  class="text-center">
	<h2>${board.bTitle }</h2>
	</div>
	
	<div class="text-left">
	<p><strong>작성자 : ${user.uNick }</strong></p>
	<p>작성일자 : <fmt:formatDate value="${board.bWriteDate }" pattern="yyyy/MM/dd"/> &nbsp; &nbsp; &nbsp; 조회수 ${board.bHit } <p>
	<hr>
	</div>

<div id="boardDetailText"  class="text-center" style="min-height: 500px; ">


<c:if test="${not empty fileList }">
	<c:forEach items="${fileList}" var="img">
		<div class="imgDiv">
		<img src="/upload/${img }" alt="이미지 찾을 수 없음" style="width: 45%; height: 45%; border: 1px solid #ccc; margin-bottom: 10px"/>
		</div>
	</c:forEach>
</c:if>

${board.bContent }

</div>

<a href="/board/list?bType=${board.bType }"><button class="btn btn-default" type="button">목록으로</button></a>
<c:if test="${sessionScope.user.uNo eq board.uNo }">
<a href="/board/delete?bNo=${board.bNo }"><button class="btn btn-default" type="button">게시글삭제</button></a>
<a href="/board/update?bNo=${board.bNo }"><button class="btn btn-default" type="button">게시글수정</button></a>
</c:if>

<hr>



	<div id="commentDiv">
    <div class="col-sm-11" style="display: inline">
      	<input type="text" id="commentInput"  class="form-control" name="commentInput" placeholder="댓글을 남겨보세요.">
    </div>
    <button id="commentBtn" class="btn btn-sm btn-primary pull-right" style="margin-right: 10px;">등록</button>
    <div class="clearfix"></div>
    
    <br>
<div id="commentList">
	<c:choose>
		
	<c:when test="${empty listC }">
		<div id="commentList">
		<div class="text-center">
			<h4>현재 등록된 댓글이 없습니다.</h4>
		</div>
		</div>	
	</c:when>
	
	<c:otherwise>
		
		<div>
			<c:if test="${listCSize ne -1}">
			<c:forEach begin="0" end="${listCSize-1 }" var="comm" items="${listC }">
			<div style="display: none;"><input type="hidden" id="commentNo" value="${comm.C_NO }"/></div>
			<div style="font-weight: bolder; margin-top: 5px;">${comm.U_NICK }</div>
			<div style="font-size: 14px;">${comm.C_CONTENT }</div>	
			<div style="font-size: 11px; color: #ccc;"><fmt:formatDate value="${comm.C_WRITE_DATE }" pattern="yyyy/MM/dd - hh:mm"/>
				<c:if test="${comm.U_NO eq sessionScope.user.uNo }"><span id="commentDel" style="color:tomato;  cursor: pointer;">삭제</span>
				</c:if></div>
			<div style="border-bottom: 1px solid #ccc; margin-top: 5px;">
			</div>
			</c:forEach>
			</c:if>
		</div>	
			
	</c:otherwise>
	</c:choose>
</div>
	<br>
	
	</div>

</div>


<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>