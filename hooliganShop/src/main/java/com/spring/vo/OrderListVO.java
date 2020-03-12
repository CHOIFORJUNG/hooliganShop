package com.spring.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderListVO {
	/*
	 * d.order_details_no, d.product_no, d.amount, g.product_name,
	 * g.product_thumbImg, g.product_price, u.user_name,u.user_address1
	 * ,u.user_address2 ,u.user_address3
	 */
	private int orderNo;
	private String userId;
	private String orderAmount;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-ss")
	private Date orderDate;
	private String delivery;
	private int orderDetailsNo;
	private int productNo;
	private int cartStock;
	private String productStock;
	private String productName;
	private String productThumbImg;
	private String productPrice;
	private String userName;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	
	
	public String getProductStock() {
		return productStock;
	}
	public void setProductStock(String productStock) {
		this.productStock = productStock;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public int getOrderDetailsNo() {
		return orderDetailsNo;
	}
	public void setOrderDetailsNo(int orderDetailsNo) {
		this.orderDetailsNo = orderDetailsNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getcartStock() {
		return cartStock;
	}
	public void setcartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductThumbImg() {
		return productThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		this.productThumbImg = productThumbImg;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAdd1() {
		return userAdd1;
	}
	public void setUserAdd1(String userAdd1) {
		this.userAdd1 = userAdd1;
	}
	public String getUserAdd2() {
		return userAdd2;
	}
	public void setUserAdd2(String userAdd2) {
		this.userAdd2 = userAdd2;
	}
	public String getUserAdd3() {
		return userAdd3;
	}
	public void setUserAdd3(String userAdd3) {
		this.userAdd3 = userAdd3;
	}
	@Override
	public String toString() {
		return "OrderListVO [orderNo=" + orderNo + ", userId=" + userId + ", orderAmount=" + orderAmount
				+ ", orderDate=" + orderDate + ", delivery=" + delivery + ", orderDetailsNo=" + orderDetailsNo
				+ ", productNo=" + productNo + ", productStock=" + productStock + ", productName=" + productName
				+ ", productThumbImg=" + productThumbImg + ", productPrice=" + productPrice + ", userName=" + userName
				+ ", userAdd1=" + userAdd1 + ", userAdd2=" + userAdd2 + ", userAdd3=" + userAdd3 + "]";
	}
	
	
}
