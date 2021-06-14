<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">

#res{
color: #FF8200;
font-size: 35px;
text-align: center;
margin: 50px;

}

#res2{
font-size: 25px;
text-align: center;
margin: 60px;
}

#res3{
font-size:25px;
text-align: center;
margin: 60px;
}

#last{
text-align: center;
font-size: 25px;
margin: 60px;
}

h2{
color: orange; 
}

#top{
background: orange;
font-size: 35px;
text-align: center;


}

#mid{
background: orange;
font-size: 20px;
text-align: center;
}

#end{
background: orange;
font-size: 20px;
text-align: center;
height: 60px;

}

button{
border-radius: 10px;
background: #FF8200;
font-size: 20px;
border: 0;
outline: 0;
margin: 20px;

}

#buttons{
margin: 25px;
text-align: center;
}

</style>

<div id="top">
증상별 질병 검색
</div>

<div id="mid">
아래 질병 목록과 주요증상을 자세히 살핀후 조취를 취해주십시오.
</div>

<c:forEach var="result" items="${resultList}">
<br>
<div id="res" >${result.dResult }</div>
<hr>
<div id="res2" >${result.dRExplain }</div>
<hr>





<div id="res3">
<h2 style="color:orange;">주요증상</h2>
${result.dEMain }
</div>
<hr>

<div id="last">

<h2 style="color:orange";>진료항목</h2>
${result.dTreatment }

</div>
</c:forEach>

<div id="end">
증상이 불확실하거나 궁금한 점이 있다면 게시판 가까운 동물병원을 이용해주세요<br>
감사합니다
</div>

<div id="buttons">
<button type="button" onclick="location.href='/'">메인페이지로</button>

<button type="button" onclick="location.href='/disease/diseasemain'">질병 다시 찾기</button>

<button type="button" onclick="location.href='/hospital/list'">동물병원 찾기</button>
</div>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>