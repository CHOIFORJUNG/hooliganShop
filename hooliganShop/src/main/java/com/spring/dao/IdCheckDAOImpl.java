package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.UserVO;

@Repository
public class IdCheckDAOImpl implements IdCheckDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public int idCheck(String inputId) {
		return session.selectOne("idCheck", inputId);
	}

}
