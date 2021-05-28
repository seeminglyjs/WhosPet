<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>

<!--스마트 에디터 스크립트 라이브러리 불러오기  -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){

	// 글작성 클릭시
	$("#btnSave").click(function(){
		//스마트에디터의 내용을 <textare>에 적용하기
		submitContents( $("#btnSave") );
		
		//form submit 수행하기
		$("form").submit();
	})

})
</script>

<style>

#writeDiv {
  padding-top: 30px;
  padding-bottom: 30px;
  border: 1px solid #ccc;
}
</style>

<div class="container" id="writeDiv">
	<form action="/board/write" method="post" id="writeForm" >
		
		<div>
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
		</div>
		

		<div>
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" rows="15" cols="100" ></textarea>
		</div>
	</form>
	<div >
		<button class="btn btn-sm btn-primary" id="btnSave">게시글 등록</button>
		<a href="/board/list"><button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button></a>
	</div>
	

</div>

<!-- 스마트 에디터 스크립트 코드  -->
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
	
	// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
	 // 에디터의 내용이 textarea에 적용된다.
	 oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	 // 에디터의 내용에 대한 값 검증은 이곳에서
	 // document.getElementById("ir1").value를 이용해서 처리한다.
	
	 try {
	     elClickedObj.form.submit();
	 } catch(e) {}
}
</script>




<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>