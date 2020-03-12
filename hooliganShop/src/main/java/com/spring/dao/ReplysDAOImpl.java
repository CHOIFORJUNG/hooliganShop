package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplysVO;

@Repository
public class ReplysDAOImpl implements ReplysDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReplysVO> replyList(Integer productNo) throws Exception {
		return sqlSession.selectList("replyList", productNo);
	}

	@Override
	public void insertReplys(ReplysVO svo) throws Exception {
		sqlSession.insert("insertReplys", svo);
		
	}

	@Override
	public void updateReplys(ReplysVO svo) throws Exception {
		sqlSession.update("updateReplys", svo);
	}

	@Override
	public void reDeleteReplys(Integer productNo) throws Exception {
		sqlSession.delete("reDeleteReplys", productNo);
	}

	@Override
	public List<ReplysVO> replyListPage(Integer productNo, PageCriteria pCri) throws Exception {
		Map<String, Object> reMap = new HashMap<>();
		
		reMap.put("productNo", productNo);
		reMap.put("pCri", pCri);
		
		return sqlSession.selectList("replyListPage", reMap);
	}

	@Override
	public int reCounts(Integer productNo) throws Exception {
		return sqlSession.selectOne("reCounts", productNo);

	}

}
