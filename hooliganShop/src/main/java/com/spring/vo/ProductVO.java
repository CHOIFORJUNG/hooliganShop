package com.spring.vo;

import java.util.Date;

public class ProductVO {

	private Integer productNo;
	private String productName;
	private String cateCode;
	private String productStock;
	private String productPrice;
	private String productDetails;
	private String productSize;
	private String productCorp;
	private String productImg;
	private String productThumbImg;
	private int productReviewcnt;
	private Date regdate;
	private Date moddate;
	
	private int cartStock;
	
	
	
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getProductStock() {
		return productStock;
	}
	public void setProductStock(String productStock) {
		this.productStock = productStock;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDetails() {
		return productDetails;
	}
	public void setProductDetails(String productDetails) {
		this.productDetails = productDetails;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public String getProductCorp() {
		return productCorp;
	}
	public void setProductCorp(String productCorp) {
		this.productCorp = productCorp;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductThumbImg() {
		return productThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		this.productThumbImg = productThumbImg;
	}
	
	public int getProductReviewcnt() {
		return productReviewcnt;
	}
	public void setProductReviewcnt(int productReviewcnt) {
		this.productReviewcnt = productReviewcnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", cateCode=" + cateCode
				+ ", productStock=" + productStock + ", productPrice=" + productPrice + ", productDetails="
				+ productDetails + ", productSize=" + productSize + ", productCorp=" + productCorp + ", productImg="
				+ productImg + ", productThumbImg=" + productThumbImg + ", productReviewcnt=" + productReviewcnt
				+ ", regdate=" + regdate + ", moddate=" + moddate + ", cartStock=" + cartStock + "]";
	}
}
