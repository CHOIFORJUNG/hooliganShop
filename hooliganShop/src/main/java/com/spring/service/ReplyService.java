package com.spring.service;

import java.util.List;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

public interface ReplyService {

	public void inputReply(ReplyVO rvo) throws Exception;
	
	public List<ReplyVO> replyList(Integer bno) throws Exception;
	
	public void modifyReply(ReplyVO rvo) throws Exception;
	
	public void delReply(Integer rebno) throws Exception;
	
	public List<ReplyVO> reListPage(Integer bno, PageCriteria pCri) throws Exception;
	
	public int reCount(Integer bno) throws Exception;

}
