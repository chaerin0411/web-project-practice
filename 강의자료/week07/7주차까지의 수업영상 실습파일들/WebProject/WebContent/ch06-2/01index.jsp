<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4개의 영역과 속성</title>
</head>
<body>
<h6>웹프로젝트실습 7주차 </h6>
<h5> 4개의 영역과 속성 알아보기</h5>

<% session.setAttribute("testId", "Yongmi"); %>

<form method="post" action="01second.jsp">
	<input type="submit" value="2번째 페이지로 ">
</form>

</body>
</html>