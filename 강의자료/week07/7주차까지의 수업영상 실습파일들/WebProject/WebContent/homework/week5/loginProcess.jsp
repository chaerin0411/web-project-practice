<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% request.setCharacterEncoding("utf-8");%>

<%
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");
  
  if(id.equals("dong") && pass.equals("1234")) {
		response.sendRedirect("index.jsp");
  } else {
%>
		<!DOCTYPE html>
		<html>
		<head><title>로그인에 실패</title></head>
		<body>
		잘못된 아이디입니다. <p>
		<form method="post" action="login.jsp">
			<input type="submit" value="로그인 재시도">
		</form>
		</body>
		</html>
<%
   }
%>
  
  
  
  