<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 예약 사이트</title>
    <link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="js/carousel.js"></script>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
	if(contentPage == null) { contentPage = "content.jsp"; }
%>
</head>
<body>
	<header>
		<jsp:include page="module/top.jsp" flush="false"/>
	</header>
	<jsp:include page='<%= "module/" + contentPage %>' flush="false"/>
	<footer>
		<jsp:include page="module/bottom.jsp" flush="false"/>
	</footer>
</body>
</html>