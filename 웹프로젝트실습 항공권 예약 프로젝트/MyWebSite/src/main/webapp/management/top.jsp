<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, memberManagement.*"%>

<%
	String memberName	= (String)session.getAttribute("member_name");
	String memberLogin	= (String)session.getAttribute("member_login");
	String memberStr = "", loginStr = null, linkStr = null;
	
	if (memberLogin == null) {
		loginStr	= "로그인";
		linkStr		= "../index.jsp?CONTENTPAGE=loginForm.jsp";
	}
	else {
		memberStr	= memberName+"님";
		loginStr	= "로그아웃";
		linkStr		= "../module/logoutProcess.jsp";
	}
%>
<!-- header 시작 -->
<!-- section top 시작 -->
<section id="top">
	<a id="logo" href="../index.jsp"><img id="logo_img" src="../img/logo.png"></a>
	<nav id="main_menu">
		<ul>
			<li><a href="../index.jsp">메인</a></li>
			<li><a href="../reservation/reservation_control.jsp?action=search">항공권 예약</a></li>
			<li><a href="../index.jsp?CONTENTPAGE=information.jsp">여행지 정보</a></li>
			<li><a href="../reservation/reservation_control.jsp?action=list">마이페이지</a></li>
		</ul>
	</nav>
	<nav id="top_menu">
		<ul>
			<li><%= memberStr %></li>
			<li class="bdright"><a href="<%= linkStr %>"><%= loginStr %></a></li>
			<li><a href="../index.jsp?CONTENTPAGE=joinForm.jsp">회원가입</a></li>
			<li id="member"><a href="../reservation/reservation_control.jsp?action=list"><img id="member_img" src="../img/member.png"></a></li>
		</ul>
	</nav>
</section><!-- section top 끝 -->
<!-- header 끝 -->