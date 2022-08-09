<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	<h1>로그인</h1>
	
	<form action="loginProcess.jsp" method="post">
		<table>
			<tr>
				<td><b>아이디</b></td>
				<td><input type="text" size=20 name="id" placeholder="아이디 입력"></td>
			</tr>			
			<tr>
				<td><b>비밀번호</b></td>
				<td><input type="password" size=20 name="pwd" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>