<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerMypageUser.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- iamport 1.1.5 라이브러리 추가 -->
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<!-- jQuery 2.2.4 라이브러리 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// iamport 변수 초기화
	var IMP = window.IMP;
	IMP.init('imp74717614');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다

	// 결제 모듈 불러오기
	$("#pay").click(function() {
		requestPayment();
	});
});
//결제 요청 - 결제 모듈 불러오기
function requestPayment() {
	var sum = ${sum};
	IMP.request_pay({
	    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
	    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
	    name : '주문명:결제테스트', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
	    amount : sum, //결제금액 - 필수항목
	    buyer_email : 'kul321@naver.com', //주문자Email - 선택항목
	    buyer_name : '구매자이름', //주문자명 - 선택항목
	    buyer_tel : '010-3340-4729', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
	    buyer_addr : '서울특별시 강남구 삼성동', //주문자주소 - 선택항목
	    buyer_postcode : '123-456', //주문자우편번호 - 선택항목
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작
	    
	}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
	    if ( rsp.success ) { // 결제 성공 로직
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        msg += '[rsp.success]';

	        
	        // 결제 완료 처리 로직
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			jQuery.ajax({
				url: "/pay/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				type: 'POST',
				dataType: 'json',
				data: {
					// rsp객체를 통해 전달된 데이터를 DB에 저장할 때 사용한다
					imp_uid : rsp.imp_uid
				}
			
			}).done(function(data) {
				//[2] 서버에서의 응답 처리
				if ( data == 'success' ) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
			        msg += '\n[done]';

					alert(msg);
					
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	        
	    } else { // 결제 실패 로직
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

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
top: 60px;
left: 740px;
}
#button{
position: relative;
top: 80px;
left: 800px;
}


</style>



<div id="boardtitle">
<h1 style="display:inline;">장바구니  </h1><h4 style="display:inline; color: gray;">MyBasket</h4>
<hr align="left" width="830">
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
		<td><img src="/resources/shopimgupload/${basketlist.shopImg.siStoredFilename  }" style="width:50px; height: 50px;"/></td>
		<td>${basketlist.shop.sName}</td>
		<td>${basketlist.sbQuantity}
		<button id="btnPlus" onclick="location.href='/mypage/basket/plus?sbNo=${basketlist.sbNo}'" class= "btn btn-outline-secondary btn-xs"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
		<c:if test="${basketlist.sbQuantity > 1}">
		<button id="btnMinus" onclick="location.href='/mypage/basket/minus?sbNo=${basketlist.sbNo}'" class= "btn btn-outline-secondary btn-xs"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
		</c:if>
        </td>
		<td>${basketlist.sbAmount * basketlist.sbQuantity}</td>
<%-- 		<td><input type="hidden" id="sbNo" name="sbNo" value="${sbNo }"><button id="btnRemove">삭제</button></td> --%>
		<td><button id="btnRemove" class="btn btn-default" onclick="location.href='/mypage/basket/remove?sbNo=${basketlist.sbNo}'">삭제</button></td>
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
<span style="display:inline; font-size: 32px; font-family: 'InfinitySans-RegularA1';">총계 ${sum}원</span>
</div>
<div id="button">
<button id="pay" class="btn btn-warning" style="display:inline; ">결제하기</button>
</div>
</div><!-- .container -->

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>