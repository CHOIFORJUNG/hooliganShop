package com.spring.hooliganShop.start;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.IdCheckService;
import com.spring.service.SignupService;
import com.spring.vo.UserVO;

@Controller
@RequestMapping("/member/*")
public class IdCheckController {
    
    @Inject
    private IdCheckService idCheckService;
    
    //SignUp GET
    @RequestMapping(value="/idCheck", method=RequestMethod.GET)
    
    @ResponseBody
  //@RequestParam은 url을 http://localhost:8080/member/signup?inputId=testId 식으로 받아 오니까ajax에서 url: "/member/idCheck?inputId="+inputId,로 보내준다
    public int idCheckGET(@RequestParam("inputId") String inputId) throws Exception{ 
    	System.out.println("입력한 inputId: " + inputId);
    	
    	int data = idCheckService.idCheck(inputId); // 0은 사용가능 아이디, 1은 중복된 아이디
    	System.out.println("아이디 사용가능 여부: " + data);
    	
    	return data;
    }
}    
    
    