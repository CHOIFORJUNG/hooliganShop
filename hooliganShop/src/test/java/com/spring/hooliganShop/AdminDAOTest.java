package com.spring.hooliganShop;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.AdminDAO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.OrderViewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class AdminDAOTest {
	@Inject
	private AdminDAO adao;
	
	private static Logger logger = LoggerFactory.getLogger(AdminDAOTest.class);
	
	/*
	 * @Test public void categoryTest() throws Exception {
	 * logger.info(adao.category().toString()); }
	 */
	@Test
	public void orderViewTest() throws Exception {
		OrderVO vo = new OrderVO();
		vo.setOrderNo(2020020714);
		
		List<OrderListVO> list = adao.orderView(vo);
		for (OrderListVO orderListVO : list) {
			logger.info("list: " + orderListVO.getOrderNo() + " " + orderListVO.getProductName());
		}
	}
}
