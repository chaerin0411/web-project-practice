<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="manager_error.jsp" import="java.util.*, reservationManagement.*"%>
<jsp:useBean id="rDatas" scope="session" class="java.util.ArrayList"/>

<head>
	<link rel="stylesheet" href="../css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="../css/manage.css" type="text/css" media="screen" />
</head>

<!-- reservation_list.jsp -->
<body><br><br>
	<header><!-- header 시작 -->
		<jsp:include page="../management/top.jsp" flush="false" />
		<nav id="navi"><!-- navi 시작 -->
			<ul>
				<li><a href="../index.jsp?CONTENTPAGE=content.jsp">
					<img src="../img/home.png"></a></li>
				<li>&#5171;</li>
				<li>예약관리:목록화면</li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->

	<!-- div center 시작 -->
	<div align="center"><br><br>
		<h3>예약관리:목록화면</h3><hr><br><br>
		<form>
			<h2><a href="../management/manager_list.jsp">[회원관리:목록화면]</a></h2>
			<table border="1">
				<tr>
					<th>예약번호</th>
					<th>예약자</th>
					<th>탑승일</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>출발지</th>
					<th>도착지</th>
					<th>좌석번호</th>
					<th>티켓가격</th>
					<th>항공사번호</th>
					<th>좌석등급</th>
				</tr>

				<% for (ReservationBook rb : (ArrayList<ReservationBook>) rDatas) { %>
				<tr>
					<td><%=rb.getReservation_no()%></td>
					<td><%=rb.getMember_id()%></td>
					<td><%=rb.getDate()%></td>
					<td><%=rb.getDeparture_time()%></td>
					<td><%=rb.getArrival_time()%></td>
					<td><%=rb.getStart_port()%></td>
					<td><%=rb.getEnd_port()%></td>
					<td><%=rb.getServe_seat_no()%></td>
					<td><%=rb.getTicket_price()%></td>
					<td><%=rb.getAirplane_no()%></td>
					<td><%=rb.getGrade()%></td>
				</tr>
				<% } %>
			</table>
		</form>
		<footer><jsp:include page="../module/bottom.jsp" flush="false" /></footer>
	</div><!-- div center 끝 -->
</body>
</html>