package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.CsVO;
import com.spring.vo.PageCriteria;

@Repository
public class CsDAOImpl implements CsDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(CsVO cvo) throws Exception {
		sqlSession.insert("csinsert", cvo); //('매퍼id랑 통일', cvo)
	}

	@Override
	public CsVO read(int csNo) throws Exception {
		return sqlSession.selectOne("csread", csNo);
	}

	@Override
	public void update(CsVO cvo) throws Exception {
		sqlSession.update("csupdate", cvo);
	}

	@Override
	public void delete(int csNo) throws Exception {
		sqlSession.delete("csdelete", csNo);
	}

	@Override
	public List<CsVO> list() throws Exception {
		return sqlSession.selectList("cslist");
	}

	@Override
	public List<CsVO> listCriteria(PageCriteria pageCri) throws Exception {
		return sqlSession.selectList("cslistCriteria", pageCri);
	}

	@Override
	public int countData(PageCriteria pageCri) throws Exception {
		return sqlSession.selectOne("cscountData", pageCri);
	}

	@Override
	public void updateReplyCnt(int csNo, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("csNo", csNo);
		paramMap.put("amount", amount);
		
		sqlSession.update("updateReplyCnt", paramMap);
		
	}

}
