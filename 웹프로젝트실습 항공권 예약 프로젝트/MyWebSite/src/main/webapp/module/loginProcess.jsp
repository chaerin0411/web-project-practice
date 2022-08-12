<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, memberManagement.*"%>

<jsp:useBean id="mbean" class="memberManagement.ManagementBean" scope="session"/> 
<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session"/>

<%
	String member_id = request.getParameter("member_id");
	String member_pwd = request.getParameter("member_pwd");
	String member_name = mbean.loginCheck(member_id,member_pwd); 
		
	if (member_name != null) {	
		session.setAttribute("member_login", "ok");
		if(request.getParameter("save") == null) {
			session.removeAttribute("loginSave");
		} else { session.setAttribute("loginSave", "check"); }
		
		session.setAttribute("member_id", member_id);
		session.setAttribute("member_pwd", member_pwd);
		session.setAttribute("member_name", member_name);
		ManagementBook mbook = mbean.getDB(member_id);
		session.setAttribute("mb",mbook);
		
		if(member_id.equals("admin") && member_pwd.equals("admin"))
			response.sendRedirect("../management/manager_control.jsp?action=list");
		else response.sendRedirect("../index.jsp?CONTENTPAGE=content.jsp");			
	}
	else {
		session.setAttribute("loginPcs", "false");
		response.sendRedirect("../index.jsp?CONTENTPAGE=loginForm.jsp");
	}
%>