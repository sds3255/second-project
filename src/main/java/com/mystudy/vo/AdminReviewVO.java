package com.mystudy.vo;

public class AdminReviewVO {

	private int bNum;
	private String productName;
	private String title;
	private String bContents;
	private String id;
	private String bDate;
	private int hits;
	private String fileName;
	private String oriName;
	
	private String content;
	private int cNum;
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getbContents() {
		return bContents;
	}
	public void setbContents(String bContents) {
		this.bContents = bContents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	@Override
	public String toString() {
		return "AdminReviewVO [bNum=" + bNum + ", productName=" + productName + ", title=" + title + ", bContents="
				+ bContents + ", id=" + id + ", bDate=" + bDate + ", hits=" + hits + ", fileName=" + fileName
				+ ", oriName=" + oriName + ", content=" + content + ", cNum=" + cNum + "]";
	}
	
}
