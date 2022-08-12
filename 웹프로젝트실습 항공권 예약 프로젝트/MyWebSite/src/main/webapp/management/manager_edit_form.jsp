<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="manager_error.jsp" import="memberManagement.*"%>
<jsp:useBean id="mb" scope="session" class="memberManagement.ManagementBook" />
<head>
	<link rel="stylesheet" href="../css/index.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="../css/manage.css" type="text/css" media="screen" />
</head>

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		} else return;
	}
</script>

<!-- manager_edit_form.jsp -->
<body><br><br>
	<header><!-- header 시작 -->
		<jsp:include page="top.jsp" flush="false" />
		<nav id="navi"><!-- navi 시작 -->
			<ul>
				<li><a href="../index.jsp?CONTENTPAGE=content.jsp">
					<img src="../img/home.png"></a></li>
				<li>&#5171;</li>
				<li>회원관리:수정화면</li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->

	<!-- div center 시작 -->
	<div align="center"><br><br>
		<h3>회원관리:수정화면</h3><hr><br><br>
		<h2><a href=manager_control.jsp?action=list>[회원관리 목록으로]</a></h2>
		
		<form name=form1 method=post action=manager_control.jsp>
			<input type=hidden name="member_id" value="<%=mb.getMember_id()%>">
			<input type=hidden name="member_pwd" value="<%=mb.getMember_pwd()%>">
			<input type=hidden name="action" value="update">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name"
						value="<%=mb.getMember_name()%>"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="member_birth"
						value="<%=mb.getMember_birth()%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="member_tel"
						value="<%=mb.getMember_tel()%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="member_email"
						value="<%=mb.getMember_email()%>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="member_addr"
						value="<%=mb.getMember_addr()%>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type=submit value="저장">
						<input type=reset value="취소">
						<input type="button" value="삭제" onClick="delcheck()">
					</td>
				</tr>
			</table>
		</form>
		<footer><jsp:include page="../module/bottom.jsp" flush="false" /></footer>
	</div><!-- div center 끝 -->
</body>