<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h2> 로그인 </h2>
<form method="post" action="loginProcess.jsp">
  <dl>
    <dd>
      <label for="id">아이디</label>
      <input id="id" name="id" type="text" placeholder="아이디 입력" autofocus>
    </dd>
    <dd>
      <label for="pass">비밀번호</label>
      <input id="pass" name="pass" type="password" placeholder="비밀번호" >
    </dd>
    <dd>
      <input type="submit" value="로그인">
    </dd>
  </dl>
</form>


