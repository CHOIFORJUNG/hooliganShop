package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.CartListVO;
import com.spring.vo.CartVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void addCart(CartListVO cavo) throws Exception{
		sqlSession.insert("addCart", cavo);
	}
	
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return sqlSession.selectList("cartList", userId);
	}

	@Override
	public void deleteCart(CartListVO cavo) throws Exception {
		sqlSession.delete("deleteCart", cavo);
	}

	@Override
	public void orderInfo(OrderVO ovo) throws Exception {
		sqlSession.insert("orderInfo", ovo);
	}

	@Override
	public void orderInfoDetail(OrderDetailVO odvo) throws Exception {
		sqlSession.insert("orderInfoDetail", odvo);
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		sqlSession.delete("cartAllDelete", userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO ovo) throws Exception {
		return sqlSession.selectList("orderList", ovo);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO ovo) throws Exception {
		return sqlSession.selectList("orderView", ovo);
	}

}
