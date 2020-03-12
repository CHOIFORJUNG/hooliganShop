package com.spring.dao;

import java.util.List;

import com.spring.vo.CartListVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;

public interface CartDAO {
	
	//카트 담기
	public void addCart(CartListVO cavo) throws Exception;
	
	//카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartListVO cavo) throws Exception;
	
	//주문정보
	public void orderInfo(OrderVO ovo) throws Exception;
	
	//주문상세정보
	public void orderInfoDetail(OrderDetailVO odvo) throws Exception;
	
	//카트비우기
	
	public void cartAllDelete(String userId) throws Exception;
	
	public List<OrderVO> orderList(OrderVO ovo) throws Exception;
	
	public List<OrderListVO> orderView(OrderVO ovo) throws Exception;
	
}
