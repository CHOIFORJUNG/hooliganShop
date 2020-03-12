package com.spring.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.constants.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    
    // 컨트롤러 실행 이후에 작동
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	System.out.println("LoginInterceptor의 preHandle()호출......");
       
    	HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        
        Object userVO =  modelMap.get("user");
        logger.info("userVO: " + userVO.toString());
       
        if (userVO != null) {
            logger.info("new login success");
            httpSession.setAttribute(Constants.LOGINED_USER, userVO);
        	response.sendRedirect("/");
        } 
        
       
        
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(Constants.LOGINED_USER) != null) {
            logger.info("clear login data before");
            httpSession.removeAttribute(Constants.LOGINED_USER);
        }

        return true;
    }
}