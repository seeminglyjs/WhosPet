<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<link href="/resources/css/hospital.css" rel="stylesheet"> 
	<h3>병원등록</h3>
	<form action="/hospital/register" method="post">
		<input type="text" name="uNo" value="${user.uNo }">
		<div class="form-group">
			<label for="hName">병원이름</label>
			<input type="text" class="form-control" id="hName" name="hName" placeholder="병원이름을 입력해주세요">
		</div>
		<div class="form-group">
			<label>병원위치</label>
			<div class="form-group">                   
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
			    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
			</div>
			<div class="form-group">
			    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="hRoadAddress" id="addr2" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
			    <input class="form-control" placeholder="상세주소" name="hDetailAddress" id="addr3" type="text"  />
			</div>
		</div>
		<div class="form-group">
			<label for="hHour">진료시간</label>
			<input type="text" class="form-control" id="hHour" name="hHour" placeholder="09:00 - 22:00">
		</div>
		<div class="form-group">
			<label for="hTel">전화번호</label>
			<input type="text" class="form-control" id="hTel" name="hTel" placeholder="02-0000-0000">
		</div>
		<div class="form-group">
			<label for="hInfo">병원소개</label>
			<textarea class="form-control" name="hInfo" placeholder="병원소개를 입력해주세요" style="height:200px; resize:none;"></textarea>
		</div>
		<div class="row">
			<div class="col-md-6">
				<button type="submit" class="btn btn-block btn-warning">등록하기</button>
			</div>
			<div class="col-md-6">
				<button type="button" class="btn btn-block btn-default">취소하기</button>
			</div>
		</div>
	</form>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           $("[name=addr1]").val(data.zonecode);
           $("[name=hRoadAddress]").val(fullRoadAddr);
           
          
       }
    }).open();
}

</script>
	
	
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>