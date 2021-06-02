<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerAdmin.jsp" /> 

<script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#sProductType").val('${updateView.sProductType }')
	
	$("form").submit(function() {
		if( $("#sName").val() == '' ) {
			return false;
		}
	})
	
	$("#btnUpdate").click(function() {
		//스마트에디터의 내용을 <textarea>에 적용하기
		submitContents( $("#btnUpdate") );
		
		//form submit 수행하기
		$("form").submit();	
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<!-- 섬네일 첨부파일 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function(){
	
  $('#delFile').click(function(){
	  	$(this).parent(".fileWrap").remove();
	  	
	  	$("#newThumbnail").show();
	})
})
</script>


<!-- 다중 첨부파일 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function(){
	
  $('.btnDelete').click(function(){
	  	$(this).parent(".fileWrap").remove();
	})
})
</script>


<style>
#newThumbnail {
	display: none;
}
</style>




<div class="container">

<h1>상품 정보 수정</h1>

<form action="/admin/shopUpdate" method="post" enctype="multipart/form-data">

<input type="hidden" id="sNo" name="sNo" value="${updateView.sNo }"/>
<input type="hidden" id="uNo" name="uNo" value="${updateView.uNo }"/>

<div id="originThumbnail" class="fileWrap">
<img alt="섬네일" src="/resources/shopimgupload/${thumbnail.siStoredFilename }" style="width: 100px;">
<span id="delFile" >x</span>
</div>

<table class="table table-striper table-hover">

<tr>
	<th>상품명</th><td><input type="text" id="sName" name="sName" value="${updateView.sName }" required/></td>
	<td>
		<div id="newThumbnail">	
			<input type="file" name="thumbnail" id="thumbnail"/>
		</div>
	
	</td>
</tr>

<tr>
	<th>상품종류</th>
	<td colspan="2">
		<select name="sProductType" id="sProductType">
			<option value="사료">사료</option>
			<option value="간식">간식</option>
			<option value="영양제">영양제</option>
			<option value="장난감">장난감</option>
		</select>
	</td>
</tr>

<tr>
	<th>상품금액</th><td colspan="2"><input type="number" id="sAmount" name="sAmount" value="${updateView.sAmount }" required="required" /></td>
</tr>

<tr>
	<th>상품수량</th><td colspan="2"><input type="number" value="${updateView.sQuantity }" id="sQuantity" name="sQuantity"/></td>
</tr>

<tr>
	<th>상품소개</th>
	<td colspan="2">
	<textarea style="width: 98%" id="sContent" name="sContent">${updateView.sContent }</textarea>
	</td>
</tr>
</table>

<!-- file 두가지 경우 -->
<div id="fileBox">
	<!-- 기존의 file -->
	<c:forEach var="originFile" items="${shopImg }" varStatus="status">
	<div id="originFile${status.count }"  class="fileWrap">
		<img alt="기존 이미지" src="/resources/shopimgupload/${originFile.siStoredFilename }" style="width: 100px;" />
		<span id="delFile${status.count }" class="btnDelete">x</span>		
	</div>
	</c:forEach>
	
	<br>
	<br>
	
	<!-- 새로운 file -->
	<div id="newFile">
		<label for="file">새로운 첨부파일</label>
		<input type="file" id="file" name="file" multiple="multiple"/><br>
		<small> ** 새로운 파일을 첨부하면 기존파일이 삭제 됩니다</small>
	</div>
</div>







<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
</div>

</form>


<!-- 스마트 에디터 적용하는 코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "sContent", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
/* 	bUseModeChanger : true */
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["sContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>



</div><!-- .container -->
	

<!-- 페이징 임포트 -->
<!-- <c:import url="/WEB-INF/views/util/shopPaging.jsp" /> -->

<c:import url="/WEB-INF/views/layout/footerAdmin.jsp" />