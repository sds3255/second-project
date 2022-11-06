package com.mystudy.Project_shop.vo;

import java.sql.Date;

public class productVO {
	String oNum, productNum, productName, smallImage, payment, id, model;
	public String getModel() {
		return model;
	}
	
	
	public void setModel(String model) {
		this.model = model;
	}

	int cCount, price, saleprice;
	Date oDate;
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSmallImage() {
		return smallImage;
	}
	public void setSmallImage(String smallImage) {
		this.smallImage = smallImage;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}


	@Override
	public String toString() {
		return "productVO [oNum=" + oNum + ", productNum=" + productNum + ", productName=" + productName
				+ ", smallImage=" + smallImage + ", payment=" + payment + ", id=" + id + ", model=" + model
				+ ", cCount=" + cCount + ", price=" + price + ", saleprice=" + saleprice + ", oDate=" + oDate + "]";
	}
	
	
	
}
