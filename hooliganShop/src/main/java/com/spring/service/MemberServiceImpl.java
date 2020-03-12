package com.spring.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.spring.dao.MemberDAO;
import com.spring.vo.LoginDTO;
import com.spring.vo.UserVO;

@Repository
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	//회원 로그인체크
	/*@Override
	public UserVO loginCheck(UserVO vo) {
		return memberDao.loginCheck(vo);
	}*/
	@Override
	public UserVO loginCheck(LoginDTO loginDTO) {
		return memberDao.loginCheck(loginDTO);
	}
	
	
	/*
	 * @Override public boolean loginCheck(UserVO vo, HttpSession session) { boolean
	 * result = memberDao.loginCheck(vo); if(result) {// true일 경우 세션에 등록 UserVO vo2
	 * = viewMember(vo); // 세션 변수 등록 session.setAttribute("userId",
	 * vo2.getUserId()); session.setAttribute("userName", vo2.getUserName()); }
	 * return result; }
	 */
	
	//회원 로그인정보
	@Override
	public UserVO viewMember(UserVO vo) {
		return memberDao.viewMember(vo);
	}
	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		//session.removeAttribute("userId");
		//세션 정보를 초기화시킴
		session.invalidate();
		
	}

}
