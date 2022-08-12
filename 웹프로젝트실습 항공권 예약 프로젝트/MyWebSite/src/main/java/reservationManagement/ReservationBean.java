package reservationManagement;

import java.sql.*;
import java.util.*;

/**
 * File : ReservationBean.java
 * Desc : 항공권 예약 프로그램 DAO 클래스
 * @author 웹프로젝트실습 기말프로젝트 1조(전채린, 엄지희)
 */

public class ReservationBean {

	Connection conn = null;
	PreparedStatement pstmt = null;

	/*
	 * Oracle 연결정보 String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; String
	 * jdbc_url = "jdbc:oracle:thin:@220.68.14.7:1521";
	 */

	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/tripdb?" + 
			   		  "useUnicode=true&characterEncoding=utf-8&" + 
			   		  "serverTimezone=UTC&useSSL=false";

	// DB 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "admin");
		} catch (Exception e) { e.printStackTrace(); }
	}

	void disconnect() {
		if (pstmt != null) {
			try { pstmt.close(); }
			catch (SQLException e) { e.printStackTrace(); }
		}
		if (conn != null) {
			try { conn.close(); }
			catch (SQLException e) { e.printStackTrace(); }
		}
	}

	// 항공권 예약 삭제 메서드
	public boolean deleteDB(Integer reservation_no) {
		connect();
		String sql = "delete from reservation where reservation_no=?;";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservation_no);
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 항공권 예약 추가 메서드
	public boolean insertDB(ReservationBook reservationbook) {
		connect(); // sql 문자열 , reservation_no는 자동 등록 되므로 입력하지 않는다.
		String sql = "insert into reservation(member_id, date, "+
					 "schedule_no, serve_seat_no, ticket_price) "+
					 "values(?, ?, ?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservationbook.getMember_id());
			pstmt.setString(2, reservationbook.getDate());
			pstmt.setString(3, reservationbook.getSchedule_no());
			pstmt.setString(4, reservationbook.getServe_seat_no());
			pstmt.setInt(5, reservationbook.getTicket_price());
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 특정 항공권 예약 정보 조회 메서드
	public ReservationBook getDB(Integer reservation_no) {
		connect(); Statement stmt = null;
		ReservationBook reservationbook = new ReservationBook();
		String sql = "select a.reservation_no, a.member_id, a.date, a.schedule_no, "+
				 	 "b.departure_time, b.arrival_time, b.start_port, b.end_port, "+
				 	 "a.serve_seat_no, a.ticket_price, c.airplane_no, d.grade "+
				 	 "from reservation a join schedule b join serve_seat c join seat d "+
				 	 "where a.reservation_no='"+reservation_no+"' "+
				 	 "and a.schedule_no=b.schedule_no and a.serve_seat_no=c.serve_seat_no "+
				 	 "and c.seat_no=d.seat_no and c.airplane_no=d.airplane_no "+
				 	 "order by reservation_no;";
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			reservationbook.setReservation_no(rs.getInt("a.reservation_no"));
			reservationbook.setMember_id(rs.getString("a.member_id"));
			reservationbook.setDate(rs.getString("a.date"));
			reservationbook.setSchedule_no(rs.getString("a.schedule_no"));
			reservationbook.setDeparture_time(rs.getString("b.departure_time"));
			reservationbook.setArrival_time(rs.getString("b.arrival_time"));
			reservationbook.setStart_port(rs.getString("b.start_port"));
			reservationbook.setEnd_port(rs.getString("b.end_port"));
			reservationbook.setServe_seat_no(rs.getString("a.serve_seat_no"));
			reservationbook.setTicket_price(rs.getInt("a.ticket_price"));
			reservationbook.setAirplane_no(rs.getString("c.airplane_no"));
			reservationbook.setGrade(rs.getString("d.grade"));
			rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return reservationbook;
	}

	// 전체 항공권 예약 목록 조회 메서드
	public ArrayList<ReservationBook> getAllDBList() {
		connect(); Statement stmt = null;
		ArrayList<ReservationBook> rDatas = new ArrayList<ReservationBook>();
		String sql = "select a.reservation_no, a.member_id, a.date, a.schedule_no, "+
					 "b.departure_time, b.arrival_time, b.start_port, b.end_port, "+
					 "a.serve_seat_no, a.ticket_price, c.airplane_no, d.grade "+
					 "from reservation a join schedule b join serve_seat c join seat d "+
					 "where a.schedule_no=b.schedule_no and a.serve_seat_no=c.serve_seat_no "+
					 "and c.seat_no=d.seat_no and c.airplane_no=d.airplane_no "+
					 "order by reservation_no;";
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setReservation_no(rs.getInt("a.reservation_no"));
				reservationbook.setMember_id(rs.getString("a.member_id"));
				reservationbook.setDate(rs.getString("a.date"));
				reservationbook.setSchedule_no(rs.getString("a.schedule_no"));
				reservationbook.setDeparture_time(rs.getString("b.departure_time"));
				reservationbook.setArrival_time(rs.getString("b.arrival_time"));
				reservationbook.setStart_port(rs.getString("b.start_port"));
				reservationbook.setEnd_port(rs.getString("b.end_port"));
				reservationbook.setServe_seat_no(rs.getString("a.serve_seat_no"));
				reservationbook.setTicket_price(rs.getInt("a.ticket_price"));
				reservationbook.setAirplane_no(rs.getString("c.airplane_no"));
				reservationbook.setGrade(rs.getString("d.grade"));
				rDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return rDatas;
	}
	
	// 특정 회원의 항공권 예약 목록 조회 메서드
	public ArrayList<ReservationBook> getDBList(String member_id) {
		connect(); Statement stmt = null;
		ArrayList<ReservationBook> rDatas = new ArrayList<ReservationBook>();
		String sql = "select a.reservation_no, a.member_id, a.date, a.schedule_no, "+
					 "b.departure_time, b.arrival_time, b.start_port, b.end_port, "+
					 "a.serve_seat_no, a.ticket_price, c.airplane_no, d.grade "+
					 "from reservation a join schedule b join serve_seat c join seat d "+
					 "where a.member_id='"+member_id+"' "+
					 "and a.schedule_no=b.schedule_no and a.serve_seat_no=c.serve_seat_no "+
					 "and c.seat_no=d.seat_no and c.airplane_no=d.airplane_no "+
					 "order by reservation_no;";
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setReservation_no(rs.getInt("a.reservation_no"));
				reservationbook.setMember_id(rs.getString("a.member_id"));
				reservationbook.setDate(rs.getString("a.date"));
				reservationbook.setSchedule_no(rs.getString("a.schedule_no"));
				reservationbook.setDeparture_time(rs.getString("b.departure_time"));
				reservationbook.setArrival_time(rs.getString("b.arrival_time"));
				reservationbook.setStart_port(rs.getString("b.start_port"));
				reservationbook.setEnd_port(rs.getString("b.end_port"));
				reservationbook.setServe_seat_no(rs.getString("a.serve_seat_no"));
				reservationbook.setTicket_price(rs.getInt("a.ticket_price"));
				reservationbook.setAirplane_no(rs.getString("c.airplane_no"));
				reservationbook.setGrade(rs.getString("d.grade"));
				rDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return rDatas;
	}

	// 전체 항공사 스케줄 목록 조회 메서드
	public ArrayList<ReservationBook> getScheduleList() {
		connect();
		ArrayList<ReservationBook> sDatas = new ArrayList<ReservationBook>();
		String sql = "select * from schedule order by freightfee asc;";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setSchedule_no(rs.getString("schedule_no"));
				reservationbook.setDeparture_time(rs.getString("departure_time"));
				reservationbook.setArrival_time(rs.getString("arrival_time"));
				reservationbook.setStart_port(rs.getString("start_port"));
				reservationbook.setEnd_port(rs.getString("end_port"));
				reservationbook.setAirplane_no(rs.getString("airplane_no"));
				reservationbook.setFreightfee(rs.getInt("freightfee"));
				sDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return sDatas;
	}

	// 특정 도시 항공사 스케줄 가져오는 메서드
	public ArrayList<ReservationBook> getSchedule(String start_port, String end_port) {
		connect();
		ArrayList<ReservationBook> sDatas = new ArrayList<ReservationBook>();
		String sql = "select * from schedule where start_port=? and end_port=? order by freightfee asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start_port);
			pstmt.setString(2, end_port);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setSchedule_no(rs.getString("schedule_no"));
				reservationbook.setDeparture_time(rs.getString("departure_time"));
				reservationbook.setArrival_time(rs.getString("arrival_time"));
				reservationbook.setStart_port(rs.getString("start_port"));
				reservationbook.setEnd_port(rs.getString("end_port"));
				reservationbook.setAirplane_no(rs.getString("airplane_no"));
				reservationbook.setFreightfee(rs.getInt("freightfee"));
				sDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return sDatas;
	}

	// 특정 도시 항공사 스케줄 가져오는 메서드 - 가격낮은순
	public ArrayList<ReservationBook> getSchedulePA(String start_port, String end_port) {
		connect();
		ArrayList<ReservationBook> sDatas = new ArrayList<ReservationBook>();
		String sql = "select * from schedule where start_port=? and end_port=? order by freightfee asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start_port);
			pstmt.setString(2, end_port);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setSchedule_no(rs.getString("schedule_no"));
				reservationbook.setDeparture_time(rs.getString("departure_time"));
				reservationbook.setArrival_time(rs.getString("arrival_time"));
				reservationbook.setStart_port(rs.getString("start_port"));
				reservationbook.setEnd_port(rs.getString("end_port"));
				reservationbook.setAirplane_no(rs.getString("airplane_no"));
				reservationbook.setFreightfee(rs.getInt("freightfee"));
				sDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return sDatas;
	}

	// 특정 도시 항공사 스케줄 가져오는 메서드 - 가격높은순
	public ArrayList<ReservationBook> getSchedulePD(String start_port, String end_port) {
		connect();
		ArrayList<ReservationBook> sDatas = new ArrayList<ReservationBook>();
		String sql = "select * from schedule where start_port=? and end_port=? order by freightfee desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start_port);
			pstmt.setString(2, end_port);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setSchedule_no(rs.getString("schedule_no"));
				reservationbook.setDeparture_time(rs.getString("departure_time"));
				reservationbook.setArrival_time(rs.getString("arrival_time"));
				reservationbook.setStart_port(rs.getString("start_port"));
				reservationbook.setEnd_port(rs.getString("end_port"));
				reservationbook.setAirplane_no(rs.getString("airplane_no"));
				reservationbook.setFreightfee(rs.getInt("freightfee"));
				sDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return sDatas;
	}

	// 특정 도시 항공사 스케줄 가져오는 메서드 - 출발시간 빠른순
	public ArrayList<ReservationBook> getScheduleDA(String start_port, String end_port) {
		connect();
		ArrayList<ReservationBook> sDatas = new ArrayList<ReservationBook>();
		String sql = "select * from schedule where start_port=? and end_port=? order by departure_time asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start_port);
			pstmt.setString(2, end_port);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setSchedule_no(rs.getString("schedule_no"));
				reservationbook.setDeparture_time(rs.getString("departure_time"));
				reservationbook.setArrival_time(rs.getString("arrival_time"));
				reservationbook.setStart_port(rs.getString("start_port"));
				reservationbook.setEnd_port(rs.getString("end_port"));
				reservationbook.setAirplane_no(rs.getString("airplane_no"));
				reservationbook.setFreightfee(rs.getInt("freightfee"));
				sDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return sDatas;
	}

	// 특정 도시 항공사 스케줄 가져오는 메서드 - 출발시간 느린순
	public ArrayList<ReservationBook> getScheduleDD(String start_port, String end_port) {
		connect();
		ArrayList<ReservationBook> sDatas = new ArrayList<ReservationBook>();
		String sql = "select * from schedule where start_port=? and end_port=? order by departure_time desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start_port);
			pstmt.setString(2, end_port);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				ReservationBook reservationbook = new ReservationBook();
				reservationbook.setSchedule_no(rs.getString("schedule_no"));
				reservationbook.setDeparture_time(rs.getString("departure_time"));
				reservationbook.setArrival_time(rs.getString("arrival_time"));
				reservationbook.setStart_port(rs.getString("start_port"));
				reservationbook.setEnd_port(rs.getString("end_port"));
				reservationbook.setAirplane_no(rs.getString("airplane_no"));
				reservationbook.setFreightfee(rs.getInt("freightfee"));
				sDatas.add(reservationbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return sDatas;
	}

	// 특정 항공사 스케줄 가져오는 메서드
	public ReservationBook getScheduleDB(String schedule_no) {
		connect();
		String sql = "select * from schedule where schedule_no=?";
		ReservationBook reservationbook = new ReservationBook();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schedule_no);
			ResultSet rs = pstmt.executeQuery();

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			reservationbook.setSchedule_no(rs.getString("schedule_no"));
			reservationbook.setDeparture_time(rs.getString("departure_time"));
			reservationbook.setArrival_time(rs.getString("arrival_time"));
			reservationbook.setStart_port(rs.getString("start_port"));
			reservationbook.setEnd_port(rs.getString("end_port"));
			reservationbook.setAirplane_no(rs.getString("airplane_no"));
			reservationbook.setFreightfee(rs.getInt("freightfee"));
			rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return reservationbook;
	}

	// 항공 이름 가져오는 메서드
	public String getAirport(String airport_no) {
		connect(); Statement stmt = null; String port_name = null;
		String sql = "select port_name from airport where airport_no='"+airport_no+"';";
		ReservationBook reservationbook = new ReservationBook();

		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			reservationbook.setPort_name(rs.getString("port_name"));
			port_name = rs.getString("port_name"); rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return port_name;
	}

	// 항공사 이름 가져오는 메서드
	public String getAirplane(String airplane_no) {
		connect(); Statement stmt = null; String airline_name = null;
		String sql = "select airline_name from airplane where airplane_no='"+airplane_no+"';";
		ReservationBook reservationbook = new ReservationBook();

		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			reservationbook.setAirline_name(rs.getString("airline_name"));
			airline_name = rs.getString("airline_name"); rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return airline_name;
	}

	// 이미 예약된 좌석인지 확인하는 메서드
	public boolean chkSeat(String serve_seat_no) {
		connect(); Statement stmt = null;
		ReservationBook reservationbook = new ReservationBook();
		String sql = "select serve_seat_no from reservation "+
					 "where schedule_no="+reservationbook.getSchedule_no()+";";

		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				if(serve_seat_no.equals(rs.getString("serve_seat_no")))
					return false;
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return true;
	}
}