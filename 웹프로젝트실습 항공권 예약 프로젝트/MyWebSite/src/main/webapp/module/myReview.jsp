<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/my.css" type="text/css" media="screen" />
</head>

<!-- myReview.jsp -->
<body>
<header><!-- header 시작 -->
	<nav id="navi"><!-- navi 시작 -->
		<ul>
			<li><a href="index.jsp?CONTENTPAGE=content.jsp">
				<img src="img/home.png"></a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=myFlight.jsp">마이 페이지</a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=myReview.jsp">나의 리뷰</a></li>
		</ul>
	</nav><!-- navi 끝 -->
	<jsp:include page="left.jsp" flush="false"/>
</header><!-- header 끝 -->

<!-- section main 시작 -->
<section id="main">
	<!-- section category 시작 -->
	<section id="category">
		<h3>나의 리뷰</h3>
		<input class="selected" type="button" value="관광명소" style="width: 375px;">
		<input type="button" value="맛집" style="width: 375px;"><br>

		<div id="search">
			<select><option value="카테고리 전체">카테고리 전체</select>
			<input type="date" placeholder="연도-월-일"> ~
			<input type="date" placeholder="연도-월-일">
			<input type="search" placeholder="검색">
		</div>

		<!-- category_list 시작 -->
		<div id="category_list">
			<div class="items">
				<div class="ihead">
					<h3>2021.09.27(월)</h3>
					<a href="#">상세보기 》</a>
				</div>
				<div class="idetail">숙소 예약번호: 210927123454732891029</div>
				<a href="#"><img src="img/ellisia.png"></a>
				<div class="itemp">
					<p class="title">엘리시아</p>
					<p class="comment" style="margin-bottom: 12px; color: gray;">
						룸B 402호<br> 2021.10.08(금) ~ 2021.10.09(토), 1박<br> 
						체크인 15:00 ~ 체크아웃 11:00
					</p><hr>
					<p class="title" style="margin-top: 7px;">리뷰 내용</p>
					<p class="comment">
						방도 넓고 깨끗하고 직원들도 친절하고<br> 
						사랑하는 사람들이랑 좋은 시간 보내다왔어요 ㅎㅎ
					</p>
				</div>
				<div class="ibtn">
					<input type="submit" value="이용 정보">
					<input type="submit" value="리뷰 수정">
					<input type="submit" value="리뷰 삭제">
				</div>
			</div>
		</div><!-- category_list 끝 -->
	</section><!-- section category 끝 -->
</section><!-- section main 끝 -->
</body>