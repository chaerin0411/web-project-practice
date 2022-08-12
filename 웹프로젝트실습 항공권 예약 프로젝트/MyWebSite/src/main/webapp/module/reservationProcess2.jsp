<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, reservationManagement.*, memberManagement.*"%>
<% String seat = (String)session.getAttribute("seat"); %>

<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session" />
<jsp:useBean id="rb" class="reservationManagement.ReservationBook" scope="session" />
<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session" />
<jsp:useBean id="sb" class="reservationManagement.ReservationBook" scope="session"/>
<head><link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" /></head>

<!-- reservationProcess2.jsp -->
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

<section id="main"><!-- section main 시작 -->
	<h4>항공편</h4>
	<form name=reservation method=post
		action=reservation/reservation_control.jsp>
		<input type=hidden name="member_id" value="<%= mb.getMember_id() %>">
		<input type=hidden name="action" value="insert">
		
		<!-- 선택 시작 -->
		<table>
			<tr>
				<th>일정번호</th>
				<th>항공사</th>
				<th>출발시간</th>
				<th>도착시간</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>운임료</th>
			</tr>
			<tr>
				<td><%= sb.getSchedule_no() %></td>
				<td><%= sb.getAirplane_no()%></td>
				<td><%= sb.getDeparture_time() %></td>
				<td><%= sb.getArrival_time() %></td>
				<td><%= sb.getStart_port() %></td>
				<td><%= sb.getEnd_port() %></td>
				<td><%= sb.getFreightfee() %></td>
			</tr>
		</table>

		<h4>좌석 선택</h4>
		<table id="tblseat">
			<tr>
				<th>좌석</th>
				<td><a href="index.jsp?CONTENTPAGE=<%= seat %>.jsp">
				<input type="text" name="seat" placeholder="좌석을 선택해주세요"
					value="<%= (rb.getServe_seat_no() == null) ? "AA01" : rb.getServe_seat_no() %>"></a></td>
			</tr>
			<tr>
				<th>좌석등급</th>
				<td style="text-transform: uppercase;"><%= rb.getGrade() %></td>
			</tr>
			<tr>
				<th>티켓가격</th>
				<td><input type="text" name="ticket" placeholder="85960"
					value="<%= (rb.getTicket_price() == null) ? "운임료: 자동설정" : rb.getTicket_price() %>"></td>
			</tr>
		</table>

		<h4>항공권 예약 확인</h4>
		<table id="tblchk">
			<tr>
				<th>날짜</th>
				<td><%= rb.getDate() %></td>
			</tr>
			<tr>
				<th>출발지</th>
				<td><%= rbean.getAirport(rb.getStart_port()) %> 
				(<%= rb.getStart_port() %>)</td>
			</tr>
			<tr>
				<th>도착지</th>
				<td><%= rbean.getAirport(rb.getEnd_port()) %> 
				(<%= rb.getEnd_port() %>)</td>
			</tr>
			<tr>
				<th>탑승인원</th>
				<td><%= rb.getPassenger_number() %></td>
			</tr>
			<tr>
			<tr>
				<th>항공사이름</th>
				<td><%= rbean.getAirplane(sb.getAirplane_no()) %> 
				(<%= sb.getAirplane_no() %>)</td>
			</tr>
		</table><!-- 선택 끝 -->
		
		<input class="search" type="submit" value="예약">
		<input class="search" type="reset" value="취소">
	</form>
</section><!-- section main 끝 -->
</body>