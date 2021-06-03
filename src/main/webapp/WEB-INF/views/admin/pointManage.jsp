<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerAdmin.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#pointadd").hide();
 
	$("#btnUser").click(function(){
			$("#pointadd").show();
		 
		        var go = {
		        		"uNo" : $('#uNo').val(),
// 		        		"poPlus" :$('#poPlus').val()
		        }
		        $.ajax({
		            type : 'post',
		            url : "/admin/pointList",
		            data : JSON.stringify(go),
		            contentType: 'application/json; charset=UTF-8',
		            dataType : 'html',
		            error: function(xhr, status, error){
// 		                alert(error);
		            },
		            success : function(data){
		            	$('#list').html(data);
		            },
		        });
		})
		
		$("#btnPoint").click(function(){
	        var go2 = {
	        		"uNo" : $('#uNo').val(),
		        	"poPlus" :$('#poPlus').val(),
		        	"poPlusY" : $('#poPlusY').val()
	        }
	        $.ajax({
	            type : 'post',
	            url : "/admin/pointAdd",
	            data : JSON.stringify(go2),
	            contentType: 'application/json; charset=UTF-8',
	            dataType : 'json',
	            error: function(xhr, status, error){
//		                alert(error);
	            },
	            success : function(data){

	            },
	        });
		})
		
	})
</script>

<div>
	<form id="user" action="/admin/pointList">
	<table class="table table-striped table-hover table-condensed">
	<tr>
	<td>유저번호 입력</td>
	<td><input type="text" id="uNo" name="uNo"/></td>
	<td><button type="button" id="btnUser" class="btn btn-default">회원 포인트 보기</button></td>
	<td></td>
	<td></td>
	</tr>

	
	<tr id="pointadd">
	<td>부여할 포인트 입력</td>
	<td><input type="text" id="poPlus" name="poPlus"/></td>
	<td>적립 사유</td>
	<td><input type="text" id="poPlusY" name="poPlusY"/></td>
	<td><button type="button" id="btnPoint" class="btn btn-default">포인트 부여</button></td>
	</tr>
	
	</table>
	
	</form>

	
</div>

<div id="list" style="width:500; height: 500px;">
<%-- 회원의 아이디는 ${uId} --%>
</div>
<%@ include file="/WEB-INF/views/layout/footerAdmin.jsp" %>