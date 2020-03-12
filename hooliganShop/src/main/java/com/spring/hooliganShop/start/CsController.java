package com.spring.hooliganShop.start;


import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.CsService;
import com.spring.utils.UploadFileUtils;
import com.spring.vo.CsVO;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;

@Controller
@RequestMapping("/cs/*")
public class CsController {

	private static Logger logger = LoggerFactory.getLogger(CsController.class);
	
	@Inject
	private CsService csvc;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	/*
	 GET : 주로 어떤 페이지로 이동할 때 사용하며, 어떤 브라우저 페이지를 그냥 보고자 할 때
	  (이 컨트롤러 안에서 예를들면 list, read 가 그렇자나 병신아 최동준!!) 
	 POST: DB와 관련된 처리를 하고자 할때. (수정,삭제 처리)
	 
	 그러므로 insert를 보면 get(그냥보고자할떄)이랑 POST(등록하기 누른후 DB처리)가 둘다 있는거자나 ㅇㅋ?
	 * 
	 * */
	
	// 글쓰기 페이지 이동
	@RequestMapping(value="/insert", method = RequestMethod.GET)  // 기본 디폴트는 GET이므로 안써줘도 에러 안남. POST는 무조건 명시 해야함
	public void insertGET(CsVO cvo, Model model) throws Exception{
		logger.info("게시글 입력....");
	}
	
	// 글쓰기 처리
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(CsVO cvo, RedirectAttributes reAttr, MultipartFile file) throws Exception{
		/*
		 form태그(뷰단)  -- > Controller(서버단)
		 
		 뷰에서 넘어온 값을 컨트롤러가 받는 방법 (3가지)
		 1. HttpServletRequest    ex) String test = request.getParameter();
		 	- 데이터만 다시 뷰로 보낼 수 있음
		 2. ModelAndView  
		 	- 데이터 & 뷰이름도 함께 지정해서 보낼 수 있음 
		 3. 객체 
		 * */
		
		logger.info("cs insert POST....");
		logger.info("cvo.toString()은 뭘까요 :" + cvo.toString());
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 cvo.setCsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
		 //fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		
		csvc.insert(cvo);
//			model.addAttribute("result","success");
		reAttr.addFlashAttribute("result", cvo.getCsReplycnt());  
		
		reAttr.addFlashAttribute("result", "insertSuccess");
		
		return "redirect:/cs/list";
	}
	
	// 글목록 페이지 이동
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(@ModelAttribute("cri") PageCriteria pageCria, PageCriteria pageCri, Model model) throws Exception{
		logger.info("글목록 가져오기.........");
		logger.info(pageCri.toString());

		//model.addAttribute("list", csvc.list());
		model.addAttribute("list", csvc.listCriteria(pageCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(pageCri);// PagingCriteria를 PagingMaker에 넣어주기 위함
		pagingMaker.setTotalData(csvc.countData(pageCri));
		
		model.addAttribute("pagingMaker", pagingMaker);
	}
	
	// 글쓰기 페이지 이동
	@RequestMapping(value="/read", method=RequestMethod.GET) 
	public void read(@RequestParam("csNo") int csNo, Model model) throws Exception {
	  logger.info("read....");
	  model.addAttribute("cvo", csvc.read(csNo));  
	}
	  
	// 수정페이지 이동
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("csNo") int csNo, Model model,
			@ModelAttribute("cri") PageCriteria pageCria) throws Exception{
		
		logger.info("csvc.read(csNo): " + csvc.read(csNo).toString());
		model.addAttribute("cvo", csvc.read(csNo)); // model에 이름을 따로 같이 안넘겨주면, 해당 vo의 첫글자를 소문자로 바꿔준 상태로 view로 넘겨줌
													// "cvo"로 지정안한다면, csVO로 넘어감
			
	}
	
	// 수정 처리
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(CsVO cvo, RedirectAttributes reAttr) throws Exception{
		logger.info("modifyPOST()........");
		
		csvc.update(cvo);
		reAttr.addFlashAttribute("result", "success");
		
		return "redirect:/cs/list";
	}
	
	// 삭제 처리
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deletePOST(CsVO cvo, RedirectAttributes reAttr) throws Exception{
		logger.info("deletePOST()........");
		
		csvc.delete(cvo.getCsNo());
		logger.info("cvo.getCsNo(): " + cvo.getCsNo());
		// model.addAttribute("result", "deleteSuccess");
		reAttr.addFlashAttribute("result", "deleteSuccess");
		
		return "redirect:/cs/list";
	}
	 
	 
}
