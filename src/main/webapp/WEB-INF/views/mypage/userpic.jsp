<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 업로드</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//등록버튼 동작
	$("#btnUp").click(function() {
		//<form> submit
		$("#form").submit();
		opener.location.reload();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		window.close();
	});
});
</script>
<style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  width: 50px;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f7a440;
  cursor: pointer;

  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #f6dcbf;
}

.filebox label:active {
  background-color: #f6dcbf;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
button {
position:relative;
top: 80px;
left: 57px;
border: none;
background-color: #f7a440;
border-radius: .25em;
color: #fff;
font-size: inherit;
padding: .5em .75em;
}
</style>
</head>
<body>
<form action="/mypage/userpic" method="post" id="form" enctype="multipart/form-data">
<div class="filebox" style="width: 200px; height:30px;">
<br>
  <label for="ex_file" style="width: 130px; margin-left: 35px;">프로필 사진 변경</label>
  <input type="file" name="file" id="ex_file">
</div>
<button type="button" id="btnUp">등록</button>
<button type="button" id="btnCancel">취소</button>
</form>


</body>
</html>