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
			<c:set var="del" value="0"></c:set>
			<c:set var="delBtn" value="0"></c:set>
			<c:forEach begin="${start }" end="${listCSize-1 }" var="comm" items="${listC }" varStatus="cnt">
			
			<div style="display: none;"></div>
			<div style="font-weight: bolder; margin-top: 5px;">${comm.U_NICK }</div>
			<div style="font-size: 14px;">${comm.C_CONTENT }</div>	
			<div style="font-size: 11px; color: #ccc;"><fmt:formatDate value="${comm.C_WRITE_DATE }" pattern="yyyy/MM/dd - hh:mm"/>
				<c:if test='${sessionScope.user.uGrade eq "M" }'>
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