package memberManagement;

/**
 * File : managementBook.java
 * Desc : 항공권 예약 프로그램 DO 클래스
 * @author 웹프로젝트실습 기말프로젝트 1조(전채린, 엄지희)
 */

public class ManagementBook { // 멤버변수 선언
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_tel;
	private String member_email;
	private String member_addr;

	public String getMember_id() { return member_id; }
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() { return member_pwd; }
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() { return member_name; }
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() { return member_birth; }
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_tel() { return member_tel; }
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() { return member_email; }
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_addr() { return member_addr; }
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
}