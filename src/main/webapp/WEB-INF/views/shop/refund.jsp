<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerUser.jsp" />

<script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous">
</script><!-- jQuery CDN --->

<script>
    function cancelPay() {
		var oRecipient = $("#oRecipient").val();
    	var reRefundHolder = $("#reRefundHolder").val();
    	var reReason = $("#reReason").val();
    	var reRefundAccount = $("#reRefundAccount").val();
      $.ajax({
        url: "/payments/cancel",
        type: "POST",
        data: {
          merchant_uid: '${payment.merchantUid}', // 주문번호
          cancel_request_amount: '${payment.pyAmount}', // 환불금액
          reason: reReason , // 환불사유
          imp_uid: '${payment.impUid}'
        },
        dataType: "json",
        success: function() {
        	alert("성공");
        },error : function() {
        	alert("실패");
        }
      });
    }
</script>


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



환불페이지임

<div class="divTable" style="width: 100%;" ><!-- <table> -->
 	<div class="divTableBody">
 		 <div class="divTableRow"><!-- <tr> -->
   				<div class="divTableCell" style="width: 78px;" align="left">은행</div><!-- <td> -->
    			<div class="divTableCell" style="width: 370px;" align="left">
    				<select name="reRefundBank" id="reRefundBank">
    					<option value="네이버페이">네이버페이</option>
    					<option value="카카오페이">카카오페이</option>
    					<option value="국민">국민</option>
    				</select>
    			</div>
         </div>
         
         <div class="divTableRow"> 
         		<div class="divTableCell" align="left">계좌번호</div> 
         		<div class="divTableCell" align="left">
         			<c:if test="!'네이버페이'.equals('#reRefundBank')">
         				<input type="text" name="reRefundAccount" id="reRefundAccount"/>
         			</c:if>
         			<c:if test="'네이버페이'.equals('#reRefundBank')">
         				<input type="text" name="reRefundAccount" id="reRefundAccount" disabled="disabled"/>
         			</c:if>
         		</div> 
     	 </div> 

         <div class="divTableRow"> 
         		<div class="divTableCell" align="left">예금주</div> 
         		<div class="divTableCell" align="left">
         			<input type="text" name="reRefundHolder" id="reRefundHolder"/>
         		</div> 
     	 </div> 

         <div class="divTableRow"> 
         		<div class="divTableCell" align="left">환불 사유</div> 
         		<div class="divTableCell" align="left">
         			<input type="text" name="reReason" id="reReason"/>
         		</div> 
     	 </div> 
 	</div> 
</div> <!-- DivTable.com -->



<br><br><br><br>
<button onclick="cancelPay()">환불하기</button>
<a href="#" onclick="goBack();"><button>취소</button></a><!-- 장바구니로 가기 -->















 
<c:import url="/WEB-INF/views/layout/footerUser.jsp" />