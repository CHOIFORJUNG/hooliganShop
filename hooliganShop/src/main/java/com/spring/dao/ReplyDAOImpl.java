package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> reList(Integer bno) throws Exception {
		return sqlSession.selectList("reList", bno);
	}

	@Override
	public void insert(ReplyVO rvo) throws Exception {
		sqlSession.insert("insertReply", rvo);
	}

	@Override
	public void update(ReplyVO rvo) throws Exception {
		sqlSession.update("updateReply", rvo);
	}

	@Override
	public void reDelete(Integer rebno) throws Exception {
		sqlSession.update("reDeleteReply", rebno);
	}

	@Override
	public List<ReplyVO> reListPage(Integer bno, PageCriteria pCri) throws Exception{
		Map<String, Object> reMap = new HashMap<>();
		
		reMap.put("bno", bno);
		reMap.put("pCri", pCri);
		
		return sqlSession.selectList("reListPage", reMap);
	}

	@Override
	public int reCount(Integer bno) throws Exception {
		return sqlSession.selectOne("reCount", bno);
	}

	@Override
	public int getBoardNo(Integer rebno) throws Exception {
		return sqlSession.selectOne("getBoardNo", rebno);
	}
	
}
