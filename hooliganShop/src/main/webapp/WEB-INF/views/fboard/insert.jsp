<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="../include/header.jsp"%>

   <!-- main -->
   < <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
             <h3><i class="fa fa-angle-right"></i>글쓰기 페이지</h3>
             
             <!-- BASIC FORM ELELEMNTS -->
             <div class="row mt">
                <div class="col-lg-12">
                  <div class="form-panel">
                       <h4 class="mb"><i class="fa fa-angle-right"></i>입력 사항</h4>
                      <form class="form-horizontal style-form" method="post" enctype="multipart/form-data">
                          	<input type="hidden" name="userId" value="${sessionScope.loginUser.userId }"/>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title" required>  <!-- name="컬럼명" 잘 맞춰 써줄 것!-->
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                 <textarea class="form-control" name="content" rows="4" required></textarea>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                          
                              <div class="col-sm-10">
       					<c:if test="${sessionScope.loginUser != null}">
                                  <input type="text" name="userId" class="form-control" value="<c:out value='${sessionScope.loginUser.userId }' />" disabled />
                         </c:if> 
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">이미지</label>
                              <div class="col-sm-10">
                                  <input type="file" name="file" id="boardImg" class="form-control">
                              	  <div class="select_img" style="margin: 20px 0;"><img src="" /></div>
                              	  <script>
								  $("#boardImg").change(function(){
									   if(this.files && this.files[0]) {
									   		var reader = new FileReader;
									    	reader.onload = function(data) {
									     	$(".select_img img").attr("src", data.target.result).width(500); //attr""에 넣어줄 , ~값       
									    }
									    reader.readAsDataURL(this.files[0]);
									   }
								  });  // #boardImg
								 </script>
                              <%=request.getRealPath("/") %> 
                              </div>
                              
                          </div>
                          
                          
                          
                          <div class="form-group">
                             <div class="col-sm-12" align="center">
                                <button type="submit" class="btn btn-theme">등록하기</button>
                             </div>
                          </div>
                      </form>
                  </div>
                </div><!-- col-lg-12-->         
             </div><!-- /row -->
             
      </section><!-- /wrapper -->
      </section><!-- /MAIN CONTENT -->
      <!--main content end-->
   
<%@ include file="../include/footer.jsp"%>