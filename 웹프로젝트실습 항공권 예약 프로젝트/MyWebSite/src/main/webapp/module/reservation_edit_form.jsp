<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="reservationManagement.*"%>
<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session" />
<jsp:useBean id="rb" scope="session" class="reservationManagement.ReservationBook" />

<head>
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" />
</head>

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		if (result == true) {
			document.reservation.action.value = "delete";
			document.reservation.submit();
		} else return;
	}
</script>

<!-- reservation_edit_form.jsp -->
<body>
<!-- section main 시작 -->
<section id="main">
	<H3>항공권 예약:수정화면</H3>
	<form name=reservation method=post
		action=reservation/reservation_control.jsp>
		<input type=hidden name="member_id" value="<%=rb.getMember_id()%>">
		<input type=hidden name="action" value="update">
		
		<!-- table 시작 -->
		<table>
			<tr>
				<th style="width: 250px;">날짜</th>
				<td style="width: 510px;"><%= rb.getDate() %></td>
			</tr>
			<tr>
				<th>출발지</th>
				<td><%= rbean.getAirport(rb.getStart_port()) %> (<%= rb.getStart_port() %>)</td>
			</tr>
			<tr>
				<th>도착지</th>
				<td><%= rbean.getAirport(rb.getEnd_port()) %> (<%= rb.getEnd_port() %>)</td>
			</tr>
			<tr>
				<th>항공사이름</th>
				<td><%= rbean.getAirplane(rb.getAirplane_no()) %> (<%= rb.getAirplane_no() %>)</td>
			</tr>
			<tr>
				<th>좌석등급</th>
				<td><%= rb.getGrade() %></td>
			</tr>
			<tr>
				<th>좌석번호</th>
				<td><%= rb.getServe_seat_no() %></td>
			</tr>
			<tr>
				<th>출발시간</th>
				<td><%=rb.getDeparture_time()%></td>
			</tr>
			<tr>
				<th>도착시간</th>
				<td><%=rb.getArrival_time() %></td>
			</tr>
		</table><!-- table 끝 -->
		<input type=submit value="목록으로" style="width: 222px; height: 60px; margin: 0 0 0 160px;">
		<input type="button" value="예약취소" onClick="delcheck()" style="cursor: pointer; background-color: #2967B9;">
	</form>
</section><!-- section main 끝 -->
</body>