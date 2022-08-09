<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 객체</title>
</head>
<body>
<%
String gradeStringA=" 10보다 크다";
String gradeStringB=" 5보다 크다";
int grade=7;

if(grade>10) { %>
	<%= gradeStringA %>
<% } else if(grade>5) { %>
	<%= gradeStringB %>
<% } %>

<%-- <%
	if(grade>10) {
		out.println(gradeStringA);
	} else if(grade>5) {
		out.println(gradeStringB);
	}
%> --%>
</body>
</html>