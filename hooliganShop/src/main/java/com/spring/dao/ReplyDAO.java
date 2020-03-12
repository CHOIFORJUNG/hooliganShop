package com.spring.dao;

import java.util.List;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> reList(Integer bno) throws Exception;
	
	public void insert(ReplyVO rvo) throws Exception;
	
	public void update(ReplyVO rvo) throws Exception;
	
	public void reDelete(Integer bno) throws Exception;
	
	public List<ReplyVO> reListPage(Integer bno, PageCriteria pCri) throws Exception;
	
	public int reCount(Integer bno) throws Exception;

	public int getBoardNo(Integer rebno) throws Exception;

}
