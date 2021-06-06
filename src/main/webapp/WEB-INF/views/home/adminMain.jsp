<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerAdmin.jsp" %>

<style type="text/css">

#mainListContainer{
	display: flex;
	justify-content: center;
}


/* 메인 탑텐 리스트 div 3개 */
.listCom{
	margin: 25px;
}

.listCom table{
	font-size: 17px;
}

.listCom table a{
	color: black;
	font-weight: bold;
	cursor: pointer;
}

.listCom table td{
	font-weight: bold;
	width:300px;
}

.listCom span{
	font-size: 13px;
	color: #ccc;
}


.jumbotron{
	background-image: url("/resources/img/mainBanner2.png");
}


/* 홍백님 슬라이드 영역 */   
      .name {
        font-weight: bold;
      }
      
      .quote {
        color: #aaaaaa;
      }
      
      .items--parent {
        overflow: hidden;
        position: relative;
      }
      
      .items {
        display: flex;
        align-items: center;
        width: fit-content;
        animation: carouselAnim 200s infinite linear;
      }
      
      .items a {
        text-decoration: none;
        color: #000;
      }
      
      .entry {
        display: flex;
        align-items: center;
        flex-direction: column;
        position: relative;
        width: 300px;
        background: #fff;
        margin: 1em;
        padding: 0.5em;
        border-radius: 10px;
        box-shadow: 4px 4px 5px 0px rgba(0, 0, 0, 0.5);
      }
      
      .entry p {
        text-align: center;
        padding: 1em;
      }
      
      .container .faders {
        width: 100%;
        height: 100%;
      }
      
      .faders .left {
        
        margin-top: 10px;
        width: 15%;
        height: 10.5%;
        position: absolute;
        z-index: 200;
      }

      .faders .right {
         margin-top: 10px;
        width: 15%;
        height: 10.5%;
        position: absolute;
        z-index: 200;
        right: 470px;
       
      }
      
      @media only screen and (max-width: 768px) {
        .items {
          animation: carouselAnim 35s infinite alternate linear;
        }

        @keyframes carouselAnim {
          from {
            transform: translate(0, 0);
          }
          to {
            transform: translate(calc(-100% + (2 * 300px)));
          }
        }
      }

      @keyframes carouselAnim {
        from {
          transform: translate(0, 0);
        }
        to {
          transform: translate(calc(-100% + (5 * 300px)));
        }
      }
/* -------------------------------------  */
     
     
     
</style>


<div id="mainContainer">

<div class="jumbotron">
  <h1 style="color: white">WhosPet</h1>
  <p><strong style="color: white">당신의 반려동물에게 최적의 병원을 찾아보세요!</strong></p>
  <p><a class="btn btn-warning btn-lg" href="/hospital/list" role="button">병원 찾기</a></p>
</div>


<!--홍백님 슬라이드 영역  -->
    <div class="container">
      <div class="faders">
        <div class="left"></div>
        <div class="right"></div>
      </div>
      <div class="items--parent">
         <div class="items">
	        <c:forEach var="t" items="${treatmentList}">
           		<a href='/treatment/treatdetail?no=${t.TR_NO}'>
	           		<div class="entry">
		             	<h3 class="name">${t.TR_NAME}</h3>
		             	<p class="quote">가격 : ${t.TR_PRICE}원</p>
		             	<p class="quote">${t.TR_DESC}</p>
	             	</div>
             	</a>
	        </c:forEach>     
           </div>
         </div>
     </div>
<!-- ----------------------  -->




<div id="mainListContainer">
	<div class="listCom">
		<table class="table table-hover">
		<tr class="text-center">
			<td><strong>최근 가입 업체</strong></td>
		</tr>
	<c:set value="0" var="start1"></c:set>
	<c:forEach begin="0" end="10" items="${newHospitalList }" var="newH">
		<c:choose>
			
			<c:when test="${empty newH }">
				<tr>
					<td>이런 데이터가 없네요 ㅠㅠ</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<tr>
					<td style="color:#e1701a">${start1 = start1 + 1 }. 
					<a href="/hospital/view?hNo=${newH.hNo }">${newH.hName } <span> Tel: ${newH.hTel } </span></a></td>
				</tr>
			</c:otherwise>		
		</c:choose>
	</c:forEach>
		</table>
	</div>
	
	<div class="listCom">
				<table class="table table-hover">
		<tr class="text-center">
			<td><strong>최다 조회 업체</strong></td>
		</tr>
	<c:set value="0" var="start2"></c:set>
	<c:forEach begin="0" end="10" items="${bestHospitalList }" var="newH">
		<c:choose>
			
			<c:when test="${empty newH }">
				<tr>
					<td>이런 데이터가 없네요 ㅠㅠ</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<tr>
					<td style="color:#e1701a">${start2 = start2 + 1 }. 
					<a href="/hospital/view?hNo=${newH.hNo }">${newH.hName } <span> Tel: ${newH.hTel } </span></a></td>
				</tr>
			</c:otherwise>		
		</c:choose>
	</c:forEach>
		</table>
	</div>
	
	<div class="listCom">
		<table class="table table-hover">
			<tr class="text-center">
				<td><strong>베스트 리뷰 업체</strong></td>
			</tr>
		<c:set value="0" var="start3"></c:set>
		<c:forEach begin="0" end="10" items="${bestReviewList }" var="newH">
			<c:choose>
				
				<c:when test="${empty newH }">
					<tr>
						<td>이런 데이터가 없네요 ㅠㅠ</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td style="color:#e1701a">${start3 = start3 + 1 }. 
						<a href="/hospital/view?hNo=${newH.H_NO }">${newH.H_NAME } <span> Tel: ${newH.H_TEL } </span></a></td>
					</tr>
				</c:otherwise>		
			</c:choose>
		</c:forEach>
		</table>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/layout/footerAdmin.jsp" %>