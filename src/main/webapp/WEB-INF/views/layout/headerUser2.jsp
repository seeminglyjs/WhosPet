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
		$(location).attr("href", "/searchList?" + $("#searchContent").val())
	})
	

})
</script>

<style type="text/css">
/*컨테이너 전체 넓이 지정  */
.container{
	width:1100px;
	min-width:1100px;
	max-width:none!important;
}
/*전체를 감싸는 div  */
#all{
	/* footer의 하단 고정을 위한 조건식  */
	min-height: 1600px;
	position: relative;
	padding-bottom: 330px;
}

/*--------------header 영역 css ------------------  */

/* 헤더 전체 div */
#headerDiv{
	display:flex;
	margin-bottom: 20px; 
	justify-content: center;
}

/* 로고 */
#headerLogo{
	width:190px;
	height: 45px;
}

/* 헤더 각 div 영역 */
.inlineHeader{
	width:280px;
	margin-top: 20px;
}

.dropdown a{
	font-weight: bolder;
}

/* 검색버튼 css  */
#headerSearchDivParent{
	padding-bottom: 15px;
}

#headerSearchDiv{
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#headerSearchDiv input{
    border: 0;
    box-shadow: none;
}

#headerSearchDiv button{
    width:50px;
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 6px 0 10px;
    border-left: solid 1px #ccc;
}

#headerSearchDiv button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#headerSearchDiv .glyphicon-search{
    font-size: 23px;
}



/* 로그인 영역 */
.loginHeader{
	margin-top: 10px;
	padding-left: 150px;
}


.loginHeader ul li a i{
	font-size: 30px;
}


/*--------------header 영역 css 끝 ------------------  */


@grid-float-breakpoint : 0;
@screen-xs-max  : 0;

</style>

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
     <div id="headerSearchDiv" class="inlineHeader" >
         <div class="input-group">
             <input type="text" class="form-control input-lg" placeholder="검색..." name="searchContent" id="searchContent"/>
             <span class="input-group-btn">
                 <button class="btn btn-info btn-lg" type="button" id="searchBtn">
                     <i class="glyphicon glyphicon-search"></i>
                 </button>
             </span>
         </div>
     </div>
	</div>

   	<!-- 로그인 -->
	<div class="loginHeader text-center" id="loginDiv">
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
<nav class="navbar navbar-default" >
	<div class="container text-center">
	
	<ul class="nav navbar-nav">
        
    <!-- 드롭다운 바 영역  -->
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">증상/질병검색 <span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#">메뉴1</a></li>
        <li class="divider"></li>
        <li><a href="#">메뉴2</a></li>
        <li class="divider"></li>
        <li><a href="#">메뉴3</a></li>
        <li class="divider"></li>
        <li><a href="#">메뉴4</a></li>
      </ul>
    </li>
    
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">병원예약 <span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="/hospital/list">병원찾기</a></li>
                
        <c:if test="${user.uGrade eq 'H'}">
	        <li class="divider"></li>
	        <li><a href="/hospital/register">병원등록</a></li>
        </c:if>
        
      </ul>
    </li>
   
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판 <span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="/board/list?bType=F">자유게시판</a></li>
        <li class="divider"></li>
        <li><a href="/board/list?bType=T">치료게시판</a></li>
        <li class="divider"></li>
        <li><a href="/board/list?bType=R">리뷰게시판</a></li>
      </ul>
    </li>
    
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품구매 <span class="caret"></span></a>
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
    
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">진료비조회 <span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="/treatment/treatmain">진료비 조회</a></li>
       
      </ul>
    </li>
  
    <c:if test="${not empty login }">
    <c:if test="${not empty gradeCheck }">
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">페이지전환 <span class="caret"></span></a>
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
</div><!-- 네비게이션 영역 끝  -->
<div id="containerAll" class="container"><!-- 콘텐츠 영역 시작  -->