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
top: -80px;
left: 260px;
font-family: 'NEXON Lv1 Gothic OTF';
}
#cont2 {
float: right;
top: -100px;
font-family: 'NEXON Lv1 Gothic OTF';
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
<hr align="left" width="830">
</div>
<div id="cont2" class="container-fluid col-md-9">
<div class="w-50"> 


<table id="boardtable" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 35%">사진</th>
		<th style="width: 20%">상품명</th>
		<th style="width: 5%">상태</th>
		<th style="width: 10%">주문 날짜</th>
		<th style="width: 10%">금액</th>
		<th style="width: 5%">수량</th>
		<th style="width: 15%">총 금액</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${order }" var="paylist">
	<%-- <tr><td>거래번호 : ${paylist.impUid }<td/><td><td/><td><td/><td></td></tr> --%>
	<tr>
	<!-- <td><img src="../resources/shopimgupload/itemtest2.jpg" style="width:100px; height: 100px;"/></td> -->
		<td>
		<a href="/shop/view?sNo=${paylist.sNo }">
		<img src="../resources/img/itemtest2.jpg" style="width:70px; height: 70px;"/>
		</a>
		</td>
		<td>
		<a href="/shop/view?sNo=${paylist.sNo }">
		${paylist.oName}
		</a>
		</td>
		<td>${paylist.oStatus }</td>
		<td><fmt:formatDate value="${paylist.oDate }" pattern="yy-MM-dd" /></td>
		<td>${paylist.oAmount }원</td>
		<td>${paylist.oQuantity }</td>
		<td>${paylist.oTotalAmount }원</td>
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