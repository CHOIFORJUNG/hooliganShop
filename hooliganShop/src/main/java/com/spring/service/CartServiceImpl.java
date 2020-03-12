package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.dao.CartDAO;
import com.spring.vo.CartListVO;
import com.spring.vo.CartVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;

@Repository
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO cadao;
	@Override
	public void addCart(CartListVO cavo) throws Exception {
		cadao.addCart(cavo);
	}
	
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return cadao.cartList(userId);
	}

	@Override
	public void deleteCart(CartListVO cavo) throws Exception {
		cadao.deleteCart(cavo);
	}

	@Override
	public void orderInfo(OrderVO ovo) throws Exception {
		cadao.orderInfo(ovo);
	}

	@Override
	public void orderInfoDetail(OrderDetailVO odvo) throws Exception {
		cadao.orderInfoDetail(odvo);
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		cadao.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO ovo) throws Exception {
		return cadao.orderList(ovo);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO ovo) throws Exception {
		return cadao.orderView(ovo);
	}
	

}
