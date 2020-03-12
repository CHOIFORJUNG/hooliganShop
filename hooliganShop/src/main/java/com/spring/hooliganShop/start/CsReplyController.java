package com.spring.hooliganShop.start;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.service.CsReplyService;
import com.spring.vo.CsReplyVO;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;

@RestController
@RequestMapping("/csReplies")
public class CsReplyController {

	@Inject
	private CsReplyService csvc;
	
	//댓글 입력
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody CsReplyVO cvo){
	
	ResponseEntity<String> resEntity = null;
		try {
			csvc.insertReply(cvo);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return resEntity;
		}
	
	//댓글 리스트 출력
	@RequestMapping(value="/selectAll/{csNo}", method=RequestMethod.GET)
	public ResponseEntity<List<CsReplyVO>> replyList(@PathVariable("csNo") int csNo) {
		
		ResponseEntity<List<CsReplyVO>> resEntity = null;
		try {
			resEntity = new ResponseEntity<>(csvc.replyList(csNo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return resEntity;
		}
	
	//댓글수정
    @RequestMapping(value="/{csReplyNo}", method= {RequestMethod.PUT, RequestMethod.PATCH}) 
    public ResponseEntity<String> updateReply(@PathVariable("csReplyNo") int csReplyNo, @RequestBody CsReplyVO cvo) {
    	
    	ResponseEntity<String> resEntity = null;
    	try { cvo.setCsReplyNo(csReplyNo); csvc.updateReply(cvo);  // 수정처리
    	resEntity = new ResponseEntity<String>("Success", HttpStatus.OK); 
    	} catch (Exception e) {
    		e.printStackTrace();
    		resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    	}
    	 return resEntity;
    	}
    
    // delete은 댓글 삭제
    
    @RequestMapping(value="/{csReplyNo}", method=RequestMethod.DELETE)
    public ResponseEntity<String> delReply(@PathVariable("csReplyNo") int csReplyNo) {
    	
    	ResponseEntity<String> resEntity = null;
    	try { csvc.deleteReply(csReplyNo); resEntity = new
    	ResponseEntity<String>("Success", HttpStatus.OK); } catch (Exception e) {
		e.printStackTrace(); resEntity = new ResponseEntity<>(e.getMessage(),
		HttpStatus.BAD_REQUEST); } return resEntity; }    			
  	
    // 댓글 페이징처리

	@RequestMapping(value="/{csNo}/{page}", method=RequestMethod.GET) 
	public ResponseEntity<Map<String, Object>> replyListPage(@PathVariable("csNo") int csNo,
		@PathVariable("page") int page){
		
		ResponseEntity<Map<String, Object>> resEntity = null; 
		  try { 
			  PageCriteria pCri = new PageCriteria(); pCri.setPage(page);
		  
			  System.out.println("csNo: "  + csNo);
		  List<CsReplyVO> reList = csvc.replyListPage(csNo, pCri);
		  System.out.println("reList: " + reList); // 확인하려고 추가
		  int reCount = csvc.reCount(csNo);
		  
		  PagingMaker pagingMaker = new PagingMaker(); 
		  pagingMaker.setCri(pCri);
		  pagingMaker.setTotalData(reCount);
		  
		  Map<String, Object> reMap = new HashMap<String, Object>();
		  reMap.put("reList", reList); 
		  reMap.put("pagingMaker", pagingMaker);
		  
		  resEntity = new ResponseEntity<Map<String,Object>>(reMap, HttpStatus.OK);
		  
		  } catch (Exception e) { e.printStackTrace(); resEntity = new
		  ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST); }
		  
		  return resEntity; }

 }
