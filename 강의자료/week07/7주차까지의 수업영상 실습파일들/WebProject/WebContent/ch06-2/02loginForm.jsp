<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>폼 생성</title></head>
<body>

<%
	String id = (String)session.getAttribute("MEMBERID");
	if (id== null) { 
%>
		<form action="02loginProcess.jsp" method="get">
		아이디: <input type="text" name="id" size="10"> <br>
		비밀번호: <input type="password" name="pwd" size="10"> <br>
		<br>
		<input type="submit" value="로그인">
		</form>

<%		
	} else {		
		out.print(id+"님, "  );	
%>		
		<form action="02logoutProcess.jsp" method="get">
			<input type="submit" value="로그아웃">
		</form>	
<%		
	}
%>











</body>
</html>
