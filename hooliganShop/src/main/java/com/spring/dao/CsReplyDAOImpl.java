package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.CsReplyVO;
import com.spring.vo.PageCriteria;

@Repository
public class CsReplyDAOImpl implements CsReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CsReplyVO> replyList(int csNo) throws Exception {
		return sqlSession.selectList("csreplyList", csNo);
	}

	@Override
	public void insertReply(CsReplyVO cvo) throws Exception {
		sqlSession.insert("csinsertReply", cvo);
	}

	@Override
	public void updateReply(CsReplyVO cvo) throws Exception {
		sqlSession.update("csupdateReply", cvo);
	}

	@Override
	public void deleteReply(int csNo) throws Exception {
		sqlSession.delete("csdeleteReply", csNo);
	}

	@Override
	public List<CsReplyVO> replyListPage(int csNo, PageCriteria pCri) throws Exception {
		Map<String, Object> reMap = new HashMap<>();
		
		reMap.put("csNo", csNo);
		reMap.put("pCri", pCri);
		
		return sqlSession.selectList("csreplyListPage", reMap);
	}

	@Override
	public int reCount(int csNo) throws Exception {
		return sqlSession.selectOne("csreCount", csNo);
	}

	@Override
	public int getCsNo(int csReplyNo) throws Exception {
		return sqlSession.selectOne("getCsNo", csReplyNo);
	}

}
