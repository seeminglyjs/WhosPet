<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerAdmin.jsp" /> 

<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("form").submit(function() {
		if( $("#sName").val() == '' ) {
			alert(111)
			return false;
		}
	})
	
	$("#btnWrite").click(function() {
		//스마트에디터의 내용을 <textare>에 적용하기
		submitContents( $("#btnWrite") );
		
		//form submit 수행하기
		$("form").submit();	
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>







<div class="container">

<h1>상품 등록</h1>

<form action="/shop/register" method="post" enctype="multipart/form-data">
<table class="table table-striper table-hover">

<tr>
	<th>상품명</th><td><input type="text" id="sName" name="sName" required/><br><br><input type="file" name="thumbnail" id="thumbnail"/></td>
</tr>

<tr>
	
</tr>

<tr>
	<th>상품종류</th>
	<td>
		<select name="sProductType" id="sProductType">
			<option value="사료">사료</option>
			<option value="간식">간식</option>
			<option value="영양제">영양제</option>
			<option value="장난감">장난감</option>
		</select>
	</td>
</tr>

<tr>
	<th>상품금액</th><td><input type="number" id="sAmount" name="sAmount" required="required" /></td>
</tr>

<tr>
	<th>상품수량</th><td><input type="number" value="1" id="sQuantity" name="sQuantity"/></td>
</tr>

<tr>
	<th>상품소개</th>
	<td>
	<textarea style="width: 98%" id="sContent" name="sContent"></textarea>
	</td>
</tr>
</table>

<label for="file">첨부파일</label>
<input type="file" name="file" id="file" multiple="multiple"/><br><br>






<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
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