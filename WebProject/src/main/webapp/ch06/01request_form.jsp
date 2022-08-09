<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 객체</title>
<style>
	table, td { border: 1px solid black; }
</style>
</head>
<body>
	<div>
		<h2>request 테스트 폼</h2>
		<hr>
		<form name=form1 method=post action="01request_result.jsp">
			<table>
				<tr>
					<td>이름</td>
					<td><input type=text size=10 name=username></td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
					<select name=job>
						<option selected>무직</option>
						<option>회사원</option>
						<option>전문직</option>
						<option>학생</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
					<input type=checkbox name=favorite value="정치">정치
					<input type=checkbox name=favorite value="사회">사회
					<input type=checkbox name=favorite value="정보통신">정보통신
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center>
					<input type=submit value="확인">
					<input type=reset value="취소">
					</td>
				</tr>				
			</table>
		</form>
	</div>
</body>
</html>