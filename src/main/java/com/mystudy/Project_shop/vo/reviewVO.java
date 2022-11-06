package com.mystudy.Project_shop.vo;

import java.util.Date;

public class reviewVO {
	int bNum, oNum, hits;
	String productName, title, bContents, id, fileName,oriName;
	Date bDate;
	
	
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
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
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	
	
	@Override
	public String toString() {
		return "reviewVO [bNum=" + bNum + ", oNum=" + oNum + ", hits=" + hits + ", productName=" + productName
				+ ", title=" + title + ", bContents=" + bContents + ", id=" + id + ", fileName=" + fileName
				+ ", oriName=" + oriName + ", bDate=" + bDate + "]";
	}
	
}
