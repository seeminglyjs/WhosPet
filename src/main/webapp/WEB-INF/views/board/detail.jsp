<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<script type="text/javascript">
$(document).ready(function(){
	
	$("#commentBtn").click(function(){	
		if(check()){
			$.ajax({
				type: "post"
				,url: "/board/comment"
				,data: {bNo : "${board.bNo }"
					, uNo : "${sessionScope.user.uNo }"
					, content : $("#commentInput").val()
					}
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
		}
	})
	
	
	$(document).on("click","#moreComment",function(){
		$.ajax({
			type: "post"
			,url: "/board/moreComment"
			,data: { curCommentSize : $("#curCommentSize").val()
				, bNo : "${board.bNo }"}
			,dataType: "html"
			,success: function(res){
				console.log("게시판 더보기 성공")
				$("#commentList").html(res)
			}
			,error: function(){
				console.log("게시판 더보기 실패")
			}
		});	
	})
	
	
	$(document).on("click","#foldComment",function(){
		$.ajax({
			type: "post"
			,url: "/board/foldComment"
			,data: { curCommentSize : "10"
				, bNo : "${board.bNo }"
				, foldCheck : "1"}
			,dataType: "html"
			,success: function(res){
				$("#commentList").html(res)
			}
			,error: function(){
				console.log("게시판 접기 실패")
			}
		});	
	})
	
})


function forwardCno(param){
	console.log($(param))
	console.log($(param).children().val())
	$.ajax({	
		type: "post"
		,url: "/board/commentDelete"
		,async: false
		,data: { 
			curCommentSize : $("#curCommentSize").val()
			, bNo : "${board.bNo }"
			, cNo : $(param).children().val()
			, delCheck : "1"
			}
		,dataType: "html"
		,success: function(res){
			$("#commentList").html(res)
		}
		,error: function(){
			console.log("댓글 삭제 실패")
		}
	});	
}



function check(){
	// 댓글창 등록 정규식 함수		
		var commentInput = /^[0-9a-zA-Z가-힣ㄱ-ㅎ!@#$%^&*()<>?/\+-\s]{2,500}$/i
		var space =/^\s{0,}$/i
		if(!commentInput.test($("#commentInput").val())){
				alert("댓글을 입력해주세요!")
				return false;		
		}else{
			if(space.test($("#commentInput").val())){
				console.log("sdsd")
				alert("댓글을 입력해주세요!")
				return false;
			}
			return true;
		}
}
</script>


<style type="text/css">

#boardDetailDiv{
	margin: 30px;
	border: 1px solid #ccc;
	border-radius: 15px;
	padding: 25px;

}

#boardDetailText{
	font-size: 20px;
}



</style>


<div>
<strong style="font-size: 18px;">Whospet </strong><span>Detail</span>
</div>
<hr>
<div id="boardDetailDiv">

	<div class="text-left" style="color:#e1701a;">
	<c:choose>
		<c:when test='${board.bType eq "F"}'>
			<h5><strong>자유 게시판</strong> <span>></span></h5>
		</c:when>

		<c:when test='${board.bType eq "T"}'>
			<h5><strong>치료 게시판</strong> <span>></span></h5>
		</c:when>
			
		<c:otherwise>
			<h5><strong>리뷰 게시판</strong> <span>></span></h5>
		</c:otherwise>
	
	</c:choose>
	
	</div>
	<div  class="text-center">
	<h2>${board.bTitle }</h2>
	</div>
	
	<div class="text-left">
	<p><strong>작성자 : ${user.uNick }</strong></p>
	<p>작성일자 : <fmt:formatDate value="${board.bWriteDate }" pattern="yyyy/MM/dd"/> &nbsp; &nbsp; &nbsp; 조회수 ${board.bHit } <p>
	<hr>
	</div>

	<div class="text-right">
	<a href="/board/list"><button type="button" class="btn btn-sm btn-primary">글목록</button></a>
	<button type="button" class="btn btn-sm btn-default" onclick="history.back()">뒤로</button>
	</div>
	
	<div style="padding-bottom: 70px"></div>
	
<div id="boardDetailText"  class="text-center" style="min-height: 300px; ">


<c:if test="${not empty fileList }">
	<c:forEach items="${fileList}" var="img">
		<div class="imgDiv">
		<img src="/upload/${img }" alt="이미지 찾을 수 없음" style="width: 45%; height: 45%; border: 1px solid #ccc; margin-bottom: 10px"/>
		</div>
	</c:forEach>
</c:if>

${board.bContent }

</div>

<div style="padding-bottom: 70px;"></div>



<div class="text-right">
<c:if test="${sessionScope.user.uNo eq board.uNo }">
<a href="/board/delete?bNo=${board.bNo }"><button class="btn btn-sm btn-default" type="button">게시글삭제</button></a>
<a href="/board/update?bNo=${board.bNo }"><button class="btn btn-sm btn-default" type="button">게시글수정</button></a>
</c:if>
</div>


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
			<c:set var="start" value="0"></c:set>
			<c:set var="del" value="0"></c:set>
			<c:set var="delBtn" value="0"></c:set>
			<c:forEach begin="${start }" end="${listCSize-1 }" var="comm" items="${listC }" varStatus="cnt">
			
			<div style="display: none;"></div>
			<div style="font-weight: bolder; margin-top: 5px;">${comm.U_NICK }</div>
			<div style="font-size: 14px;">${comm.C_CONTENT }</div>	
			<div style="font-size: 11px; color: #ccc;"><fmt:formatDate value="${comm.C_WRITE_DATE }" pattern="yyyy/MM/dd - hh:mm"/>
				<c:if test="${comm.U_NO eq sessionScope.user.uNo }">
				<span id="commentDel${delBtn = delBtn + 1 }" style="color:tomato;  cursor: pointer;" onclick="forwardCno(this)" >삭제
				<input type="hidden" id="commentNo${del = del + 1 }" value="${comm.C_NO }">
				</span>
				</c:if></div>
			<div style="border-bottom: 1px solid #ccc; margin-top: 5px;">
			</div>
			</c:forEach>
			
			<input type="hidden" value="${listCSize }" name="curCommentSize" id="curCommentSize">
			<c:choose>
			
			<c:when test="${listCSize < totalCSize}">
			<div class="text-center" style="margin-top: 10px;">
			<button class="btn btn-sm btn-default" id="moreComment" name="moreComment" type="button">더보기</button>
			</div>
			</c:when>
			
			<c:when test="${listCSize >= totalCSize and listCSize > 10}">
			<div class="text-center" style="margin-top: 10px;">
			<button class="btn btn-sm btn-default" id="foldComment" name="foldComment" type="button">접기</button>
			</div>
			</c:when>
			
			<c:otherwise>
				
			</c:otherwise>
			
			</c:choose>
			
			</c:if>
		</div>	
			
	</c:otherwise>
	</c:choose>
</div>
	<br>
	
	</div>

</div>
<hr>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>