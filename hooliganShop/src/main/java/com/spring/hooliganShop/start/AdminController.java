package com.spring.hooliganShop.start;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.AdminService;
import com.spring.service.ProductService;
import com.spring.utils.UploadFileUtils;
import com.spring.vo.CategoryVO;
import com.spring.vo.OrderListVO;
import com.spring.vo.OrderVO;
import com.spring.vo.OrderViewVO;
import com.spring.vo.ProductVO;
import com.spring.vo.ProductViewVO;
import com.spring.vo.UserVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService psvc;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 관리자창
	@RequestMapping(value="/adminpage", method=RequestMethod.GET)
	public void adminpage() throws Exception{}
	
	// 상품 등록 페이지 이동
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET(Model model) throws Exception {
		 logger.info("get goods register");
		 List<CategoryVO> category = adminService.category();
		 for (CategoryVO i : category) {
			System.out.print(i);
		}
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	

	// 상품 등록 처리
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(ProductVO pvo, RedirectAttributes reAttr, MultipartHttpServletRequest request, MultipartFile file ) throws Exception{
		System.out.println("상품등록 처리 POST 호출......");
		logger.info("register POST....");
		logger.info("pvo.toString():: " + pvo.toString());
		
		  String imgUploadPath = uploadPath + File.separator + "imgUpload"; 
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath); 
		  String fileName = null;
		  
		  if(file != null) { 
			  System.out.println("사진 존재!!!!"); 
			  fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		  } else { 
			  // fileName = uploadPath + File.separator + "images" + File.separator + "none.png"; 
		  }
		  
		  pvo.setProductImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName); 
		  pvo.setProductThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		 
		psvc.register(pvo);
		System.out.println("상품등록 완료되었습니다.");
		//model.addAttribute("result","success");
		reAttr.addFlashAttribute("result", "success");
			
			return "redirect:/";
	}
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listGET(Model model) throws Exception{
		logger.info("get good list!");
		
		List<ProductVO> list = adminService.productlist();
		
		model.addAttribute("list", list);
	}
	
	//상품조회
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void viewGET(@RequestParam("n") int productNo, Model model) throws Exception{
		logger.info("get view!");
		
		ProductViewVO pvo = adminService.productView(productNo);
		model.addAttribute("product", pvo);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("n") int productNo, Model model) throws Exception{
		logger.info("get modify!");
		
		ProductViewVO pvo = adminService.productView(productNo);
		model.addAttribute("product", pvo);
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	//상품수정
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public String modifyPOST(ProductVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
	 logger.info("post goods modify");
	 
	 // 새로운 파일이 등록되었는지 확인
	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	  // 기존 파일을 삭제
	  new File(uploadPath + req.getParameter("productImg")).delete();
	  new File(uploadPath + req.getParameter("productThumbImg")).delete();
	  
	  // 새로 첨부한 파일을 등록
	  String imgUploadPath = uploadPath + File.separator + "imgUpload";
	  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	  
	  vo.setProductThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	  vo.setProductImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	  
	 } else {  // 새로운 파일이 등록되지 않았다면
	  // 기존 이미지를 그대로 사용
	  vo.setProductThumbImg(req.getParameter("productThumbImg"));
	  vo.setProductImg(req.getParameter("productImg"));
	 }
	 
	 adminService.ProductModify(vo);
	 
	 return "redirect:/admin/list";
	}
	
	// 상품 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int productNo) throws Exception {
	 logger.info("post goods delete");

	 adminService.productDelete(productNo);
	 
	 return "redirect:/admin/list";
	}
	
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
	 logger.info("get order list");
	   
	 List<OrderViewVO> orderList = adminService.orderList();
	 logger.info("orderList: " + orderList);
	 
	 model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") int orderNo,
	      OrderVO ovo, Model model) throws Exception {
	 logger.info("get order view");
	 
	 ovo.setOrderNo(orderNo); 
	 logger.info("orderNo: " + orderNo);
	 List<OrderListVO> orderView = adminService.orderView(ovo);
	 System.out.println("orderView: " + orderView);
	 model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO ovo) throws Exception {
	 logger.info("post order view");
	   
	 adminService.delivery(ovo);
	 
	 List<OrderListVO> orderView = adminService.orderView(ovo); 

	 ProductVO pvo = new ProductVO();
	  
	 for(OrderListVO i : orderView) {
		 pvo.setProductNo(i.getProductNo());
		 pvo.setProductStock(Integer.toString(i.getcartStock()));//cartStock를 get 해서 setProductStock에 넣어준다.pvo타입으로 반환되어 changeStock으로 간다!
	  
		 //System.out.println("productNo: " + i.getProductNo());
		 //System.out.println("getcartStock: " + i.getcartStock());
		 
		 logger.info("pvo.toString(): " + pvo.toString());
		 logger.info("pvo.productStock: " + pvo.getProductStock());
		 adminService.changeStock(pvo);
	 }

	 return "redirect:/admin/orderView?n=" + ovo.getOrderNo();
	}
	
	@RequestMapping(value="/userList", method=RequestMethod.GET)
	public void userList(Model model) throws Exception{
		logger.info("get good userList!");
		
		List<UserVO> userList = adminService.userList();
		
		model.addAttribute("userList", userList);
	}
}
