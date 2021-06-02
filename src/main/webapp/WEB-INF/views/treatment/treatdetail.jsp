<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-latest.min.js"></script>
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
     
    #container--chart {
	    margin-top: 50px;
	    height: 420px;
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
	
	.container--chart {
	    margin: 20px;
	    padding: 20px;
	    margin-bottom: -15px;
	    overflow: hidden;
	    display: flex;
    }
    
	.vertical .progress-bar {
	  height: 300px;
	  width: 40px;
	  margin-right: 25px;
	}

	.vertical .progress-track {
	  position: relative;
	  width: 40px;
	  height: 100%;
	  background: #fff;
	}

	.vertical .progress-fill {
	  position: relative;
	  background: #825;
	  height: 50%;
	  width: 10px;
	  color: #fff;
	  text-align: center;
	  font-family: "Lato","Verdana",sans-serif;
	  font-size: 12px;
	  line-height: 20px;
	}

	.rounded .progress-fill {
	  box-shadow: inset 0 0 5px rgba(0,0,0,.2);
	  border-radius: 3px;
	}
	
	.container--city,
	.container--ward,
	.container--country {
	  margin-left: 120px;
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
	}
	
	.h--info{
	  display:flex;
	  justify-content: center;
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
      <form action="" class="Search">
        <input
          class="Search-box"
          type="search"
          id="Search-box"
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
	    <input type="button" class="btn" id="btnTest" onClick="isLogin();" value="현위치">
 	    <span id="region"></span>
    </div>
    <br>
    <center>
    
    <div class="container--chartbox">
		<h2>${treatment.TR_NAME}</h2>
	    <div class="container--chart vertical rounded">
	    
		<div class="container--city">
		<h3 id="city">평균가</h3>
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#73EEB2">
		        <span style="display:none">30%</span>
		      </div>
		    </div>
		  </div>
		
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#5F9EA0">
		        <span style="display:none">60%</span>
		      </div>
		    </div>
		  </div>
		
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#00BFFF">
		        <span style="display:none">90%</span>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="container--ward">
		<h3 id="district">평균가</h3>
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#73EEB2">
		        <span style="display:none">30%</span>
		      </div>
		    </div>
		  </div>
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#5F9EA0">
		        <span style="display:none">60%</span>
		      </div>
		    </div>
		  </div>
		  
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#00BFFF">
		        <span style="display:none">90%</span>
		      </div>
		    </div>
		  </div>
		  
		</div>
		<div class="container--country">
		<h3>전국 평균가</h3>
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#73EEB2">
		        <span style="display:none">30%</span>
		      </div>
		    </div>
		  </div>
		
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#5F9EA0">
		        <span style="display:none">60%</span>
		      </div>
		    </div>
		  </div>
		  
		  <div class="progress-bar">
		    <div class="progress-track">
		      <div class="progress-fill" style="background-color:#00BFFF">
		        <span style="display:none">90%</span>
		      </div>
		    </div>
		  </div>
		</div>
	  </div>
	</div>
	
	</center>
	
	<div class="container--hospital">
	  <ul class="h--list">
	  <li>
	    <div class="h--info">
		  	<div class="h--name">병원1</div>
		  	<div class="h--region">지역1</div>
		  	<div class="h--time">진료시간1</div>
		  	<div class="h--tel">전화번호1</div>
		  	<input type="button" class="btn" value="자세히">
	  	</div>
	  </li>
	  <li>
	    <div class="h--info">
		  	<div class="h--name">병원2</div>
		  	<div class="h--region">지역2</div>
		  	<div class="h--time">진료시간2</div>
		  	<div class="h--tel">전화번호2</div>
		  	<input type="button" class="btn" value="자세히">
	  	</div>
	  </li>
	  <li>
	    <div class="h--info">
		  	<div class="h--name">병원3</div>
		  	<div class="h--region">지역3</div>
		  	<div class="h--time">진료시간3</div>
		  	<div class="h--tel">전화번호3</div>
		  	<input type="button" class="btn" value="자세히">
	  	</div>
	  </li>
	  <li>
	    <div class="h--info">
		  	<div class="h--name">병원4</div>
		  	<div class="h--region">지역4</div>
		  	<div class="h--time">진료시간4</div>
		  	<div class="h--tel">전화번호4</div>
		  	<input type="button" class="btn" value="자세히">
	  	</div>
	  </li>
	  <li>
	    <div class="h--info">
		  	<div class="h--name">병원5</div>
		  	<div class="h--region">지역5</div>
		  	<div class="h--time">진료시간5</div>
		  	<div class="h--tel">전화번호5</div>
		  	<input type="button" class="btn" value="자세히">
	  	</div>
	  </li>
	  </ul>
	</div>
	
	<script>
    	$('.vertical .progress-fill span').each(function(){
    	  var percent = $(this).html();
    	  var pTop = 100 - ( percent.slice(0, percent.length - 1) ) + "%";
    	  $(this).parent().css({
    	    'height' : percent,
    	    'top' : pTop
    	  });
    	});
    </script>
    
    <script>
      function isLogin() {
    	  console.log("hello");
      }
    </script>
    
    <script>
	    var lat = 0;
	    var lon = 0;
	    var district = ' ';
	    var options = {
	    	enableHighAccuracy : true,
	    	timeout : 5000,
	    	maximumAge : 0
	    };
	
	    function success(pos) {
	    	var crd = pos.coords;
	    	console.log('위도 : ' + crd.latitude);
	    	console.log('경도: ' + crd.longitude);
	    	lat = crd.latitude;
	    	lon = crd.longitude;
	    };
	
	    function error(err) {
	    	console.warn('ERROR(' + err.code + '): ' + err.message);
	    };
	
	    $("#btnTest").click(function() {
	      navigator.geolocation.getCurrentPosition(success, error, options);
	      getAddr(lat,lon);
	      function getAddr(lat,lon){
	          let geocoder = new kakao.maps.services.Geocoder();
	
	          let coord = new kakao.maps.LatLng(lat, lon);
	          let callback = function(result, status) {
	              if (status === kakao.maps.services.Status.OK) {
	                  console.log(result[0]['address']);
	                  district = result[0]['address']['region_2depth_name'];
	                  document.getElementById('region').innerText = result[0]['address']['region_1depth_name'] + "시 " + result[0]['address']['region_2depth_name'];
	                  document.getElementById('city').innerText = result[0]['address']['region_1depth_name'] + "시 평균가";
	                  document.getElementById('district').innerText = result[0]['address']['region_2depth_name'] + " 평균가";
	              }
	          };
	          geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	          $.ajax({
	              type: "post", 
	              url: "/treatment/treatlist",
	              data: "region=" + district,
	              success : function(data){
	            	  console.log("성공")
	              },
	              error : function() {
	            	  console.log("실패")
	              }
	          });
	      }
	
	    })



    </script>
    
    
     
    
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>