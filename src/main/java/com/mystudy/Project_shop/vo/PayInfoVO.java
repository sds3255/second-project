package com.mystudy.Project_shop.vo;

import java.sql.Date;

public class PayInfoVO {
	private int oNum, price, saleprice, payprice;
	private Date oDate;
	private String receiver, oAddr,	oPhone,	memo,  oPayment ;

	
	
	
	
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
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
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getoPayment() {
		return oPayment;
	}
	public void setoPayment(String oPayment) {
		this.oPayment = oPayment;
	}
	@Override
	public String toString() {
		return "PayInfoVO [oNum=" + oNum + ", price=" + price + ", saleprice=" + saleprice + ", payprice=" + payprice
				+ ", oDate=" + oDate + ", receiver=" + receiver + ", oAddr=" + oAddr + ", oPhone=" + oPhone
				+ ", memo=" + memo + ", oPayment=" + oPayment + "]";
	}
	
	
	
	
	
}
