package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.dao.SignupDAO;
import com.spring.vo.UserVO;

@Repository
public class SignupServiceimpl implements SignupService{

    @Inject
    private SignupDAO dao;
 
    @Override
    public void insertMember(UserVO uvo) {
        dao.insertMember(uvo);
    }
}
