package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.dao.ShopDAO;
import com.spring.vo.CategoryVO;
import com.spring.vo.ProductViewVO;

@Repository
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;
	
	
	@Override
	public List<ProductViewVO> shopList(int cateCode) throws Exception{
		return dao.shopList(cateCode);  // 메소드의 모든 기능을 수행한 다음, 맨 마지막에 결과값만 자신을 호출한 컨트롤러로 return
									 	// 여기서는 dao.shopList(cateCode)라는 메소드를 호출한 뒤, 그로인해 얻게 되는 결과값을
										// return 하게 되는 것
										// 그러므로 간단히 말하면 순서는 컨트롤러(호출)->서비스->다오(계산후 값을)->서비스->컨트롤러
	}
	
	@Override
	public ProductViewVO productView(int productNo) throws Exception{
		return dao.productView(productNo);
	}

	@Override
	public String getCateName(int cateCode) throws Exception {
		return dao.getCateName(cateCode);
	}

	@Override
	public List<ProductViewVO> bestList() throws Exception {
		return dao.bestList();
	}
	
}


