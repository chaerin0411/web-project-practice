<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD><TITLE>ch06 : page_control.jsp</TITLE></HEAD>
<BODY>
<H2>forward, sendRedirect 테스트</H2>
<HR>
<form method=post action="03forward_action2.jsp">
	forward action : <input type=text name=username>
	<input type=submit value="확인">
</form>

<form method=post action="03response_sendRedirect.jsp">
	response.sendRedirect : <input type=text name=username>
	<input type=submit value="확인">
</form>
</BODY>
</HTML>