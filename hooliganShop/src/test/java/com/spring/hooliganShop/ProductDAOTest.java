package com.spring.hooliganShop;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.BoardDAO;
import com.spring.dao.ProductDAO;
import com.spring.dao.ShopDAO;
import com.spring.vo.BoardVO;
import com.spring.vo.ProductVO;
import com.spring.vo.ProductViewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ProductDAOTest {
	@Inject
	private ProductDAO pdao;
	
	
	@Inject
	private ShopDAO sdao;
	
	
	private static Logger logger = LoggerFactory.getLogger(ProductDAOTest.class);
	
	/*
	@Test
	public void insertTest() throws Exception{
		
		//for (int i = 101; i <= 200; i++) {
			
			ProductVO vo = new ProductVO();
			vo.setProductName("나이키운동화3");
			vo.setCateCode("102");
			vo.setProductStock("100");
			vo.setProductPrice("40000");
			vo.setProductDetails("베스트 셀러!!");
			vo.setProductSize("250");
			vo.setProductCorp("나이키회사2");
			//vo.setProductReviewcnt("1");
			
			pdao.register(vo);
	
		//}
	}
	*/
	@Test
	public void mainListTest() throws Exception {
		List<ProductViewVO> list = sdao.bestList();
		for(ProductViewVO vo : list) {
			logger.info(vo.getProductNo() + ": " + vo.getProductName());
		}
	}
	
}
