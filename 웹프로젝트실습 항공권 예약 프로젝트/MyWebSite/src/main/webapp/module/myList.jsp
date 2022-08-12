<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, cartManagement.*"%>
<jsp:useBean id="cDatas" scope="session" class="java.util.ArrayList"/>

<head>
	<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/my.css" type="text/css" media="screen" />
</head>
<script type="text/javascript">
	function check(cart_no) {
		document.location.href="cart/cart_control.jsp?action=edit&cart_no="+cart_no;
	}
</script>

<!-- myList.jsp -->
<body>
<header><!-- header 시작 -->
	<nav id="navi"><!-- navi 시작 -->
		<ul>
			<li><a href="index.jsp?CONTENTPAGE=content.jsp">
				<img src="img/home.png"></a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=myFlight.jsp">마이 페이지</a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=myList.jsp">나의 저장</a></li>
		</ul>
	</nav><!-- navi 끝 -->
	<jsp:include page="left.jsp" flush="false"/>
</header><!-- header 끝 -->

<!-- section main 시작 -->
<section id="main">
	<!-- section category 시작 -->
	<section id="category">
		<h3>나의 찜 목록</h3>
		<input class="selected" type="button" value="관광명소" style="width: 375px;">
		<input type="button" value="맛집" style="width: 375px;"><br>

		<div id="search">
			<select>
				<option value="피자">피자
				<option value="카페">카페
				<option value="국밥">국밥
			</select>
			<input type="date" placeholder="연도-월-일"> ~
			<input type="date" placeholder="연도-월-일">
			<input type="search" placeholder="검색">
		</div>
		
		<!-- category_list 시작 -->
		<div id="category_list">
			<% for(CartBook cb : (ArrayList<CartBook>)cDatas) { %>
			<div class="items" style="height: 200px;">
				<svg class="list" viewBox="0 0 32 32" data-svg-content="true" 
					xmlns="http://www.w3.org/2000/svg" 
					xmlns:xlink="http://www.w3.org/1999/xlink" 
					width="32" height="32" fill="rgb(231, 76, 60)">
					<g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z">
				</path></g></svg>
				<a href="javascript:check(<%= cb.getCart_no() %>)">
				<img src="<%= cb.getSrc() %>"></a>
				<div class="itemp">
					<p class="title"><%=cb.getProduct_name() %></p>
					<p class="comment">
						<%=cb.getProduct_detail() %><br> 평점
						<%=cb.getReview() %>(<%=cb.getRatings() %>) · 찜 723<br> 330km｜
						<%=cb.getDistinguishing() %><br>
						<br> 주소:
						<%=cb.getLocation() %><br> 전화:<%=cb.getTel() %><br>
						홈페이지: https://www.instagram.com/leejeamo…<br>
					</p>
					<p class="comment"><%=cb.getTime() %></p>
				</div>
			</div><% } %>
		</div><!-- category_list 끝 -->
	</section><!-- section category 끝 -->
</section><!-- section main 끝 -->
</body>