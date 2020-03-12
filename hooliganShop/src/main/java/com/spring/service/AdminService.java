package com.spring.service;

import java.util.List;

import com.spring.vo.CategoryVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.OrderViewVO;
import com.spring.vo.ProductVO;
import com.spring.vo.ProductViewVO;
import com.spring.vo.UserVO;

public interface AdminService {

	public List<CategoryVO> category() throws Exception;
	
	public List<ProductVO> productlist() throws Exception;
	
	public ProductViewVO productView(int productNo) throws Exception; 
	
	public void ProductModify(ProductVO pvo) throws Exception;
	
	public void productDelete(int productNo) throws Exception;
	
	public List<OrderViewVO> orderList() throws Exception;

	public List<OrderListVO> orderView(OrderVO ovo) throws Exception;
	
	public void delivery (OrderVO ovo) throws Exception;

	public void changeStock(ProductVO pvo) throws Exception;
	
	public List<OrderDetailVO> changeStockView(OrderVO ovo) throws Exception;

	public List<UserVO> userList() throws Exception;

}
