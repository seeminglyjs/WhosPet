<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerUser.jsp" /> 

<style>
/* DivTable.com */ 
.divTable{ display: table; width: 100%; } 

.divTableRow { display: table-row; } 

.divTableHeading { background-color: #EEE; display: table-header-group; } 

.divTableCell, .divTableHead { border: 1px solid #F7F2E0; display: table-cell; padding: 3px 10px; } 

.divTableHeading { background-color: #EEE; display: table-header-group; font-weight: bold; } 

.divTableFoot { background-color: #EEE; display: table-footer-group; font-weight: bold; } 

.divTableBody { display: table-row-group; }

.button:hover { background-color: orange; }
</style>

<div align="right">
<label>01 장바구니</label><label>&nbsp>&nbsp</label><label>02 주문•결제</label><label>&nbsp>&nbsp</label><strong>03 주문완료</strong>
</div>
<hr style="border: solid 1px orange;">
<div align="center">
<label>주문이 성공적으로 완료되었습니다.</label><br>
<label>주문번호는 : ${payment.pyApplyNum }</label><br>
<br>
<a href="/mypage/user"><button>마이페이지</button></a>
<a href="/shop/list"><button>쇼핑하러가기</button></a>
<hr>
</div>


<br><br><br>






<span>주문상품내역</span><br>
<hr style="border: solid 1px orange;">
<div class="divTable" style="width: 100%;" ><!-- <table> -->
 	<div class="divTableBody">
 		 <div class="divTableRow"><!-- <tr> -->
   				<div class="divTableCell" style="width: 78px;" align="center">상품구분</div><!-- <td> -->
    			<div class="divTableCell" style="width: 370px;" align="center">상품명</div>
     			<div class="divTableCell" style="width: 0px;"align="center">수량</div>
      			<div class="divTableCell" style="width: 50px;" align="center">가격</div>
         </div>
         
         <div class="divTableRow"> 
         		<div class="divTableCell" align="center">${shop.sProductType }</div> 
         		<div class="divTableCell" align="center">${order.oName }</div> 
         		<div class="divTableCell" align="center">${order.oQuantity }</div> 
         		<div class="divTableCell" align="center">${order.oTotalAmount }원</div> 
     	 </div> 
 	</div> 
</div> <!-- DivTable.com -->

<br><br><br>

<span>주문정보(주문자)</span><br>
<hr style="border: solid 1px orange;">
<div class="divTable" style="width: 100%;" ><!-- <table> -->
 	<div class="divTableBody">
 		 <div class="divTableRow"><!-- <tr> -->
   				<div class="divTableCell" style="width: 40px;" align="center">이름</div><!-- <td> -->
      			<div class="divTableCell" style="width: 370px;" align="left">${order.oSender }</div>
         </div>
         
         <div class="divTableRow"> 
         		<div class="divTableCell" align="center">회원닉네임</div> 
         		<div class="divTableCell" align="left">${user.uNick }</div> 
     	 </div> 

 		 <div class="divTableRow"><!-- <tr> -->
   				<div class="divTableCell" align="center">휴대전화</div><!-- <td> -->
      			<div class="divTableCell" align="left">${sender.uPhone }</div>
         </div>
         
         <div class="divTableRow"> 
         		<div class="divTableCell" align="center">email</div> 
         		<div class="divTableCell" align="left">${sender.uEmail }</div> 
     	 </div> 
 	</div> 
</div> <!-- DivTable.com -->

<br><br><br>

<span>결제금액</span><br>
<hr style="border: solid 1px orange;">
<div class="divTable" style="width: 100%;" ><!-- <table> -->
 	<div class="divTableBody">
 		 <div class="divTableRow"><!-- <tr> -->
   				<div class="divTableCell" style="width: 40px;" align="center">정가</div><!-- <td> -->
      			<div class="divTableCell" style="width: 370px;" align="right">${order.oTotalAmount }원</div>
         </div>
         
         <div class="divTableRow"> 
         		<div class="divTableCell" align="center">할인금액</div> 
         		<div class="divTableCell" align="right">0 원</div> 
     	 </div> 

         <div class="divTableRow"> 
         		<div class="divTableCell" align="center">포인트 사용</div> 
         		<div class="divTableCell" align="right">0 원</div> 
     	 </div> 

 		 <div class="divTableRow"><!-- <tr> -->
   				<div class="divTableCell" align="center">배송비</div><!-- <td> -->
      			<div class="divTableCell" align="right">0 원</div>
         </div>
         
         <div class="divTableRow"> 
         		<div class="divTableCell" align="center">결제대상금액</div> 
         		<div class="divTableCell" align="right"><label>(정가-할인금액-사용한 포인트+배송비)</label>&nbsp&nbsp${order.oTotalAmount } 원</div> 
     	 </div> 
 	</div> 
</div> <!-- DivTable.com -->

<br><br><br>

<div align="center">
<label style="font-size: 40px;">WhosPet</label><label style="font-size: 20px;">을 이용해 주셔서 감사합니다.</label><br>
<label style="font-size: 30px;">${order.oSender }</label><label>고객님, 주문이 완료되었습니다.</label><br>

</div>

<br>

<div align="center">
	<a href="/mypage/user"><button>마이페이지</button></a>
</div>

<!-- 페이징 임포트 -->
<!-- <c:import url="/WEB-INF/views/util/shopPaging.jsp" /> -->

<c:import url="/WEB-INF/views/layout/footerUser.jsp" />