package com.spring.dao;

import java.util.List;

import com.spring.vo.BoardVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.PageCriteria;


public interface BoardDAO {

	public void insert(BoardVO bvo) throws Exception;
	
	public BoardVO read(Integer bno) throws Exception;
	
	public void update(BoardVO bvo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<BoardVO> list() throws Exception;
	
	public List<BoardVO> listPage(int page) throws Exception; // 페이징 처리 테스트
	
	public List<BoardVO> listCriteria(PageCriteria pageCria) throws Exception;
	
	public int countData(PageCriteria pageCria) throws Exception;
	// 페이징 & 검색처리 게시판 FindCriteria!!
	public List<BoardVO> listFind(FindCriteria findCri) throws Exception;
	
	public int findCountData(FindCriteria findCri) throws Exception;
	
	public void replyCnt(Integer bno, int amount) throws Exception;
	
	public void hitCnt(Integer bno)throws Exception; 
}
