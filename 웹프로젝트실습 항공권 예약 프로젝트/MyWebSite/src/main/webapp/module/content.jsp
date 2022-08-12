<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- content.jsp -->
<!-- section main 시작 -->
<section id="main">
	<!-- section category1 시작 -->
	<section id="category1">
		<div id="category1_carousel">
			<div class="window">
				<ul class="container">
					<li><img class="cimg selected" src="img/c1.jpg"></li>
					<li><img class="cimg" src="img/c2.jpg"></li>
					<li><img class="cimg" src="img/c3.jpg"></li>
					<li><img class="cimg" src="img/c4.jpg"></li>
				</ul>
			</div>
			<ul class="buttons">
				<li><div id="1" class="button selected"></div></li>
				<li><div id="2" class="button"></div></li>
				<li><div id="3" class="button"></div></li>
				<li><div id="4" class="button"></div></li>
			</ul>
			<button id="clarr" class="prev carr"><img src="img/larrow.png"></button>
			<button id="crarr" class="next carr"><img src="img/rarrow.png"></button>
		</div>
		<div id="category1_menu">
			<ul>
				<li class="selected"><a href="reservation/reservation_control.jsp?action=myPage"><b>&#128467;</b> 예약 조회</a></li>
				<li><a href="index.jsp?CONTENTPAGE=myHotel.jsp"><b>&#128477;</b> 체크인</a></li>
				<li><a href="index.jsp?CONTENTPAGE=reservation.jsp"><b>&#9992;</b> 항공권 현황</a></li>
			</ul>
		</div>
	</section><!-- section category1 끝 -->
	<br>

	<!-- section category2 시작 -->
	<section id="category2">
		<div id="category2_title"><h3>여행지 추천</h3></div>
		<!-- category2_travel 시작 -->    
		<div id="category2_travel">       
			<div class="items">
				<a href="reservation/reservation_control.jsp?action=specialSearch&start_port=ICN&end_port=KIX"><img src="img/osaka.jpg"></a>
				<div class="itemp">
				<p class="title">서울/인천 - 오사카</p>
				<p class="comment">일반석 왕복</p>
				<p class="price">KRW 270,000원 ~</p>
				</div>
			</div>                    
			<div class="items">
				<a href="reservation/reservation_control.jsp?action=specialSearch&start_port=ICN&end_port=HKG"><img src="img/hongkong.jpg"></a>
				<div class="itemp">
					<p class="title">서울/인천 - 홍콩</p>
					<p class="comment">일반석 왕복</p>
					<p class="price">KRW 380,000원 ~</p>
				</div>
			</div>                                       
			<div class="items">
				<a href="reservation/reservation_control.jsp?action=specialSearch&start_port=ICN&end_port=GRU"><img src="img/brazil.jpg"></a>
				<div class="itemp">
					<p class="title">서울/인천 - 브라질</p>
					<p class="comment">일반석 왕복</p>
					<p class="price">KRW 520,000원 ~</p>
				</div>
			</div>                    
			<div class="items">
				<a href="reservation/reservation_control.jsp?action=specialSearch&start_port=ICN&end_port=HNL"><img src="img/hawaii.jpg"></a>
				<div class="itemp">
					<p class="title">서울/인천 - 하와이</p>
					<p class="comment">일반석 왕복</p>
					<p class="price">KRW 700,000원 ~</p>
				</div>
			</div>                    
		</div><!-- category2_travel 끝 -->
		
		<!--  category2_travel_img 시작 -->
		<div id="category2_travel_img">
			<div id="category2_travel_imgcmt">
				<p><b>여행의 모든 것</b></p>
				<p><b>TRIP으로 한번에</b></p>
				<p class="firstp">흩어져 있는 여행정보를 한눈에</p>
				<p>깔끔하고 자세한 도시별 가이드</p>
				<p>여행을 공유하는 소통의 장소</p>
				<p>검색 지옥에서 해방될 시간</p>
			</div>
			<img src="img/triple.png">
		</div><!--  category2_travel_img 끝 -->
	</section><!-- section category2 끝 -->
</section><!-- section main 끝 -->