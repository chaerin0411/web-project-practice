<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProcess.jsp</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(id.equals("dong") && pwd.equals("1234"))
		response.sendRedirect("index.jsp");
	else if(id.equals("dong"))
		out.println("잘못된 비밀번호입니다.");
	else
		out.println("잘못된 아이디입니다.");
	%>
	<form action="login.jsp" method="post">
		<input type="submit" value="로그인 재시도">
	</form>
</body>
</html>