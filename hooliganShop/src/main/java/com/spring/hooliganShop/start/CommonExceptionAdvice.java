package com.spring.hooliganShop.start;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice   // @ControllerAdvicd : 현재 이 클래스가 컨트롤러에서 발생하는 Exception을 전문적으로 처리하는 클래스임을 스프링에 알림
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
//	@ExceptionHandler(Exception.class) // 모든 Exception은 공통으로 처리하기 위해 Exception.class 명시
//	public String common(Exception e) {
//		
//		logger.info(e.toString());
//		return "err_exception";  // 실제 예외처리를 해주는 view 명 
//	}
	
	
	/*
	 일반 컨트롤러 클래스와 다륵 ㅔModel을 파라미터로 사용하는 것을 지원하지 않기 때문에 ModelAndView 타입을 직접 사용하는 형태로 작성
	 - ModelAndView는 하나의 객체에 Model 데이터와 View의 처리를 동시에 처리할 수 있는 객체 
	 - 예외가 발생하면 예외가 발생한 내용이 담긴 데이터를 exception에 담고 err_exception.jsp에 전달
	 
	 * */
	@ExceptionHandler(Exception.class) 
	private ModelAndView errMAV(Exception e) {
		
		logger.info(e.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);     // 예외사항
		mav.setViewName("/err_exception"); // 뷰의 이름
		
		return mav;
	}
}
