package com.spring.hooliganShop.start;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.SignupService;
import com.spring.vo.UserVO;

@Controller
@RequestMapping("/member/*")
public class SignupController {
    
    @Inject
    private SignupService signupService;
    
    //SignUp GET
    @RequestMapping(value="/signup", method=RequestMethod.GET)
    public void signupGET() {
    	
    }
   
    
    //SignUp PSOT
        @RequestMapping(value="/signup", method=RequestMethod.POST)
        public String signupPOST(UserVO uvo, RedirectAttributes reAttr) {
        	//비밀번호 암호화를 위해 hash 사용!
        	String hashedPw =BCrypt.hashpw(uvo.getUserPw(), BCrypt.gensalt());
        	uvo.setUserPw(hashedPw);
            signupService.insertMember(uvo);
            reAttr.addFlashAttribute("result", "success");
            
    		return "redirect:/";
        }
    
    
    
}
