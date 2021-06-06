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
       color: #000;
     }
     
	.btn {
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
	    background-color: #333;
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
	}
	
	.h--list {
	  list-style: none;
	  font-size: 20px;
	  margin:0;
	}
	
	.h--info{
	  display:flex;
	  width: 1400px;
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
      <form action="/treatSearchDetail" class="Search" method="post">
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
    <div class="container--location">
    
	    <input type="button" class="btn" id="btnTest" onclick="isClicked()" value="현위치">
 	    <span id="region"></span>
    </div>
    <br>
    <center>
    
    <div class="container--chartbox" id="container--chartbox">
		<h2>${treatment.TR_NAME}</h2>
		<% if(session.getAttribute("login") == null) { %>
		  <h3>현위치 및 특정 지역 평균가는 로그인 하시면 보실 수 있습니다.</h3>
		<% } %>
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
		
		var chart = am4core.create('chartdiv', am4charts.XYChart)
		chart.colors.step = 2;
		var login = <%session.getAttribute("login");%>
		console.log(login);
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
		console.log(login);
		
		
		function createSeries(value, name) {
		    var series = chart.series.push(new am4charts.ColumnSeries())
		    series.dataFields.valueY = value
		    series.dataFields.categoryX = 'category'
		    series.name = name
		
		
		    var bullet = series.bullets.push(new am4charts.LabelBullet())
		    bullet.interactionsEnabled = false
		    bullet.dy = 20;
		    bullet.label.text = '{valueY}' + '원'
		    bullet.label.fill = am4core.color('#ffffff')
		
		    return series;
		}
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
    	var count = 0;
	    var lat = 0;
	    var lon = 0;
	    var region = ' ';
	    var district = ' ';
	    var options = {
	    	enableHighAccuracy : true,
	    	timeout : 5000,
	    	maximumAge : 0
	    };
	
	    function success(pos) {
	    	var crd = pos.coords;
	    	lat = crd.latitude;
	    	lon = crd.longitude;
	    };
	    
	    function sleep(ms) {
	    	  return new Promise(resolve => setTimeout(resolve, ms));
	    }
	
	    function error(err) {
	    	console.warn('ERROR(' + err.code + '): ' + err.message);
	    };
	    

	    navigator.geolocation.getCurrentPosition(success, error, options);
        
	    $("#btnTest").click(function() {
		    let geocoder = new kakao.maps.services.Geocoder();
		    let coord = new kakao.maps.LatLng(lat, lon);
			let callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        region = result[0]['address']['region_1depth_name'];
			        district = result[0]['address']['region_2depth_name'];
			    }
			};
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			$.ajax({
			    type: "post", 
			    url: " /treatment/treatdetail",
			    data: {"city": region, "district": district},
			    success : function(data){
			  	  console.log("성공")
			  	  am4core.ready(function() {
		
				var chart = am4core.create('chartdiv', am4charts.XYChart)
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
				    bullet.dy = 20;
				    bullet.label.text = '{valueY}' + '원'
				    bullet.label.fill = am4core.color('#ffffff')
				
				    return series;
				}
				
				if(login){
					chart.data = [
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가',
					        first: ${cityMin} + 0,
					        second: ${cityPrice} + 0,
					        third: ${cityMax} + 0
					    },
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가 ',
					        first: ${districtMin} + 0,
					        second: ${districtPrice} + 0,
					        third:${districtMax} + 0
					    },
					    {
					        category: '최저가ㅤㅤㅤ평균가ㅤㅤㅤ최고가  ',
					        first: ${totalMin} + 0,
					        second:${totalPrice} + 0,
					        third: ${totalMax} + 0
					    }
					]
				}
				
				else{
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
					        third:  0
					    }
					]
				}
				console.log();
				createSeries('first', data[0]['H_ROAD_ADDRESS'].split(' ')[0] + ' 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
				createSeries('second', data[0]['H_ROAD_ADDRESS'].split(' ')[1] + ' 평균가ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ');
				createSeries('third', '전국 평균가');

				}); // end am4core.ready()
			    
			  	  console.log(data[0]);
			  	  document.getElementById('region').innerHTML = data[0]['H_ROAD_ADDRESS'].split(' ')[0] + ' ' + data[0]['H_ROAD_ADDRESS'].split(' ')[1];
			  	  const parent = document.getElementById('parentul');
			  	  console.log(parent);

			  	  if(count == 0){
				      <% for(int i = 0; i < 5; i++) { %>
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
					  	  <% int h_no = Integer.parseInt(orderedList.get(i).get("H_NO").toString()); %>
					  	  btn.setAttribute('onClick', "location.href='/hospital/view?hNo=<%=h_no%>'");
					  	  					  	  
					  	  newDiv.appendChild(document.createTextNode(data[<%=i%>]['H_NAME']));
					  	  newDiv2.appendChild(document.createTextNode(data[<%=i%>]['H_ROAD_ADDRESS']));
					  	  newDiv3.appendChild(document.createTextNode(data[<%=i%>]['H_HOUR']));
					  	  newDiv4.appendChild(document.createTextNode(data[<%=i%>]['H_TEL']));
					  	  
					  	  parent.appendChild(newli);
					  	  newli.appendChild(infoDiv);
					  	  infoDiv.appendChild(newDiv);
					  	  infoDiv.appendChild(newDiv2);
					  	  infoDiv.appendChild(newDiv3);
					  	  infoDiv.appendChild(newDiv4);
					  	  infoDiv.appendChild(btn);
				  	 <% } %>
			  	  }
			  	  
			    },
			    error : function() {
			  	  console.log("실패")
			    }
			});
	    })
    </script>
    
    
     
    
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>