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

import com.spring.service.ReplyService;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;
import com.spring.vo.ReplyVO;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService rsvc;

	// 댓글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	// ResponseEntity= rest방식에서 status를 나타냄 200 300 400 오류. @RequestBody=제이슨데이터를 객체화
	// 시켜주는것임
	public ResponseEntity<String> inputReply(@RequestBody ReplyVO rvo) {

		ResponseEntity<String> resEntity = null;
		// 예외처리하기위한 try catch 구문에 성공하면 success, httpstatus.ok = 200번이 뜬다.
		try {
			rsvc.inputReply(rvo);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return resEntity;
	}

	// 댓글 리스트 출력
	@RequestMapping(value = "/selectAll/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("bno") Integer bno) {
		ResponseEntity<List<ReplyVO>> resEntity = null;

		try {
			resEntity = new ResponseEntity<>(rsvc.replyList(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return resEntity;

	}

	
	  // PUT/PATCH은 댓글 수정 //@pathvariable는 url의 경로중에 잇는것들중에 어떤하나+를 받고싶은거니까 받아
	  
	  @RequestMapping(value="/{rebno}", method= {RequestMethod.PUT,
	  RequestMethod.GET}) //RequestBody는 뷰쪽에서 날라오는 데이터를 커맨드객체타입(여러변수들을가지고있는)여러가지으로 받는다 
	  public ResponseEntity<String> modifyReply(@PathVariable("rebno")
	  Integer rebno, @RequestBody ReplyVO rvo) {// @RequestBody는 JSON 객체로 변환시킴
	  
	  ResponseEntity<String> resEntity = null;
	  
	  try { rvo.setRebno(rebno); rsvc.modifyReply(rvo); // 수정처리
	  
	  resEntity = new ResponseEntity<String>("Success", HttpStatus.OK); } catch
	  (Exception e) { e.printStackTrace(); resEntity = new
	  ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); }
	  
	  return resEntity; }
	  
	  // DELETE은 댓글 삭제
	  
	  @RequestMapping(value = "/{rebno}", method = RequestMethod.DELETE) public
	  ResponseEntity<String> delReply(@PathVariable("rebno") Integer rebno) {
	  
	  ResponseEntity<String> resEntity = null;
	  
	  try { rsvc.delReply(rebno); resEntity = new
	  ResponseEntity<String>("Success", HttpStatus.OK); } catch (Exception e) {
	  e.printStackTrace(); resEntity = new ResponseEntity<>(e.getMessage(),
	  HttpStatus.BAD_REQUEST); } return resEntity; }
	  
	  // 댓글에 대한 페이징 처리
	  
	  @RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET) public
	  ResponseEntity<Map<String, Object>> reListPage(
	  
	  @PathVariable("bno") Integer bno,
	  
	  @PathVariable("page") Integer page) {
	  
	  ResponseEntity<Map<String, Object>> resEntity = null; 
	  try { 
		  PageCriteria pCri = new PageCriteria(); pCri.setPage(page);
	  
		  System.out.println("bno: "  + bno);
	  List<ReplyVO> reList = rsvc.reListPage(bno, pCri); 
	  System.out.println("reList: " + reList); // 확인하려고 추가
	  int reCount = rsvc.reCount(bno);
	  
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
