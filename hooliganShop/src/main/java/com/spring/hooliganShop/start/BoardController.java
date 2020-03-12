package com.spring.hooliganShop.start;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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

import com.spring.service.BoardService;
import com.spring.utils.UploadFileUtils;
import com.spring.vo.BoardVO;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService bsvc;
	
	@Resource(name="uploadPath")   // @Resource(name="uploadPath")는 bean의 id가 uploadPath인 녀석을 찾아옴 
	private String uploadPath;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void insertGET(BoardVO bvo, Model model) throws Exception{ // Model=데이터 전달용 객체, 키와 값으로 저장
		logger.info("게시글 입력....");
		
	}
	
	// 글쓰기 처리
	@RequestMapping(value="/insert", method=RequestMethod.POST)
//	public String insertPost(BoardVO bvo, Model model) throws Exception{
	public String insertPost(BoardVO bvo, RedirectAttributes reAttr, MultipartFile file) throws Exception{
	
		logger.info("insert POST....");
		logger.info(bvo.toString());
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {  // 파일첨부가 된 사진이 있다면
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 bvo.setBoardImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);  
		
		 //       / + imgUpload/  +  2020/02/03 + /    + barca
		 bvo.setBoardThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		} else {  // 파일첨부 하지 않았다면
			// fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		bsvc.insert(bvo); // 글쓰기 처리
//			model.addAttribute("result","success");
		reAttr.addFlashAttribute("result", bvo.getReplyCnt());  
		
			return "/board/resultOK";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model) throws Exception{
		logger.info("글목록 가져오기.........");
		
		model.addAttribute("list", bsvc.list());
	}

	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("pCri") PageCriteria pCri, Model model) throws Exception{
		
		model.addAttribute(bsvc.read(bno)); //addAttribute에서 ""이름을 안넣었으면 해당 클래스의 소문자 이름으로 사용된다.
	}										//readPage.jsp에서 bbsVO
//	  @RequestMapping(value="/read", method=RequestMethod.GET) 
//	  public void read(@RequestParam("bno") int bno, Model model) throws Exception {
//		  logger.info("read....");
//		  model.addAttribute("boardVO", bsvc.read(bno));  // 리턴타입은 BoardVO
//	  }
	
	@RequestMapping(value="delPage", method=RequestMethod.POST)
	public String delPage(@RequestParam("bno") int bno, PageCriteria pCria, RedirectAttributes reAttr)throws Exception{
		bsvc.delete(bno);
		
		reAttr.addAttribute("page", pCria.getPage());
		reAttr.addAttribute("numPerPage", pCria.getNumPerPage());
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/board/pageList";
	}	
//	  @RequestMapping(value="/delete", method=RequestMethod.POST) // read.jsp에서 POST방식으로 보냈기떄문에
//	  public String delete(@RequestParam("bno") int bno, RedirectAttributes reAttr) throws Exception {  // read.jsp에서 hidden으로 넘어온 bid값을 받아야 함
//		  
//		  bsvc.delete(bno);
//		  
//		  reAttr.addFlashAttribute("result", "success"); 
//		  return "redirect:/board/list"; 
//	  }
//	  
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, 
			@ModelAttribute("pCri") PageCriteria pCri, Model model) throws Exception {
		
		logger.info("modify GET()............");
		model.addAttribute(bsvc.read(bno));
	}
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPOST(BoardVO bvo, PageCriteria pCri, RedirectAttributes reAttr)throws Exception{
		bsvc.update(bvo);
		
		reAttr.addAttribute("page", pCri.getPage());
		//
		reAttr.addAttribute("numPerPage", pCri.getNumPerPage());
		//addFlashAttribute() 는 리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다.
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/board/pageList";		
	}
//		@RequestMapping(value="/modify", method=RequestMethod.GET)
//		public void modifyGET(int bno, Model model) throws Exception{
//			model.addAttribute(bsvc.read(bno));
//		}
//		@RequestMapping(value="/modify", method=RequestMethod.POST)
//		public String modifyPOST(BoardVO bvo, RedirectAttributes reAttr) throws Exception{
//			logger.info("modifyPOST()........");
//			
//			bsvc.update(bvo);;
//			reAttr.addFlashAttribute("result", "success");
//			
//			return "redirect:/board/list";
//		}
		
		@RequestMapping(value="/pageList", method=RequestMethod.GET)
		public void pageList(PageCriteria pCria, Model model) throws Exception{
			logger.info(pCria.toString());
			
			model.addAttribute("list", bsvc.listCriteria(pCria));
			
			PagingMaker pagingMaker = new PagingMaker();
			pagingMaker.setCri(pCria);
			//pagingMaker.setTotalData(155);
			pagingMaker.setTotalData(bsvc.listCountData(pCria));
			
			model.addAttribute("pagingMaker", pagingMaker);
		}
}
