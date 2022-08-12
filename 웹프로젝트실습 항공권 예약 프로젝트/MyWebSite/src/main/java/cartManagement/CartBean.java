package cartManagement;

import java.sql.*;
import java.util.*;

import cartManagement.CartBook;
import memberManagement.ManagementBook;

/**
 * File : CartBean.java
 * Desc : 항공권 예약 프로그램 DAO 클래스
 * @author 웹프로젝트실습 기말프로젝트 1조(전채린, 엄지희)
 */

public class CartBean {

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

	// 찜목록 삭제 메서드
	public boolean deleteDB(Integer cart_no) {
		connect();
		String sql = "delete from cart where cart_no=?;";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 찜목록 추가 메서드
	public boolean insertDB(CartBook cartbook, String member_id) {
		connect(); // sql 문자열 , cart_no는 자동 등록 되므로 입력하지 않는다.
		String sql = "insert into cart(product_no, member_id) values(?, ?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartbook.getProduct_no());
			pstmt.setString(2, member_id);
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 전체 찜목록 조회 메서드
	public ArrayList<CartBook> getAllDBList() {
		connect();
		ArrayList<CartBook> cDatas = new ArrayList<CartBook>();
		String sql = "select b.cart_no, a.product_no, a.product_name, a.location, "+
			 	 "a.product_detail, a.ratings, a.review, a.distinguishing, "+
			 	"a.time, a.tel, a.src, b.member_id "+
			 	 "from product a join cart b "+
			 	 "on a.product_no = b.product_no;";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CartBook cartbook = new CartBook();
				cartbook.setCart_no(rs.getInt("cart_no"));
				cartbook.setProduct_no(rs.getString("product_no"));
				cartbook.setProduct_name(rs.getString("product_name"));
				cartbook.setLocation(rs.getString("location"));
				cartbook.setProduct_detail(rs.getString("product_detail"));
				cartbook.setRatings(rs.getString("ratings"));
				cartbook.setReview(rs.getInt("review"));
				cartbook.setDistinguishing(rs.getString("distinguishing"));
				cartbook.setTime(rs.getString("time"));
				cartbook.setTel(rs.getString("tel"));
				cartbook.setSrc(rs.getString("src"));
				cartbook.setMember_id(rs.getString("member_id"));			
				cDatas.add(cartbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return cDatas;
	}
	
	// 특정 회원 찜목록 조회 메서드
	public ArrayList<CartBook> getDBList(String member_id) {
		connect();
		ArrayList<CartBook> cDatas = new ArrayList<CartBook>();
		String sql = "select b.cart_no, a.product_no, a.product_name, a.location, "+
			 	 "a.product_detail, a.ratings, a.review, a.distinguishing, "+
			 	"a.time, a.tel, a.src, b.member_id "+
			 	 "from product a join cart b "+
			 	 "where b.member_id=? "+
			 	 "and a.product_no = b.product_no;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CartBook cartbook = new CartBook();
				cartbook.setCart_no(rs.getInt("cart_no"));
				cartbook.setProduct_no(rs.getString("product_no"));
				cartbook.setProduct_name(rs.getString("product_name"));
				cartbook.setLocation(rs.getString("location"));
				cartbook.setProduct_detail(rs.getString("product_detail"));
				cartbook.setRatings(rs.getString("ratings"));
				cartbook.setReview(rs.getInt("review"));
				cartbook.setDistinguishing(rs.getString("distinguishing"));
				cartbook.setTime(rs.getString("time"));
				cartbook.setTel(rs.getString("tel"));
				cartbook.setSrc(rs.getString("src"));
				cartbook.setMember_id(rs.getString("member_id"));	
				cDatas.add(cartbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return cDatas;
	}
	
	// 찜목록 수정 페이지 요청인 경우
	public CartBook getDB(Integer cart_no) {
		connect();
		CartBook cartbook = new CartBook();
		String sql = "select b.cart_no, a.product_no, a.product_name, a.location, "+
			 	 "a.product_detail, a.ratings, a.review, a.distinguishing, "+
			 	"a.time, a.tel, a.src, b.member_id "+
			 	 "from product a join cart b "+
			 	 "where b.cart_no=? "+
			 	 "and a.product_no = b.product_no;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			ResultSet rs = pstmt.executeQuery();

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			cartbook.setCart_no(rs.getInt("cart_no"));
			cartbook.setProduct_no(rs.getString("product_no"));
			cartbook.setProduct_name(rs.getString("product_name"));
			cartbook.setLocation(rs.getString("location"));
			cartbook.setProduct_detail(rs.getString("product_detail"));
			cartbook.setRatings(rs.getString("ratings"));
			cartbook.setReview(rs.getInt("review"));
			cartbook.setDistinguishing(rs.getString("distinguishing"));
			cartbook.setTime(rs.getString("time"));
			cartbook.setTel(rs.getString("tel"));
			cartbook.setSrc(rs.getString("src"));
			cartbook.setMember_id(rs.getString("member_id"));	
			rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return cartbook;
	}
	
	// 찜목록 중복 체크 메서드
	public boolean cartCheck(String product_no, String member_id) {
		connect();
		String sql = "select * from cart where product_no=? and member_id=?";
		boolean cartCon = false;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_no);
			pstmt.setString(2, member_id);
			ResultSet rs = pstmt.executeQuery();
			cartCon = rs.next();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return cartCon;
	}
	
	// 전체 상품정보 목록 조회 메서드
	public ArrayList<CartBook> getProductDBList() {
		connect();
		ArrayList<CartBook> pDatas = new ArrayList<CartBook>();
		String sql = "select * from product;";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CartBook cartbook = new CartBook();
				cartbook.setProduct_no(rs.getString("product_no"));
				cartbook.setProduct_name(rs.getString("product_name"));
				cartbook.setLocation(rs.getString("location"));
				cartbook.setProduct_detail(rs.getString("product_detail"));
				cartbook.setRatings(rs.getString("ratings"));
				cartbook.setReview(rs.getInt("review"));
				cartbook.setDistinguishing(rs.getString("distinguishing"));
				cartbook.setTime(rs.getString("time"));
				cartbook.setTel(rs.getString("tel"));
				cartbook.setSrc(rs.getString("src"));		
				pDatas.add(cartbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return pDatas;
	}
	
	// 특정 상품정보 조회 메서드
	public CartBook getProductDB(String product_no) {
		connect();
		CartBook cartbook = new CartBook();
		String sql = "select * from product where product_no=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_no);
			ResultSet rs = pstmt.executeQuery();

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			cartbook.setProduct_no(rs.getString("product_no"));
			cartbook.setProduct_name(rs.getString("product_name"));
			cartbook.setLocation(rs.getString("location"));
			cartbook.setProduct_detail(rs.getString("product_detail"));
			cartbook.setRatings(rs.getString("ratings"));
			cartbook.setReview(rs.getInt("review"));
			cartbook.setDistinguishing(rs.getString("distinguishing"));
			cartbook.setTime(rs.getString("time"));
			cartbook.setTel(rs.getString("tel"));
			cartbook.setSrc(rs.getString("src"));
			rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return cartbook;
	}
	
	// 상품 삭제 메서드
	public boolean deleteProductDB(String product_no) {
		connect();
		String sql = "delete from product where product_no=?;";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_no);
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 상품정보 추가 메서드
	public boolean insertProductDB(CartBook cartbook) {
		connect(); // sql 문자열 , cart_no는 자동 등록 되므로 입력하지 않는다.
		String sql = "insert into product(product_no, product_name, location, product_detail, "+
					 "ratings, review, distinguishing, time, tel, src) "+
					 "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartbook.getProduct_no());
			pstmt.setString(2, cartbook.getProduct_name());
			pstmt.setString(3, cartbook.getLocation());
			pstmt.setString(4, cartbook.getProduct_detail());
			pstmt.setString(5, cartbook.getRatings());
			pstmt.setInt(6, cartbook.getReview());
			pstmt.setString(7, cartbook.getDistinguishing());
			pstmt.setString(8, cartbook.getTime());
			pstmt.setString(9, cartbook.getTel());
			pstmt.setString(10, cartbook.getSrc());
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}
	
	// 상품정보 수정 메서드
	public boolean updateProductDB(CartBook cartbook) {
		connect();
		String sql = "update product set product_name=?, location=?, product_detail=?, "+
					 "ratings=?, review=?, Distinguishing=?, time=?, tel=?, src=? "+
					 "where product_no=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartbook.getProduct_name());
			pstmt.setString(2, cartbook.getLocation());
			pstmt.setString(3, cartbook.getProduct_detail());
			pstmt.setString(4, cartbook.getRatings());
			pstmt.setInt(5, cartbook.getReview());
			pstmt.setString(6, cartbook.getDistinguishing());
			pstmt.setString(7, cartbook.getTime());
			pstmt.setString(8, cartbook.getTel());
			pstmt.setString(9, cartbook.getSrc());
			pstmt.setString(10, cartbook.getProduct_no());
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}
}
