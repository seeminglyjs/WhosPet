<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

#head{
color: orange;
font-size: 35px;
margin: 50px;


}

.text{
color: black;
font-size: 35px;

}


.text:hover{
color: orange;

}

#detail{
text-align: center;
height: 600px;


}

div{
height: auto;
}

h3{
color: orange;
}

button{
border-radius: 10px;
background: orange;
font-size: 20px;
border: 0;
outline: 0;
}



</style>


<div id="detail">

<h1 id="head">아래의 증상 중 해당하는 것을 선택해주세요</h1>

<hr>

<c:forEach var="view" items="${viewList}">

<br>
<a class="text" href="/disease/diseaseresult?dNo=${view.dNo}">${view.dQSymptom}</a>
</c:forEach>

<hr>
<br>
<h3>해당하는 증상이 없거나 문의가 필요할시 게시판 또는 가까운 동물병원에 문의해 주세요</h3>
<br>
<br>
<button type="button" onclick="location.href='/hospital/list'">동물병원찾기</button>
</div>






<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>

