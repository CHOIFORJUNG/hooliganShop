package com.spring.vo;

import java.util.Date;

public class OrderVO {
//	 order_no int(11) not null auto_increment primary key,
//	    user_id varchar(50) not null,
//	    order_amount varchar(50) not null,
//	    orderDate Date default now(),
//		 delivery varchar(50) not null

	private int orderNo;
	private String userId;
	private String orderAmount;
	private Date orderDate;
	private String delivery;
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
	
	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", userId=" + userId + ", orderAmount=" + orderAmount + ", orderDate="
				+ orderDate + ", delivery=" + delivery + "]";
	}
	
	
}
