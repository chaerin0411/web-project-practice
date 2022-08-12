<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="../management/manager_error.jsp" import="reservationManagement.*, memberManagement.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="rbean" class="reservationManagement.ReservationBean" scope="session"/> 
<jsp:useBean id="rb" class="reservationManagement.ReservationBook" scope="session"/>
<jsp:useBean id="sb" class="reservationManagement.ReservationBook" scope="session"/>
<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session"/>
<jsp:setProperty name="rb" property="*"/> 

<% 
	String action = request.getParameter("action"); // 컨트롤러 요청 파라미터
	String memberLogin = (String)session.getAttribute("member_login"); // 로그인 확인 파라미터

	// 파라미터에 따른 요청 처리
	// 전체 항공권 예약정보 목록 요청인 경우
	if(action.equals("alist")) {
		ArrayList<ReservationBook> rDatas = rbean.getAllDBList();
		session.setAttribute("rDatas", rDatas);
		response.sendRedirect("reservation_list.jsp");
	}
	
	// 특정 회원의 항공권 예약정보 목록 요청인 경우
	else if(action.equals("list")) {
		ArrayList<ReservationBook> rDatas = rbean.getDBList(mb.getMember_id());
		session.setAttribute("rDatas", rDatas);
		response.sendRedirect("../index.jsp?CONTENTPAGE=myFlight.jsp");
	}
	
	// 항공권 좌석 예약 요청인 경우
	else if(action.equals("seat")) {
		rb.setServe_seat_no(request.getParameter("seat"));
		if(rb.getGrade().equals("economy"))
			rb.setTicket_price(sb.getFreightfee());
		else if(rb.getGrade().equals("business"))
			rb.setTicket_price(sb.getFreightfee()+10000);
		else if(rb.getGrade().equals("first"))
			rb.setTicket_price(sb.getFreightfee()+30000);			
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess2.jsp");
	}
	
	// 항공권 예약 요청인 경우
	else if(action.equals("insert")) {
		if(rbean.insertDB(rb)) {
			response.sendRedirect("reservation_control.jsp?action=list");
		} else throw new Exception("DB 입력오류");		
	}
	
	// 항공권 예약정보 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		ReservationBook rbook = rbean.getDB(rb.getReservation_no());
		session.setAttribute("rb",rbook);
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservation_edit_form.jsp");
	}
	
	// 항공권 예약정보 수정 등록 요청인 경우: 요청 거절
	else if(action.equals("update")) {
		response.sendRedirect("reservation_control.jsp?action=list");
	}
	
	// 항공권 예약 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(rbean.deleteDB(rb.getReservation_no())) {
			response.sendRedirect("reservation_control.jsp?action=list");
		} else throw new Exception("DB 삭제 오류");
	}
	
	// 전체 항공권 검색 요청인 경우
	else if(action.equals("search")) {
		if(memberLogin == null) {
			session.setAttribute("firstLogin", "yet");
			response.sendRedirect("../index.jsp?CONTENTPAGE=loginForm.jsp");
		}
		else { // 로그인 되어있음
			ArrayList<ReservationBook> sDatas = rbean.getScheduleList();
			session.setAttribute("sDatas", sDatas);
			response.sendRedirect("../index.jsp?CONTENTPAGE=reservation.jsp");
		}
	}
	
	// 특정 도시 항공권 검색 요청인 경우
	else if(action.equals("csearch")) {
		ArrayList<ReservationBook> sDatas = rbean.getSchedule(rb.getStart_port(), rb.getEnd_port());
		session.setAttribute("sDatas", sDatas);
		session.setAttribute("seat", request.getParameter("grade"));
		rb.setGrade(request.getParameter("grade"));
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess1.jsp");
	}
	
	// 특정 도시 항공권 검색 요청인 경우 - 가격낮은순
	else if(action.equals("lowPrice")) {
		ArrayList<ReservationBook> sDatas = rbean.getSchedulePA(rb.getStart_port(), rb.getEnd_port());
		session.setAttribute("sDatas", sDatas);
		session.setAttribute("seat", request.getParameter("grade"));
		rb.setGrade(request.getParameter("grade"));
		session.setAttribute("selop", "pa");
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess1.jsp");
	}
	
	// 특정 도시 항공권 검색 요청인 경우 - 가격높은순
	else if(action.equals("highPrice")) {
		ArrayList<ReservationBook> sDatas = rbean.getSchedulePD(rb.getStart_port(), rb.getEnd_port());
		session.setAttribute("sDatas", sDatas);
		session.setAttribute("seat", request.getParameter("grade"));
		rb.setGrade(request.getParameter("grade"));
		session.setAttribute("selop", "pd");
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess1.jsp");
	}
	
	// 특정 도시 항공권 검색 요청인 경우 - 출발시간 빠른순
	else if(action.equals("fastDeparture")) {
		ArrayList<ReservationBook> sDatas = rbean.getScheduleDA(rb.getStart_port(), rb.getEnd_port());
		session.setAttribute("sDatas", sDatas);
		session.setAttribute("seat", request.getParameter("grade"));
		rb.setGrade(request.getParameter("grade"));
		session.setAttribute("selop", "da");
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess1.jsp");
	}
	
	// 특정 도시 항공권 검색 요청인 경우 - 출발시간 느린순
	else if(action.equals("lowDeparture")) {
		ArrayList<ReservationBook> sDatas = rbean.getScheduleDD(rb.getStart_port(), rb.getEnd_port());
		session.setAttribute("sDatas", sDatas);
		session.setAttribute("seat", request.getParameter("grade"));
		rb.setGrade(request.getParameter("grade"));
		session.setAttribute("selop", "dd");
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess1.jsp");
	}
	
	// 특정 특가 도시 항공권 검색 요청인 경우
	else if(action.equals("specialSearch")) {
		rb.setStart_port(request.getParameter("start_port"));
		rb.setEnd_port(request.getParameter("end_port"));
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservation.jsp");
	}	
	
	// 특정 항공권 검색 요청인 경우
	else if(action.equals("ssearch")) {
		ReservationBook sbook = rbean.getScheduleDB(rb.getSchedule_no());
		session.setAttribute("sb",sbook);
		response.sendRedirect("../index.jsp?CONTENTPAGE=reservationProcess2.jsp");
	}
	
	// 마이페이지 요청인 경우
	else if(action.equals("myPage")) {
		if(memberLogin == null) {
			session.setAttribute("firstLogin", "yet");
			response.sendRedirect("../index.jsp?CONTENTPAGE=loginForm.jsp");
		}
		else { // 로그인 되어있음
			response.sendRedirect("reservation_control.jsp?action=list");
		}
	}
	else out.println("<script>alert('action 파라미터를 확인해 주세요!')</script>");
%>