<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch06 : request_result.jsp</title>
</head>
<body>
	<div align="center">
		<h2>request 테스트 결과 - 1</h2>
	
		<hr>
		<table border=1 cellspacing="1" cellpadding="5">
			<tr>
				<td>이름</td>
				<td><%=request.getParameter("username") %> </td>
			</tr>
			<tr>
				<td>직업</td>
				<td><%=request.getParameter("job") %> </td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
				<%
					// getParameterValues 메소드를 이용해 "favorite" 로 설정된 form 의 
					String favorites[] = request.getParameterValues("favorite");
			
					/*
					// 배열의 크기만큼 루프를 돌면서 값을 출력함.
					for(int i=0; i<favorites.length; i++) {
						out.println(favorites[i] + "<br>");
					}
					*/
					
					// java 5.0 코드
					for(String favorite: favorites) {
						out.println(favorite + "<br>");
					}
				%>
		</table>
		<hr>
		<h2>request 테스트 결과 - 2</h2>
		<table border=0>
			<tr>
				<td>
				1. 클라이언트 IP 주소 : <%= request.getRemoteAddr() %> <br>
				2. 요청 메소드 : <%= request.getMethod() %> <br>
				<%
					Cookie cookie[] = request.getCookies();
				%>
				3. <%= cookie[0].getName() %> 에 설정된 쿠기값 : <%= cookie[0].getValue() %> <br>
				4. 프로토콜 : <%= request.getProtocol() %>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>