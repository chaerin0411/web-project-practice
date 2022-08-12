<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, reservationManagement.*, memberManagement.*"%>

<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session" />
<jsp:useBean id="rb" class="reservationManagement.ReservationBook" scope="session" />
<jsp:useBean id="sDatas" scope="session" class="java.util.ArrayList" />
<% String sel = ""; if(rb.getStart_port() == null) sel = "selected"; %>

<head>
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<!-- reservation.jsp -->
<body>
<header><!-- header 시작 -->
	<nav id="navi"><!-- navi 시작 -->
		<ul>
			<li><a href="index.jsp?CONTENTPAGE=content.jsp">
				<img src="img/home.png"></a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=reservation.jsp">항공권 예약</a></li>
		</ul>
	</nav><!-- navi 끝 -->
</header><!-- header 끝 -->

<!-- section main 시작 -->
<section id="main">
	<h3>여정/날짜 선택</h3>
	<form name=reservation method=post
		action=reservation/reservation_control.jsp>
		<input type=hidden name="action" value="csearch">
		
		<!-- 선택 시작 -->
		<input id="btnw" type="button" value="왕복">
		<input id="btnp" type="button" value="편도">
		<table>
			<tr>
				<th>날짜</th>
				<td><input type="date" name="date" value="2021-12-08"></td>
			</tr>
			<tr>
				<th>출발지</th>
				<td><select name="start_port">
						<option value="<%= rb.getStart_port() %>">
						<%= rbean.getAirport(rb.getStart_port()) %>
						<option value="BKK">방콕
						<option value="CDG">파리
						<option value="CJU">제주
						<option value="GMP" <%= sel %>>김포
						<option value="GRU">상파울로
						<option value="HKG">홍콩
						<option value="HNL">하와이
						<option value="ICN">인천
						<option value="JFK">뉴욕
						<option value="KIX">오사카
						<option value="LHR">런던
						<option value="NRT">도쿄
						<option value="PEK">베이징
						<option value="PUS">부산
				</select></td>
			</tr>
			<tr>
				<th>도착지</th>
				<td><select name="end_port">
						<option value="<%= rb.getEnd_port() %>">
						<%= rbean.getAirport(rb.getEnd_port()) %>
						<option value="BKK">방콕
						<option value="CDG">파리
						<option value="CJU">제주
						<option value="GMP">김포
						<option value="GRU">상파울로
						<option value="HKG">홍콩
						<option value="HNL">하와이
						<option value="ICN">인천
						<option value="JFK">뉴욕
						<option value="KIX">오사카
						<option value="LHR">런던
						<option value="NRT">도쿄
						<option value="PEK">베이징
						<option value="PUS" <%= sel %>>부산
				</select></td>
			</tr>
			<tr>
				<th>탑승인원</th>
				<td><input type="number" name="passenger_number" value="1"></td>
			</tr>
			<tr>
				<th>좌석등급</th>
				<td><select name="grade">
						<option value="economy" selected>이코노미
						<option value="business">비지니스
						<option value="first">퍼스트
				</select></td>
			</tr><!-- 선택 끝 -->
		</table>
		<input id="search" type="submit" value="항공권 조회">
	</form>
</section><!-- section main 끝 -->
</body>