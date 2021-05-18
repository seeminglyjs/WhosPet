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
      /* border-box */
      html {
        box-sizing: border-box;
      }
      *,
      *:before,
      *:after {
        box-sizing: inherit;
      }

      /* Undoes normalize.css setting box-sizing to content-box */
      input[type="search"] {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        height: calc(100vh - 8em);
        font-family: "Muli", sans-serif;
        background-color: #f9f9f9;
      }

      .container {
        width: 1000px;
        margin: 50px auto;
        overflow: hidden;
      }

      /**
 * The search field needs to be a little smaller than its container but when
 * focused it needs to grow to the whole width of its container.
 *
 * I wanted the icon to be specified in the html instead of a background so
 * I could use fontawesome.
 *
 * I use flexbox so that the search box grows to the whole width of its
 * container (minus the margins when it's not focused).
 *
 * When the search box is focused the icon moves horizontally the width of the
 * margin. To be able to target the label I used the adjacent sibling selector.
 *
 */

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

      h1 {
        text-align: center;
        margin: 1.5em;
      }

      .items {
        display: flex;
        align-items: center;
        width: fit-content;
        animation: carouselAnim 50s infinite alternate linear;
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

      .entry p {
        text-align: center;
        padding: 1em;
      }

      .name {
        font-weight: bold;
      }

      @keyframes carouselAnim {
        from {
          transform: translate(0, 0);
        }
        to {
          transform: translate(calc(-100% + (5 * 300px)));
        }
      }

      .container .faders {
        width: 100%;
        position: absolute;
        height: 100%;
      }

      .faders .right,
      .faders .left {
        background: linear-gradient(
          to right,
          rgba(245, 245, 245, 1) 0%,
          rgba(255, 255, 255, 0) 100%
        );
        width: 15%;
        height: 100%;
        position: absolute;
        z-index: 200;
      }

      .right {
        right: 0;
        background: linear-gradient(
          to left,
          rgba(245, 245, 245, 1) 0%,
          rgba(255, 255, 255, 0) 100%
        );
      }

      .quote {
        color: #aaaaaa;
      }

      span {
        margin-right: 30px;
        width: 100px;
        height: 100px;
        background-color: #fff;
        border-radius: 20%;
        text-align: center;
        line-height: 100px;
        display: inline-block;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.26);
        color: rgba(0, 0, 0, 0.7);
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
  </head>
  
  
    <div class="container">
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
    <div class="container">
      <span>진료비: 1000건</span>
      <span>병원 : 100건</span>
    </div>
    <div class="container">
      <div class="faders">
        <div class="left"></div>
        <div class="right"></div>
      </div>
      <div class="items">
        <div class="entry">
          <h3 class="name">사상충</h3>
          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">x레이</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">피부도말검사</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">중성화</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">사상충</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">사상충</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">사상충</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
        <div class="entry">
          <h3 class="name">사상충</h3>

          <p class="quote">가격 : 50000원</p>
        </div>
      </div>
    </div>
  </body>
    
    
    
    
    
<%@ include file="/WEB-INF/views/layout/footerUser.jsp" %>