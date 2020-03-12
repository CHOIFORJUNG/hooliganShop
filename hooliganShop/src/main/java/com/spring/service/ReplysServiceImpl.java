package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.dao.ReplysDAO;
import com.spring.vo.PageCriteria;
import com.spring.vo.ReplysVO;
@Repository
public class ReplysServiceImpl implements ReplysService{

	@Inject
	private ReplysDAO sdao;
	
	@Override
	public List<ReplysVO> replyList(Integer productNo) throws Exception {
		return sdao.replyList(productNo);
	}

	@Override
	public void insertReplys(ReplysVO svo) throws Exception {
		sdao.insertReplys(svo);
	}

	@Override
	public void updateReplys(ReplysVO svo) throws Exception {
		sdao.updateReplys(svo);
	}

	@Override
	public void reDeleteReplys(Integer rebnum) throws Exception {
		sdao.reDeleteReplys(rebnum);;
	}

	@Override
	public List<ReplysVO> replyListPage(Integer productNo, PageCriteria pCri) throws Exception {
		return sdao.replyListPage(productNo, pCri);
	}

	@Override
	public int reCounts(Integer productNo) throws Exception {
		return sdao.reCounts(productNo);
	}

}
