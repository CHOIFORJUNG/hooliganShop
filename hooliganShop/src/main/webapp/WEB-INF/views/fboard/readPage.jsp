<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<%@page import="com.spring.vo.UserVO"%>
<style>
.oriImg {
	width: 500px;
	height: auto;
}

.thumbImg {
	
}
</style>
<!-- main -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">

		<!--"hidden"이 적용된 bid,page,numPerPage값은 같이 넘겨주게된다   -->
		<form role="form" method="post">
			<input type="hidden" name="bno" value="${boardVO.bno}" /> <input
				type="hidden" name="page" value="${fCri.page}" /> <input
				type="hidden" name="numPerPage" value="${fCri.numPerPage}" /> <input
				type="hidden" name="findType" value="${fCri.findType}" /> <input
				type="hidden" name="keyword" value="${fCri.keyword}" />
		</form>


		<section id="main-content">
			<section class="wrapper">


				<div class="row mt">
					<div class="col-lg-10" style="text-align: center; width: 100%">
						<div class="form-panel"
							style="display: inline-block; width: 100%;">
							<form class="form-horizontal style-form" method="post">
								<!--post방식의 controller로 이동!!  -->
								<div align="center">
									<h4 class="mb">
										<i class="fa fa-angle-right"></i>이곳은 해외축구 이야기를 나누는 곳입니다!
									</h4>
								</div>
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">제목</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="title"
											value="${boardVO.title}" readonly="readonly">
										<!-- name="컬럼명" 잘 맞춰 써줄 것!-->
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">내용</label>
									<div class="col-sm-8">
										<textarea class="form-control" name="content" rows="7"
											readonly="readonly">${boardVO.content}</textarea>
									</div>
								</div>
								<c:if test="${boardVO.boardImg != null}">
									<div class="form-group">
										<img src="${boardVO.boardImg}" class="oriImg" />
										<%--  
								 <p>썸네일</p>
								 <img src="${boardVO.boardThumbImg}" class="thumbImg"/> --%>
									</div>
								</c:if>
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">작성자</label>
									<div class="col-sm-8">
										<input type="text" name="userId" class="form-control"
											readonly="readonly" value="${boardVO.userId}">
									</div>
								</div>
						</div>
						</form>
					</div>
					<!-- form-pannel -->
					<div class="form-group">
						<div class="col-sm-12" align="center">
							<c:if
								test="${sessionScope.loginUser != null && sessionScope.loginUser.userId == boardVO.userId}">
								<button type="submit" class="btn btn-primary">수정하기</button>&nbsp;
				                <button type="submit" class="btn btn-danger">삭제하기</button>&nbsp;
        						</c:if>
							<button type="submit" class
							="btn btn-info">목록으로</button>
						</div>
					</div>

				</div>
				<!-- col-lg-12-->
				</div>
			</section>
		</section>
		<!-- 모달창 수정 전-->
		<!-- <div id = "modifyDiv" style="" class="modal-fade">
			<span class='title-dialog'></span>번 댓글
			<div>		
				<input type="text" id="reContent" size="60">
			</div>
			
			<div align="center">
				 <button type="button" id="reModifyBtn">수정</button>
				 <button type="button" id="reDelBtn">삭제</button>
				 <button type="button" id="closeBtn">닫기</button>
			</div> 
		</div>   -->
		<!-- 댓글 모달창 수정 후 -->

		<div class="modal fade" id="modifyDiv">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">
							<span class='title-dialog'></span>번 댓글 편집창
						</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!--   Modal body -->
					<div class="modal-body">
						사용자: <input class="form-control" type="text" id="userId" size="8" readonly="readonly">
					</div>
					<div class="modal-body">
						날짜: <input class="form-control" type="text" id="regDate" size="15" readonly="readonly">
					</div>
					<div class="modal-body">
						내용: <input class="form-control" type="text" id="replyContent" size="60" name="replyContent">
					</div>
					<div align="center">
						<button type="button"  class="btn btn-info" id="reModifyBtn">수정</button>
						<button type="button"  class="btn btn-danger" id="reDelBtn">삭제</button>
					</div>
					<!--    Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
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
							style="display: inline-block; width: 60%; margin-left: 260px;">
							<h4>댓글목록</h4>
							<!-- 댓글목록 -->
							<ul id="reply" style="list-style:none;">
							</ul>

							<!-- 댓글 버튼들 존재 -->
							<ul class="pagination" id="pgeNumList">
								<!-- 1,2,3,4,5,6,7 버튼 생김 -->
							</ul>
								<h4>댓글쓰기</h4>
       	<c:if test="${sessionScope.loginUser != null }">

							<!-- 댓글입력창 -->
							<div class="forreplyinput">
								<div>
									<c:if test="${sessionScope.loginUser != null}">
										<input class="form-control" type="text" name="userId"
											id="writer" placeholder="Your Name"
											value="<c:out value='${sessionScope.loginUser.userId }' />"
											disabled />
									</c:if>
								</div>
								<div>
									<textarea class="form-control" name="replyContent"
										id="addReContent" placeholder="Your Message" rows="5"
										data-rule="required" data-msg="Please write something for us"></textarea>
									<div class="validate"></div>
								</div>
								<div class="loading"></div>
								<div class="error-message"></div>

								<div class="form-send" style="margin-top:10px">
									<button id="submitBtn" class="btn btn-large">댓글작성</button>
								</div>
							</div>
				</c:if>
				
												<c:if test="${sessionScope.loginUser == null}">
								<li><a href="/member/login" class="btn btn-info"
									role="button">로그인하러 가기</a></li>
								</c:if>	
							</form>
						</div>
					</div>
					<!-- row -->
				</div>
				<!-- col-lg-8 -->

			</section>
			<!--/wrapper -->
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
            				frmObj.attr("action", "/fboard/modifyPage");
            				frmObj.submit();
            			});
	
            			$(".btn-danger").on("click", function(){
            				frmObj.attr("action", "/fboard/delPage");
            				frmObj.submit();
            			});
            			
            			$(".btn-info").on("click", function(){
            				/* self.location = "/bbs/list"; */
            				frmObj.attr("method", "get");
            				frmObj.attr("action", "/fboard/list");
            				frmObj.submit();
            			});
            			
            			
            			
            			
            			
            			/* 댓글에 대한 jQuery */
            			
            			var bno = '${boardVO.bno}';
            			
            			getPgeNum(1);
            			
            			
            			
            			//댓글 페이징 처리
            			function getPgeNum(page){
            				$.getJSON("/replies/"+bno+"/"+page, function(data){ // data는 json형태의 data
            					
            					console.log(data.reList.length);
            					console.log(data);
            					
            					var str="";
            					
            					$(data.reList).each(function(){
            						var userId = "'" + this.userId + "'";
            						console.log("userId!!: " + userId);
									/*             			 			str +='<div class="row mt">'
            							+ 	'<div class="col-lg-8" style="text-align: center; width: 100%">'
            							+		'<div class="content-panel" style="display: inline-block; width: 1000px;">'
            							+			'<section id="unseen">'
            							+				'<table class="table table-bordered table-striped table-condensed">'
            							+					'<thead>'
            							+						'<tr>'
            							+							'<th style="width: 170px; text-align: center;">'+ this.userId + '</th>'
            							+							'<th style="width: 170px; text-align: center;">'+ this.regDate + '</th>'
            							+							'<th style="text-align: center;">'+ this.replyContent
            							+								'&nbsp;&nbsp;&nbsp;<c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.userId.equals('amourjun')}"><button type="button" class="btn btn-primary" data-toggle="modal" id="modifyRepBtn" data-target="#modifyDiv">수정</button></c:if>'
            							+							'</th>'
            							+						'</tr>'
            							+					'</thead>'
            							+				'</table>'
            							+			'</section>'
            							+		'</div>'
            							+	'</div>'
            							+'</div>'; */
    								str +="<li data-rebno='"+ this.rebno +"' class='reList' style='text-align:left;'>"
									+"<h4>"+ this.userId + "</h4>"
									+"<p>"+ this.regDate +"</p>"
									+"<blockquote>"+ this.replyContent +"</blockquote>"
									+ "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#modifyDiv'>수정</button>"
									+"</li>"
									+"<hr/>";
							});            					
            					
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
            			
    					$("#reply").on("click", ".reList button", function(){  // 댓글 옆에 수정버튼 클릭 시 모달 창
    						var li = $(this).parent(); /* li 선택 */
    						var rebno = li.attr("data-rebno"); /*data-rebno값 얻어오기*/
    					//	var csContent = li.text();
    						
    						//alert("댓글번호 : "+rebno+"  수정할 내용 : "+csContent);
    						$(".title-dialog").html(rebno);
    					//	$("#csContent").val(csContent);
    					//	$("#modifyDiv").show("slow"); 
    						
    						/*지원추가*/
    					 	var userId = $(this).parent().find('h4').text();
    						var regDate = $(this).parent().find('p').text();
    						var replyContent = $(this).prev().text();
    						
    						$('#userId').val(userId);
    						$('#regDate').val(regDate);
    						$('#replyContent').val(replyContent);
    						
    					}); 
    					
            			
            			//댓글 쓰기 처리
            			$("#submitBtn").on("click", function(){  // 댓글 작성 버튼 클릭 시
            			/*  $("선택자").val();   // 해당 선택자의 값을 가져옴
            				$("선택자").val("test"); // 해당 선택자의 값을 test로 변경
            			*/
            				var reWriter = $("#writer").val();
            				var reContent = $("#addReContent").val();
            				
            				$.ajax({
            					type : 'post',  // get / post방식같은 요청방식
            					url : '/replies',  // url은 controller의 @RequestMapping 경로
            					headers:{
            						"Content-Type" : "application/json",
            						"X-HTTP-Method-Override" : "POST"
            					},
            					
            					dataType : 'text',  // dataType는 받는 타입 (서버에서 보내줄 데이터 형식)
            					data :JSON.stringify({ // data는 보내는 타입(서버로 요청하는 데이터 방식)
            					bno : bno,  // 오른쪽 편에 있는게 위에서 받아온 데이터
            					 userId : reWriter,
            					 replyContent : reContent
            					}),
            					
            					success : function(result){ // result는 서버로부터 받아온 데이터
            						if (result == 'Success'){
            							// alert("댓글 등록 성공!!!")
            							//reListAll(); // 전체리스트 출력
            							getPgeNum(1);  // 페이징처리된 리스트 출력
            							
            							$("#writer").val("");//val()=값을 가져오는것
            							$("#addReContent").val("");
            							//userId.val("");  // val("")=""안에 값으로 변경
            							//userId.val(""); = $("#writer").val().val("");이니까 오류
            							//replyContent.val(""); // 댓글 내용 초기화
            						}
            					} 
            					
            				}); // ajax
            			}); // #submitBtn
            			
            			// 삭제 처리
            			$("#reDelBtn").on("click", function(){
            			
            			var rebno = $(".title-dialog").html();
            			var reContent = $("#reContent").val();
            			
            				$.ajax({
            					type:'delete',
            					url:'/replies/'+rebno,
            					headers :{
            						"Content-Type" : "application/json",
            						"X-HTTP-Method-Override" : "DELETE"
            					},
            					dataType: 'text',
            					success: function(result){
            						console.log("result:" + result);
            						if(result == 'Success'){
            							alert("삭제 성공!!!");
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
            				
            		 	var rebno = $(".title-dialog").html();
            		 	var reContent = $(this).parents().find('#replyContent').val();  // 댓글의 내용 가져오기
            			//console.log(reContent);
            				$.ajax({
            					type:'put',
            					url:'/replies/'+rebno,
            					headers :{
            						"Content-Type" : "application/json",
            						"X-HTTP-Method-Override" : "PUT"				
            					},
            					data:JSON.stringify({replyContent:reContent}),
            					dataType: 'text',
            					success: function(result){
            						console.log("result:" + result);
            						if(result == 'Success'){
            							alert("수정 성공!!!");
            							//$("#modifyDiv").hide("slow"); 
            							$("#modifyDiv").modal('hide');  // Modal 닫기
            							//reListAll();  // 댓글 목록 갱신
            							getPgeNum(1);
            						}
            					}
            				
            				});// ajax 
            			}); // #reModifyBtn
            			
            		});
            	</script>