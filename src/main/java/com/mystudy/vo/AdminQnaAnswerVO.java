package com.mystudy.vo;

public class AdminQnaAnswerVO {
	private int qaNum;
	private int qNum;
	private String qaTitle;
	private String qaContents;
	private String qaDate;
	private String custid;
	private String productName;
	private String qTitle;
	private String qContents;
	private String id;
	private String qPwd;
	private String qDate;
	private int qHits;
	public int getQaNum() {
		return qaNum;
	}
	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaContents() {
		return qaContents;
	}
	public void setQaContents(String qaContents) {
		this.qaContents = qaContents;
	}
	public String getQaDate() {
		return qaDate;
	}
	public void setQaDate(String qaDate) {
		this.qaDate = qaDate;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContents() {
		return qContents;
	}
	public void setqContents(String qContents) {
		this.qContents = qContents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getqPwd() {
		return qPwd;
	}
	public void setqPwd(String qPwd) {
		this.qPwd = qPwd;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public int getqHits() {
		return qHits;
	}
	public void setqHits(int qHits) {
		this.qHits = qHits;
	}
	@Override
	public String toString() {
		return "QnaAnswerVO [qaNum=" + qaNum + ", qNum=" + qNum + ", qaTitle=" + qaTitle + ", qaContents=" + qaContents
				+ ", qaDate=" + qaDate + ", custid=" + custid + ", productName=" + productName + ", qTitle=" + qTitle
				+ ", qContents=" + qContents + ", id=" + id + ", qPwd=" + qPwd + ", qDate=" + qDate + ", qHits=" + qHits
				+ "]";
	}
	
	
}
