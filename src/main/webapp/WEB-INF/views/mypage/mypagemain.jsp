<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>

<style type="text/css">
#menubar {
width: 200px;
height: 1400px;
background-color: #f6dcbf;
position: fixed; left:0;
padding: 20px;
}

#menubar2 {
width: 200px;
height: 1350px;
background-color: white;
position: fixed; left:0; top: 300px;
}
#barlist {
padding: 30px;
list-style: none;
}
</style>

<div id="menubar">
<h3>마이페이지</h3>
<div id="menubar2">
<ul id="barlist">
<li>내 정보</li>
<hr>
<li>작성글 조회</li>
<hr>
<li>예약 정보</li>
<hr>
<li>포인트 조회</li>
<hr>
<li>구매내역</li>
<hr>
<li>장바구니</li>
<hr>
<li>병원 등록/조회/삭제</li>
<hr>
<li>예약현황</li>
</ul>
</div>
</div>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>