<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="../include/header.jsp"%>

   <!-- main -->
    <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
             <h3><i class="fa fa-angle-right"></i>게시글 조회
             </h3>
             
            <form role="form" method="post" role="form">
             		<input type="hidden" name="bno" value="${boardVO.bno}"/>
            </form>
             <div class="row mt">
                <div class="col-lg-12">
                  <div class="form-panel">
                   <form class="form-horizontal style-form" method="post">
                       <h4 class="mb">
                       		<i class="fa fa-angle-right"></i>조회내용
                       </h4>
                       <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="subject" value="${boardVO.title}" readonly="readonly">  <!-- name="컬럼명" 잘 맞춰 써줄 것!-->
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
      </section><! --/wrapper -->
</section>
      <!-- /MAIN CONTENT -->
<%@ include file="../include/footer.jsp"%>

  	<script>
                	// $는 jQuery의 의미
    				$(document).ready(function(){
    						var frmObj = $("form[role='form']");
    					
    						console.log("폼태그입니다..");
    						//#는 id 선택의미, .은 class선택의미
	                  		
					
                  			$(".btn-primary").on("click", function(){
                  				frmObj.attr("action", "/board/modify");
                  				frmObj.attr("method", "get");
                  				frmObj.submit();
                  			});
							
                  			$(".btn-danger").on("click", function(){
                  				frmObj.attr("action", "/board/delete");
                  				frmObj.submit();
                  			});
                  			
                  			$(".btn-info").on("click", function(){
                  				self.location = "/board/list";
                  			});
                  			
                  		});
                  	</script>