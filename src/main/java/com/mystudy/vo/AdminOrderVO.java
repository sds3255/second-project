package com.mystudy.vo;

public class AdminOrderVO {
	private int oNum;
	private int product_num;
	private String productName;
	private int cCount;
	private int price;
	private int saleprice;
	private String oDate;
	private String image;
	private String payment;
	private String id;
	private String receiver;
	private String oPhone;
	private String memo;
	private String oPayment;
	private String model;
	private String oAddr;
	private int productNum;
	
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getoAddr() {
		return oAddr;
	}
	public void setoAddr(String oAddr) {
		this.oAddr = oAddr;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
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
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	@Override
	public String toString() {
		return "AdminOrderVO [oNum=" + oNum + ", product_num=" + product_num + ", productName=" + productName
				+ ", cCount=" + cCount + ", price=" + price + ", saleprice=" + saleprice + ", oDate=" + oDate
				+ ", image=" + image + ", payment=" + payment + ", id=" + id + ", receiver=" + receiver + ", oPhone="
				+ oPhone + ", memo=" + memo + ", oPayment=" + oPayment + ", model=" + model + ", oAddr=" + oAddr
				+ ", productNum=" + productNum + "]";
	}
	

	
	
}
