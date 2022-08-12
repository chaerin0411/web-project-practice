<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="css/form.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/join.css" type="text/css" media="screen" />
	<script src="js/join.js"></script>
</head>

<!-- joinForm.jsp -->
<%
	String verified = (String)session.getAttribute("verified");
	if (verified != null) { %>
		<script>alert("이미 존재하는 아이디입니다!");</script><%
		session.removeAttribute("verified");
	}
%>

<body>
<header><!-- header 시작 -->
	<nav id="navi"><!-- navi 시작 -->
		<ul>
			<li><a href="index.jsp?CONTENTPAGE=content.jsp">
				<img src="img/home.png"></a></li>
			<li>&#5171;</li>
			<li><a href="index.jsp?CONTENTPAGE=joinForm.jsp">회원가입</a></li>
		</ul>
	</nav><!-- navi 끝 -->
</header><!-- header 끝 -->

<!-- section main 시작 -->
<section id="main">
	<h3>회원가입 - Sign up Page</h3>
	<form name="join" method=post onsubmit="return check()"
		action="management/manager_control.jsp">
		<input type=hidden name="action" value="join">
		
		<!-- table 시작 -->
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id" maxlength="10" placeholder="아이디"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pwd" maxlength="50" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" maxlength="20" placeholder="홍길동"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="member_birth"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="member_tel" maxlength="20" placeholder="010-0000-0000"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="member_email" placeholder="abc@site.net"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="member_addr" placeholder="서울시 구로구 경인로 445"></td>
			</tr>
			<tr>
				<td id="trf" colspan=2>모든 필드에 값을 입력해주세요!</td>
			</tr>
		</table><!-- table 끝 -->
		<input type=submit value="회원가입">
		<input type=reset value="취소"></td>
	</form>
</section><!-- section main 끝 -->
</body>