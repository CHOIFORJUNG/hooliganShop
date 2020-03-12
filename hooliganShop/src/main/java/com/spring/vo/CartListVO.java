package com.spring.vo;

import java.util.Date;

public class CartListVO {
	
	private int cartNo;
	private String userId;
	private int productNo;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String productName;
	private int productPrice;
	private String productThumbImg;
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductThumbImg() {
		return productThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		this.productThumbImg = productThumbImg;
	}
	@Override
	public String toString() {
		return "CartListVO [cartNo=" + cartNo + ", userId=" + userId + ", productNo=" + productNo + ", cartStock="
				+ cartStock + ", addDate=" + addDate + ", num=" + num + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productThumbImg=" + productThumbImg + "]";
	}
	
	
}
