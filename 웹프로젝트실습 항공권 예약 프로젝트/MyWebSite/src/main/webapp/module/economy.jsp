<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, reservationManagement.*, memberManagement.*"%>
<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session" />
<jsp:useBean id="rb" class="reservationManagement.ReservationBook" scope="session" />
<head><link rel="stylesheet" href="css/seat.css" type="text/css" media="screen" /></head>

<!-- economy.jsp -->
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
		
		<!-- 테이블 1 시작 -->
		<table>
			<tr>
				<th>A</th>
				<th>B</th>
				<th>C</th>
				<th>이동 통로</th>
				<th>D</th>
				<th>E</th>
				<th>F</th>
				<th>이동 통로</th>
				<th>G</th>
				<th>H</th>
				<th>I</th>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA01"></td>
				<td><input name="seat" type="submit" value="AB01"></td>
				<td><input name="seat" type="submit" value="AC01"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD01"></td>
				<td><input name="seat" type="submit" value="AE01"></td>
				<td><input name="seat" type="submit" value="AG01"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG01"></td>
				<td><input name="seat" type="submit" value="AH01"></td>
				<td><input name="seat" type="submit" value="AI01"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA02"></td>
				<td><input name="seat" type="submit" value="AB02"></td>
				<td><input name="seat" type="submit" value="AC02"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD02"></td>
				<td><input name="seat" type="submit" value="AE02"></td>
				<td><input name="seat" type="submit" value="AG02"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG02"></td>
				<td><input name="seat" type="submit" value="AH02"></td>
				<td><input name="seat" type="submit" value="AI02"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA03"></td>
				<td><input name="seat" type="submit" value="AB03"></td>
				<td><input name="seat" type="submit" value="AC03"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD03"></td>
				<td><input name="seat" type="submit" value="AE03"></td>
				<td><input name="seat" type="submit" value="AG03"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG03"></td>
				<td><input name="seat" type="submit" value="AH03"></td>
				<td><input name="seat" type="submit" value="AI03"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA04"></td>
				<td><input name="seat" type="submit" value="AB04"></td>
				<td><input name="seat" type="submit" value="AC04"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD04"></td>
				<td><input name="seat" type="submit" value="AE04"></td>
				<td><input name="seat" type="submit" value="AG04"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG04"></td>
				<td><input name="seat" type="submit" value="AH04"></td>
				<td><input name="seat" type="submit" value="AI04"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA05"></td>
				<td><input name="seat" type="submit" value="AB05"></td>
				<td><input name="seat" type="submit" value="AC05"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD05"></td>
				<td><input name="seat" type="submit" value="AE05"></td>
				<td><input name="seat" type="submit" value="AG05"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG05"></td>
				<td><input name="seat" type="submit" value="AH05"></td>
				<td><input name="seat" type="submit" value="AI05"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA06"></td>
				<td><input name="seat" type="submit" value="AB06"></td>
				<td><input name="seat" type="submit" value="AC06"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD06"></td>
				<td><input name="seat" type="submit" value="AE06"></td>
				<td><input name="seat" type="submit" value="AG06"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG06"></td>
				<td><input name="seat" type="submit" value="AH06"></td>
				<td><input name="seat" type="submit" value="AI06"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA07"></td>
				<td><input name="seat" type="submit" value="AB07"></td>
				<td><input name="seat" type="submit" value="AC07"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD07"></td>
				<td><input name="seat" type="submit" value="AE07"></td>
				<td><input name="seat" type="submit" value="AG07"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG07"></td>
				<td><input name="seat" type="submit" value="AH07"></td>
				<td><input name="seat" type="submit" value="AI07"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA08"></td>
				<td><input name="seat" type="submit" value="AB08"></td>
				<td><input name="seat" type="submit" value="AC08"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD08"></td>
				<td><input name="seat" type="submit" value="AE08"></td>
				<td><input name="seat" type="submit" value="AG08"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG08"></td>
				<td><input name="seat" type="submit" value="AH08"></td>
				<td><input name="seat" type="submit" value="AI08"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA09"></td>
				<td><input name="seat" type="submit" value="AB09"></td>
				<td><input name="seat" type="submit" value="AC09"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD09"></td>
				<td><input name="seat" type="submit" value="AE09"></td>
				<td><input name="seat" type="submit" value="AG09"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG09"></td>
				<td><input name="seat" type="submit" value="AH09"></td>
				<td><input name="seat" type="submit" value="AI09"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA10"></td>
				<td><input name="seat" type="submit" value="AB10"></td>
				<td><input name="seat" type="submit" value="AC10"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD10"></td>
				<td><input name="seat" type="submit" value="AE10"></td>
				<td><input name="seat" type="submit" value="AG10"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG10"></td>
				<td><input name="seat" type="submit" value="AH10"></td>
				<td><input name="seat" type="submit" value="AI10"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA11"></td>
				<td><input name="seat" type="submit" value="AB11"></td>
				<td><input name="seat" type="submit" value="AC11"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD11"></td>
				<td><input name="seat" type="submit" value="AE11"></td>
				<td><input name="seat" type="submit" value="AG11"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG11"></td>
				<td><input name="seat" type="submit" value="AH11"></td>
				<td><input name="seat" type="submit" value="AI11"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA12"></td>
				<td><input name="seat" type="submit" value="AB12"></td>
				<td><input name="seat" type="submit" value="AC12"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD12"></td>
				<td><input name="seat" type="submit" value="AE12"></td>
				<td><input name="seat" type="submit" value="AG12"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG12"></td>
				<td><input name="seat" type="submit" value="AH12"></td>
				<td><input name="seat" type="submit" value="AI12"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA13"></td>
				<td><input name="seat" type="submit" value="AB13"></td>
				<td><input name="seat" type="submit" value="AC13"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD13"></td>
				<td><input name="seat" type="submit" value="AE13"></td>
				<td><input name="seat" type="submit" value="AG13"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG13"></td>
				<td><input name="seat" type="submit" value="AH13"></td>
				<td><input name="seat" type="submit" value="AI13"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA14"></td>
				<td><input name="seat" type="submit" value="AB14"></td>
				<td><input name="seat" type="submit" value="AC14"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD14"></td>
				<td><input name="seat" type="submit" value="AE14"></td>
				<td><input name="seat" type="submit" value="AG14"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG14"></td>
				<td><input name="seat" type="submit" value="AH14"></td>
				<td><input name="seat" type="submit" value="AI14"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA15"></td>
				<td><input name="seat" type="submit" value="AB15"></td>
				<td><input name="seat" type="submit" value="AC15"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD15"></td>
				<td><input name="seat" type="submit" value="AE15"></td>
				<td><input name="seat" type="submit" value="AG15"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG15"></td>
				<td><input name="seat" type="submit" value="AH15"></td>
				<td><input name="seat" type="submit" value="AI15"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA16"></td>
				<td><input name="seat" type="submit" value="AB16"></td>
				<td><input name="seat" type="submit" value="AC16"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD16"></td>
				<td><input name="seat" type="submit" value="AE16"></td>
				<td><input name="seat" type="submit" value="AG16"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG16"></td>
				<td><input name="seat" type="submit" value="AH16"></td>
				<td><input name="seat" type="submit" value="AI16"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA17"></td>
				<td><input name="seat" type="submit" value="AB17"></td>
				<td><input name="seat" type="submit" value="AC17"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD17"></td>
				<td><input name="seat" type="submit" value="AE17"></td>
				<td><input name="seat" type="submit" value="AG17"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG17"></td>
				<td><input name="seat" type="submit" value="AH17"></td>
				<td><input name="seat" type="submit" value="AI17"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA18"></td>
				<td><input name="seat" type="submit" value="AB18"></td>
				<td><input name="seat" type="submit" value="AC18"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD18"></td>
				<td><input name="seat" type="submit" value="AE18"></td>
				<td><input name="seat" type="submit" value="AG18"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG18"></td>
				<td><input name="seat" type="submit" value="AH18"></td>
				<td><input name="seat" type="submit" value="AI18"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA19"></td>
				<td><input name="seat" type="submit" value="AB19"></td>
				<td><input name="seat" type="submit" value="AC19"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD19"></td>
				<td><input name="seat" type="submit" value="AE19"></td>
				<td><input name="seat" type="submit" value="AG19"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG19"></td>
				<td><input name="seat" type="submit" value="AH19"></td>
				<td><input name="seat" type="submit" value="AI19"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA20"></td>
				<td><input name="seat" type="submit" value="AB20"></td>
				<td><input name="seat" type="submit" value="AC20"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD20"></td>
				<td><input name="seat" type="submit" value="AE20"></td>
				<td><input name="seat" type="submit" value="AG20"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG20"></td>
				<td><input name="seat" type="submit" value="AH20"></td>
				<td><input name="seat" type="submit" value="AI20"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA21"></td>
				<td><input name="seat" type="submit" value="AB21"></td>
				<td><input name="seat" type="submit" value="AC21"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD21"></td>
				<td><input name="seat" type="submit" value="AE21"></td>
				<td><input name="seat" type="submit" value="AG21"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG21"></td>
				<td><input name="seat" type="submit" value="AH21"></td>
				<td><input name="seat" type="submit" value="AI21"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA22"></td>
				<td><input name="seat" type="submit" value="AB22"></td>
				<td><input name="seat" type="submit" value="AC22"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD22"></td>
				<td><input name="seat" type="submit" value="AE22"></td>
				<td><input name="seat" type="submit" value="AG22"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG22"></td>
				<td><input name="seat" type="submit" value="AH22"></td>
				<td><input name="seat" type="submit" value="AI22"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA23"></td>
				<td><input name="seat" type="submit" value="AB23"></td>
				<td><input name="seat" type="submit" value="AC23"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD23"></td>
				<td><input name="seat" type="submit" value="AE23"></td>
				<td><input name="seat" type="submit" value="AG23"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG23"></td>
				<td><input name="seat" type="submit" value="AH23"></td>
				<td><input name="seat" type="submit" value="AI23"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA24"></td>
				<td><input name="seat" type="submit" value="AB24"></td>
				<td><input name="seat" type="submit" value="AC24"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD24"></td>
				<td><input name="seat" type="submit" value="AE24"></td>
				<td><input name="seat" type="submit" value="AG24"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG24"></td>
				<td><input name="seat" type="submit" value="AH24"></td>
				<td><input name="seat" type="submit" value="AI24"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AA25"></td>
				<td><input name="seat" type="submit" value="AB25"></td>
				<td><input name="seat" type="submit" value="AC25"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AD25"></td>
				<td><input name="seat" type="submit" value="AE25"></td>
				<td><input name="seat" type="submit" value="AG25"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AG25"></td>
				<td><input name="seat" type="submit" value="AH25"></td>
				<td><input name="seat" type="submit" value="AI25"></td>
			</tr>
		</table><!-- 테이블 1 끝 -->
	</form>

	<form name="floor2" method=post
		action=reservation/reservation_control.jsp>
		<input type=hidden name="action" value="seat">
		
		<table><!-- 테이블 2 시작 -->
			<tr>
				<th>J</th>
				<th>K</th>
				<th>L</th>
				<th>이동 통로</th>
				<th>M</th>
				<th>N</th>
				<th>O</th>
				<th>이동 통로</th>
				<th>P</th>
				<th>Q</th>
				<th>R</th>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ01"></td>
				<td><input name="seat" type="submit" value="AK01"></td>
				<td><input name="seat" type="submit" value="AL01"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM01"></td>
				<td><input name="seat" type="submit" value="AN01"></td>
				<td><input name="seat" type="submit" value="AO01"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP01"></td>
				<td><input name="seat" type="submit" value="AQ01"></td>
				<td><input name="seat" type="submit" value="AR01"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ02"></td>
				<td><input name="seat" type="submit" value="AK02"></td>
				<td><input name="seat" type="submit" value="AL02"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM02"></td>
				<td><input name="seat" type="submit" value="AN02"></td>
				<td><input name="seat" type="submit" value="AO02"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP02"></td>
				<td><input name="seat" type="submit" value="AQ02"></td>
				<td><input name="seat" type="submit" value="AR02"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ03"></td>
				<td><input name="seat" type="submit" value="AK03"></td>
				<td><input name="seat" type="submit" value="AL03"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM03"></td>
				<td><input name="seat" type="submit" value="AN03"></td>
				<td><input name="seat" type="submit" value="AO03"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP03"></td>
				<td><input name="seat" type="submit" value="AQ03"></td>
				<td><input name="seat" type="submit" value="AR03"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ04"></td>
				<td><input name="seat" type="submit" value="AK04"></td>
				<td><input name="seat" type="submit" value="AL04"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM04"></td>
				<td><input name="seat" type="submit" value="AN04"></td>
				<td><input name="seat" type="submit" value="AO04"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP04"></td>
				<td><input name="seat" type="submit" value="AQ04"></td>
				<td><input name="seat" type="submit" value="AR04"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ05"></td>
				<td><input name="seat" type="submit" value="AK05"></td>
				<td><input name="seat" type="submit" value="AL05"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM05"></td>
				<td><input name="seat" type="submit" value="AN05"></td>
				<td><input name="seat" type="submit" value="AO05"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP05"></td>
				<td><input name="seat" type="submit" value="AQ05"></td>
				<td><input name="seat" type="submit" value="AR05"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ06"></td>
				<td><input name="seat" type="submit" value="AK06"></td>
				<td><input name="seat" type="submit" value="AL06"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM06"></td>
				<td><input name="seat" type="submit" value="AN06"></td>
				<td><input name="seat" type="submit" value="AO06"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP06"></td>
				<td><input name="seat" type="submit" value="AQ06"></td>
				<td><input name="seat" type="submit" value="AR06"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ07"></td>
				<td><input name="seat" type="submit" value="AK07"></td>
				<td><input name="seat" type="submit" value="AL07"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM07"></td>
				<td><input name="seat" type="submit" value="AN07"></td>
				<td><input name="seat" type="submit" value="AO07"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP07"></td>
				<td><input name="seat" type="submit" value="AQ07"></td>
				<td><input name="seat" type="submit" value="AR07"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ08"></td>
				<td><input name="seat" type="submit" value="AK08"></td>
				<td><input name="seat" type="submit" value="AL08"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM08"></td>
				<td><input name="seat" type="submit" value="AN08"></td>
				<td><input name="seat" type="submit" value="AO08"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP08"></td>
				<td><input name="seat" type="submit" value="AQ08"></td>
				<td><input name="seat" type="submit" value="AR08"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ09"></td>
				<td><input name="seat" type="submit" value="AK09"></td>
				<td><input name="seat" type="submit" value="AL09"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM09"></td>
				<td><input name="seat" type="submit" value="AN09"></td>
				<td><input name="seat" type="submit" value="AO09"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP09"></td>
				<td><input name="seat" type="submit" value="AQ09"></td>
				<td><input name="seat" type="submit" value="AR09"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ10"></td>
				<td><input name="seat" type="submit" value="AK10"></td>
				<td><input name="seat" type="submit" value="AL10"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM10"></td>
				<td><input name="seat" type="submit" value="AN10"></td>
				<td><input name="seat" type="submit" value="AO10"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP10"></td>
				<td><input name="seat" type="submit" value="AQ10"></td>
				<td><input name="seat" type="submit" value="AR10"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ11"></td>
				<td><input name="seat" type="submit" value="AK11"></td>
				<td><input name="seat" type="submit" value="AL11"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM11"></td>
				<td><input name="seat" type="submit" value="AN11"></td>
				<td><input name="seat" type="submit" value="AO11"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP11"></td>
				<td><input name="seat" type="submit" value="AQ11"></td>
				<td><input name="seat" type="submit" value="AR11"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ12"></td>
				<td><input name="seat" type="submit" value="AK12"></td>
				<td><input name="seat" type="submit" value="AL12"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM12"></td>
				<td><input name="seat" type="submit" value="AN12"></td>
				<td><input name="seat" type="submit" value="AO12"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP12"></td>
				<td><input name="seat" type="submit" value="AQ12"></td>
				<td><input name="seat" type="submit" value="AR12"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ13"></td>
				<td><input name="seat" type="submit" value="AK13"></td>
				<td><input name="seat" type="submit" value="AL13"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM13"></td>
				<td><input name="seat" type="submit" value="AN13"></td>
				<td><input name="seat" type="submit" value="AO13"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP13"></td>
				<td><input name="seat" type="submit" value="AQ13"></td>
				<td><input name="seat" type="submit" value="AR13"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ14"></td>
				<td><input name="seat" type="submit" value="AK14"></td>
				<td><input name="seat" type="submit" value="AL14"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM14"></td>
				<td><input name="seat" type="submit" value="AN14"></td>
				<td><input name="seat" type="submit" value="AO14"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP14"></td>
				<td><input name="seat" type="submit" value="AQ14"></td>
				<td><input name="seat" type="submit" value="AR14"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ15"></td>
				<td><input name="seat" type="submit" value="AK15"></td>
				<td><input name="seat" type="submit" value="AL15"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM15"></td>
				<td><input name="seat" type="submit" value="AN15"></td>
				<td><input name="seat" type="submit" value="AO15"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP15"></td>
				<td><input name="seat" type="submit" value="AQ15"></td>
				<td><input name="seat" type="submit" value="AR15"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ16"></td>
				<td><input name="seat" type="submit" value="AK16"></td>
				<td><input name="seat" type="submit" value="AL16"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM16"></td>
				<td><input name="seat" type="submit" value="AN16"></td>
				<td><input name="seat" type="submit" value="AO16"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP16"></td>
				<td><input name="seat" type="submit" value="AQ16"></td>
				<td><input name="seat" type="submit" value="AR16"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ17"></td>
				<td><input name="seat" type="submit" value="AK17"></td>
				<td><input name="seat" type="submit" value="AL17"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM17"></td>
				<td><input name="seat" type="submit" value="AN17"></td>
				<td><input name="seat" type="submit" value="AO17"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP17"></td>
				<td><input name="seat" type="submit" value="AQ17"></td>
				<td><input name="seat" type="submit" value="AR17"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ18"></td>
				<td><input name="seat" type="submit" value="AK18"></td>
				<td><input name="seat" type="submit" value="AL18"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM18"></td>
				<td><input name="seat" type="submit" value="AN18"></td>
				<td><input name="seat" type="submit" value="AO18"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP18"></td>
				<td><input name="seat" type="submit" value="AQ18"></td>
				<td><input name="seat" type="submit" value="AR18"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ19"></td>
				<td><input name="seat" type="submit" value="AK19"></td>
				<td><input name="seat" type="submit" value="AL19"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM19"></td>
				<td><input name="seat" type="submit" value="AN19"></td>
				<td><input name="seat" type="submit" value="AO19"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP19"></td>
				<td><input name="seat" type="submit" value="AQ19"></td>
				<td><input name="seat" type="submit" value="AR19"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ20"></td>
				<td><input name="seat" type="submit" value="AK20"></td>
				<td><input name="seat" type="submit" value="AL20"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM20"></td>
				<td><input name="seat" type="submit" value="AN20"></td>
				<td><input name="seat" type="submit" value="AO20"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP20"></td>
				<td><input name="seat" type="submit" value="AQ20"></td>
				<td><input name="seat" type="submit" value="AR20"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ21"></td>
				<td><input name="seat" type="submit" value="AK21"></td>
				<td><input name="seat" type="submit" value="AL21"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM21"></td>
				<td><input name="seat" type="submit" value="AN21"></td>
				<td><input name="seat" type="submit" value="AO21"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP21"></td>
				<td><input name="seat" type="submit" value="AQ21"></td>
				<td><input name="seat" type="submit" value="AR21"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ22"></td>
				<td><input name="seat" type="submit" value="AK22"></td>
				<td><input name="seat" type="submit" value="AL22"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM22"></td>
				<td><input name="seat" type="submit" value="AN22"></td>
				<td><input name="seat" type="submit" value="AO22"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP22"></td>
				<td><input name="seat" type="submit" value="AQ22"></td>
				<td><input name="seat" type="submit" value="AR22"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ23"></td>
				<td><input name="seat" type="submit" value="AK23"></td>
				<td><input name="seat" type="submit" value="AL23"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM23"></td>
				<td><input name="seat" type="submit" value="AN23"></td>
				<td><input name="seat" type="submit" value="AO23"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP23"></td>
				<td><input name="seat" type="submit" value="AQ23"></td>
				<td><input name="seat" type="submit" value="AR23"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ24"></td>
				<td><input name="seat" type="submit" value="AK24"></td>
				<td><input name="seat" type="submit" value="AL24"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM24"></td>
				<td><input name="seat" type="submit" value="AN24"></td>
				<td><input name="seat" type="submit" value="AO24"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP24"></td>
				<td><input name="seat" type="submit" value="AQ24"></td>
				<td><input name="seat" type="submit" value="AR24"></td>
			</tr>
			<tr>
				<td><input name="seat" type="submit" value="AJ25"></td>
				<td><input name="seat" type="submit" value="AK25"></td>
				<td><input name="seat" type="submit" value="AL25"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AM25"></td>
				<td><input name="seat" type="submit" value="AN25"></td>
				<td><input name="seat" type="submit" value="AO25"></td>
				<td></td>
				<td><input name="seat" type="submit" value="AP25"></td>
				<td><input name="seat" type="submit" value="AQ25"></td>
				<td><input name="seat" type="submit" value="AR25"></td>
			</tr>
		</table><!-- 테이블 2 끝 -->
	</form>
</section><!-- section main 끝 -->
</body>