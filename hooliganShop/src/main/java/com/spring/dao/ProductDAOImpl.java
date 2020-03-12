package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void register(ProductVO pvo) throws Exception {
		sqlSession.insert("register", pvo);
	}

	@Override
	public ProductVO read(Integer pno) throws Exception {
		return null;
	}

	@Override
	public void update(ProductVO pvo) throws Exception {
		
	}

	@Override
	public void delete(Integer pno) throws Exception {
		
	}

}
