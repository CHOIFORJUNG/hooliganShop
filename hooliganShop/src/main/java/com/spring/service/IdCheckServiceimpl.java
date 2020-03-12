package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.dao.IdCheckDAO;
import com.spring.vo.UserVO;

@Repository
public class IdCheckServiceimpl implements IdCheckService {

	@Inject
	private IdCheckDAO dao;
	
	@Override
	public int idCheck(String inputId) {
		return dao.idCheck(inputId);
	}

}
