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