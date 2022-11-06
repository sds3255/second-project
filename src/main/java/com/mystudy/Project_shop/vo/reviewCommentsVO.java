package com.mystudy.Project_shop.vo;

import java.util.Date;

public class reviewCommentsVO {
	int cNum, bNum;
	String id, content;
	Date cDate;
	
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	
	
	@Override
	public String toString() {
		return "reviewComments [cNum=" + cNum + ", bNum=" + bNum + ", id=" + id + ", content=" + content + ", cData="
				+ cDate + "]";
	}
	
	
}
