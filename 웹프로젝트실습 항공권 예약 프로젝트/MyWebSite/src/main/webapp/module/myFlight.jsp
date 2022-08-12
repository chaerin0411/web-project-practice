<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, reservationManagement.*"%>

<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session" />
<jsp:useBean id="rDatas" scope="session" class="java.util.ArrayList" />

<head>
	<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/my.css" type="text/css" media="screen" />
</head>
<script type="text/javascript">
	function check(reservation_no) {
		document.location.href = "reservation/reservation_control.jsp?action=edit&reservation_no="+reservation_no; }
</script>

<!-- myFlight.jsp -->
<body>
<header><!-- header 시작 -->
	<nav id="navi"><!-- navi 시작 -->
		<ul>
			<li><a href="index.jsp?CONTENTPAGE=content.jsp">
				<img src="img/home.png"></a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=myFlight.jsp">마이 페이지</a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=myFlight.jsp">나의 예약 - 항공</a></li>
		</ul>
	</nav><!-- navi 끝 -->
	<jsp:include page="left.jsp" flush="false"/>
</header><!-- header 끝 -->

<!-- section main 시작 -->
<section id="main">
	<h3>나의 예약</h3>
	<a href="index.jsp?CONTENTPAGE=myFlight.jsp"><input class="selected" type="button" value="항공"></a>
    <a href="index.jsp?CONTENTPAGE=myHotel.jsp"><input type="button" value="숙박" ></a>
	<input type="button" value="투어·티켓">

	<form method=post action="../reservation/reservation_control.jsp">
		<input type=hidden name="member_id" value="<%= mb.getMember_id() %>">
		<input type=hidden name="action" value="edit">
		
		<!-- 테이블 시작 -->
		<table>
			<tr>
				<th>예약 번호</th>
				<th>예약자</th>
				<th>탑승일</th>
				<th>출발 시간</th>
				<th>도착 시간</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>좌석 번호</th>
				<th>티켓 가격</th>
				<th>항공사 번호</th>
				<th>좌석 등급</th>
			</tr>

			<% for(ReservationBook rb : (ArrayList<ReservationBook>)rDatas) { %>
			<tr>
				<td class="ths">
					<a href="javascript:check(<%=rb.getReservation_no() %>)">
					<%=rb.getReservation_no() %></a></td>
				<td><%=rb.getMember_id() %></td>
				<td><%=rb.getDate() %></td>
				<td><%=rb.getDeparture_time() %></td>
				<td><%=rb.getArrival_time() %></td>
				<td><%=rb.getStart_port() %></td>
				<td><%=rb.getEnd_port() %></td>
				<td><%=rb.getServe_seat_no() %></td>
				<td><%=rb.getTicket_price() %></td>
				<td><%=rb.getAirplane_no() %></td>
				<td><%=rb.getGrade() %></td>
			</tr>
			<% } %>
		</table><!-- 테이블 끝 -->
	</form>
</section><!-- section main 끝 -->
</body>