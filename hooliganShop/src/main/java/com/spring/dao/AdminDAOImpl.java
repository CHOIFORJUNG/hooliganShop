package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.CategoryVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.OrderViewVO;
import com.spring.vo.ProductVO;
import com.spring.vo.ProductViewVO;
import com.spring.vo.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		
		return sql.selectList("category");
	}
	
	@Override
	public List<ProductVO> productlist() throws Exception{
		
		return sql.selectList("productlist");
	}
	
	@Override
	public ProductViewVO productView(int productNo) throws Exception{
		
		return sql.selectOne("productView", productNo);
	}
	
	@Override
	public void ProductModify(ProductVO pvo) throws Exception{
		
		sql.update("productModify", pvo);
	}
	
	@Override
	public void productDelete(int productNo) throws Exception{
		
		sql.delete("productDelete", productNo);
	}

	@Override
	public List<OrderViewVO> orderList() throws Exception {
		return sql.selectList("adminOrderList");
	}

	@Override
	public List<OrderListVO> orderView(OrderVO ovo) throws Exception {
		return sql.selectList("adminOrderView", ovo);
	}

	@Override
	public void delivery(OrderVO ovo) throws Exception {
		sql.update("delivery", ovo);
	}

	@Override
	public void changeStock(ProductVO pvo) throws Exception {
		sql.update("changeStock", pvo);
	}

	@Override
	public List<OrderDetailVO> changeStockView(OrderVO ovo) throws Exception {
		return sql.selectList("changeStock_sub", ovo);
	}

	@Override
	public List<UserVO> userList() throws Exception {
		return sql.selectList("userList");
	}



}
