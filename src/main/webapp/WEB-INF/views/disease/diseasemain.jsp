<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">


table{
float: left;
margin: 82px;
}

h1{
font-size: 45px;
}

li{
list-style:none;
}

.text{
color: #000000;
font-size: 20px;
}

.text:hover{
color: orange;
}

th{
color: orange;
}

#text{
margin:30px 10px 30px 200px;

}





</style>

<div id="main">

<div id="text"><h1>아래의 증상 중 한가지를 선택하세요</h1></div>
<hr>
	     
	     <div id="first">
	     <table>
	     
	     <tr><th><h1>안구 이상</h1><hr></th></tr>
	     <tr><td><c:forEach var="eye" items="${eyeList}">
	     		<li>
	     			<a class="text" href="/disease/diseasedetail?dQNo=${eye.dQNo}">${eye.dQuestion}</a>
	     		</li>
	     	</c:forEach></td>	    	
	        	</tr>  	         	     
	     
	          
	     </table>
	     
	     <table>
	     
	     <tr><th><h1>행동 이상</h1><hr></th></tr>
	     <tr><td><c:forEach var="behavior" items="${behaviorList}">
	     		<li>
	     			<a class="text" href="/disease/diseasedetail?dQNo=${behavior.dQNo}">${behavior.dQuestion}</a>
	     		</li>
	     	</c:forEach></td>	    	
	        	</tr>  	         	     
	     
	          
	     </table>
	     
	      <table>
	     
	     <tr><th><h1>코 이상</h1><hr></th></tr>
	     <tr><td><c:forEach var="nose" items="${noseList}">
	     		<li>
	     			<a class="text" href="/disease/diseasedetail?dQNo=${nose.dQNo}">${nose.dQuestion}</a>
	     		</li>
	     	</c:forEach></td>	    	
	        	</tr>  	         	     
	     
	          
	     </table>
	     </div>
	      <div>
	      <table>
	     <tr><th><h1>음식 섭취</h1><hr></th></tr>
	     <tr><td><c:forEach var="food" items="${foodList}">
	     		<li>
	     			<a class="text" href="/disease/diseasedetail?dQNo=${food.dQNo}">${food.dQuestion}</a>
	     		</li>
	     	</c:forEach></td>	    	
	        	</tr> 
	     
	    
	     </table>
	     
	      <table>
	     <tr><th><h1>호흡 이상</h1><hr></th></tr>
	     <tr><td><c:forEach var="air" items="${airList}">
	     		<li>
	     			<a class="text" href="/disease/diseasedetail?dQNo=${air.dQNo}">${air.dQuestion}</a>
	     		</li>
	     	</c:forEach></td>	    	
	        	</tr> 
	     
	    
	     </table>
	     
	      <table>
	     <tr><th><h1>소변 이상</h1><hr></th></tr>
	     <tr><td><c:forEach var="urine" items="${urineList}">
	     		<li>
	     			<a class="text" href="/disease/diseasedetail?dQNo=${urine.dQNo}">${urine.dQuestion}</a>
	     		</li>
	     	</c:forEach></td>	    	
	        	</tr> 
	     
	    
	     </table>
	     </div>
	     
	     
	     
     </div>

<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>