package com.mystudy.Project_shop.vo;

import java.sql.Date;

public class OrderListVO {
	private int oNum,productNum,cCount, price,	saleprice;
   private Date oDate;
   private String productName,model,image, payment, id, receiver,oAddr,oPhone,memo,oPayment;

public String getModel() {
	return model;
}


public void setModel(String model) {
	this.model = model;
}


public String getoAddr() {
	return oAddr;
}


public void setoAddr(String oAddr) {
	this.oAddr = oAddr;
}


public String getoPhone() {
	return oPhone;
}


public void setoPhone(String oPhone) {
	this.oPhone = oPhone;
}


public String getoPayment() {
	return oPayment;
}


public void setoPayment(String oPayment) {
	this.oPayment = oPayment;
}


public String getReceiver() {
	return receiver;
}


public void setReceiver(String receiver) {
	this.receiver = receiver;
}





public String getMemo() {
	return memo;
}


public void setMemo(String memo) {
	this.memo = memo;
}




public int getoNum() {
	return oNum;
}


public void setoNum(int oNum) {
	this.oNum = oNum;
}


public int getProductNum() {
	return productNum;
}


public void setProductNum(int productNum) {
	this.productNum = productNum;
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


public String getProductName() {
	return productName;
}


public void setProductName(String productName) {
	this.productName = productName;
}



public String getImage() {
	return image;
}


public void setImage(String image) {
	this.image = image;
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

}
