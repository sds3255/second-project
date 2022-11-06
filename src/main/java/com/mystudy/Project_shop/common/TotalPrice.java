package com.mystudy.Project_shop.common;

public class TotalPrice {
	private int totalPrice;
	private int totalSalePrice;
	private int minusPrice;
	private int totalPayPrice=0;
	private int delPrice=0;
	private int coupon=0;
	private int tquant;
	private String tpayment;


	public void  tp() {
		totalPrice+=totalPrice*tquant;		
		totalSalePrice+=totalSalePrice*tquant;		
	}

	public void  tpp() {
		totalPrice=totalPrice*tquant;
		totalSalePrice=totalSalePrice*tquant;	
		totalPayPrice=totalPrice-(totalPrice-totalSalePrice);				
	}
	
	
	
	
	public int getTquant() {
		return tquant;
	}
	public void setTquant(int tquant) {
		this.tquant = tquant;
	}
	public int getTotalPrice() {
		return totalPrice ;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getTotalSalePrice() {
		return totalSalePrice;
	}
	public void setTotalSalePrice(int totalSalePrice) {
		this.totalSalePrice = totalSalePrice ;
	}
	public int getDelPrice() {
		return delPrice;
	}
	public void setDelPrice(int delPrice) {
		this.delPrice = delPrice;
	}
	public int getMinusPrice() {
		return minusPrice;
	}
	
	public void setMinusPrice(int minusPrice) {
		this.minusPrice =minusPrice;
	}
	
	public int getTotalPayPrice() {
		return totalPayPrice;
	}
	
	public void setTotalPayPrice(int totalPayPrice) {
		this.totalPayPrice = totalPayPrice  ;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public String getTpayment() {
		return tpayment;
	}
	public void setTpayment(String tpayment) {
		this.tpayment = tpayment;
	}

	@Override
	public String toString() {
		return "TotalPrice [totalPrice=" + totalPrice + ", totalSalePrice=" + totalSalePrice + ", minusPrice="
				+ minusPrice + ", totalPayPrice=" + totalPayPrice + ", delPrice=" + delPrice + ", coupon=" + coupon
				+ ", tquant=" + tquant + ", tpayment=" + tpayment + "]";
	}
	
	

	
}
