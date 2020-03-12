package com.spring.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.LoginDTO;
import com.spring.vo.UserVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;

	//회원 로그인체크
	/*@Override
	public UserVO loginCheck(UserVO vo) {
		//String name = session.selectOne("loginCheck", vo);
		//return (name == null) ? false : true;
		return session.selectOne("loginCheck", vo);
	}*/
	@Override
	public UserVO loginCheck(LoginDTO loginDTO) {
		//String name = session.selectOne("loginCheck", vo);
		//return (name == null) ? false : true;
		return session.selectOne("loginCheck", loginDTO);
	}

	

	//회원 로그인정보
	@Override
	public UserVO viewMember(UserVO vo) {
		return session.selectOne("viewMember", vo);
	}

	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		
	}

}
