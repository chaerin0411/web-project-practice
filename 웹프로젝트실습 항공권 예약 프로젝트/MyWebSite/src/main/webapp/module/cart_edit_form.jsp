<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="reservationManagement.*"%>
<jsp:useBean id="cb" scope="session" class="cartManagement.CartBook" />

<head>
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/reserve.css" type="text/css" media="screen" />
</head>

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		if (result == true) {
			document.cart.action.value = "delete";
			document.cart.submit();
		} else return;
	}
</script>

<!-- cart_edit_form.jsp -->
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
	</header><!-- header 끝 -->
	
	<!-- div center 시작 -->
	<section id="main" style="margin-top: 30px;">
		<H3>찜목록:수정화면</H3>
		<form name=cart method=post action=cart/cart_control.jsp>
			<input type=hidden name="member_id" value="<%=cb.getCart_no()%>">
			<input type=hidden name="action" value="delete">
			
			<!-- table 시작 -->
			<table border="1" style="margin-top: 10px;">
				<tr>
					<th>찜목록번호</th>
					<td><%=cb.getCart_no() %></td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td><%=cb.getProduct_no() %></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><%=cb.getProduct_name() %></td>
				</tr>
				<tr>
					<th>위치</th>
					<td><%=cb.getLocation() %></td>
				</tr>
				<tr>
					<th>상품상세</th>
					<td><%=cb.getProduct_detail() %></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><%=cb.getRatings() %></td>	
				</tr>
				<tr>
					<th>리뷰수</th>
					<td><%=cb.getReview() %></td>	
				</tr>
				<tr>
					<th>상품구분</th>
					<td><%=cb.getDistinguishing() %></td>
				</tr>				
				<tr>
					<th>이용시간</th>
					<td><%=cb.getTime() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=cb.getTel() %></td>
				</tr>
				<tr>
					<th>경로</th>
					<td><%=cb.getSrc() %></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type=submit value="찜취소">
					</td>
				</tr>
			</table><!-- table 끝 -->
		</form>
	</section><!-- div center 끝 -->
</body>