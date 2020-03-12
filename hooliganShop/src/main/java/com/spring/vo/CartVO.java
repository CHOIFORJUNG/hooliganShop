package com.spring.vo;

import java.util.Date;

public class CartVO {
	/*  cart_no int not null auto_increment,
		user_id varchar(50) not null,
		product_no int(11) not null,
		cart_stock int(11) not null,
		addDate timestamp not null default now(),
		*/
	
	private int cartNo;
	private String userId;
	private int productNo;
	private int cartStock;
	private Date addDate;
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
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", userId=" + userId + ", productNo=" + productNo + ", cartStock="
				+ cartStock + ", addDate=" + addDate + "]";
	}
	
}
