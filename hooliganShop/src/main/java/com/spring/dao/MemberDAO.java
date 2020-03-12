package com.spring.dao;

import javax.servlet.http.HttpSession;

import com.spring.vo.LoginDTO;
import com.spring.vo.UserVO;

public interface MemberDAO {
	
	//public boolean loginCheck(UserVO vo);
	
	//public UserVO loginCheck(UserVO vo);
	public UserVO loginCheck(LoginDTO userDO);
	
	public UserVO viewMember(UserVO vo);
	
	public void logout(HttpSession session);

}
