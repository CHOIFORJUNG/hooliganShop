package com.spring.service;

import java.util.List;

import com.spring.vo.CartListVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;

public interface CartService {

	public void addCart(CartListVO cavo) throws Exception;
	
	public List<CartListVO> cartList(String userId) throws Exception;
	
	public void deleteCart(CartListVO cavo) throws Exception;
	
	public void orderInfo(OrderVO ovo) throws Exception;

	public void orderInfoDetail(OrderDetailVO odvo) throws Exception;
	
	public void cartAllDelete(String userId) throws Exception;
	
	public List<OrderVO> orderList(OrderVO ovo) throws Exception;

	public List<OrderListVO> orderView(OrderVO ovo) throws Exception;
}