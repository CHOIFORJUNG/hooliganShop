package com.spring.dao;

import java.util.List;

import com.spring.vo.CategoryVO;
import com.spring.vo.ProductViewVO;

public interface ShopDAO {

	//카테고리별 상품 리스트
	public List<ProductViewVO> shopList(int cateCode) throws Exception;
	
	public ProductViewVO productView(int productNo) throws Exception;
	
	//베스트셀러 리스트
	
	public List<ProductViewVO> bestList() throws Exception;
	public String getCateName(int cateCode) throws Exception;  // jw
}
