package com.mystudy.Project_shop.vo;

import java.sql.Date;

public class qnaVO {
	int qNum, custid, qHits;
	String productName, qTitle, qContents, id,qPwd;
	Date qDate;
	
	

	public String getqPwd() {
		return qPwd;
	}
	public void setqPwd(String qPwd) {
		this.qPwd = qPwd;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public int getCustid() {
		return custid;
	}
	public void setCustid(int custid) {
		this.custid = custid;
	}
	public int getqHits() {
		return qHits;
	}
	public void setqHits(int qHits) {
		this.qHits = qHits;
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
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	
	
	@Override
	public String toString() {
		return "qnaVO [qNum=" + qNum + ", custid=" + custid + ", qHits=" + qHits + ", productName=" + productName
				+ ", qTitle=" + qTitle + ", qContents=" + qContents + ", id=" + id + ", qPwd=" + qPwd + ", qDate="
				+ qDate + "]";
	}
	
	
	
}
