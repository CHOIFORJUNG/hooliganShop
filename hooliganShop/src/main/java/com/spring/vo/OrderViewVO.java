package com.spring.vo;

import java.util.Date;

public class OrderViewVO {
								//mapper에서 join inner해주기 위해선 userVO orderVO를 합쳐준 VO가 필요하다.
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	private String isAdmin;
	private Date regDate;
	private Date modDate;
	
	private int orderNo;
	private String orderAmount;
	private Date orderDate;
	private String delivery;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
		return "OrderViewVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userPhone=" + userPhone + ", userAdd1=" + userAdd1 + ", userAdd2=" + userAdd2
				+ ", userAdd3=" + userAdd3 + ", isAdmin=" + isAdmin + ", regDate=" + regDate + ", modDate=" + modDate
				+ ", orderNo=" + orderNo + ", orderAmount=" + orderAmount + ", orderDate=" + orderDate + ", delivery="
				+ delivery + "]";
	}
	
	
}
