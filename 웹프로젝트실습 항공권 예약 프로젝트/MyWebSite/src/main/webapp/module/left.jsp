<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session"/>

<!-- header 시작 -->
<nav id="left">
	<!-- navi left 시작 -->
	<ul>
		<li>&#10148; <a href="reservation/reservation_control.jsp?action=list&member_id=<%=mb.getMember_id()%>">나의 예약</a></li>
		<li>&#10148; <a href="index.jsp?CONTENTPAGE=myReview.jsp">나의 리뷰</a></li>
		<li>&#10148; <a href="cart/cart_control.jsp?action=list&member_id=<%=mb.getMember_id()%>">나의 저장</a></li>
		<hr>
		<li>&#10148; <a href="management/manager_control.jsp?action=infoEdit&member_id=<%=mb.getMember_id()%>">나의 정보</a></li>
	</ul>
</nav>
<!-- navi left 끝 -->
<!-- header 끝 -->