<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerMypageUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<script type="text/javascript">
// //등록버튼 동작
// $("#btnRemove").click(function() {
// 	//<form> submit
// 	$("#orderForm").attr("action","/mypage/basket/remove");
// 	$("#orderForm").submit();
// });

</script>
<style type="text/css">

boardtable{
position: relative;
top: 100px;
left: 600px;
}

table, th {
	text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}



#boardtitle{
position: relative;
top: -100px;
left: 220px;
font-family: 'InfinitySans-RegularA1';
}
#cont2 {
float: right;
top: -100px;
font-family: 'InfinitySans-RegularA1';
}

#page{
position: relative;
top: -100px;
left: 130px;
}

#sum{
position: relative;
top: 80px;
left: 540px;
}
#button{
position: relative;
top: 100px;
left: 620px;
}


</style>

<div id="boardtitle">
<h1 style="display:inline;">장바구니  </h1><h4 style="display:inline; color: gray;">MyBasket</h4>
<hr align="left" width="630">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 


<!-- <form id="orderForm" method="post"> -->

<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%">사진</th>
		<th style="width: 20%">상품명</th>
		<th style="width: 45%">개수</th>
		<th style="width: 10%">금액</th>
		<th style="width: 15%">삭제</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${basketlist }" var="basketlist">
	<tr>
		<td><img src="../resources/img/itemtest1.jpg" style="width:50px; height: 50px;"/></td>
		<td>${basketlist.shop.sName}</td>
		<td>${basketlist.sbQuantity}
		<button id="btnPlus" onclick="location.href='/mypage/basket/plus?sbNo=${basketlist.sbNo}'" class= "btn btn-outline-secondary btn-xs"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
		<c:if test="${basketlist.sbQuantity > 1}">
		<button id="btnMinus" onclick="location.href='/mypage/basket/minus?sbNo=${basketlist.sbNo}'" class= "btn btn-outline-secondary btn-xs"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
		</c:if>
        </td>
		<td>${basketlist.sbAmount}</td>
<%-- 		<td><input type="hidden" id="sbNo" name="sbNo" value="${sbNo }"><button id="btnRemove">삭제</button></td> --%>
		<td><button id="btnRemove" onclick="location.href='/mypage/basket/remove?sbNo=${basketlist.sbNo}'">삭제</button></td>
	</tr>
</c:forEach>
</tbody>
</table>

<%-- <span class="pull-left">total : ${paging.totalCount }</span> --%>
<!-- </form> -->
<hr align="left" width="630">
</div>
</div>
<div class="clearfix"></div>
<div id="page">
<!-- 페이징 JSP -->
<%-- <jsp:include page="/WEB-INF/views/util/mypageboardpaging.jsp" /> --%>
<div id="sum">
<span style="display:inline; font-size: 32px;">총계 ${sum}원</span>
</div>
<div id="button">
<button style="display:inline;">결제하기</button>
</div>
</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>