<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/layout/headerUser.jsp" %>
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
       margin-left: 150px;
       
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
      
      </style>
   
   
   
    <script>
      window.console = window.console || function (t) {};
    </script>
    <script>
      if (document.location.search.match(/type=embed/gi)) {
        window.parent.postMessage("resize", "*");
      }
    </script>
   
   
    <div class="container">
    <h1>진료비 검색</h1>
     <hr>
     <br>
      <form action="/treatdetail" class="Search">
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
    <center>
       <div class="container">
         <span class="content">진료비: ${numOftreat}건</span>
         <span class="content">병원 : ${numOfhospital}건</span>
       </div>
    </center>
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
     <div class="container list">
	     <ul class="content-list">
	     <h1>검진</h1>
	     	<c:forEach var="v" items="${VList}">
	     		<li>
	     			<a href="/treatment/treatdetail?no=${v.TR_NO}">${v.TR_NAME}</a>
	     		</li>
	     	</c:forEach>
	     </ul>
	     <ul class="content-list">
	     <h1>수술</h1>
	     	<c:forEach var="s" items="${SList}">
	     		<li>
	     			<a href="/treatment/treatdetail?no=${s.TR_NO}">${s.TR_NAME}</a>
	     		</li>
	     	</c:forEach>
	     </ul>
	     <ul class="content-list">
	     <h1>진료</h1>
	     	<c:forEach var="c" items="${CList}">
	     		<li>
	     			<a href="/treatment/treatdetail?no=${c.TR_NO}">${c.TR_NAME}</a>
	     		</li>
	     	</c:forEach>
	     </ul>
     </div>
     
    
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>