<%@ page language="java" contentType="text/html; charset=UTF-8" 
        pageEncoding="UTF-8" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 제목</title>
</head>
<body>
안녕하세요. <br>
<%
     String bookTitle= "JSP 기초";			
    String author= "김동양";  
    Date da= new Date(); 
    out.println( "책이름 : "+ bookTitle +"<br>");
%>		

<%! String ddddd="난 선언부"; %>

<h5><%= bookTitle %></h5>
저자는 (<%= author %>)입니다. <br>
현재 날짜와 시간은 : <%= da %>

</body>
</html>