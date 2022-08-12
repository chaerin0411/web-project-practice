<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, reservationManagement.*, memberManagement.*"%>
<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session" />
<jsp:useBean id="rb" class="reservationManagement.ReservationBook" scope="session" />
<head><link rel="stylesheet" href="css/seat.css" type="text/css" media="screen" /></head>

<!-- first.jsp -->
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
	<h3>좌석 선택</h3>
	<form name="floor1" method=post
		action=reservation/reservation_control.jsp>
		<input type=hidden name="grade" value="<%=rb.getGrade()%>">
		<input type=hidden name="action" value="seat">
		
		<table style="width: 380px;"><!-- table 시작 -->
			<tr>
				<th>V</th>
				<th>이동통로</th>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV01"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV02"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV03"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV04"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV05"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV06"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV07"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV08"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV09"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV10"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV11"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV12"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV13"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV14"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV15"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV16"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV17"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV18"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV19"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV20"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV21"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV22"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV23"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV24"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AV25"></td>
				<td></td>
			</tr>
		</table><!-- table 끝 -->
	</form>
</section><!-- section 끝 -->
</body>