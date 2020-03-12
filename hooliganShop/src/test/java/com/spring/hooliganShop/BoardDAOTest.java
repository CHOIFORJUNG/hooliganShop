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
import com.spring.vo.BoardVO;
import com.spring.vo.FindCriteria;



	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
	public class BoardDAOTest {

		@Inject
		private BoardDAO bdao;
		
		private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
		
		/*
		@Test
		public void insertTest() throws Exception{
			
			for (int i = 101; i <= 200; i++) {
				
				BoardVO bvo = new BoardVO();
				bvo.setBno(i);
				bvo.setTitle("테스트 제목입니다" + i);
				bvo.setContent("테스트 내용입니다" + i);
				bvo.setUserId("testId");
				bvo.setHit(0);
				bvo.setReplyCnt(0);
				bvo.setImage("test.png");
				bvo.setThumbImg("testThumbImg.png");
				bdao.insert(bvo);
			}
		}
		*/
		
		@Test
		public void listFindCriteriaTest() throws Exception {
			FindCriteria cri = new FindCriteria();
			cri.setPage(1);
			cri.setFindType("S");
			cri.setKeyword("테스트");
			
			logger.info("*****************테스트 글목록 출력*****************");
			
			List<BoardVO> list = bdao.listFind(cri);
			for(BoardVO bvo : list) {
				logger.info(bvo.getBno() + ": " + bvo.getTitle());
			}

			logger.info("*****************테스트 Data갯수 출력*****************");
			logger.info("CountData: " + bdao.findCountData(cri));
		}
		
		
	}
