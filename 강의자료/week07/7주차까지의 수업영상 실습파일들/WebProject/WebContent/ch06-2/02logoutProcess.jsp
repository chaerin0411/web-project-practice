<%@ page contentType="text/html; charset=utf-8" %>
<%
		session.removeAttribute("MEMBERID");
		response.sendRedirect("02loginForm.jsp");
%>
