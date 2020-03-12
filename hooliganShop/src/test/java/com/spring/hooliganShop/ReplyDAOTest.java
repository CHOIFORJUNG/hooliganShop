package com.spring.hooliganShop;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.ReplyDAO;
import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDAOTest {
	
	@Inject
	private ReplyDAO rdao;
	
	private static Logger Logger = LoggerFactory.getLogger(ReplyDAOTest.class);
/*	
	@Test
	public void writeTest() throws Exception{
		ReplyVO rvo = new ReplyVO();
		rvo.setBno(1);
		rvo.setReplyContent("댓글 테스트입니다!!");
		rvo.setuserId("testId3");
		
		rdao.insert(rvo);
		rdao.update(rvo);
	}
	*/
	@Test
	public void listCriteriaTest() throws Exception{
		PageCriteria pCria = new PageCriteria();
		pCria.setPage(1);
		pCria.setNumPerPage(10);
		
		List<ReplyVO> list= rdao.reListPage(1, pCria);
		
		for(ReplyVO rvo : list) {
			Logger.info(rvo.getuserId() + ":"+ rvo.getReplyContent());
		}
	
	}
}
