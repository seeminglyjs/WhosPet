<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>



<!-- 카카오 맵 API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                        extraAddr =extraAddr;
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>



<style type="text/css">

/*  우편 번호만 수평 유지위한 css */
#sample6_postcode{
	display: inline !important;
	width: 250px !important;
}

</style>

	<div style="width: 500px; height:300px; margin: 0 auto;">
	<h2>회원가입</h2>
	<hr>
	<form class="form-horizontal" action="/join/join" method="post">
	  
	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="id" name="id" placeholder="아이디...">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="pw" class="col-sm-2 control-label">비밀번호</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="pw" name ="pw" placeholder="비밀번호..." autocomplete="off">
	    </div>
	  </div>
	  
   	  <div class="form-group">
	    <label for="name" class="col-sm-2 control-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="name" name ="name" placeholder="홍길동...">
	    </div>
	  </div>
	  
	  
  	  <div class="form-group">
	    <label for="phone" class="col-sm-2 control-label">전화번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phone" name ="phone" placeholder="010-1234-1234...">
	    </div>
	  </div>
	  
	  
	<!-- 카카오로그인에서 미가입 유저가 회원가입 폼으로 넘어왔을때 체크할 요소  -->
	<c:choose>
		<c:when test="${empty kakaoEmail }">
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="email" id="email" placeholder="abcd@gmail.com...">
			</div>
		</div>
		</c:when>
		
		<c:otherwise >
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="email" id="email" value="${kakaoEmail }">
			</div>
		</div>
		</c:otherwise>
	</c:choose>
	
	
	  <div class="form-group">
	    <label for="nick" class="col-sm-2 control-label">닉네임</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="nick" name ="nick" placeholder="닉네임123...">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="postcode" class="col-sm-2 control-label">주소</label>
	    <div class="col-sm-10">
	    <input type="text" class="form-control" id="sample6_postcode" name="postcode" placeholder="우편번호">
	    <input type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	    <input type="text" class="form-control" id="sample6_address" name="address" placeholder="주소" style="margin-top: 10px;">
		<input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" style="margin-top: 10px;">
		<input type="hidden" class="form-control" id="sample6_extraAddress" name ="extraAddress" placeholder="참고항목" style="margin-top: 10px;">
	    </div>
	  </div>

	  <div class="form-group">
	    <label for="ugrade" class="col-sm-2 control-label">유저유형</label>
	    <div class="col-sm-10">
			<select class="form-control" id= "ugrade" name="ugrade">
				<option value="U" >일반 사용자</option>
				<option value="H" >병원 사용자</option>						
			</select>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="pet" class="col-sm-2 control-label">반려동물</label>
	    <div class="col-sm-10">
			<select class="form-control" id= "pet" name="pet">
				<option value="D" >반려견</option>
				<option value="C" >반려묘</option>						
				<option value="A" >반려견 + 반려묘</option>						
			</select>
	    </div>
	  </div>

	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary">회원가입</button>     
	    </div>
	  </div>
	
	</form>
	</div>


<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>