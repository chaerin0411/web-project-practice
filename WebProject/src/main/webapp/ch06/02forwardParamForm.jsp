<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0"/>

<h2>포워딩될페이지에 파라미터값 전달 예제</h2>
<form method="post" action="02forwardParamTo.jsp">
	<dl>
		<dd>
			<lable for="name">이름</lable>
			<input id="name" name="name" type="text"
					placeholder="홍길동" autofocus required>
		</dd>
		<dd>
			<label for="color">색선택</label>
			<select id="color" name="color" required>
				<option value="blue" selected>파랑색
				<option value="red">빨강색
				<option value="yellow">노랑색
			</select>
		</dd>
		<dd>
			<input type="submit" value="확인">
		</dd>
	</dl>	
</form>
<title>02ForwardParamForm.jsp</title>
</head>
<body>

</body>
</html>