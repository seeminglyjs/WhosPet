<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

    $.ajax({
        type : "GET",
        url : "/mypage/user",
        data: "",
        dataType : "html",
        error : function() {
            alert('통신실패!!');
        },
        success : function(data) {
        	$("#div1").html(data)
        }
 
    });
    
    
    $("#userinfo").click(function(){
    	$.ajax({
            type : "GET",
            url : "/mypage/user",
            data: "",
            dataType : "html",
            error : function() {
                alert('통신실패!!');
            },
            success : function(data) {
            
            	$("#div1").children().remove();
            	$("#div1").html(data)
            }
    	
   			 });
    	})
    
    $("#boardinfo").click(function(){
    	$.ajax({
            type : "GET",
            url : "/mypage/board",
            data: "",
            dataType : "html",
            error : function() {
                alert('통신실패!!');
            },
            success : function(data) {
            
            	$("#div1").children().remove();
            	$("#div1").html(data)
            }
    	
   			 });
    	})
    	
    	$("#bookinginfo").click(function(){
    	$.ajax({
            type : "GET",
            url : "/mypage/booking",
            data: "",
            dataType : "html",
            error : function() {
                alert('통신실패!!');
            },
            success : function(data) {
            
            	$("#div1").children().remove();
            	$("#div1").html(data)
            }
    	
   			 });
    	})
    	
    	$("#pointinfo").click(function(){
    	$.ajax({
            type : "GET",
            url : "/mypage/point",
            data: "",
            dataType : "html",
            error : function() {
                alert('통신실패!!');
            },
            success : function(data) {
            
            	$("#div1").children().remove();
            	$("#div1").html(data)
            }
    	
   			 });
    	})
    	
        $("#payinfo").click(function(){
    	$.ajax({
            type : "GET",
            url : "/mypage/pay",
            data: "",
            dataType : "html",
            error : function() {
                alert('통신실패!!');
            },
            success : function(data) {
            
            	$("#div1").children().remove();
            	$("#div1").html(data)
            }
    	
   			 });
    	})
    	
    	$("#basketinfo").click(function(){
    	$.ajax({
            type : "GET",
            url : "/mypage/basket",
            data: "",
            dataType : "html",
            error : function() {
                alert('통신실패!!');
            },
            success : function(data) {
            
            	$("#div1").children().remove();
            	$("#div1").html(data)
            }
    	
   			 });
    	})
	
})
</script>
<style type="text/css">
#menubar {
width: 200px;
height: 100px;
background-color: #f6dcbf;
position: relative; left:0;
padding-top: 10px;
border-right: 15px solid black;
}

#menubar2 {
width: 200px;
height: 500px;
background-color: white;
position: relative; left:0; top:0;
border-right: 15px solid gray;
}
#barlist {
padding: 30px;
list-style: none;
}

#div1{
width: 600px;
height: 500px;
position: relative;
right:-250px; top:-100px;
}

li {
cursor:pointer;
}
</style>

<div id="menubar">
<h3 style="padding:10px;">마이페이지</h3>
<div id="menubar2">
<ul id="barlist">
<li id="userinfo">내 정보</li>
<hr>
<li id="boardinfo">작성글 조회</li>
<hr>
<li id="bookinginfo">예약 정보</li>
<hr>
<li id="pointinfo">포인트 조회</li>
<hr>
<li id="payinfo">구매내역</li>
<hr>
<li id="basketinfo">장바구니</li>
<hr>
<li>병원 등록/조회/삭제</li>
<hr>
<li>예약현황</li>
</ul>
</div>
</div>


<div id="div1"></div>
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>