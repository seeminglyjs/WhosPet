<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerMypageUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    
    
//     $("#btnUpdate").click(function(){
//     	$.ajax({
//             type : "GET",
//             url : "/mypage/update",
//             data: "",
//             dataType : "html",
//             error : function() {
//                 alert('통신실패!!');
//             },
//             success : function(data) {
            
//             	location.href = "/mypage/update";
//             }
    	
//    			 });
//     	})
</script>
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

table {
margin-left: 520px; 
margin-right: 0px;
border-left: 20px double #f6dcbf;
font-family: 'InfinitySans-RegularA1';
text-align: center;
}

tbody{
width: 300px;

}
tr{
border: 1px solid #f6dcbf;

}

td{
padding: 20px;
}

button{
display: inline-block;
border: none;
background-color: #f7a440;
border-radius: .25em;
color: #fff;
font-size: inherit;
padding: 10px 20px;
box-shadow: inset 0 0 3px white; 
font-family: 'IBMPlexSansKR-Regular';
-webkit-transition: background-color 0.2s;
transition: background-color 0.2s;

}
#colname {
padding-left: 20px;
padding-right: 30px;
background-color: #f6dcbf;
font-weight: bold;
text-align: center;
box-shadow: inset 30px 0 40px #white;
}

#colval{
padding-right: 60px;
}

#picture{
position: relative;
top: 100px;
left: 280px;
}


#buttons{
position: relative;
top: 80px;
left: 400px;

}

button:hover {
  background-color: #f6dcbf;
}

button:active {
  background-color: #f6dcbf;
}

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

#menubar {
width: 200px;
height: 100px;
background-color: #f6dcbf;
position: relative; left:0;
padding-top: 10px;
border-right: 15px solid black;
float: left;
}

#menubar2 {
width: 200px;
height: 500px;
background-color: white;
position: relative; left:0; top:0;
border-right: 15px solid gray;
}
#barlist {
padding: 30px;
list-style: none;
}

#div1{
width: 700px;
height: 500px;
position: relative;
right:-250px; top:-100px;
}

#boardtitle{
position: relative;
left: 20px;
font-family: 'InfinitySans-RegularA1';
}

li {
cursor:pointer;
}

.pict{
border: 1px solid #f6dcbf;
padding: 10px;
}
</style>
<div id="boardtitle">
<h1 style="display:inline;">내 정보 </h1><h4 style="display:inline; color: gray;">MyInfo</h4>
<hr>
</div>
<div id="picture" style="width: 100px; height:80px;">
<c:if test="${empty upic}"> 
<img class="pict" style="width: 200px; height: 200px; border-radius: 50%" src="../resources/img/defaultImage.png"/>
</c:if>
<c:if test="${!empty upic}"> 
<img class="pict" src="/upload/${upic.upicStoname  }" style="width: 200px; height: 200px; border-radius: 50%"">
</c:if>
<br>
<br>
<button type="button" id="btnPic" 
style="margin-left: 45px; width: 100px;"
onclick="window.open
('/mypage/userpic','write','width=250,height=200,left=300, top=300, location=no,status=no,scrollbars=yes')">
사진 변경</button>

 
</div>
<table>
<tr>
<td id="colname">회원명</td>
<td id="colval">${uinfo.uName }</td>
</tr>
<tr>
<td id="colname">닉네임</td>
<td id="colval">${uinfo.uNick }</td>
</tr>
<tr>
<td id="colname">휴대폰</td>
<td id="colval">${uinfo.uPhone }</td>
</tr>
<tr>
<td id="colname">이메일</td>
<td id="colval">${uinfo.uEmail }</td>
</tr>
<tr>
<td id="colname">주소</td>
<td id="colval">${uinfo.uAddress }</td>
</tr>
</table>
<div id="buttons">
<button type="button" id="btnUpdate" style="margin-right: 20px;"
onclick="window.open('/mypage/update','write','width=550,height=500,left=200, top=200, location=no,status=no,scrollbars=yes')">정보 수정</button>
<button type="button" id="btnDelete"
onclick="window.open('/mypage/userout','write','width=550,height=500,left=200, top=200, location=no,status=no,scrollbars=yes')">회원 탈퇴</button>
</div>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>