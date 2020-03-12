package com.spring.hooliganShop.start;

import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.MemberService;
import com.spring.vo.LoginDTO;
import com.spring.vo.UserVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	
	@Inject
	MemberService memberService;
	
	//로그인 화면
	/*@RequestMapping("login")
	public String login() {
		return "member/login"; // view/member/login.jsp로 포워드
	}*/
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "member/login"; // view/member/login.jsp로 포워드
	}
	
	
	
	/*   redirect   vs  forward
	 redirect는 페이지 이동시 새로운 url로 바뀌는거다. forward는 새로운 페이지로 이동하더라도 기존 url이 남아있다.
	 body에 실려서 넘어가서 url상에 msg가 안뜬다. 한번.  model은 header에 실려서 넘어가므로 새로고침을 해도 존재한다. 여러번.
	 
	 
	 
	 */
	/*
	//로그인 처리
	@RequestMapping("loginCheck")
	public String loginCheck(@ModelAttribute UserVO vo, HttpSession session, 
			Model model, RedirectAttributes reAttributes, HttpServletRequest request) {
		
		System.out.println("입력아이디: " + request.getParameter("userId"));
		System.out.println("입력비번: " + request.getParameter("userPw"));
		System.out.println("sessionId: " + request.getSession().getId());
		
	//	session = request.getSession();
		if(session.getAttribute("loginUser") != null) { 
			session.removeAttribute("loginUser");
		}
		System.out.println("vo: " + vo);
		UserVO userVO = memberService.loginCheck(vo);  // 아이디가 존재하는지만 검사 (비번은 검사x)
		System.out.println("userVO: " + userVO);
		session = request.getSession(); // jw추가
		
		if(userVO == null) {  // 존재하지 않는 회원
			System.out.println("존재하지 않는 회원입니다. 로그인 실패!");
			session.setAttribute("loginUser", null);
			reAttributes.addFlashAttribute("msg", "failure");			
			
			return "redirect:/member/login";
			
		} else { // 아이디는 확인완료
			// BCrypt.checkpw(직접 입력한 pw, 암호화된 pw)
			if(!BCrypt.checkpw(vo.getUserPw(), userVO.getUserPw())) {  
				
				System.out.println("비번이 불일치");
				session.setAttribute("loginUser", null);
				reAttributes.addFlashAttribute("msg", "failure");			
				
				return "redirect:/member/login";
			} else { // 로그인 성공
				System.out.print("로그인성공===> ");
				System.out.println("디비 아이디: " + userVO.getUserId());
				System.out.println("isAdmin!??:" + userVO.getIsAdmin());
				
				session.setAttribute("loginUser", userVO); //setAttrubute넘겨주면 전체에 쓸수있는거다(loginUser)
				reAttributes.addFlashAttribute("msg", "success");
			}
			
		}
		
		System.out.println("session Attribute: " + session.getAttribute("loginUser") );
		System.out.println("sessionId: " + session.getId());
		return "redirect:/";
	} */
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public void loginCheck(LoginDTO vo, HttpServletRequest req, RedirectAttributes rttr, Model model) {
		System.out.println("loginCheck() 호출......");

		UserVO userVO = memberService.loginCheck(vo);  // 아이디가 존재하는지만 검사 (비번은 검사x)

		if(userVO == null) {  // 존재하지 않는 회원
			System.out.println("존재하지 않는 회원입니다. 로그인 실패!");
			model.addAttribute("msg", "loginFailure");			
			
			return;
			
		} else { // 아이디는 확인완료
			// BCrypt.checkpw(직접 입력한 pw, 암호화된 pw)
			if(!BCrypt.checkpw(vo.getUserPw(), userVO.getUserPw())) {  
				
				System.out.println("비번이 불일치");
				model.addAttribute("msg", "pwFailure");		
				return;
			} else { // 로그인 성공
				System.out.println("userVO: " + userVO.toString());
				System.out.print("로그인성공===> ");
				System.out.println("디비 아이디: " + userVO.getUserId());
				
				model.addAttribute("msg", "success");		
				model.addAttribute("user", userVO);
				
				//HttpSession session = req.getSession();
				//session.setAttribute("loginUser", userVO);		
			}
		} 
	}
	//로그아웃 처리
	@RequestMapping("logout")
	public String logout(@ModelAttribute UserVO vo, HttpSession session, RedirectAttributes reAttributes) {
		memberService.logout(session);
		
//		mav.setViewName("member/login");
//		mav.addObject("msg", "logout");
		reAttributes.addFlashAttribute("msg", "logoutSuccess");
		
		
		return "redirect:/";
	}

}
