package cartManagement;

/**
 * File : CartBook.java
 * Desc : 항공권 예약 프로그램 DO 클래스
 * @author 웹프로젝트실습 기말프로젝트 1조(전채린, 엄지희)
 */

public class CartBook { // 멤버변수 선언

	// product
	private String product_no;
	private String product_name;
	private String location;
	private String product_detail;
	private String ratings;
	private Integer review;
	private String time;
	private String tel;
	private String distinguishing;
	private String src;

	// cart
	private Integer cart_no;
	private String member_id;

	// product
	public String getProduct_no() { return product_no; }
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() { return product_name; }
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getLocation() { return location; }
	public void setLocation(String location) {
		this.location = location;
	}
	public String getProduct_detail() { return product_detail; }
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getRatings() { return ratings; }
	public void setRatings(String ratings) {
		this.ratings = ratings;
	}
	public Integer getReview() { return review; }
	public void setReview(Integer review) {
		this.review = review;
	}
	public String getDistinguishing() { return distinguishing; }
	public void setDistinguishing(String distinguishing) {
		this.distinguishing = distinguishing;
	}
	public String getTime() { return time; }
	public void setTime(String time) { this.time = time; }
	public String getTel() { return tel; }
	public void setTel(String tel) { this.tel = tel; }
	public String getSrc() { return src; }
	public void setSrc(String src) { this.src = src; }

	// cart
	public Integer getCart_no() { return cart_no; }
	public void setCart_no(Integer cart_no) {
		this.cart_no = cart_no;
	}
	public String getMember_id() { return member_id; }
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
