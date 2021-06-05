<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerAdmin.jsp" /> 

<script type="text/javascript">
$(document).ready(function(){
	
	//수량 업버튼
	$(".prod-quantity-plus").click(function() {
		console.log(".prod-quantity-plus clicked")
		var quantity = $("#quantity").val();//document.getElementById("quantity").value;
		quantity++;
		$("#quantity").val(quantity);
		var sAmount = '${shop.sAmount }';
		var totalAmount = quantity * sAmount;
		$("#totalAmount").val(totalAmount);
		$("#printTotalAmount").html(totalAmount);

		
	/* 	$.ajax({
			type: "get" //요청 메소드
			, url: "/shop/updownbutton" //요청 URL
			, data: {
				sAmount:${shop.sAmount},
				quantity:quantity
			} //요청 파라미터
			, dataType: "" //응답받은 데이터의 형식
			, success: function( res ) { //AJAX 성공 시 콜백함수
				console.log("성공")
				
				console.log( res ) //응답 데이터 확인
				
				console.log( res.result )
				
				// 화면에 출력(변경)될 값을 적용해줘야한다
				$("#upbutton").html(res); //응답데이터 html 반영 코드
				$("#quantity").val(quantity);
				//사용 예시
// 				if( res.result ) {
// 				} else {
// 				}
				
			}
			, error: function() { //AJAX 실패 시 콜백함수
				console.log("실패")
				
			}
		}) */
		
	})
	
	//수량 다운버튼
	$(".prod-quantity-minus").click(function() {
		console.log(".prod-quantity-minus clicked")
		var quantity = $("#quantity").val();//document.getElementById("quantity").value;
		if(quantity <= 1){
			alert('수량이 1보다 작을 수 없습니다.');
			return false;
		}
		quantity--;
		$("#quantity").val(quantity);
		var sAmount = '${shop.sAmount }';
		var totalAmount = quantity * sAmount;
		$("#totalAmount").val(totalAmount);
		$("#printTotalAmount").html(totalAmount);
		
		/* if( quantity > 0 ){
			
			$.ajax({
				type: "get" //요청 메소드
				, url: "/shop/updownbutton" //요청 URL
				, data: {
					sAmount:${shop.sAmount},
					quantity:quantity
				} //요청 파라미터
				, dataType: "" //응답받은 데이터의 형식
				, success: function( res ) { //AJAX 성공 시 콜백함수
					console.log("성공")
					
					console.log( res ) //응답 데이터 확인
					
					console.log( res.result )
					
					// 화면에 출력(변경)될 값을 적용해줘야한다
					$("#upbutton").html(res); //응답데이터 html 반영 코드
					$("#quantity").val(quantity);
					//사용 예시
	// 				if( res.result ) {
	// 				} else {
	// 				}
					
				}
				, error: function() { //AJAX 실패 시 콜백함수
					console.log("실패")
					
				}
			})
		} */
	})
	
	
	
	
	
	
	//수량이 숫자입력시 변경
	$(".btnQuantity").keyup(function() {
		console.log("숫자입력 clicked")
		var quantity = $("#quantity").val();//document.getElementById("quantity").value;
		if(quantity < 1 && quantity != ''){
			alert('수량이 1보다 작을 수 없습니다.');
			$("#quantity").val(1);
			return false;
		}else if(quantity == ''){
			$("#printTotalAmount").html('${shop.sAmount}');
			return false;
		}
		$("#quantity").val(quantity);
		var sAmount = '${shop.sAmount }';
		var totalAmount = quantity * sAmount;
		$("#totalAmount").val(totalAmount);
		$("#printTotalAmount").html(totalAmount);
		
		
		
	})

	
	// 장바구니 버튼 눌렀을 때 상품번호, 
	$("#basket").click(function(){
		console.log("basket 버튼 클릭");
		var quantity = $("#quantity").val();
		
		$.ajax({
			type: "POST" //요청 메소드
			, url: "/shop/basket" //요청 URL
			, data: {
				sNo: ${shop.sNo},
				quantity: quantity,
				uNo: ${shop.uNo}
			} //요청 파라미터
			, dataType: "" //응답받은 데이터의 형식
			, success: function( res ) { //AJAX 성공 시 콜백함수
				alert('장바구니 성공햇습니다.');
				console.log("성공")
				
				
				// 화면에 출력(변경)될 값을 적용해줘야한다
				$("#upbutton").html(res); //응답데이터 html 반영 코드
				$("#quantity").val(quantity);
			
				
			}
			, error: function() { //AJAX 실패 시 콜백함수
				alert('장바구니 실패햇습니다.');
				console.log("실패")
			}
		})
		
	})
	
})


</script>

<style>

div.left {
	float: left;
	width: 50%;	
}

div.right {
	float: right;
	width: 50%;
}


.btnQuantity {
	font-size: 20px;
	width: 50px;
	height: 20px;
}

/* 수량변경 화살표 제거 */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.btn {
	width: 150px;
}

#upbutton {
	font-size: 50px;
}
</style>



<div class="container">

<h1>상품 상세 정보</h1>

<div class="left">
<img alt="섬네일" src="/resources/shopimgupload/${thumbnail.siStoredFilename }" style="width: 400px; height: 350px;">
</div>

<div class="right">
<input type="hidden" id="sNo" name="sNo" value="${shop.sNo }" >

<table class="table table-striper table-hover">

<tr>
	<td>${shop.sName }</td>
</tr>

<tr>
	<td>${shop.sAmount } 원</td>
</tr>


<tr>
	<th>상품소개</th>
</tr>
</table>

<div style="height: 200px;">
${shop.sContent }
</div>

<div class="prod-buy-quantity">
	<input type="number" id="quantity" name="quantity" class="btnQuantity" value="1" autocomplete="off" min="1">
		<div style="display:table-cell; vertical-align: top;" >
			<button type="button" class="prod-quantity-plus" >⬆</button>
			<button type="button" class="prod-quantity-minus">⬇</button>
		</div>
</div>

<a href="/"><button id="basket" class="btn btn-default">장바구니</button></a>
<a href=""><button id="buy" class="btn btn-warning">구매하기</button></a>

<div id="printTotalAmount">
${shop.sAmount }
</div>

</div><!-- .right -->
</div>


<br><hr><br><br>




<c:forEach var="contentImg" items="${shopImg }">
<div align="center">
<img alt="이미지" src="/resources/shopimgupload/${contentImg.siStoredFilename }" style="width: 900px;">
</div>
</c:forEach>

<br><br><br>


<!-- 페이징 임포트 -->

<c:import url="/WEB-INF/views/layout/footerAdmin.jsp" />