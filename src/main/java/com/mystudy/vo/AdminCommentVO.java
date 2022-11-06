package com.mystudy.vo;

public class AdminCommentVO {
	
	private int cNum;
	private String id;
	private String content;
	private int bNum;
	private String cDate;
	private int cPage;
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
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
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public int getcPage() {
		return cPage;
	}
	public void setcPage(int cPage) {
		this.cPage = cPage;
	}
	@Override
	public String toString() {
		return "AdminCommentVO [cNum=" + cNum + ", id=" + id + ", content=" + content + ", bNum=" + bNum + ", cDate="
				+ cDate + ", cPage=" + cPage + "]";
	}

	
	
}
