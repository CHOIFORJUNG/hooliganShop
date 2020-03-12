package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.BoardVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.PageCriteria;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(BoardVO bvo) throws Exception{
		sqlSession.insert("insert", bvo);
	}
	
	@Override
	public BoardVO read(Integer bno) throws Exception{
		return sqlSession.selectOne("read", bno);
	}
	
	@Override
	public void update(BoardVO bvo) throws Exception{
		sqlSession.update("update",bvo);
	}
	
	@Override
	public void delete(Integer bno) throws Exception{
		sqlSession.update("delete",bno);
	}
	
	@Override
	public List<BoardVO> list() throws Exception{
		return sqlSession.selectList("list");
	}
	
	@Override
	public List<BoardVO> listPage(int page) throws Exception{
		if(page <=0){
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return sqlSession.selectList("listPage", page);		
	}
	
	@Override
	public List<BoardVO> listCriteria(PageCriteria cria) throws Exception{
		return sqlSession.selectList("listCriteria", cria);
	}
	
	@Override
	public int countData(PageCriteria pCria) throws Exception{
		return sqlSession.selectOne("countData", pCria);
	}
	
	@Override
	public List<BoardVO> listFind(FindCriteria findCri) throws Exception{
		return sqlSession.selectList("listFind", findCri);
	}
	
	@Override
	public int findCountData(FindCriteria findCri) throws Exception{
		return sqlSession.selectOne("findCountData", findCri);
	}

	@Override
	public void replyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		sqlSession.update("replyCnt", paramMap);
	}

	@Override
	public void hitCnt(Integer bno) throws Exception {
		sqlSession.update("hitCnt", bno);
	}
	
}
