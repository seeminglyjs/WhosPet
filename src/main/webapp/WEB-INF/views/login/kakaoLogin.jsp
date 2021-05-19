<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<!-- 카카오톡 API 스크립트 코드  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('65923a6755abd0443f692b424c69707c');

// SDK 초기화 여부를 판단합니다. 성공시 true
console.log(Kakao.isInitialized());

window.Kakao.API.request({ // 유저의 정보를 가져오는 메소드
    url: '/v2/user/me', // 해당 url은 고정임
   	data: {
            property_keys: ["kakao_account.email"] //가져올 데이터
    },
    success: function(res) { // 성공시 콜백함수
    	console.log(res)
    	const kakaoEmail = res.kakao_account.email // 이메일 정보 가져오기(저장)    	
  		
		var kakaoForm = document.getElementById("kakaoForm")    
		document.getElementById("kakaoEmailInput").value = kakaoEmail
		kakaoForm.submit()
        }
});


</script>
<!----------------------------------------->


<form action="/login/kakaoLogin" method="post" id="kakaoForm">
	<input type="hidden" name="kakaoEmail" id="kakaoEmailInput">
</form>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>