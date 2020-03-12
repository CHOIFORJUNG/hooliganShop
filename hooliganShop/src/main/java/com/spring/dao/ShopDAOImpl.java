package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.CategoryVO;
import com.spring.vo.ProductViewVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductViewVO> shopList(int cateCode) throws Exception {

		return sqlSession.selectList("shopList", cateCode);
	}
	
	@Override
	public ProductViewVO productView(int productNo) throws Exception {
		
		return sqlSession.selectOne("productView", productNo);
	}

	@Override
	public String getCateName(int cateCode) throws Exception {
		return sqlSession.selectOne("getCateName", cateCode);
	}

	@Override
	public List<ProductViewVO> bestList() throws Exception {
		return sqlSession.selectList("bestList");
	}
	
	
	

}
