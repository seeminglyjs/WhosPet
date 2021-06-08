<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerUser.jsp" /> 

<!-- iamport 1.1.5 라이브러리 추가 -->
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<!-- jQuery 2.2.4 라이브러리 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 다음 결제 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	// 식별코드 넣는 코드
	var IMP = window.IMP;
	IMP.init("imp83609769");	// 가맹점 식별코드
	
	
	//결제 버튼 클릭시 결제 모듈 작동
	$("#payment").click(function(){
		console.log("payment 버튼 클릭");
		
		var total = ${basketInfo.totalAmount};
		console.log("total : " + total);
		
		var oRecipient = $("#oRecipient").val();
		var oAddress = $("[name='oAddress']").val();
		var oDetailAddress = $("[name='oDetailAddress']").val();
	
		IMP.request_pay({
		    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
		    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
		    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
		    name : '주문명:결제테스트', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
		    amount : 1000, //결제금액 - 필수항목
		    buyer_email : 'qswwsq11@gmail.com', //주문자Email - 선택항목
		    buyer_name : '구매자이름', //주문자명 - 선택항목
		    buyer_tel : '010-2952-4792', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
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
		        msg += '결제 상태 : ' + rsp.status;
		        
		        // 결제 완료 처리 로직
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					type: 'POST',
					dataType: 'json',
					data: {
						impUid : rsp.imp_uid,
						merchantUid : rsp.merchant_uid,
						pyAmount : rsp.paid_amount,
						pyApplyNum : rsp.apply_num,
						pyMethod : rsp.pay_method,
						
						// /payments/compelete 매개변수 order 에서 받을 데이터
						sNo : '${basketInfo.sNo}',		//상품번호
						oName : '${basketInfo.sName}',	//상품이름
						oQuantity : '${basketInfo.quantity}',	//주문한 수량
						oAmount : '${basketInfo.sAmount}',	//상품 가격
						oTotalAmount : '${basketInfo.totalAmount}', //결제할 총 가격
						oSender : '${userOrder.uName}',	//주문한 사람
						oRecipient : oRecipient,		//받는 사람
						oAddress : oAddress,			//주소
						oDetailAddress : oDetailAddress //상세 주소
						
						//기타 필요한 데이터가 있으면 추가 전달
						}
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					if ( everythings_fine ) {
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
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
		
		
	})
	
	
	
})	
</script>






<div><span style="font-size: 40px;">구매자정보</span></div>
<br><br><br><br>

<table class="table table-hover">
<tr>
	<th>이름</th><td style="width:85%">${userOrder.uName }</td>
</tr>
<tr>
	<th>이메일</th><td>${userOrder.uEmail }</td>
</tr>
<tr>
	<th>휴대폰 번호</th><td>${userOrder.uPhone }</td>
</tr>
</table>


<!-- 다음 주소 API 설정 -->
<!-- <script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script> -->



<div>
	<span style="font-size: 40px;">받는사람 정보</span><input type="button" onclick="sample3_execDaumPostcode()" value="배송지 변경"><br>
	
	<table class="recipient table table-hover" >
		<tr>
			<th>이름</th><td style="width:85%"><input type="text" id="oRecipient" name="oRecipient" value="${userOrder.uName }" /></td>
		</tr>
		<tr>
			<th>배송주소</th>
			<td>
			<input type="text" id="sample3_postcode" name="postNo"  placeholder="우편번호"><br><br>
			<input type="text" id="sample3_address" name="oAddress" value="${userOrder.uAddress }" placeholder="주소" style="width: 250px;">
			<input type="text" id="sample3_detailAddress" name="oDetailAddress" value="${userOrder.uDetailAddress }" placeholder="상세주소" style="width: 250px;">
 			<input type="text" id="sample3_extraAddress" placeholder="참고항목">
			</td>			

		</tr>
		<tr>
			<th>연락처</th><td><input type="text" id="uPhone" name="uPhone" value="${userOrder.uPhone }" /></td>
		</tr>
		<tr>
			<th>배송 요청사항</th><td><input type="text" id="comment" name="comment" value="안전하게 부탁드려요!" style="width: 400px; height: 30px;"/></td>
		</tr>
	</table>
	
	
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

	<!-- 다음 주소 api설정 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
	
</div>









<br><br><br><br><br><br><br><br><br>
<button id="payment">결제</button>


<!-- 페이징 임포트 -->
<!-- <c:import url="/WEB-INF/views/util/shopPaging.jsp" /> -->

<c:import url="/WEB-INF/views/layout/footerUser.jsp" />