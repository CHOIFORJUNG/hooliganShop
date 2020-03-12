package com.spring.service;

import javax.servlet.http.HttpSession;

import com.spring.vo.LoginDTO;
import com.spring.vo.UserVO;

public interface MemberService {

	//public boolean loginCheck(UserVO vo, HttpSession session);
	
	//public UserVO loginCheck(UserVO vo);
	public UserVO loginCheck(LoginDTO loginDTO);
	
	public UserVO viewMember(UserVO vo);
	
	public void logout(HttpSession session);
}
