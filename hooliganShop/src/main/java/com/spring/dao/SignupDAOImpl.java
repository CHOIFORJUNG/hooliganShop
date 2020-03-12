package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.UserVO;

@Repository
public class SignupDAOImpl implements SignupDAO {
 
    @Inject
    private SqlSession session;
 
    @Override
    public void insertMember(UserVO uvo) {
        session.insert("insertMember", uvo);
    }
}