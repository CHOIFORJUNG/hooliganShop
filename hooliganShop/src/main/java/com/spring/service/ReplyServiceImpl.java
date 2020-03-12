package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.BoardDAO;
import com.spring.dao.ReplyDAO;
import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

@Repository
public class ReplyServiceImpl implements ReplyService {

    private final ReplyDAO dao;

    private final BoardDAO bdao;

    @Inject
    public ReplyServiceImpl(ReplyDAO dao, BoardDAO bdao) {
        this.dao = dao;
        this.bdao = bdao;
    }
    
    @Transactional
    @Override
    public void inputReply(ReplyVO replyVO) throws Exception {
        dao.insert(replyVO);
        bdao.replyCnt(replyVO.getBno(), 1);
    }

	@Override
	public List<ReplyVO> replyList(Integer bno) throws Exception {
		return dao.reList(bno);
	}

	@Override
	public void modifyReply(ReplyVO rvo) throws Exception {
		dao.update(rvo);
	}

    @Transactional
    @Override
    public void delReply(Integer rebno) throws Exception {
        int bno = dao.getBoardNo(rebno);
        dao.reDelete(rebno);
        bdao.replyCnt(bno, -1);
    }


	@Override
	public List<ReplyVO> reListPage(Integer bno, PageCriteria pCri) throws Exception {
		return dao.reListPage(bno, pCri);
	}

	@Override
	public int reCount(Integer bno) throws Exception {
		return dao.reCount(bno);
	}


}