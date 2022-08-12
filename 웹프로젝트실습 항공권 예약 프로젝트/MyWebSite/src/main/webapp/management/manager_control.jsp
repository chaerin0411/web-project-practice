<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="manager_error.jsp" import="memberManagement.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:useBean id="mbean" class="memberManagement.ManagementBean" scope="session"/> 
<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session"/>
<jsp:setProperty name="mb" property="*"/>
<% request.setCharacterEncoding("utf-8"); %>

<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 회원관리 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<ManagementBook> datas = mbean.getDBList();
		session.setAttribute("datas", datas);
		pageContext.forward("manager_list.jsp");
	}
	
	// 회원관리 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(mbean.insertDB(mb)) {
			response.sendRedirect("manager_control.jsp?action=list");
		} else throw new Exception("DB 입력오류");
	}
	
	// 회원관리 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		ManagementBook mbook = mbean.getDB(mb.getMember_id());
		if(!request.getParameter("upwd").equals("admin")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			session.setAttribute("mb",mbook);
			response.sendRedirect("manager_edit_form.jsp");
		}	
	}
	
	// 회원관리 수정 등록 요청인 경우
	else if(action.equals("update")) {
		if(mbean.updateDB(mb)) {
			response.sendRedirect("manager_control.jsp?action=list");
		} else throw new Exception("DB 갱신오류");
	}
	
	// 회원관리 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(mbean.deleteDB(mb.getMember_id())) {
			response.sendRedirect("manager_control.jsp?action=list");
		} else throw new Exception("DB 삭제 오류");
	}
	
	// 회원가입 요청인 경우
	else if(action.equals("join")) {
		if(mbean.joinCheck((String)request.getParameter("member_id"))) {
			session.setAttribute("verified", "error");
			response.sendRedirect("../index.jsp?CONTENTPAGE=joinForm.jsp");
		} else if(mbean.insertDB(mb)) {
			session.setAttribute("joinEnd","end");
			response.sendRedirect("../index.jsp?CONTENTPAGE=loginForm.jsp");
		} else throw new Exception("DB 입력오류");
	}
	
	// 회원관리 수정 페이지 요청인 경우
		else if(action.equals("infoEdit")) {
			ManagementBook mbook = mbean.getDB(mb.getMember_id());
			session.setAttribute("mb",mbook);
			response.sendRedirect("../index.jsp?CONTENTPAGE=myInfo.jsp");
	}
	
	// 회원정보 수정 등록 요청인 경우
		else if(action.equals("infoUpdate")) {
			if(mbean.updateDB(mb)) {
				response.sendRedirect("../index.jsp?CONTENTPAGE=myFlight.jsp");
			} else throw new Exception("DB 갱신오류");
		}
	
	else out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
%>