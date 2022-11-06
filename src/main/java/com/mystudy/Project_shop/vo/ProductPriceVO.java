package com.mystudy.Project_shop.vo;

public class ProductPriceVO {
	private int productNum, price, saleprice;
	private String category, model, productName;
	private String image, content, regdate;
	
	// 수량, 수량별 금액(판매가 * 수량)
	private int quant; // 장바구니에 담긴 수량
	private int totalPrice; // 수량별 금액(판매가 * 수량)
	
	// 할인율 조회 메소드
	public int getPercent() {
		double percent = (price - saleprice) * 100 / price;
		return (int)percent;
	}
	
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
		// 수량이 변경되면 수량별 합계금액(totalPrice) 계산 후 변경처리
		totalPrice = saleprice * quant;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ProductVO [productNum=" + productNum + ", price=" + price + ", saleprice=" + saleprice + ", category="
				+ category + ", model=" + model + ", productName=" + productName + ", image=" + image + ", content="
				+ content + ", regdate=" + regdate + ", quant=" + quant + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
	

}
