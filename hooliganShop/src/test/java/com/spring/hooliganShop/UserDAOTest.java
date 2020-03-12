package com.spring.hooliganShop;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.UserDAO;
import com.spring.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class UserDAOTest {
 
	@Inject
	private UserDAO userDAO;
	
	@Test
	public void testTime() throws Exception{
		System.out.println(userDAO.getTime());
	}
	
	@Test
	public void testInsertMember() throws Exception{
		UserVO uvo = new UserVO();
		uvo.setUserId("testId5");
		uvo.setUserPw("1234");
		uvo.setUserName("홍길동");
		uvo.setUserEmail("test@naver.com");
		uvo.setUserAdd1("서울시송파구");
		uvo.setUserAdd2("방이동145-45");
		uvo.setUserAdd3("502호");
		uvo.setUserPhone("010-9027-6187");
		
		userDAO.insertUser(uvo);
		
	}
}
