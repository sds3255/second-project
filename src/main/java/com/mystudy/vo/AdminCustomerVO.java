package com.mystudy.vo;

public class AdminCustomerVO {
	private String custid;
	private String name;
	private String id;
	private String pwd;
	private String addr;
	private String phone;
	private String email;
	
	public AdminCustomerVO() {
		super();
	}

	public AdminCustomerVO(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}
	
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "CustomerVO [custid=" + custid + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", addr=" + addr
				+ ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
	
}
