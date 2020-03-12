<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<%@page import="com.spring.vo.UserVO" %>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
   <!-- main -->
    <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
             <h3 style="text-align:center;"><i class="fa fa-angle-right"></i>게시글 조회
             </h3>
             
            <form role="form" method="post" role="form">
             		<input type="hidden" name="csNo" value="${cvo.csNo}"/>
            </form>
             <div class="row mt">
                <div class="col-lg-8" style="margin-left: 160px;">
                  <div class="form-panel">
                   <form class="form-horizontal style-form" method="post">
                      	 <h4 class="mb" style="margin-left: 140px;"> 
                       		<i class="fa fa-angle-right"></i>조회내용
                       </h4>
                        <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">글번호</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="csNo" value="${cvo.csNo}" readonly="readonly">  <!-- name="컬럼명" 잘 맞춰 써줄 것!-->
                              </div>
                          </div>
                       <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="csTitle" value="${cvo.csTitle}" readonly="readonly">  <!-- name="컬럼명" 잘 맞춰 써줄 것!-->
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                 <textarea class="form-control" name="csContent" rows="4" 
                                 readonly="readonly">${cvo.csContent}</textarea>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                              <div class="col-sm-10">
                                  <input type="text" name="userId" class="form-control" readonly="readonly" value="${cvo.userId}">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">이미지</label>
                              <div class="col-sm-10">
                                 <img class="img-responsive" src="${cvo.csThumbImg }" alt=""
					style="height: 300px; width: 550px; margin-left:100px;"/>
                              </div>
                          </div>
                          
                         
             	</form>
             		</div><!-- form-pannel -->
             			  <div class="form-group">
             	 		  	<div class="col-sm-12" align="center">
             	 		  	<c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.userId == cvo.userId }">
				                <button type="submit" class="btn btn-primary">수정하기</button>&nbsp;
				                <button type="submit" class="btn btn-danger">삭제하기</button>&nbsp;
				             </c:if>
				                <button type="submit" class="btn btn-info">목록으로</button>
             				</div>
                  		  </div>
                  
                  
                </div>
                <!-- col-lg-12-->   
             </div>
             
             <!--             댓글 모달창                                -->
             
	  <div class="modal fade" id="modifyDiv">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">    
	               
             <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title"><span class='title-dialog'></span>번 댓글 편집창</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	         <!--   Modal body -->
	        <div class="modal-body">
	          <input class="form-control" type="text" id="userId" size="8" readonly="readonly">
	        </div>
	        <div class="modal-body">
	          <input class="form-control" type="text" id="regDate" size="15" readonly="readonly">
	        </div>
	        <div class="modal-body">
	          <input class="form-control" type="text" id="csContent" size="60" name="csContent">
	        </div>
	        <div align="center">
					 <button type="button"  class="btn btn-info" id="reModifyBtn">수정</button>
					 <button type="button"  class="btn btn-danger" id="reDelBtn">삭제</button>
			</div>
			
	     <!--    Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>	
	  
	  
	  
	  
	  
	  
	  
	  
	  	<section id="main-content">
			<section class="wrapper">
				<!-- /row -->
				<div class="row">
					<div align="center" style="width: 100%; text-align: center;">
						<div class="col-lg-12"
							style="display: inline-block; width: 60%; margin-left: 260px; margin-top: 100px;">
							 <h3><i class='fas fa-edit'></i>&nbsp;관리자답변</h3>
        <div class="hline" style="margin-bottom: 30px;"></div>
        <!-- 댓글목록 -->
        <ul id="reply" style="list-style:none;">
        </ul>
        
        <!-- 댓글 버튼들 존재 -->
         <ul class="pagination" id="pgeNumList">
         	<!-- 1,2,3,4,5,6,7 버튼 생김 -->
		 </ul>
		<!-- 댓글입력창 -->      
		<div class="forreplyinput">
        <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.userId.equals('admin')}">
		 		<h4>댓글쓰기</h4>
            <div>
              <input class="form-control" type="text" name="userId" id="writer" placeholder="Your Name" value="${sessionScope.loginUser.userId }" disabled />
            </div>
        	 <div>
              <textarea class="form-control" name="csContent" id="addcsContent" placeholder="Your Message" rows="5" data-rule="required" data-msg="Please write something for us"></textarea>
              <div class="validate"></div>
            </div> 
            <div class="loading"></div>
            <div class="error-message"></div>

            <div class="form-send">
              <button id="submitBtn" class="btn btn-large">댓글작성</button>
            </div>
            </c:if>
                 <c:if test="${sessionScope.loginUser == null }">
        	<li><a href="/member/login" class="btn btn-info" role="button">로그인하러 가기</a></li>
     		</c:if>
       </div>	  		 
	        
	                  </form>
						</div>
					</div>
					<!-- row -->
				</div>
				<!-- col-lg-8 -->

			</section>
			<!--/wrapper -->
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
                  				frmObj.attr("action", "/cs/modify");
                  				frmObj.attr("method", "get");
                  				frmObj.submit();
                  			});
							
                  			$(".btn-danger").on("click", function(){
                  				frmObj.attr("action", "/cs/delete");
                  				frmObj.submit();
                  			});
                  			
                  			$(".btn-info").on("click", function(){
                  				self.location = "/cs/list";
                  			});
                  			
                  		});

    				$(document).ready(function () {
    					

    				 	var csNo = '${cvo.csNo}';
    					console.log('csNo 확인: ' + csNo);
    					getPgeNum(1);
    					
    					
    					
    					//댓글 페이징 처리
    					function getPgeNum(page){
    						$.getJSON("/csReplies/"+csNo+"/"+page, function(data){ // data는 json형태의 data
    							
    							console.log(data.reList.length);
    							console.log(data);
    							
    							var str="";
    							
    							$(data.reList).each(function(){
    								str +="<li data-csReplyNo='"+ this.csReplyNo +"' class='reList' style='text-align:left;'>"
    									+"<h4>"+ this.userId + "</h4>"
    									+"<p>"+ this.regDate +"</p>"
    									+"<blockquote>"+ this.csContent +"</blockquote>"
    									+ "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#modifyDiv'>수정</button>"
    									+"</li>"
    									+"<hr/>";
    							});
    							// if(loginUser2 != null && userId == this.userId) {
    								
    							
    							
    							$("#reply").html(str);
    							
    							// 페이지 번호 출력 호출
    							showPageNum(data.pagingMaker)
    						});
    					}//getPgeNum()
    					
    					
    					// 댓글 목록 페이지 번호 출력 함수 (1,2,3,4,5,6, 번호 출력)
    					function showPageNum(pagingMaker){
    						
    						var str = "";
    						
    						// 이전 버튼 활성화
    						if(pagingMaker.prev){
    							str +="<li><a href='"+(pagingMaker.startPage-1)+"'>◀</a></li>";
    						}

    						// 페이지 번호
    						for(var i=pagingMaker.startPage, end=pagingMaker.endPage; i <= end; i++){			
    							str +="<a href='"+i+"'><button type='button'>"+i+"</button></a>";	
    						}
    						
    						// 다음 버튼 활성화
    						if(pagingMaker.next){
    							str +="<li><a href='"+(pagingMaker.endPage+1)+"'>▶</a></li>";
    						}
    						
    						$("#pgeNumList").html(str);
    					} //showPageNum()
    					
    					// 목록페이지 번호 변수 선언, 1로 초기화
    					var rePage = 1;
    					
    					//목록페이지 번호 클릭시 이벤트 발생
    					$("#pgeNumList").on("click", "a button", function(e) { // 페이지번호 클릭 시,
    					
    						e.preventDefault(); // <a> 태그의 화면전환이 일어나지 않도록 하는 역할을 하는 메소드
    						
    								// this는 페이지번호 
    						rePage = $(this).parent().attr("href");   // this는 버튼, this.parent()는 a 태그 
    						
    						getPgeNum(rePage); // 목록 페이지 호출
    						
    					});
    					
    					//댓글 쓴 뒤 수정버튼 클릭 시 모달창 뜨도록 ( + 해당 댓글의 댓글도 함께 나오도록)
    					$("#reply").on("click", ".reList button", function(){  // 댓글 옆에 수정버튼 클릭 시 모달 창
    						var li = $(this).parent(); /* li 선택 */
    						var csReplyNo = li.attr("data-csReplyNo"); /*data-rebno값 얻어오기*/
    					//	var csContent = li.text();
    						
    						//alert("댓글번호 : "+rebno+"  수정할 내용 : "+csContent);
    						$(".title-dialog").html(csReplyNo);
    					//	$("#csContent").val(csContent);
    					//	$("#modifyDiv").show("slow"); 
    						
    						/*지원추가*/
    					 	var userId = $(this).parent().find('h4').text();
    						var regDate = $(this).parent().find('p').text();
    						var csContent = $(this).prev().text();
    						
    						$('#userId').val(userId);
    						$('#regDate').val(regDate);
    						$('#csContent').val(csContent);
    						
    					}); 
    					
    					
    					//댓글 쓰기 처리
    					$("#submitBtn").on("click", function(){  // 댓글 작성 버튼 클릭 시
    					/*  $("선택자").val();   // 해당 선택자의 값을 가져옴
    						$("선택자").val("test"); // 해당 선택자의 값을 test로 변경
    					*/
    						var reWriter = $("#writer").val();
    						var csContent = $("#addcsContent").val();
    						console.log(reWriter);
    						$.ajax({
    							type : 'post',  // get / post방식같은 요청방식
    							url : '/csReplies',  // url은 controller의 @RequestMapping 경로
    							headers:{
    								"Content-Type" : "application/json",
    								"X-HTTP-Method-Override" : "POST"
    							},
    							
    							dataType : 'text',  // dataType는 받는 타입 (서버에서 보내줄 데이터 형식)
    							data :JSON.stringify({ // data는 보내는 타입(서버로 요청하는 데이터 방식)
    							csNo : csNo,  // 오른쪽 편에 있는게 위에서 받아온 데이터
    							 userId : reWriter,
    							 csContent : csContent
    							}),
    							
    							success : function(result){ // result는 서버로부터 받아온 데이터
    								if (result == 'Success'){
    									// alert("댓글 등록 성공!!!")
    									//reListAll(); // 전체리스트 출력
    									getPgeNum(1);  // 페이징처리된 리스트 출력
    									
    									$("#writer").val("");//val()=값을 가져오는것
    									$("#addcsContent").val("");
    									//userId.val("");  // val("")=""안에 값으로 변경
    									//userId.val(""); = $("#writer").val().val("");이니까 오류
    									//replyContent.val(""); // 댓글 내용 초기화
    								}
    							} 
    							
    						}); // ajax
    					}); // #submitBtn
    					
    					// 삭제 처리
    					$("#reDelBtn").on("click", function(){
    					
    					var csReplyNo = $(".title-dialog").html();
    					var csContent = $("#csContent").val();
    					
    						$.ajax({
    							type:'delete',
    							url:'/csReplies/'+csReplyNo,
    							headers :{
    								"Content-Type" : "application/json",
    								"X-HTTP-Method-Override" : "DELETE"
    							},
    							dataType: 'text',
    							success: function(result){
    								console.log("result:" + result);
    								if(result == 'Success'){
    									alert("댓글 삭제하였습니다.");
    									
    									location.reload();	
    									//$("#modifyDiv").hide("slow");  // Modal 닫기
    									$("#modifyDiv").modal('hide');  // Modal 닫기 (지원)
    									//reListAll(); // 댓글 목록 갱신
    									getPgeNum(1);
    								}
    							}
    						
    						});// ajax
    					}); // #reDelBtn
    					
    					// 수정 처리
    					$("#reModifyBtn").on("click", function(){
    						
    				 	var csReplyNo = $(".title-dialog").html();
    				 	var csContent = $(this).parents().find('#csContent').val();  // 댓글의 내용 가져오기
    					//console.log(csContent);
    						$.ajax({
    							type:'put',
    							url:'/csReplies/'+csReplyNo,
    							headers :{
    								"Content-Type" : "application/json",
    								"X-HTTP-Method-Override" : "PUT"				
    							},
    							data:JSON.stringify({csContent:csContent}),
    							dataType: 'text',
    							success: function(result){
    								console.log("result:" + result);
    								if(result == 'Success'){
    									alert("댓글을 수정했습니다.");
    									//$("#modifyDiv").hide("slow"); 
    									//$("#modifyDiv").modal('hide');  // Modal 닫기
    									
    									location.reload();		//reload!! 이런식으로 닫히고 새로고침 하게 정지원씨가 해주었음!!ㅋㅋㅋㅋㅋ
    									$(".modal-dialog").modal('hide');
    									//reListAll();  // 댓글 목록 갱신
    									getPgeNum(1);
    								}
    							}
    						
    						});// ajax 
    					}); // #reModifyBtn
    				}); // document ready function
                  	</script>
</html>                  	