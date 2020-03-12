package com.spring.service;

import java.util.List;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplysVO;

public interface ReplysService {
	
	public List<ReplysVO> replyList(Integer productNo) throws Exception;
	
	public void insertReplys(ReplysVO svo) throws Exception;
	
	public void updateReplys(ReplysVO svo) throws Exception;
	
	public void reDeleteReplys(Integer productNo) throws Exception;
	
	public List<ReplysVO> replyListPage(Integer rebnum, PageCriteria pCri) throws Exception;
	
	public int reCounts(Integer productNo) throws Exception;
}
