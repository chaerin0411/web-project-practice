<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String verified = (String)session.getAttribute("verified");
	if (verified != null) { %>
		<script>alert("이미 찜한 상품입니다!");</script><%
		session.removeAttribute("verified");
	}
%>
<head>
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/info.css" type="text/css" media="screen" />
</head>

<!-- information.jsp -->
<body>
<header><!-- header 시작 -->
	<nav id="navi">	<!-- navi 시작 -->
		<ul>
			<li><a href="index.jsp?CONTENTPAGE=content.jsp">
				<img src="img/home.png"></a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=information.jsp">여행지 정보</a></li>
		</ul>
	</nav><!-- navi 끝 -->
</header><!-- header 끝 -->

<!-- section main 시작 -->
<section id="main">
	<!-- section category1 시작 -->
	<section id="category1">
            <div id="head">
                <h3>국내여행</h3>
                <div id="switch"><!-- toggle 버튼 시작 -->
                    <input type="checkbox" id="switch-input" checked>
                    <span id="switch-label" data-on="국내" data-off="국외"></span>
                    <span id="switch-handle"></span>
                </div><!-- toggle 버튼 끝 -->
            </div>
			
			<ul>
				<li>가평·양평</li>
				<li>강릉·속초</li>
				<li>경주</li>
				<li style="color: #2F6AB8;">부산</li>
				<li>여수</li>
				<li>인천</li>
				<li>전주</li>
			</ul>
			<select style="height: 35px;">
				<option value="국내">국내
				<option value="해외">해외	
			</select>
			<input type="search" placeholder="search" style="width: 400px; height: 35px; border-radius: 0px;">
	</section><!-- section category1 끝 -->

	<!-- section category2 시작 -->
	<section id="category2">
		<div id="ct1" class="category2_title">
			<h3>관광명소</h3>
			<h4>요새 부산에서 핫한 관광지는?</h4>
		</div>
		<!-- category2_travel 시작 -->
		<div id="cr1" class="category2_travel">         
			<div class="items">
				<a href="cart/cart_control.jsp?action=search&product_no=P001"><img src="img/bridge.JPG"></a>
				<div class="itemp">
				<p class="title">광안대교</p>
				<p class="rating">&#9733;4.5(252)</p>
				<p class="comment">관광명소 부산 수영구<br>교량, 다리</p>
				</div>
			</div>                    
			<div class="items">
				<a href="cart/cart_control.jsp?action=search&product_no=P002"><img src="img/thebay.jpg"></a>
				<div class="itemp">
				<p class="title">더베이101</p>
				<p class="rating">&#9733;4.8(124)</p>
				<p class="comment">관광명소 부산 해운대구<br>문화시설</p>
				</div>
			</div>                                       
			<div class="items">	
				<a href="cart/cart_control.jsp?action=search&product_no=P003"><img src="img/sujung.jpg"></a>
				<div class="itemp">
				<p class="title">수정동</p>
				<p class="rating">&#9733;4.1(156)</p>
				<p class="comment">관광명소 부산 동구<br>마을</p>
				</div>
			</div> 
		</div><!-- category2_travel 끝 -->
		<!-- 세로선 --><div class="updown"></div>
		<div id="ct2" class="category2_title">
			<h3>맛집</h3>
			<h4>요새 부산에서 핫한 맛집은?</h4>
		</div>
		<!-- category2_travel 시작 --> 
		<div id="cr2" class="category2_travel">          
			<div class="items">
				<a href="cart/cart_control.jsp?action=search&product_no=P004"><img src="img/gukbab.png"></a>
				<div class="itemp">
				<p class="title">수변최고…</p>
				<p class="rating">&#9733;4.2(115)</p>
				<p class="comment">맛집 부산 수영구<br>국밥</p>
				</div>
			</div>                    
			<div class="items">
				<a href="cart/cart_control.jsp?action=search&product_no=P005"><img src="img/magnate.png"></a>
				<div class="itemp">
				<p class="title">메그네이트</p>
				<p class="rating">&#9733;3.9(227)</p>
				<p class="comment">맛집 부산 남구<br>카페</p>
				</div>
			</div>                                       
			<div class="items">
				<a href="cart/cart_control.jsp?action=search&product_no=P006"><img src="img/pizza.jpg"></a>
				<div class="itemp">
				<p class="title">이재모피자</p>
				<p class="rating">&#9733;4.5(571)</p>
				<p class="comment">맛집 부산 중구<br>피자</p>
				</div>
			</div>                 
		</div><!-- category2_travel 끝 -->
	</section><!-- section category2 끝 -->
</section><!-- section main 끝 -->
</body>