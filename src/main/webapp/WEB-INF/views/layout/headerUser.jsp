<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.2.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/common.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--JSTL라이브러리 영역  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="UTF-8">
<title>WhosPet</title>

<!-- 카카오 api 초기화 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('65923a6755abd0443f692b424c69707c');
// SDK 초기화 여부를 판단합니다. 성공시 true
console.log(Kakao.isInitialized());
</script>

<!-- 카카오 api 연결 끊기 로그아웃  -->
<script type="text/javascript">
$(document).ready(function(){
	$("#logout").click(function(){	
		Kakao.API.request({
			  url: '/v1/user/unlink',
			  success: function(response) {
			    console.log(response);
			    $(location).attr("href","/login/logout") // 로그아웃 링크 연결
			  },
			  fail: function(error) {  
			    console.log(error);
			    $(location).attr("href","/login/logout") // 로그아웃 링크 연결
			  },
			});		
	})	
})
</script>


<script type="text/javascript">
<!-- 메인 검색기능 자바스크립트  -->
$(document).ready(function(){
	$("#searchBtn").click(function(){
		$(location).attr("href", "/mainSerch" + "?data=" + $("#searchContent").val())
	})
	
	$('nav li').hover(
			  function() {
			  	$('ul', this).stop().slideDown(150);
			  },
				function() {
			    $('ul', this).stop().slideUp(150);
			  }
	);
})



</script>



</head>
<body>
<div id="all">

<!-- 메인헤더 영역  -->	
<div id="headerDiv" class="container">

	<!-- 이미지 로고 -->
	<div class="inlineHeader">
		<a href="/"><img alt="로고" src="/resources/img/logo2.png" id="headerLogo"></a>
	</div>
	

	<!-- 검색창 영역  -->	
	<div id="headerSearchDivParent">
     <div id="headerSearchDiv">
         <div class="input-group">
             <input type="text" class="form-control input-lg" placeholder="진료항목검색" name="searchContent" id="searchContent"/>
             <span class="input-group-btn">
                 <button class="btn btn-info btn-lg" type="button" id="searchBtn">
                     <i class="glyphicon glyphicon-search"></i>
                 </button>
             </span>
         </div>
     </div>
	</div>

   	<!-- 로그인 -->
	<div class="loginHeader text-center clearfix" id="loginDiv">
	    <ul class="nav navbar-nav">
	    <li class="dropdown">
	      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:#666666"><i class="glyphicon glyphicon-user"></i></a>      
	      
	      <c:if test="${login }">
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="/mypage/user" id="mypage">마이페이지</a></li>
	        <li class="divider"></li>
	        <li><a href="#" id="logout">로그아웃</a></li>
	      </ul>
	      </c:if>
	      
    	  <c:if test="${empty login }">
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="/login/login">로그인</a></li>
	        <li class="divider"></li>
	        <li><a href="/join/join">회원가입</a></li>
	      </ul>
	      </c:if>
	      
	    </li>
	    </ul>
	</div>

 
</div>	



<!-- 네비게이션바 영역  -->

	<div id="navDiv">
	<nav id="hNav">
		<div class="container">

		<ul>
			<li><a href="#">증상/질병검색 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/disease/diseasemain">질병/증상</a></li>
					
				</ul>
			</li>
			
			<li><a href="#">병원예약 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/hospital/list">병원찾기</a></li>
			       <c:if test="${user.uGrade eq 'H'}">
  				    <li class="divider"></li>
  				    <li><a href="/hospital/register">병원등록</a></li>
			        </c:if>
				</ul>
			</li>
			
			<li>
				<a href="#">게시판 <span class="caret"></span></a>
			      <ul class="dropdown-menu">
			        <li><a href="/board/list?bType=F">자유게시판</a></li>
			        <li class="divider"></li>
			        <li><a href="/board/list?bType=T">치료게시판</a></li>
			        <li class="divider"></li>
			        <li><a href="/board/list?bType=R">리뷰게시판</a></li>
			      </ul>
			</li>
			
			<li>
				<a href="#">상품구매 <span class="caret"></span></a>
			    <ul class="dropdown-menu" role="menu">
			      <li><a href="/shop/list">메뉴1</a></li>
			      <li class="divider"></li>
			      <li><a href="#">메뉴2</a></li>
			      <li class="divider"></li>
			      <li><a href="#">메뉴3</a></li>
			      <li class="divider"></li>
			      <li><a href="#">메뉴4</a></li>
			    </ul>
			</li>
			
			<li><a href="#">진료비조회 <span class="caret"></span></a>
		      <ul class="dropdown-menu" role="menu">
       	 	  	<li><a href="/treatment/treatmain">진료비 조회</a></li>
      		  </ul>
			</li>
			
		    <c:if test="${not empty login }">
    		<c:if test="${not empty gradeCheck }">	
			<li><a href="#">페이지전환 <span class="caret"></span></a>
      			<ul class="dropdown-menu" role="menu">
	        		<li><a href="/">유저메인</a></li>
	        		<li class="divider"></li>
	        		<li><a href="/admin">관리자메인</a></li>
     			</ul>
			</li>
		  	</c:if>
  			</c:if>
			
		</ul>
	</div>
</nav>
</div>


<div id="containerAll" class="container"><!-- 콘텐츠 영역 시작  -->