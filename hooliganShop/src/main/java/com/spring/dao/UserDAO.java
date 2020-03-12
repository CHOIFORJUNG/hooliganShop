package com.spring.dao;

import com.spring.vo.UserVO;

public interface UserDAO {
	
	public String getTime();
	
	public void insertUser(UserVO uvo);

}
