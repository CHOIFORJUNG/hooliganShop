<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<!-- main -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 게시글 수정
		</h3>

		<!-- role 속성:
			. HTML5에서 새롭게 추가된 속성
			. ARIA(Accessible Rich Internet Application)라는 HTML5의 상세 규격 중 하나
			. 시각 장애인이 컴퓨터의 리더기를 사용해서 웹 페이지를 읽을 때 "해당 부분이 form이다" 라고 정의해주는 것
			. role은 필수적인 요소는 아니지만 화면용 리더기를 이용해야하는 사람들에게도
			  불편함이 없는 사이트를 제공하고자 하는 경우에 이 속성을 이용함.
		  -->

		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<form role = "form" class="form-horizontal style-form" method="post">
						<input type="hidden" name="page" value="${pCri.page}"/>
						<input type="hidden" name="numPerPage" value="${pCri.numPerPage}"/>
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 수정내용
						</h4>
						
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">글번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="bno"
									value="${boardVO.bno}" readonly="readonly">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="title"
									value="${boardVO.title}">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="content" rows="4">${boardVO.content}</textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">작성자</label>
							<div class="col-sm-10">
								<input type="text" name="userId" class="form-control"
									value="${boardVO.userId}">
							</div>
						</div>

					</form>
				</div>
				<!-- form-panel-->

				<div class="form-group">
					<div class="col-sm-12" align="center">
						<button type="submit" id="btn_save" class="btn btn-primary">저장하기</button>&nbsp;
						<button type="submit" id="btn_cancel" class="btn btn-warning">취소하기</button>
					</div>
				</div>

			<script>
				$(document).ready(function() {
					var frmObj = $("form[role='form']");
					 
					console.log("폼태그입니다..");
					
					//수정처리 페이지로 이동
					$("#btn_save").on("click", function(){
						frmObj.attr("action","/board/modifyPage");
						mObj.submit();
					});
					
					//$("#btn_cancel").on("click", function(){
					$(".btn-warning").on("click", function(){
						/* self.location="/bbs/list"; */
						self.location="/board/pageList?page=${pCri.page}&numPerPage=${pCri.numPerPage}";
					})
					
					
				});
				
			</script>


			</div>
			<!-- col-lg-12-->
		</div>
		<!-- /row -->
	</section>
	<!--/wrapper -->
</section>
<!-- /MAIN CONTENT -->

<%@include file="../include/footer.jsp"%>