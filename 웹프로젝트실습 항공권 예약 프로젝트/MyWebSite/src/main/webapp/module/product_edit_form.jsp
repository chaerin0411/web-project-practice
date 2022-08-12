<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="reservationManagement.*"%>
<jsp:useBean id="pb" scope="session" class="cartManagement.CartBook" />
<head>
	<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/manage.css" type="text/css" media="screen" />
</head>

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			document.product.action.value="productDelete";
			document.product.submit();
		} else return;
	}
</script>

<!-- product_edit_form.jsp -->
<body><br><br>
	<header><!-- header 시작 -->
		<nav id="navi"><!-- navi 시작 -->
			<ul>
				<li><a href="index.jsp?CONTENTPAGE=content.jsp">
					<img src="img/home.png"></a></li>
				<li>&#5171;</li>
				<li>상품관리:수정화면</li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->
	
	<!-- div center 시작 -->
	<div align=center><br><br>
		<h3>상품관리:수정화면</h3><hr><br><br>
		<h2><a href=cart/cart_control.jsp?action=aSearch>[상품관리 목록으로]</a></h2>
		
		<form name=product method=post action=cart/cart_control.jsp>
			<input type=hidden name="product_no" value="<%=pb.getProduct_no()%>">
			<input type=hidden name="action" value="productUpdate">
			<table border=1>
				<tr>
					<th>상품번호</th>
					<td><%=pb.getProduct_no() %></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="product_name" value="<%=pb.getProduct_name()%>"></td>
				</tr>
				<tr>
					<th>위치</th>
					<td><input type="text" name="location" value="<%=pb.getLocation()%>"></td>
				</tr>
				<tr>
					<th>상품상세</th>
					<td><input type="text" name="product_detail" value="<%=pb.getProduct_detail()%>"></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><input type="text" name="ratings" value="<%=pb.getRatings()%>"></td>	
				</tr>
				<tr>
					<th>리뷰수</th>
					<td><input type="number" name="review" value="<%=pb.getReview()%>"></td>
				</tr>
				<tr>
					<th>상품구분</th>
					<td><input type="text" name="distinguishing" value="<%=pb.getDistinguishing()%>"></td>
				</tr>				
				<tr>
					<th>이용시간</th>
					<td><input type="text" name="time" value="<%=pb.getTime()%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="<%=pb.getTel()%>"></td>
				</tr>
				<tr>
					<th>경로</th>
					<td><input type="text" name="src" value="<%=pb.getSrc() %>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()">
					</td>
				</tr>
			</table>
		</form>
	</div><!-- div center 끝 -->
</body>