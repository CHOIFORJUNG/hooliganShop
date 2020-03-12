package com.spring.hooliganShop.start;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.constants.Constants;
import com.spring.service.CartService;
import com.spring.service.ReplyService;
import com.spring.service.ShopService;
import com.spring.vo.CartListVO;
import com.spring.vo.OrderDetailVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.ProductViewVO;
import com.spring.vo.UserVO;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	 @Inject
	 private CartService casvc;
	 
	 @Inject
	 ShopService service;
	 
	 @Inject
	 private ReplyService rsvc;
	    
	 // 카테고리별 상품 리스트
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getshopList(@RequestParam("c") int cateCode,
	      @RequestParam("l") int level, Model model) throws Exception {
	  logger.info("get shopList");
	  
	  List<ProductViewVO> shopList = null;
	  shopList = service.shopList(cateCode);
	  
	 
	  /* 변수의 종류 */
	  // 기본형타입  : byte, int, long, boolean, char, float, double
	  //  ex) int test = 1;    // 데이터값을 직접 int형인 변수안에 담는다 
	  
	  // 참조형타입 : 기본형을 제외한 나머지들 ex) String, interface, class, Map, List.. etc 
	  //ex) String s = new String();     // String s = "11";
	  // ex) Person p = new Person();  // p는 어딘가 존재하는Person객체를 가르키는 주소값을 담음
	  // p.equals(s); 
	  
	  String cateName = service.getCateName(cateCode);
	  System.out.println("cateName: " + cateName);
	  
	  model.addAttribute("shopList", shopList);
	  model.addAttribute("cateName", cateName);

	 }
	 
	// 상품 조회
	 @RequestMapping(value = "/view", method = RequestMethod.GET)
	 public void getView(@RequestParam("n") int productNo, Model model) throws Exception {
	  logger.info("get view");
	  
	  ProductViewVO productView = service.productView(productNo);
	  model.addAttribute("productView", productView);
	 }
	 
	 @ResponseBody	//보통 AJAX사용할때 쓰는 어노테이션
	 @RequestMapping(value="/view/addCart", method=RequestMethod.POST)
	 public int addCart(CartListVO cavo, HttpSession session) throws Exception{
		logger.info("addCart호출......");								//이런식으로 오류 찾아봐
		
		int result = 0;
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		System.out.println("loginUser: " + loginUser);			   //이런식으로 오류 찾아봐
		System.out.println("productNo: " + cavo.getProductNo());   //이런식으로 오류 찾아봐
		System.out.println("cartStock: " + cavo.getCartStock());  //이런식으로 오류 찾아봐
		
		if(loginUser != null) {
		cavo.setUserId(loginUser.getUserId());
		logger.info("catvo: " + cavo);//이런식으로 오류 찾아봐
		casvc.addCart(cavo);
		result = 1;
		}
		
		return result;
	 }
	 
	 //카트목록
	 @RequestMapping(value="/cartList", method = RequestMethod.GET)
	 public void getCartList(HttpSession session, Model model)throws Exception{
		 logger.info("get cart list");
		 
		 UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		 String userId = loginUser.getUserId();
		 
		 List<CartListVO> cartList = casvc.cartList(userId);
		 
		 model.addAttribute("cartList", cartList);
	 }
	 
	// 카트 삭제
	 @ResponseBody
	 @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	 public int deleteCart(HttpSession session,
	      @RequestParam(value = "chbox[]") List<String> chArr, CartListVO cart) throws Exception {
	  logger.info("delete cart");
	  
	  UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	  String userId = loginUser.getUserId();
	  
	  int result = 0;
	  int cartNo = 0;
	  
	  
	  if(loginUser != null) {
	   cart.setUserId(userId);
	   
	   for(String i : chArr) {   
	    cartNo = Integer.parseInt(i);
	    cart.setCartNo(cartNo);
	    casvc.deleteCart(cart);
	   }   
	   result = 1;
	  }  
	  return result;  
	 }
	 
	// 주문
	 @RequestMapping(value = "/cartList", method = RequestMethod.POST)
	 public String order(HttpSession session, OrderVO ovo, OrderDetailVO odvo) throws Exception {
	  logger.info("order");
	  
	  UserVO loginUser = (UserVO)session.getAttribute("loginUser");  
	  String userId = loginUser.getUserId();
	 
	  Calendar cal = Calendar.getInstance();
	  int year = cal.get(Calendar.YEAR);
	  String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	  String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	  String subNum = "";
	  
	  for(int i = 1; i <= 2; i ++) {
	   subNum += (int)(Math.random() * 10);
	  }
	  
	  String orderNoStr = ymd + subNum;
	  System.out.println("orderNoStr: " + orderNoStr );
	  int orderNo = Integer.parseInt(orderNoStr); 
	  
	  
	  // String -> int    :   int i = Integer.parseInt(str);
	  // int    -> String :   String s = Integer.toString(i); 
	  
	  ovo.setOrderNo(orderNo);
	  ovo.setUserId(userId);
	   
	  casvc.orderInfo(ovo);
	  logger.info("ovo값들: " + ovo.toString());
	  
	  odvo.setOrderNo(orderNo);
	  
	  System.out.println("odvo: " + odvo);
	  casvc.orderInfoDetail(odvo);
	  
	  casvc.cartAllDelete(userId);
	  
	  return "redirect:/shop/orderList";  
	 }
	 
	 
	 
	 // 주문 목록
	 @RequestMapping(value = "/orderList", method = RequestMethod.GET)
	 public void getOrderList(HttpSession session, OrderVO ovo, Model model) throws Exception {
	  logger.info("get order list");
	  
	  UserVO loginUser = (UserVO)session.getAttribute(Constants.LOGINED_USER);
	  String userId = loginUser.getUserId();
	  logger.info("userId in getOrderList : " + userId);
	  ovo.setUserId(userId);
	  
	  List<OrderVO> orderList = casvc.orderList(ovo);
	  
	  model.addAttribute("orderList", orderList);
	 }
	 
	// 주문 상세 목록
	 @RequestMapping(value = "/orderView", method = RequestMethod.GET)
	 public void getOrderList(HttpSession session,
	       @RequestParam("n") int orderNo,
	       OrderVO ovo, Model model) throws Exception {
	  logger.info("get order view");
	  
	  UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	  String userId = loginUser.getUserId();
	  
	  ovo.setUserId(userId);
	  ovo.setOrderNo(orderNo);
	  
	  
	  List<OrderListVO> orderView = casvc.orderView(ovo);
	  logger.info("orderView: " + orderView.toString());
	  
	  model.addAttribute("orderView", orderView);
	 }
	 
	 
}
