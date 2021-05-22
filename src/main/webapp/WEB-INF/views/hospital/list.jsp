<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
<style>
.box{
	border:1px solid #e5e5e5;
	border-radius:10px;
	padding:10px;
}

.box+.box{
	margin-top:10px;
}

.mb15{
	margin-bottom:15px;
}

</style>
	<h1>병원 리스트</h1>
	
	<form class="form-inline text-center mb15" action="/hospital/search" method="get">
	  <div class="form-group">
	  	<select class="form-control" name="category">
			<option value="hName">병원이름</option>
			<option value="hRoadAddress">주소</option>	  	
	  	</select>
	    <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
	  </div>
	  <button id="search" class="btn btn-default">검색</button>
	</form>
	
	<div class="row">
		<div class="col-md-6 pull-left">
			<c:forEach items="${list }" var="list">
			<div class="box">
				<p>${list.H_NAME }</p>
				<p>${list.H_ROAD_ADDRESS} ${list.H_DETAIL_ADDRESS }</p>
				<p>${list.H_HOUR }</p>
				<p><i class="glyphicon glyphicon-earphone"></i> ${list.H_TEL }</p>
			</div>
			</c:forEach>
		</div>
		<div class="col-md-6 pull-left">
			<div id="map" style="width:100%; height:850px;"></div>
		</div>
	
	</div>
	
	<div class="text-center">
		<ul class="pagination pagination-sm">
			
			<c:if test="${paging.curPage != paging.startPage}">
			<li><a href="/hospital/list?curPage=${paging.curPage-1 }">&lt;</a></li>
			</c:if>
			
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
				<c:choose>
					<c:when test="${paging.curPage eq i}">
						<li class="active"><a href="/hospital/list?curPage=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/hospital/list?curPage=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			
			<c:if test="${paging.curPage != paging.endPage }">
			<li><a href="/hospital/list?curPage=${paging.curPage+1 }">&gt;</a></li>
			</c:if>
			
		</ul>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afdd7506d022e1ee11fca787e3b4d967&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3, // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var rdnmadrList = new Array();
	var cmpnmList = new Array();
	
	var rdnList =JSON.parse('${arraylist}');
	console.log(rdnList);
	for(var k in rdnList){	
		var $obj = rdnList[k];
		var aa =  $obj.address;
		var bb  =  $obj.name;
		rdnmadrList.push(aa);
		cmpnmList.push(bb);
	}
	
	
	//주소 리스트 
	rdnmadrList.forEach(function(addr, index){
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        
		        var content = '<div class="overlay_info">';
		        content += '    <a><strong>' + cmpnmList[index] +'</strong></a>';
		        content += '    <div class="desc">';
		        content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
		        content += '        <span class="address">'+ rdnmadrList[index]  +'</span>';
		        content += '    </div>';
		        content += '</div>';
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            //  content: cmpnmList[index], 
		            content: content,
		           	disableAutoPan: true
		           	
		        });
		        infowindow.open(map, marker);

				
				console.log(index);   
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        if(index == 1){
		        	console.log(coords)
		        	map.setCenter(coords);	
		        }
		        
		    } 
		    
		    
		}); 
		
	}); 
	
	
	</script>
		
	
	
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>