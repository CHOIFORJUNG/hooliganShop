package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.AdminDAO;
import com.spring.vo.CategoryVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.OrderViewVO;
import com.spring.vo.ProductVO;
import com.spring.vo.ProductViewVO;
import com.spring.vo.UserVO;

@Service
public class AdminServiceImpl  implements AdminService  {

	@Inject
	private AdminDAO dao;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}
	
	@Override
	public List<ProductVO> productlist() throws Exception{
		System.out.println("서비스");
		return dao.productlist();
	}
	
	@Override
	public ProductViewVO productView(int productNo) throws Exception{
		return dao.productView(productNo);
	}
	
	@Override
	public void ProductModify(ProductVO pvo) throws Exception{
		dao.ProductModify(pvo);
	}
	
	@Override
	public void productDelete(int productNo) throws Exception{
		dao.productDelete(productNo);
	}

	@Override
	public List<OrderViewVO> orderList() throws Exception {
		return dao.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO ovo) throws Exception {
		return dao.orderView(ovo);
	}

	@Override
	public void delivery(OrderVO ovo) throws Exception {
		dao.delivery(ovo);
	}

	@Override
	public void changeStock(ProductVO pvo) throws Exception {
		dao.changeStock(pvo);
	}

	@Override
	public List<OrderDetailVO> changeStockView(OrderVO ovo) throws Exception {
		return dao.changeStockView(ovo);
	}
	
	@Override
	public List<UserVO> userList() throws Exception {
		return dao.userList();
	}

}
