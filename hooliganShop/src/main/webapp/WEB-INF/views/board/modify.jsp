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

		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<form  role="form" class="form-horizontal style-form" method="post">
					
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 수정내용
						</h4>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">글번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="bno" value="${boardVO.bno}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="title" value="${boardVO.title}">
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
								<input type="text" name="userId" class="form-control" value="${boardVO.userId}">
							</div>
						</div>

					</form>
				</div>
				<!-- form-panel-->

				<div class="form-group">
					<div class="col-sm-12" align="center">
						<button type="submit" id="btn_save" class="btn btn-primary">저장하기</button>&nbsp;
						<button type="submit" id="btn_cancel" class="btn btn-warning">취소하기</button>&nbsp;
					</div>
				</div>

			</div>
			<!-- col-lg-12-->
		</div>
		<!-- /row -->
	</section>
	<! --/wrapper -->
</section>
<!-- /MAIN CONTENT -->
<%@include file="../include/footer.jsp"%>

<script>
	// $는 jQuery의 의미
	$(document).ready(function(){
		
		var frmObj = $("form[role='form']");
		console.log("form태그입니다...");  /* 게시글 하나 선택하면 해당 로그 찍힘 */
		
		$('#btn_save').on("click", function() {
			frmObj.submit();  // 수정하기 클릭 하면, controller에 가서 /modify로  감 (post방식)
		});
		
		$("#btn_cancel").on("click", function() {
			self.location="/board/list";  // 취소하기 누르면 다시 리스트 페이지로 (http://localhost:8080/bbs/list)
		});
		
	});
</script>