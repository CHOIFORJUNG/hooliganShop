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

import com.spring.service.ReplysService;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;
import com.spring.vo.ReplyVO;
import com.spring.vo.ReplysVO;

@RestController
@RequestMapping("/productReplies")
public class ReplysController {

	@Inject
	private ReplysService svc;

	// 댓글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	// ResponseEntity= rest방식에서 status를 나타냄 200 300 400 오류. @RequestBody=제이슨데이터를 객체화
	// 시켜주는것임
	public ResponseEntity<String> insertReplys(@RequestBody ReplysVO svo) {

		ResponseEntity<String> resEntity = null;
		// 예외처리하기위한 try catch 구문에 성공하면 success, httpstatus.ok = 200번이 뜬다.
		try {
			svc.insertReplys(svo);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return resEntity;
	}

	// 댓글 리스트 출력
	@RequestMapping(value = "/selectAll/{productNo}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplysVO>> replyList(@PathVariable("productNo") Integer productNo) {
		ResponseEntity<List<ReplysVO>> resEntity = null;

		try {
			resEntity = new ResponseEntity<>(svc.replyList(productNo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return resEntity;

	}

	
	  // PUT/PATCH은 댓글 수정 //@pathvariable는 url의 경로중에 잇는것들중에 어떤하나+를 받고싶은거니까 받아
	  
	  @RequestMapping(value="/{rebnum}", method= {RequestMethod.PUT,
	  RequestMethod.PATCH}) //RequestBody는 뷰쪽에서 날라오는 데이터를 커맨드객체타입(여러변수들을가지고있는)여러가지으로 받는다 
	  public ResponseEntity<String> updateReplys(@PathVariable("rebnum")
	  Integer rebnum, @RequestBody ReplysVO svo) {// @RequestBody는 JSON 객체로 변환시킴
	  
	  ResponseEntity<String> resEntity = null;
	  
	  try { svo.setRebnum(rebnum);; svc.updateReplys(svo);; // 수정처리
	  
	  resEntity = new ResponseEntity<String>("Success", HttpStatus.OK); } catch
	  (Exception e) { e.printStackTrace(); resEntity = new
	  ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); }
	  
	  return resEntity; }
	  
	  // DELETE은 댓글 삭제
	  
	  @RequestMapping(value = "/{rebnum}", method = RequestMethod.DELETE) public
	  ResponseEntity<String> delReply(@PathVariable("rebnum") Integer rebnum) {
	  
	  ResponseEntity<String> resEntity = null;
	  
	  try { svc.reDeleteReplys(rebnum);; resEntity = new
	  ResponseEntity<String>("Success", HttpStatus.OK); } catch (Exception e) {
	  e.printStackTrace(); resEntity = new ResponseEntity<>(e.getMessage(),
	  HttpStatus.BAD_REQUEST); } return resEntity; }
	  
	  // 댓글에 대한 페이징 처리
	  
	  @RequestMapping(value="/{productNo}/{page}", method=RequestMethod.GET) public
	  ResponseEntity<Map<String, Object>> replyListPage(
	  
	  @PathVariable("productNo") Integer productNo,
	  
	  @PathVariable("page") Integer page) {
	  
	  ResponseEntity<Map<String, Object>> resEntity = null; 
	  try { 
		  PageCriteria pCri = new PageCriteria(); pCri.setPage(page);
	  
		  System.out.println("productNo: "  + productNo);
	  List<ReplysVO> reList = svc.replyListPage(productNo, pCri); 
	  System.out.println("reList: " + reList); // 확인하려고 추가
	  int reCount = svc.reCounts(productNo);
	  
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
