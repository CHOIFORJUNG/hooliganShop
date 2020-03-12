package com.spring.service;

import java.util.List;

import com.spring.vo.CategoryVO;
import com.spring.vo.ProductViewVO;

public interface ShopService {

	public List<ProductViewVO> shopList(int cateCode) throws Exception;
	
	public ProductViewVO productView(int productNo) throws Exception;
	
	public String getCateName(int cateCode) throws Exception;  // jw
	
	public List<ProductViewVO> bestList() throws Exception;

}
