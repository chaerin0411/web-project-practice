<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="../css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="../css/manage.css" type="text/css" media="screen" />
</head>

<body><br><br>
	<header><!-- header 시작 -->
		<jsp:include page="../management/top.jsp" flush="false" />
		<nav id="navi"><!-- navi 시작 -->
			<ul>
				<li><a href="../index.jsp?CONTENTPAGE=content.jsp">
					<img src="../img/home.png"></a></li>
				<li>&#5171;</li>
				<li>상품관리:작성화면</li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->
	
	<!-- div center 시작 -->
	<div align="center"><br><br>
		<h3>상품관리:작성화면</h3><hr><br><br>
		<h2><a href=../cart/cart_control.jsp?action=aSearch>[상품 목록으로]</a></h2>
		
		<form name=product method=post action="../cart/cart_control.jsp">
			<input type=hidden name="action" value="productInsert">
			<table border="1">
				<tr>
					<th>상품번호</th>
					<td><input type="text" name="product_no" maxlength="4"></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="product_name" maxlength="20"></td>
				</tr>
				<tr>
					<th>위치</th>
					<td><input type="text" name="location" maxlength="50"></td>
				</tr>
				<tr>
					<th>상품상세</th>
					<td><input type="text" name="product_detail" maxlength="50"></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><input type="text" name="ratings" maxlength="10"></td>
				</tr>
				<tr>
					<th>리뷰수</th>
					<td><input type="number" name="review"></td>
				</tr>
				<tr>
					<th>상품구분</th>
					<td><input type="text" name="distinguishing" maxlength="10"></td>
				</tr>
				<tr>
					<th>이용시간</th>
					<td><input type="text" name="time" maxlength="30"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" maxlength="20"></td>
				</tr>
				<tr>
					<th>경로</th>
					<td><input type="text" name="src" maxlength="20"></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type=submit value="저장"><input
						type=reset value="취소"></td>
				</tr>
			</table>
		</form>
	</div><!-- div center 끝 -->
	<footer><jsp:include page="../module/bottom.jsp" flush="false" /></footer>
</body>
