package com.spring.dao;

import java.util.List;

import com.spring.vo.CategoryVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.OrderViewVO;
import com.spring.vo.ProductVO;
import com.spring.vo.ProductViewVO;
import com.spring.vo.UserVO;

public interface AdminDAO {
	
	public List<CategoryVO> category() throws Exception;
	
	public List<ProductVO> productlist() throws Exception;
	//상품조회 + 카테고리 JOIN
	public ProductViewVO productView(int productNo) throws Exception;
	// 상품수정
	public void ProductModify(ProductVO pvo) throws Exception;
	
	public void productDelete(int productNo) throws Exception;
	
	public List<OrderViewVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO ovo) throws Exception;
	
	public void delivery (OrderVO ovo) throws Exception;
	
	public void changeStock(ProductVO pvo) throws Exception;
	
	public List<OrderDetailVO> changeStockView(OrderVO ovo) throws Exception;
	
	public List<UserVO> userList() throws Exception;

}
