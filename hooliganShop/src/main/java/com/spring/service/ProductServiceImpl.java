package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ProductDAO;
import com.spring.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	ProductDAO pdao;
	
	@Override
	public void register(ProductVO pvo) throws Exception {
		pdao.register(pvo);
		
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
