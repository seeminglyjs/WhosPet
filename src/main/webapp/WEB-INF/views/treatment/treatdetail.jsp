<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
 <%@ page import="java.util.*"%>
 <%
 	List<HashMap<String, Object>> orderedList = (List<HashMap<String, Object>>)session.getAttribute("orderedList");
 %>
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84eb5f9e9be040c09fa07972ce6f0e62&libraries=services"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
     <style>      
     .Search {
        position: relative;
        display: flex;
        font-weight: 300;
        font-size: 40px;
        color: #e1701a;
      }

      .Search-box {
        flex: 1 0 auto;
        margin: 0 12px;
        padding: 8px 20px;
        height: 80px;
        border: 0;
        box-shadow: 0 3px 12px -1px rgba(0, 0, 0, 0.3);
        transition: all 0.15s ease-in-out;
        font-size: 30px;
      }
      
      .Search-box:focus {
        flex: 1 0 90%;
        margin: 0;
        outline: 0;
      }

      .Search-label {
        position: absolute;
        top: 14px;
        right: 30px;
        font-size: 40px;
        transition: all 0.15s ease-in-out;
      }

      .Search-box:focus + .Search-label {
        transform: translateX(12px);
      }
      
      .content {
        margin-top: 50px;
        margin-right: 30px;
        margin-bottom: 50px;
        width: 180px;
        height: 100px;
        background-color: #fff;
        border-radius: 20%;
        text-align: center;
        line-height: 100px;
        display: inline-block;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.26);
        color: rgba(0, 0, 0, 0.7);
        font-size: 20px;
        font-weight: 700;
       
      }
      
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
      
      
     .container .list{
      display: flex;
      position: absolute;
      text-align:center;
      
     }
     
     .container .list h1{
      font-size: 32px;
      font-weight: 700;
      color:
      
     }

     .content-list {
       font-size:20px;
       list-style: none;
       margin-top: 50px;
       margin-left: 100px;
       
     }
     
     .content-list li {
       padding-top: 10px;
     }
     
     .content-list li a {
       text-decoration: none;
       color: #aaaaaa;
     }
     
     .content-list li a:hover {
       color: #e1701a;
     }
     
	.btn,
	.btn--detail {
	    width: 130px;
	    height: 40px;
	    padding: 10px;
	    border-radius: 20px 20px 20px 20px;
	    color: #333;
	    font-size: 16px;
	    font-weight: 700;
	    text-align: center;
	    cursor: pointer;
	    box-sizing: border-box;
	    display: block;
	    transition: .4s;
	}
	
	.btn:hover{
	    background-color: #e1701a;
	    color:#fff;
	}
	
	h2 {
	  font-weight: 700;
	  font-size: 32px;
	}
	
	h3 {
	  font-weight: 700;
	  font-size: 20px;
	}
	
	.container--chartbox {
	  border: 1px solid #fff;
	  box-shadow: inset 0 0 5px rgba(0,0,0,.2);
	}
	
	.container--hospital {
		margin-top: 80px;
		width: 100%;
	}
	
	.h--list {
	  list-style: none;
	  font-size: 15px;
	  margin:0;
	  width: auto;
	}
	
	.h--info{
	  display:flex;
	}
	
	.h--name{
	  margin-right: 150px;
	  margin-bottom: 50px;
	  font-weight: 700;
	}
	
	.h--region,
	.h--time,
	.h--tel {
	  margin-right: 150px;
	  margin-bottom: 50px;
	  color: #aaaaaa;
	}
	
	.container--label {
	  display:flex;
	}
	
	.container--location {
	  display:flex;
	}
	
	.container--location span {
	  font-size: 24px;
	  display: inline-block;
	  margin-left: 40px;
	  padding-top: 5px;
	}
	
	#chartdiv {
	  width: 100%;
	  height: 500px;
	}
	
	#deleteBtn {
	  text-decoration: none;
	  margin-top: 7px;
	}
	
    </style>
     
     <% session = request.getSession(); %>
    <script>
      window.console = window.console || function (t) {};
    </script>
    <script>
      if (document.location.search.match(/type=embed/gi)) {
        window.parent.postMessage("resize", "*");
      }
    </script>
    <div class="container">
    <h1>진료비 상세</h1>
     <hr>
     <br>
      <form action="/treatment/treatSearchDetail" class="Search" method="post">
        <input
          class="Search-box"
          type="search"
          id="Search-box"
          name="Search-box"
          autocomplete="off"
        />
        <label class="Search-label" for="Search-box"
          ><i class="fa fa-search"></i
        ></label>
      </form>
    </div>
    <br>
    <br>
    <div class="container--location" id="container--location">
    
	    <input type="button" class="btn" id="btnTest" onclick="isClicked()" value="현위치">
	    <input type="button" class="btn" id="btnSelect" value="주소선택">
	    <select name="sido1" id="sido1"></select>
		<select name="gugun1" id="gugun1"></select>
 	    <span id="region"></span>
 	    <a class="material-icons" id="deleteBtn"></a>
    </div>
    <br>
    <center>
    
    <div class="container--chartbox" id="container--chartbox">
		<h2>${treatment.TR_NAME}</h2>
		<% if(session.getAttribute("login") == null) { %>
		  <h3>현위치 및 특정 지역 평균가는 로그인 하시면 보실 수 있습니다.</h3>
		<% } %>
		<h3 id="message"></h3>
	    <div id="chartdiv"></div>
	</div>
	
	<div class="container--hospital">
	  <ul class="h--list" id="parentul">
	  </ul>
	</div>
	
	</center>
	
	
	<script>
		am4core.ready(function() {
		
		// Themes begin
		// Themes end
		
		var chart = am4core.create('chartdiv', am4charts.XYChart) // 차트 생성 
		chart.colors.step = 2;
		var login = ${login} // 로그인정보 from 세션 
		console.log(login);
		// 그래프의  legend 부분 ( 상단 xx시 , xx구 , 전국 평균가 )
		chart.legend = new am4charts.Legend()
		chart.legend.position = 'top'
		chart.legend.paddingBottom = 20
		chart.legend.labels.template.maxWidth = 95
		chart.legend.itemContainers.template.togglable = false;
		
		// 차트 x축 
		var xAxis = chart.xAxes.push(new am4charts.CategoryAxis())
		xAxis.dataFields.category = 'category'
		xAxis.renderer.cellStartLocation = 0.1
		xAxis.renderer.cellEndLocation = 0.9
		xAxis.renderer.grid.template.location = 0;
		
		
		// 차트 y축 
		var yAxis = chart.yAxes.push(new am4charts.ValueAxis());
		yAxis.min = 0;
		console.log(login);
		
		
		// 막대그래프 생성 with value 
		function createSeries(value, name) {
		    var series = chart.series.push(new am4charts.ColumnSeries())
		    series.dataFields.valueY = value
		    series.dataFields.categoryX = 'category'
		    series.name = name
		
		
		    var bullet = series.bullets.push(new am4charts.LabelBullet())
		    bullet.interactionsEnabled = false
		    bullet.dy = 20;
		    bullet.label.text = '{valueY}' + '원'
		    bullet.label.fontSize = 12; // 폰트사이즈 변경 , 미변경시 defalut가 커서 숫자 자동으로 ellipsis됨 
		    bullet.label.fill = am4core.color('#ffffff')
		
		    return series;
		}
		
		//그래프에 들어갈 데이터 
		chart.data = [
		    {
		        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가',
		        first: 0,
		        second: 0,
		        third: 0
		    },
		    {
		        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가 ',
		        first: 0,
		        second: 0,
		        third: 0
		    },
		    {
		        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가  ',
		        first: 0,
		        second: 0,
		        third: 0
		    }
		]
			
		
		createSeries('first', '현위치 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
		createSeries('second', '지역 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
		createSeries('third', '전국 평균가');

		}); // end am4core.ready()
	</script>
    
    <script>
	    function isClicked(){
	    }
    </script>
    
    <script>
    	var sido = ' ';
    	var gugun = ' ';
	    var lat = 0;
	    var lon = 0;
	    var region = ' ';
	    var district = ' ';
	    var options = {
	    	enableHighAccuracy : true,
	    	timeout : 5000,
	    	maximumAge : 0
	    };
		// 위치와 경도 받는 함수 (현 위치)
	    function success(pos) {
	    	var crd = pos.coords;
	    	lat = crd.latitude;
	    	lon = crd.longitude;
	    };
		// sleep함수 넣어준 시간만큼 기다리는 promise를 사용 with 콜백 , 미사용함 
	    function sleep(ms) {
	    	  return new Promise(resolve => setTimeout(resolve, ms));
	    }
	
	    function error(err) {
	    	console.warn('ERROR(' + err.code + '): ' + err.message);
	    };
	    
		// 현위치의 위도, 경도 받아오기 
	    navigator.geolocation.getCurrentPosition(success, error, options);
        
		//현위치 버튼 클릭 이벤트  
	    $("#btnTest").click(function() {
			// 카카오맵 API를 이용해 현위치 위도, 경도 정보를 바탕으로 도로명 주소를 받아옴
		    let geocoder = new kakao.maps.services.Geocoder();
		    let coord = new kakao.maps.LatLng(lat, lon);
			let callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        region = result[0]['address']['region_1depth_name'];
			        district = result[0]['address']['region_2depth_name'];
			        
			    }
			};
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			
			//ajax 비동기 방식 (json 사용) , url 부분 controller에 @responsebody사용 
			$.ajax({
			    type: "post", 
			    url: "/treatment/treatdetail",
			    data: {"city": region, "district": district},
			    success : function(data){
			  	  console.log("성공")
			  	
			  	  
			  	am4core.ready(function() {
		
			  	//위의 차트 코드 그대로  사용 
				var chart = am4core.create('chartdiv', am4charts.XYChart)
				chart.colors.step = 2;
				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				valueAxis.min = 500;
				
				//y축 범위를 늘림 이유는 최대값이 낮아 가격이 낮은 데이터들이 짤림 
				valueAxis.max = data[data.length - 1]['totalMax'] + 50000;
				valueAxis.strictMinMax = true; 
				var login = ${login}
				chart.legend = new am4charts.Legend()
				chart.legend.position = 'top'
				chart.legend.paddingBottom = 20
				chart.legend.labels.template.maxWidth = 95
				chart.legend.itemContainers.template.togglable = false;
				
				var xAxis = chart.xAxes.push(new am4charts.CategoryAxis())
				xAxis.dataFields.category = 'category'
				xAxis.renderer.cellStartLocation = 0.1
				xAxis.renderer.cellEndLocation = 0.9
				xAxis.renderer.grid.template.location = 0;
				
				var yAxis = chart.yAxes.push(new am4charts.ValueAxis());
				yAxis.min = 0;
				
				
				function createSeries(value, name) {
				    var series = chart.series.push(new am4charts.ColumnSeries())
				    series.dataFields.valueY = value
				    series.dataFields.categoryX = 'category'
				    series.name = name
				
				
				    var bullet = series.bullets.push(new am4charts.LabelBullet())
				    bullet.interactionsEnabled = false
				    bullet.dy = -10;
				    bullet.label.text = '{valueY}' + '원'
				    bullet.label.fontSize = 12;
				    bullet.label.fill = am4core.color('#000')
				
				    return series;
				}
				console.log(login);
				// 비로그인시,지역, 구  최저,평균,최고가 0 , 전국 평균가만 표시 
				<% if(session.getAttribute("login") == null) { %>
					chart.data = [
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가',
					        first: 0,
					        second: 0,
					        third: 0
					    },
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가 ',
					        first: 0,
					        second: 0,
					        third: 0
					    },
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가  ',
					        first: data[data.length - 1]['totalMin'],
					        second: data[data.length - 1]['totalPrice'],
					        third: data[data.length - 1]['totalMax']
					    }
					]
					
					//로그인시 모든 정보 표시 
				<% } else {%>
					chart.data = [
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가',
					        first: data[data.length - 1]['cityMin'],
					        second: data[data.length - 1]['cityPrice'],
					        third: data[data.length - 1]['cityMax']
					    },
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가 ',
					        first: data[data.length - 1]['districtMin'],
					        second: data[data.length - 1]['districtPrice'],
					        third: data[data.length - 1]['districtMax']
					    },
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가  ',
					        first: data[data.length - 1]['totalMin'],
					        second: data[data.length - 1]['totalPrice'],
					        third: data[data.length - 1]['totalMax']
					    }
					]
					
				<% } %>
				//위의 legend에 현위치 나오게 
				createSeries('first', data[0]['H_ROAD_ADDRESS'].split(' ')[0] + ' 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
				createSeries('second', data[0]['H_ROAD_ADDRESS'].split(' ')[1] + ' 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
				createSeries('third', '전국 평균가');

				}); // end am4core.ready()
			    
					//버튼 옆에 xx시 xx구 글자및 x버튼 표
			  	  document.getElementById('region').innerHTML = data[0]['H_ROAD_ADDRESS'].split(' ')[0] + ' ' + data[0]['H_ROAD_ADDRESS'].split(' ')[1];
			  	  const deleteBtn = document.getElementById('deleteBtn');
			  	  deleteBtn.innerHTML = 'clear';
			  	  //x 버튼 클릭시 페이지 리셋 , 
			  	  deleteBtn.setAttribute('href', '/treatment/treatdetail?no=' + ${TR_NO});
			  	  const parent = document.getElementById('parentul');
			  	  console.log(parent);

			  	  
			  	  //현위치 버튼 클릭시 기존태 모두 삭제 , 쿼리셀렉터 사용 
			  	document.querySelectorAll('.h--info').forEach(function(a){
			  		a.remove()
		  		})
		  		document.querySelectorAll('.h--name').forEach(function(a){
			  		a.remove()
		  		})
		  		document.querySelectorAll('.h--region').forEach(function(a){
			  		a.remove()
		  		})
		  		document.querySelectorAll('.h--time').forEach(function(a){
			  		a.remove()
		  		})
		  		document.querySelectorAll('.h--tel').forEach(function(a){
			  		a.remove()
		  		})
		  		document.querySelectorAll('.btn--detail').forEach(function(a){
			  		a.remove()
		  		})

		  		//그래프 아래에 현위치 병원, -> 5개 이상여도 5개만 , 5개 이하저장된 수만큼 
			      for(var i = 0; i < data.length - 1; i++) {
				  	  var newli = document.createElement('li');
				  	  var infoDiv = document.createElement('div');
				  	  var newDiv = document.createElement('div');
				  	  var newDiv2 = document.createElement('div');
				  	  var newDiv3 = document.createElement('div');
				  	  var newDiv4 = document.createElement('div');
				  	  var btn = document.createElement('button');
				  	  
				  	  infoDiv.classList.add('h--info');
				  	  newDiv.classList.add('h--name');
				  	  newDiv2.classList.add('h--region');
				  	  newDiv3.classList.add('h--time');
				  	  newDiv4.classList.add('h--tel');
				  	  btn.classList.add('btn');
				  	  btn.appendChild(document.createTextNode("자세히"));
				  	  let h_no = data[i]['H_NO'];
				  	  btn.setAttribute('onClick', "location.href='/hospital/view?hNo=" + h_no + "'");
				  	  					  	  
				  	  newDiv.appendChild(document.createTextNode(data[i]['H_NAME']));
				  	  newDiv2.appendChild(document.createTextNode(data[i]['H_ROAD_ADDRESS']));
				  	  newDiv3.appendChild(document.createTextNode(data[i]['H_HOUR']));
				  	  newDiv4.appendChild(document.createTextNode(data[i]['H_TEL']));
				  	  
				  	  parent.appendChild(newli);
				  	  newli.appendChild(infoDiv);
				  	  infoDiv.appendChild(newDiv);
				  	  infoDiv.appendChild(newDiv2);
				  	  infoDiv.appendChild(newDiv3);
				  	  infoDiv.appendChild(newDiv4);
				  	  infoDiv.appendChild(btn);
			  	 }
			  	  
			    },
			    error : function() {
			  	  console.log("실패")
			    }
			});
	    })
	   
	    // 전국 시/도, 구./군 저장 from google
	    $('document').ready(function() {
			   var area0 = ["시/도 선택","서울","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
			   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
			   var area3 = ["대덕구","동구","서구","유성구","중구"];
			   var area4 = ["광산구","남구","동구",     "북구","서구"];
			   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
			   var area6 = ["남구","동구","북구","중구","울주군"];
			   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
			   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
			   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
			   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
			   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
			   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
			   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
			   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
			   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
			
			 $("select[name^=sido]").each(function() {
			  $selsido = $(this);
			  $.each(eval(area0), function() {
			   $selsido.append("<option value='"+this+"'>"+this+"</option>");
			  });
			  $selsido.next().append("<option value=''>구/군 선택</option>");
			 });
			 
			 // 시/도 선택시 구/군 설정
			
			 $("select[name^=sido]").change(function() {
			  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
			  console.log(area);
			  var $gugun = $(this).next(); // 선택영역 군구 객체
			  $("option",$gugun).remove(); // 구군 초기화
			
			  if(area == "area0"){
			   $gugun.append("<option value=''>구/군 선택</option>");
			  }
			  else {
			   $.each(eval(area), function() {
			   $gugun.append("<option value='"+this+"'>"+this+"</option>");
			    
			   });
			  }
			 });
		});
	    //지연 선택 버튼 누를때 이벤트 발생 , 기본동작은 현위치버튼과 비슷 
	    $("#btnSelect").click(function() {
	    	console.log("sido1: " + sido);
			console.log("gugun: " + gugun);
	    	sido = document.getElementById('sido1').value;
	    	gugun = document.getElementById('gugun1').value;

			$.ajax({
			    type: "post", 
			    url: "/treatment/treatdetailSelect",
			    data: {"city": sido, "district": gugun},
			    success : function(data){
			  	console.log("성공")
			  	console.log(data);
			  	//해당위치 등록병원 없을시 alert
			  	if(data.length == 0)
				  window.alert("해당 위치에 등록된 병원이 없습니다.");
			  	am4core.ready(function() {
		
			  		//위에차트생성과  똑같 
				var chart = am4core.create('chartdiv', am4charts.XYChart)
				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				valueAxis.min = 500;
				valueAxis.max = data[data.length - 1]['totalMax'] + 100000;
				valueAxis.strictMinMax = true; 
				chart.colors.step = 2;
				var login = ${login}
				chart.legend = new am4charts.Legend()
				chart.legend.position = 'top'
				chart.legend.paddingBottom = 20
				chart.legend.labels.template.maxWidth = 95
				chart.legend.itemContainers.template.togglable = false;
				
				var xAxis = chart.xAxes.push(new am4charts.CategoryAxis())
				xAxis.dataFields.category = 'category'
				xAxis.renderer.cellStartLocation = 0.1
				xAxis.renderer.cellEndLocation = 0.9
				xAxis.renderer.grid.template.location = 0;
				
				var yAxis = chart.yAxes.push(new am4charts.ValueAxis());
				yAxis.min = 0;
				
				
				function createSeries(value, name) {
				    var series = chart.series.push(new am4charts.ColumnSeries())
				    series.dataFields.valueY = value
				    series.dataFields.categoryX = 'category'
				    series.name = name
				
				
				    var bullet = series.bullets.push(new am4charts.LabelBullet())
				    bullet.interactionsEnabled = false
				    bullet.dy = -10;
				    bullet.label.text = '{valueY}' + '원'
				    bullet.label.fontSize = 12;
				    bullet.label.fill = am4core.color('#000')
				
				    return series;
				}
				
				<% if(session.getAttribute("login") == null) { %>
				chart.data = [
				    {
				        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가',
				        first: 0,
				        second: 0,
				        third: 0
				    },
				    {
				        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가 ',
				        first: 0,
				        second: 0,
				        third: 0
				    },
				    {
				        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가  ',
				        first: data[data.length - 1]['totalMin'],
				        second: data[data.length - 1]['totalPrice'],
				        third: data[data.length - 1]['totalMax']
				    }
				]
				
			<% } else {%>
				chart.data = [
				    {
				        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가',
				        first: data[data.length - 1]['cityMin'],
				        second: data[data.length - 1]['cityPrice'],
				        third: data[data.length - 1]['cityMax']
				    },
				    {
				        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가 ',
				        first: data[data.length - 1]['districtMin'],
				        second: data[data.length - 1]['districtPrice'],
				        third: data[data.length - 1]['districtMax']
				    },
				    {
				        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가  ',
				        first: data[data.length - 1]['totalMin'],
				        second: data[data.length - 1]['totalPrice'],
				        third: data[data.length - 1]['totalMax']
				    }
				]
				
			<% } %>
				createSeries('first', data[0]['H_ROAD_ADDRESS'].split(' ')[0] + ' 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
				createSeries('second', data[0]['H_ROAD_ADDRESS'].split(' ')[1] + ' 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
				createSeries('third', '전국 평균가');

				}); // end am4core.ready()
			    
			  	  document.getElementById('region').innerHTML = data[0]['H_ROAD_ADDRESS'].split(' ')[0] + ' ' + data[0]['H_ROAD_ADDRESS'].split(' ')[1];
			  	const deleteBtn = document.getElementById('deleteBtn');
			  	  deleteBtn.innerHTML = 'clear';
			  	  deleteBtn.setAttribute('href', '/treatment/treatdetail?no=' + ${TR_NO});
			  	  
			  	  
			  	  const parent = document.getElementById('parentul');
			  	  
				  	document.querySelectorAll('.h--info').forEach(function(a){
				  		a.remove()
			  		})
			  		document.querySelectorAll('.h--name').forEach(function(a){
				  		a.remove()
			  		})
			  		document.querySelectorAll('.h--region').forEach(function(a){
				  		a.remove()
			  		})
			  		document.querySelectorAll('.h--time').forEach(function(a){
				  		a.remove()
			  		})
			  		document.querySelectorAll('.h--tel').forEach(function(a){
				  		a.remove()
			  		})
			  		document.querySelectorAll('.btn--detail').forEach(function(a){
				  		a.remove()
			  		})
			  		
			  	  

			      for(var i = 0; i < data.length - 1; i++) {
				  	  var newli = document.createElement('li');
				  	  var infoDiv = document.createElement('div');
				  	  var newDiv = document.createElement('div');
				  	  var newDiv2 = document.createElement('div');
				  	  var newDiv3 = document.createElement('div');
				  	  var newDiv4 = document.createElement('div');
				  	  var btn = document.createElement('button');
				  	  
				  	  infoDiv.classList.add('h--info');
				  	  newDiv.classList.add('h--name');
				  	  newDiv2.classList.add('h--region');
				  	  newDiv3.classList.add('h--time');
				  	  newDiv4.classList.add('h--tel');
				  	  btn.classList.add('btn--detail');
				  	  btn.appendChild(document.createTextNode("자세히"));
				  	  let h_no = data[i]['H_NO'];
				  	  btn.setAttribute('onClick', "location.href='/hospital/view?hNo=" + h_no + "'");
				  	  					  	  
				  	  newDiv.appendChild(document.createTextNode(data[i]['H_NAME']));
				  	  newDiv2.appendChild(document.createTextNode(data[i]['H_ROAD_ADDRESS']));
				  	  newDiv3.appendChild(document.createTextNode(data[i]['H_HOUR']));
				  	  newDiv4.appendChild(document.createTextNode(data[i]['H_TEL']));
				  	  
				  	  parent.appendChild(newli);
				  	  newli.appendChild(infoDiv);
				  	  infoDiv.appendChild(newDiv);
				  	  infoDiv.appendChild(newDiv2);
				  	  infoDiv.appendChild(newDiv3);
				  	  infoDiv.appendChild(newDiv4);
				  	  infoDiv.appendChild(btn);
			  	 }
			  	  
			    },
			    error : function() {
			  	  console.log("실패")
			    }
			});
	    })
    </script>
    
    
     
    
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>