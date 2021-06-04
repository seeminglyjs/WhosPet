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
<h1 style="display:inline;">구매내역  </h1><h4 style="display:inline; color: gray;">MyPayment</h4>
<hr align="left" width="630">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 


<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 35%">사진</th>
		<th style="width: 20%">상품명</th>
		<th style="width: 15%">상태</th>
		<th style="width: 20%">주문 날짜</th>
		<th style="width: 15%">금액</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${paylist }" var="paylist">
	<tr><td>거래번호 : ${paylist.impUid }<td/><td><td/><td><td/><td></td></tr>
	<tr>
		<td><img src="../resources/img/itemtest2.jpg" style="width:100px; height: 100px;"/></td>
		<td>${paylist.shop.sName}</td>
		<td>${paylist.pyStatus }</td>
		<td><fmt:formatDate value="${paylist.pyDate }" pattern="yy-MM-dd HH:mm" /></td>
		<td>${paylist.pyAmount }원</td>
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
<jsp:include page="/WEB-INF/views/util/mypageboardpaging.jsp" />

</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>