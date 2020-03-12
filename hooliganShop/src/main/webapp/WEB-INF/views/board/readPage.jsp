<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<%@page import="com.spring.vo.UserVO" %>


   <!-- main -->
   < <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
             <h3><i class="fa fa-angle-right"></i>게시글 조회
             </h3>
             
            <form role="form" method="post"><!--"hidden"이 적용된 bid,page,numPerPage값은 같이 넘겨주게된다   -->
             		<input type="hidden" name="bno" value="${boardVO.bno}"/>
             		<input type="hidden" name="page" value="${pCri.page}"/>
             		<input type="hidden" name="numPerPage" value="${pCri.numPerPage}"/>
             		
            </form>
             <div class="row mt">
                <div class="col-lg-12">
                  <div class="form-panel">
                   <form class="form-horizontal style-form" method="post"><!--post방식의 controller로 이동!!  -->
                       <h4 class="mb">
                       		<i class="fa fa-angle-right"></i>조회내용
                       </h4>
                       	  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title" value="${boardVO.title}" readonly="readonly">  <!-- name="컬럼명" 잘 맞춰 써줄 것!-->
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                 <textarea class="form-control" name="content" rows="4" 
                                 readonly="readonly">${boardVO.content}</textarea>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                              <div class="col-sm-10">
                                  <input type="text" name="userId" class="form-control" readonly="readonly" value="${boardVO.userId}">
                              </div>
                          </div>
                         
             	</form>
             		</div><!-- form-pannel -->
             			  <div class="form-group">
             	 		  	<div class="col-sm-12" align="center">
				                <button type="submit" class="btn btn-primary">수정하기</button>&nbsp;
				                <button type="submit" class="btn btn-danger">삭제하기</button>&nbsp;
				                <button type="submit" class="btn btn-info">목록으로</button>
             				</div>
                  		  </div>
                  
                </div>
                <!-- col-lg-12-->   
             </div>
             <!-- /row -->
      <div class="row">
      <div class="col-lg-8">
        <h4>댓글목록</h4>
        <div class="hline"></div>
        
        <!-- 댓글목록 -->
        <ul id="reply">
	        <!-- 
	        <h4>testId</h4>
	        <p>2020-01-20</p>
	        <blockquote>안녕하세요 댓글테스트 <button> 수정</button></blockquote> -->
	  		
	  	
        </ul>
        
        
        <!-- 댓글 버튼들 존재 -->
         <ul class="pagination" id="pgeNumList">
         	<!-- 1,2,3,4,5,6,7 버튼 생김 -->
		 </ul>
        <!-- 댓글입력창 -->
		<div class="forreplyinput">
		<h4>댓글쓰기</h4>
        <!-- 댓글입력창 -->
       
       		<script>
       		console.log("userId#$%^ :" userId);
       		</script>
            <div>
              <input class="form-control" type="text" name="userId" id="writer" placeholder="Your Name" value="test"disabled />
            </div>
        	 <div>
              <textarea class="form-control" name="reContent" id="addReContent" placeholder="Your Message" rows="5" data-rule="required" data-msg="Please write something for us"></textarea>
              <div class="validate"></div>
            </div> 
            <div class="loading"></div>
            <div class="error-message"></div>

            <div class="form-send">
              <button id="submitBtn" class="btn btn-large">댓글작성</button>
            </div>
        	<li><a href="/member/login" class="btn btn-info" role="button">로그인하러 가기</a></li>
        	
		</div>
      </div> <!-- row -->
      </div> <!-- col-lg-8 -->
      
      </section><!--/wrapper -->
</section>
   
<%@ include file="../include/footer.jsp"%>

            	<script>
            		//$는 jquery라는 의미 24강
            		$(document).ready(function(){
            			
            			/* 게시글에 대한 jQuery */
            			var frmObj = $("form[role='form']");
            			
            			console.log("폼태그입니다....");
            			//#는 id 선택의미, .은 class선택의미
             		

            			$(".btn-primary").on("click", function(){
            				frmObj.attr("method", "get");
            				frmObj.attr("action", "/board/modifyPage");
            				frmObj.submit();
            			});
	
            			$(".btn-danger").on("click", function(){
            				frmObj.attr("method", "get")
            				frmObj.attr("action", "/board/delPage");
            				frmObj.submit();
            			});
            			
            			$(".btn-info").on("click", function(){
            				/* self.location = "/bbs/list"; */
            				frmObj.attr("method", "get");
            				frmObj.attr("action", "/board/pageList");
            				frmObj.submit();
            			});
            			
            			
            			
            			
            			
            			/* 댓글에 대한 jQuery */
            			
            			
            			
            			
            			var bno = 1;
            			
            			//getPgeNum(1)
            			
            			reListAll();
            			
            			// 댓글목록 전체 화면에 뿌려주기
            			function reListAll(){
            				/* getJSON(댓글리스트 가져오는 url, 콜백함수) */
            				$.getJSON("/replies/selectAll/"+bno, function(data){ // 댓글리스트를 data로 받아옴
            					console.log(data);
            					var str = "";
            					
            					$(data).each(function(){
            						
            				        str +="<h4>" + this.userId + "</h4>"
            				        	+"<p>" + this.regDate + "</p>"
            				        	+"<blockquote>" + this.replyContent + "</blockquote>";
            				        
            					});
            					
            					$("#reply").html(str);
            				});	
            			} //reListAll()
            			
            			//댓글 페이징 처리
            			function getPgeNum(page){
            				$.getJSON("/replies/"+bno+"/"+page, function(data){ // data는 json형태의 data
            					
            					console.log(data.reList.length);
            					console.log(data);
            					
            					var str="";
            					
            					$(data.reList).each(function(){
            						str +="<h4>"+ this.userId + "</h4>"
            							+"<p>"+ this.regDate +"</p>"
            							+"<blockquote>"+ this.replyContent +"<blockquote>"
            					});
            					
            					$("#reply").html(str);
            					
            					// 페이지 번호 출력 호출
            					showPageNum(data.pagingMaker)
            				});
            			}//getPgeNum()            			
            		});
            	</script>
</html>