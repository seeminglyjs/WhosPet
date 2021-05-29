<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<link href="/resources/css/hospital.css" rel="stylesheet">
	<h3>병원등록</h3>
	
	<c:choose>
		<c:when test="${info.hAdcheck eq 'W'}">
			<div class="register_status status_w">
				<span class="badge on">승인대기</span>
				<span class="badge">게시완료</span>
				<span class="badge">반려</span>
				<div>관리자의 승인이 필요한 게시글 입니다  <br> 마이페이지 내에 병원 관리메뉴에서 등록,조회,삭제 이 가능합니다. </div>
			</div>
		</c:when>
		<c:when test="${info.hAdcheck eq 'Y'}">
			<div class="register_status status_y">
				<span class="badge">승인대기</span>
				<span class="badge on">게시완료</span>
				<span class="badge">반려</span>
				<div>병원 게시가 완료되었습니다.  <br> 마이페이지 내에 병원 관리메뉴에서 등록,조회,삭제 이 가능합니다. </div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="register_status status_n">
				<span class="badge">승인대기</span>
				<span class="badge">게시완료</span>
				<span class="badge on">반려</span>
				<div>반려된 게시글입니다. </div>
			</div>
		</c:otherwise>
	</c:choose>

	<div class="form-group">
		<label>병원이름</label>
		<input type="text" class="form-control" value="${info.hName }" readonly>
	</div>
	<div class="form-group">
		<label>병원위치</label>
		<div class="form-group">
		    <input class="form-control" style="top: 5px;" type="text" value="${info.hRoadAddress }" readonly/>
		</div>
		<div class="form-group">
		    <input class="form-control" type="text"  value="${info.hDetailAddress }" readonly/>
		</div>
	</div>
	<div class="form-group">
		<label>진료시간</label>
		<input type="text" class="form-control" value="${info.hHour }" readonly>
	</div>
	<div class="form-group">
		<label>전화번호</label>
		<input type="text" class="form-control" value="${info.hTel }" readonly>
	</div>
	<div class="form-group">
		<label>병원소개</label>
		<textarea class="form-control" style="height:200px; resize:none;" readonly>${info.hInfo}</textarea>
	</div>
	

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>