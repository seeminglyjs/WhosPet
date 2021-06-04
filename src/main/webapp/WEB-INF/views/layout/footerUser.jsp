<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div><!-- 본문컨테이너 끝  -->
<div id="footerDiv">
  <div class="footerInfo">
        <footer>
            <div class="container">
                <div style="display: flex; justify-content: center; border-bottom: 1px solid white; padding-left: 70px;">
                    <div>
						<a href="/"><img alt="로고" src="/resources/img/footerlogo.png" id="footerLogo"></a>
                    </div>
                    <div style="padding-left: 70px">
                        <h3>Services</h3>
                        <ul class="footerlist">
                            <li><a href="/">메인 화면</a></li>
                            <li><a href="#">증상 / 질병 확인</a></li>
                            <li><a href="/board/list">WhosPet 게시판</a></li>
                        </ul>
                    </div>
                    <div style="padding-left: 70px;">
                        <h3>WhosPet</h3>
                        <p>Kh정보 교육원 파이널 프로젝트 1조 [ 프로젝트: WhosPet ]</p>
                        <p>Groups: 강민서, 고이삭, 기보람, 손홍백, 유상우, 장성우</p>
                    </div>
                </div>
                <div class="text-center" style="padding-top: 12px;">
                <p class="copyright">Copyright © WhosPet 2021. All Rights reserved</p>
           		</div>
            </div>
        </footer>
    </div>
</div><!--footer 컨테이너 끝  -->

</div><!-- 전체컨테이너 끝  -->
</body>

<!-- footer css  -->
<style type="text/css">

/* 전체 footer div*/
#footerDiv{
	position: absolute;
    left: 0;
    bottom: 0;
   	width:100%;
	min-width: 1120px;
	background-color: #fff;
}

/* footer 링크  */
.footerlist li a{
	color:white;
}

/* footer 이미지 */
#footerLogo{
	width: 200px;
	height: 60px;
}


.container .row {
	border-bottom: 0.5px solid white;
}

.footerInfo {
  padding: 20px 0px;
  color:white;
  background-color:#aaaaaa;
}

.footerInfo h3 {
  margin-top:0;
  margin-bottom:12px;
  font-weight:bold;
  font-size:16px;
}

.footerInfo ul {
  padding:0;
  list-style:none;
  line-height:1.6;
  font-size:14px;
}
 
</style>
</html>