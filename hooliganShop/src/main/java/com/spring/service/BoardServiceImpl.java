package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.BoardDAO;
import com.spring.vo.BoardVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.PageCriteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;
	
	@Override
	public void insert(BoardVO bvo) throws Exception{
		bdao.insert(bvo);
	}
	
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardVO read(Integer bno) throws Exception {
        bdao.hitCnt(bno);
        return bdao.read(bno);
    }
	
	@Override
	public void update(BoardVO bvo) throws Exception{
		bdao.update(bvo);
	}
	
	@Override
	public void delete(Integer bno) throws Exception{
		bdao.delete(bno);
	}
	
	@Override
	public List<BoardVO> list() throws Exception{
			return bdao.list();
	}
	
	@Override
	public List<BoardVO> listCriteria(PageCriteria pCria) throws Exception{
		return bdao.listCriteria(pCria);
	}
	
	@Override
	public int listCountData(PageCriteria pCria) throws Exception{
		return bdao.countData(pCria);
	}
	
	@Override
	public List<BoardVO> listFind(FindCriteria findCri) throws Exception{
		return bdao.listFind(findCri);
	}
	
	@Override
	public int findCountData(FindCriteria findCri) throws Exception{
		return bdao.findCountData(findCri);
	}

	@Override
	public void replyCnt(Integer bno, int amount) throws Exception {
		
	}

}

