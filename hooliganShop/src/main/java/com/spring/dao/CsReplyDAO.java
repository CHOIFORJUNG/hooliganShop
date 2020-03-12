package com.spring.dao;

import java.util.List;

import com.spring.vo.CsReplyVO;
import com.spring.vo.PageCriteria;

public interface CsReplyDAO {

	public List<CsReplyVO> replyList(int csNo) throws Exception;
	
	public void insertReply(CsReplyVO cvo) throws Exception;
	
	public void updateReply(CsReplyVO cvo) throws Exception;
	
	public void deleteReply(int csNo) throws Exception;

	public List<CsReplyVO> replyListPage(int csNo, PageCriteria pCri) throws Exception; 

	public int reCount(int csNo) throws Exception;
	
	public int getCsNo(int csReplyNo) throws Exception;

}