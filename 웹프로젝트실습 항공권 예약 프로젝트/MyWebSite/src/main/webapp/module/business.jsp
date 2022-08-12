<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, reservationManagement.*, memberManagement.*"%>
<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session" />
<jsp:useBean id="rb" class="reservationManagement.ReservationBook" scope="session" />
<head><link rel="stylesheet" href="css/seat.css" type="text/css" media="screen" /></head>

<!-- business.jsp -->
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
		
		<!-- 테이블 시작 -->
		<table>
			<tr>
				<th>S</th>
				<th>T</th>
				<th>U</th>
				<th>이동통로</th>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS01"></td>
				<td><input name="seat" type="submit" value="AT01"></td>
				<td><input name="seat" type="submit" value="AU01"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS02"></td>
				<td><input name="seat" type="submit" value="AT02"></td>
				<td><input name="seat" type="submit" value="AU02"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS03"></td>
				<td><input name="seat" type="submit" value="AT03"></td>
				<td><input name="seat" type="submit" value="AU03"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS04"></td>
				<td><input name="seat" type="submit" value="AT04"></td>
				<td><input name="seat" type="submit" value="AU04"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS05"></td>
				<td><input name="seat" type="submit" value="AT05"></td>
				<td><input name="seat" type="submit" value="AU05"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS06"></td>
				<td><input name="seat" type="submit" value="AT06"></td>
				<td><input name="seat" type="submit" value="AU06"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS07"></td>
				<td><input name="seat" type="submit" value="AT07"></td>
				<td><input name="seat" type="submit" value="AU07"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS08"></td>
				<td><input name="seat" type="submit" value="AT08"></td>
				<td><input name="seat" type="submit" value="AU08"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS09"></td>
				<td><input name="seat" type="submit" value="AT09"></td>
				<td><input name="seat" type="submit" value="AU09"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS10"></td>
				<td><input name="seat" type="submit" value="AT10"></td>
				<td><input name="seat" type="submit" value="AU10"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS11"></td>
				<td><input name="seat" type="submit" value="AT11"></td>
				<td><input name="seat" type="submit" value="AU11"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS12"></td>
				<td><input name="seat" type="submit" value="AT12"></td>
				<td><input name="seat" type="submit" value="AU12"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS13"></td>
				<td><input name="seat" type="submit" value="AT13"></td>
				<td><input name="seat" type="submit" value="AU13"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS14"></td>
				<td><input name="seat" type="submit" value="AT14"></td>
				<td><input name="seat" type="submit" value="AU14"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS15"></td>
				<td><input name="seat" type="submit" value="AT15"></td>
				<td><input name="seat" type="submit" value="AU15"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS16"></td>
				<td><input name="seat" type="submit" value="AT16"></td>
				<td><input name="seat" type="submit" value="AU16"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS17"></td>
				<td><input name="seat" type="submit" value="AT17"></td>
				<td><input name="seat" type="submit" value="AU17"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS18"></td>
				<td><input name="seat" type="submit" value="AT18"></td>
				<td><input name="seat" type="submit" value="AU18"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS19"></td>
				<td><input name="seat" type="submit" value="AT19"></td>
				<td><input name="seat" type="submit" value="AU19"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS20"></td>
				<td><input name="seat" type="submit" value="AT20"></td>
				<td><input name="seat" type="submit" value="AU20"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS21"></td>
				<td><input name="seat" type="submit" value="AT21"></td>
				<td><input name="seat" type="submit" value="AU21"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS22"></td>
				<td><input name="seat" type="submit" value="AT22"></td>
				<td><input name="seat" type="submit" value="AU22"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS23"></td>
				<td><input name="seat" type="submit" value="AT23"></td>
				<td><input name="seat" type="submit" value="AU23"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS24"></td>
				<td><input name="seat" type="submit" value="AT24"></td>
				<td><input name="seat" type="submit" value="AU24"></td>
				<td></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AS25"></td>
				<td><input name="seat" type="submit" value="AT25"></td>
				<td><input name="seat" type="submit" value="AU25"></td>
				<td></td>
			</tr>
		</table><!-- 테이블 끝 -->
	</form>
</section><!-- section main 끝 -->
</body>