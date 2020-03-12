package com.spring.service;

import java.util.List;

import com.spring.vo.BoardVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.PageCriteria;

public interface BoardService {
	

	public void insert(BoardVO bvo) throws Exception;
	
	public BoardVO read(Integer bno) throws Exception;
	
	public void update(BoardVO bvo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<BoardVO> list() throws Exception;
	
	public List<BoardVO> listCriteria(PageCriteria pCria) throws Exception;
	
	public int listCountData(PageCriteria pCria) throws Exception;
	
	public List<BoardVO> listFind(FindCriteria findCri) throws Exception;
	
	public int findCountData(FindCriteria findCria) throws Exception;

	public void replyCnt(Integer bno, int amount) throws Exception;

}

