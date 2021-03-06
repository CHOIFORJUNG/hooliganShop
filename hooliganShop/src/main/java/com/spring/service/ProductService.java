package com.spring.service;

import com.spring.vo.ProductVO;

public interface ProductService {
	
	public void register(ProductVO pvo) throws Exception;
	
	public ProductVO read(Integer pno) throws Exception;
	
	public void update(ProductVO pvo) throws Exception;
	
	public void delete(Integer pno) throws Exception;

}
