package com.mystudy.vo;

public class AdminAnswerVO {
	private int qaNum;
	private int qNum;
	private String qaTitle;
	private String qaContents;
	private String qaDate;
	private String productName;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
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
	@Override
	public String toString() {
		return "AnswerVO [qaNum=" + qaNum + ", qNum=" + qNum + ", qaTitle=" + qaTitle + ", qaContents=" + qaContents
				+ ", qaDate=" + qaDate + ", productName=" + productName + "]";
	}
	
	
}
