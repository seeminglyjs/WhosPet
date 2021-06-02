<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<c:forEach begin="${start }" end="${listCSize-1 }" var="comm" items="${listC }" varStatus="cnt">
			
			<div style="display: none;"><input type="hidden" id="commentNo" value="${comm.C_NO }"/></div>
			<div style="font-weight: bolder; margin-top: 5px;">${comm.U_NICK }</div>
			<div style="font-size: 14px;">${comm.C_CONTENT }</div>	
			<div style="font-size: 11px; color: #ccc;"><fmt:formatDate value="${comm.C_WRITE_DATE }" pattern="yyyy/MM/dd - hh:mm"/>
				<c:if test='${sessionScope.user.uGrade eq "M" }'><span id="commentDel" style="color:tomato;  cursor: pointer;">삭제</span>
				</c:if></div>
			<div style="border-bottom: 1px solid #ccc; margin-top: 5px;">
			</div>
			</c:forEach>
			
			<c:if test="${listCSize < totalCSize}">
			<div class="text-center" style="margin-top: 10px;">
			<input type="hidden" value="${listCSize }" name="curCommentSize" id="curCommentSize">
			<button class="btn btn-sm btn-default" id="moreComment" name="moreComment" type="button">더보기</button>
			</div>
			</c:if>
			
			</c:if>
		</div>	
			
	</c:otherwise>
	</c:choose>
</div>