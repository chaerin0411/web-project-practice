<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, cartManagement.*"%>
<jsp:useBean id="pDatas" scope="session" class="java.util.ArrayList"/>

<head>
	<link rel="stylesheet" href="../css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="../css/manage.css" type="text/css" media="screen" />
</head>

<script type="text/javascript">
	function check(product_no) {
		document.location.href="../cart/cart_control.jsp?action=productEdit&product_no="+product_no;
	}
</script>

<!-- product_list.jsp -->
<body><br><br>
	<header><!-- header 시작 -->
		<jsp:include page="../management/top.jsp" flush="false" />
		<nav id="navi"><!-- navi 시작 -->
			<ul>
				<li><a href="../index.jsp?CONTENTPAGE=content.jsp">
				<img src="../img/home.png"></a></li>
				<li>&#5171;</li>
				<li>상품관리:목록화면</li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->
	
	<!-- div center 시작 -->
	<div align="center"><br><br>
		<h3>상품관리:목록화면</h3><hr><br><br>
		<form>
			<h2><a href="../management/manager_list.jsp">[회원관리:목록화면]</a></h2>
			<h2><a href="product_form.jsp">[상품 정보 입력]</a></h2>
			<table border="1">
				<tr>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>위치</th>
					<th>상품상세</th>
					<th>평점</th>
					<th>리뷰수</th>
					<th>상품구분</th>
					<th>이용시간</th>
					<th>전화번호</th>
					<th>경로</th>
				</tr>
				<% for (CartBook pb : (ArrayList<CartBook>) pDatas) { %>
				<tr>
					<td class="ths"><a href="javascript:check('<%=pb.getProduct_no()%>')"><%=pb.getProduct_no()%></a></td>
					<td><%=pb.getProduct_name()%></td>
					<td><%=pb.getLocation()%></td>
					<td><%=pb.getProduct_detail()%></td>
					<td><%=pb.getRatings()%></td>
					<td><%=pb.getReview()%></td>
					<td><%=pb.getDistinguishing()%></td>
					<td><%=pb.getTime()%></td>
					<td><%=pb.getTel()%></td>
					<td><%=pb.getSrc()%></td>
				</tr>
				<% } %>
			</table>
		</form>
	</div><!-- div center 끝 -->
	<footer><jsp:include page="../module/bottom.jsp" flush="false" /></footer>
</body>