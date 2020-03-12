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

import com.spring.service.BoardService;
import com.spring.utils.UploadFileUtils;
import com.spring.vo.BoardVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.PagingMaker;

@Controller
@RequestMapping("/fboard/*")
public class FindController {
	private static final Logger logger = LoggerFactory.getLogger(FindController.class);
	
	@Inject
	private BoardService bsvc;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(@ModelAttribute("fCri") FindCriteria fCri, Model model) throws Exception{
		logger.info(fCri.toString());
		
//		model.addAttribute("list", bsvc.listCriteria(fCri));
		model.addAttribute("list", bsvc.listFind(fCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(fCri);
		
//		pagingMaker.setTotalData(bsvc.listCountData(fCri));
		pagingMaker.setTotalData(bsvc.findCountData(fCri));
		
		model.addAttribute("pagingMaker", pagingMaker);		
	}
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("bno") int bno, @ModelAttribute("fCri") FindCriteria fCri, Model model)
		throws Exception{
		model.addAttribute(bsvc.read(bno));
	}
	
	@RequestMapping(value="/delPage", method = RequestMethod.POST)
	public String delPage(@RequestParam("bno") int bno, FindCriteria fCri,
			RedirectAttributes reAttr) throws Exception{
		
		bsvc.delete(bno);
		
		reAttr.addAttribute("page", fCri.getPage());
		reAttr.addAttribute("numPerPage", fCri.getNumPerPage());
		reAttr.addAttribute("findType", fCri.getFindType());
		reAttr.addAttribute("keyword", fCri.getKeyword());
		
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/fboard/list";
	}
	
	//수정페이지
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyGET(int bno, @ModelAttribute("fCri") FindCriteria fCri, Model model) throws Exception{
		model.addAttribute(bsvc.read(bno));
	}
	
	// DB수정 처리
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPOST(BoardVO bvo, FindCriteria fCri, RedirectAttributes reAttr, MultipartFile file, HttpServletRequest req) throws Exception{
		
		logger.info(fCri.toString());
		 // 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("boardImg")).delete();
		  new File(uploadPath + req.getParameter("boardThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  bvo.setBoardImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  bvo.setBoardThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  bvo.setBoardImg(req.getParameter("gdsImg"));
		  bvo.setBoardThumbImg(req.getParameter("gdsThumbImg"));
		  
		 }
		
		
		
		bsvc.update(bvo);
		
		reAttr.addAttribute("page", fCri.getPage());
		reAttr.addAttribute("numPerPage", fCri.getNumPerPage());
		reAttr.addAttribute("findType", fCri.getFindType());
		reAttr.addAttribute("keyword", fCri.getKeyword());
		
		reAttr.addFlashAttribute("result", "Success");
		
		logger.info(reAttr.toString());
				
		return "redirect:/fboard/list";
	}
	
	//글쓰기 페이지 요청
	@RequestMapping(value="/insert", method =RequestMethod.GET)
	public void insertGET() throws Exception{
		
		logger.info("insertGET() 호출..........");
	}
	
	//DB 글 입력처리
	@RequestMapping(value="/insert", method =RequestMethod.POST)
	public String writePOST(BoardVO bvo, RedirectAttributes reAttr, MultipartFile file) throws Exception{
		
		logger.info("writePOST()호출.........");
		logger.info(bvo.toString());
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			System.out.println("사진 첨부 했습니다.");
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			bvo.setBoardImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			bvo.setBoardThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
		 // fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		bsvc.insert(bvo);
		
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/fboard/list";
	}
}