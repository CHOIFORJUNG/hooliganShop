package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.CsDAO;
import com.spring.dao.CsReplyDAO;
import com.spring.vo.CsReplyVO;
import com.spring.vo.PageCriteria;

@Repository
public class CsReplyServiceImpl implements CsReplyService{
	
	
	private final CsDAO  csdao;
	private final CsReplyDAO cdao;
	
	@Inject
	public CsReplyServiceImpl(CsDAO csdao, CsReplyDAO cdao) {
		this.csdao = csdao;
		this.cdao = cdao;
	}
	
	@Override
	public List<CsReplyVO> replyList(int csNo) throws Exception {
		return cdao.replyList(csNo);
	}

	@Transactional
	@Override
	public void insertReply(CsReplyVO cvo) throws Exception {
		csdao.updateReplyCnt(cvo.getCsNo(), 1);
		cdao.insertReply(cvo);
	}

	@Override
	public void updateReply(CsReplyVO cvo) throws Exception {
		cdao.updateReply(cvo);
	}
	
	@Transactional
	@Override
	public void deleteReply(int csReplyNo) throws Exception {
		int csNo = cdao.getCsNo(csReplyNo);
		cdao.deleteReply(csNo);
		csdao.updateReplyCnt(csReplyNo, -1);
	}

	@Override
	public List<CsReplyVO> replyListPage(int csNo, PageCriteria pCri) throws Exception {
		return cdao.replyListPage(csNo, pCri);
	}

	@Override
	public int reCount(int csNo) throws Exception {
		return cdao.reCount(csNo);
	}

}
