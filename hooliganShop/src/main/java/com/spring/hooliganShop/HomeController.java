package com.spring.hooliganShop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.ShopService;
import com.spring.vo.ProductViewVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	 ShopService service;
	 
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<ProductViewVO> bestList = null;
		bestList = service.bestList();
		System.out.println("bestList: " + bestList);
		
		model.addAttribute("bestList", bestList);
		
		return "home";
	}
	
	@RequestMapping(value="/ajaxTest", method=RequestMethod.GET)
	public void ajaxTest() {
		
	}
	
}
