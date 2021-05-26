<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<link href="/resources/css/hospital.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker3.min.css" > 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
<script src="/resources/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.ko.min.js"></script>

<div class="row">
	<div class="col-md-6 hospital_info">
		<p><img src="/resources/img/petbanner.jpg" class="img-responsive"></p>
		<p>${info.hName }</p>
		<p>${info.hRoadAddress } ${info.hDetailAddress }</p>
		<p>${info.hHour }</p>
		<p><i class="glyphicon glyphicon-earphone" style="margin-right: 5px;"></i>${info.hTel }</p>
		<p>${info.hInfo }</p> 
	</div>
	<div class="col-md-6">
		<p class="text-right"><button type="button" class="btn btn-default" onclick="history.back() ">목록으로</button></p>
		
		
		<c:if test="${empty login }">
		<div class="reservation_area nologin">
			<h4>예약하기</h4>
			<form action="/" method="">
				<div class="form-group">
					<div class="row">
					   <div class="col-md-12">
					      <div id="datepicker"></div>
					   </div>
					</div>
				</div>
				<div class="form-group">
					<label for="date">날짜</label>
					<input type="text" name="bookDate" class="form-control" id="date">
				</div>
				<div class="form-group">
					<label for="time">시간</label>
					<input type="text" name="bookHour" class="form-control" id="time">
				</div>
				<div class="form-group">
					<label for="petinfo">종류/나이</label>
					<input type="text" name="bookPetInfo" class="form-control" id="petinfo">
				</div>
				<div class="form-group">
					<label for="text">진료내용</label>
					<textarea name="bookText" class="form-control" id="text"></textarea>
				</div>
				<button type="button" class="btn btn-block btn-warning">예약하기</button>
			</form>
		</div>
		</c:if>
		
		<c:if test="${login }">
		<div class="reservation_area">
			<h4>예약하기</h4>
			<form action="/hospital/book" method="post" onsubmit="return check()">
				<input type="hidden" name="hNo" value="${info.hNo }">
				<input type="hidden" name="uNo" value="${user.uNo }">
				<div class="form-group">
					<div class="row">
					   <div class="col-md-12">
					      <div id="datepicker"></div>
					   </div>
					</div>
				</div>
				<div class="form-group">
					<label for="date">날짜</label>
					<input type="text" name="bookDate" class="form-control" id="date">
				</div>
				<div class="form-group">
					<label for="time">시간</label>
					<input type="text" name="bookHour" class="form-control" id="time">
				</div>
				<div class="form-group">
					<label for="petinfo">종류/나이</label>
					<input type="text" name="bookPetInfo" class="form-control" id="petinfo">
				</div>
				<div class="form-group">
					<label for="text">진료내용</label>
					<textarea name="bookText" class="form-control" id="text"></textarea>
				</div>
				<button class="btn btn-block btn-warning">예약하기</button>
			</form>
		</div>
		</c:if>
		
		
	</div>
</div>

<hr>

<div>
	<h4>후기</h4>
	
	<c:if test="${empty review }">
	등록된 후기가 없습니다.
	</c:if>
	
	<c:forEach items="${review }" var="item">
	<div class="reviewbox">
		<div class="clearfix">
			<div class="starW pull-left">
				<span style="width:calc(${item.R_STAR }*20%)"></span>
			</div>
			<b class="pull-left">${item.R_STAR }</b>
		</div>
		<p class="rcontent">${item.R_CONTENT }</p>
		<p class="ruser"><span>${item.U_NICK } </span><span>${item.R_DATE  }</span></p>
	</div>
	</c:forEach>
	<!--  -->
	
	<hr>
	<div class="reviewProc">
		<input type="text" name="hNo" value="${info.hNo }" id="hNo">	
		<input type="text" name="uNo" value="${user.uNo }" id="uNo">
		<input type="text" name="rStar" value="0.5" id="rStar">
		<div class="starRev clearfix">
		  <span class="star r1 on"></span>
		  <span class="star r2"></span>
		  <span class="star r1"></span>
		  <span class="star r2"></span>
		  <span class="star r1"></span>
		  <span class="star r2"></span>
		  <span class="star r1"></span>
		  <span class="star r2"></span>
		  <span class="star r1"></span>
		  <span class="star r2"></span>
		</div>
		<c:if test="${empty login }">
			<textarea class="form-control" name="rContent" disabled>로그인하세요!</textarea>
			<div class="pull-right">
				<button class="btn btn-warning" disabled>보내기</button>
			</div>
		</c:if>
		<c:if test="${login }">
			<textarea class="form-control" name="rContent" id="rContent"></textarea>
			<div class="pull-right">
				<button class="btn btn-warning" id="btn_reviewProc">보내기</button>
			</div>
		</c:if>
	</div>
</div>

<script>

//별점
$(".star").on('click',function(){
   var idx = $(this).index();
   $(".star").removeClass("on");
     for(var i=0; i<=idx; i++){
        $(".star").eq(i).addClass("on");
   }
   $("#rStar").val($(".star.on").length/2);
   
 });

//달력
$('#datepicker').datepicker({
	  inline: true,
	  format: "yyyy/mm/dd",
	  language : "ko",
	  todayHighlight:true,
	  
}).on('changeDate', function(e) {
	$('#date').val(e.format());  
});  

//예약폼 유효성검사
function check(){
	
	if( $("#date").val()=="" ){
		alert("예약할 날짜를 입력해주세요!")
		$("#date").focus();
		return false;
	}
	
	if( $("#time").val()=="" ){
		alert("예약시간을 입력해주세요!")
		$("#time").focus();
		return false;
	}
	
	if( $("#petinfo").val()=="" ){
		alert("종류/나이를 입력해주세요!")
		$("#petinfo").focus();
		return false;
	}
	
	if( $("#text").val()=="" ){
		alert("진단내용를 입력해주세요!")
		$("#text").focus();
		return false;
	}
	
}

$("#btn_reviewProc").click(function(){
	
	const hNo = $("#hNo").val()
	const uNo = $("#uNo").val()
	const rStar = $("#rStar").val()
	const rContent = $("#rContent").val()
		
	$.ajax({
		type:'get'
		,url:'/hospital/reviewProc'
		,data:{hNo:hNo,uNo:uNo,rStar:rStar,rContent:rContent}
		,dataType:'json'
		,success:function(res){
			console.log("성공")
			
			if(res==1){
				alert("댓글달기 성공!");
				location.reload();
			}
			
		},error:function(){
			console.log("에러")
		}
	})
})

</script>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>