<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("loginSave") == null) {
		session.removeAttribute("member_id");
		session.removeAttribute("member_pwd");
	}
	session.removeAttribute("member_login");
	session.removeAttribute("loginPcs");
	session.removeAttribute("mb");
	response.sendRedirect("../index.jsp?CONTENTPAGE=content.jsp");
%>