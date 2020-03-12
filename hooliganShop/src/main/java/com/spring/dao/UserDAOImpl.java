package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String getTime() {
		return sqlSession.selectOne("getTime");
	}
	@Override
	public void insertUser(UserVO uvo) {
		sqlSession.insert("insertUser",uvo);
	}
	
	

}
