package com.spring.vo;

public class OrderDetailVO {

//	order_details_no int(11) not null auto_increment primary key ,
//	order_no int(11) not null,
//	product_no int(11) not null,
//	cartStock int(11) not null
	
	private int orderDetailsNo;
	private int orderNo;
	private int productNo;
	private int cartStock;
	
	
	public int getOrderDetailsNo() {
		return orderDetailsNo;
	}
	public void setOrderDetailsNo(int orderDetailsNo) {
		this.orderDetailsNo = orderDetailsNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailsNo=" + orderDetailsNo + ", orderNo=" + orderNo + ", productNo=" + productNo
				+ ", cartStock=" + cartStock + "]";
	}
}
