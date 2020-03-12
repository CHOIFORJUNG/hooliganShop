<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>



<!-- *****************************************************************************************************************
	 CONTACT FORMS
	 ***************************************************************************************************************** -->

  <div class="container mtb">
    <div class="row">
      <div class="col-lg-12">
        <h4>문의하실 내용을 적어주세요!</h4>
        <div class="hline"></div>
        <form class="form-horizontal style-form" method="post" enctype="multipart/form-data">
                          	<input type="hidden" name="userId" value="${sessionScope.loginUser.userId }" />
            <div class="form-group">
              <input type="text" name="userId" class="form-control" id="contact-name" value="${sessionScope.loginUser.userId }" disabled /><!-- data-rule="minlen:4" data-msg="Please enter at least 4 chars" --> 
              <div class="validate"></div>
            </div>
            <div class="form-group">
              <input type="text" name="csTitle" class="form-control" id="contact-subject" placeholder="제목" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>

            <div class="form-group">
              <textarea class="form-control" name="csContent" id="contact-message" placeholder="내용" rows="5"></textarea> <!-- data-rule="required" data-msg="Please write something for us" -->
              <div class="validate"></div>
            </div>
            <!-- 파일첨부 -->
            <div class="form-group">
			 <label for="gdsImg">&nbsp;&nbsp;&nbsp;&nbsp;이미지</label>	
			 <input type="file" id="csThumbImg" name="file" />
			 <div class="select_img" style="margin: 20px 0;"><img src="" /></div>
			 
			 <script>
			  $("#csThumbImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
			 </script>
           	
            </div>
            
                          
                          
                          <div class="form-group">
                             <div class="col-sm-12" align="center">
                                <button type="submit" class="btn btn-theme">등록하기</button>
                             </div>
                          </div>
                      </form>
        
        
        
        
        
        
        
        <form role='form' class="contact-form php-mail-form" method="POST" action="/cs/insert" enctype="multipart/form-data">
			<input type="hidden" name="userId" value="${sessionScope.loginUser.userId }" />
            <div class="form-group">
              <input type="text" name="userId" class="form-control" id="contact-name" value="${sessionScope.loginUser.userId }" disabled /><!-- data-rule="minlen:4" data-msg="Please enter at least 4 chars" --> 
              <div class="validate"></div>
            </div>
            <div class="form-group">
              <input type="text" name="csTitle" class="form-control" id="contact-subject" placeholder="제목" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>

            <div class="form-group">
              <textarea class="form-control" name="csContent" id="contact-message" placeholder="내용" rows="5"></textarea> <!-- data-rule="required" data-msg="Please write something for us" -->
              <div class="validate"></div>
            </div>
            <!-- 파일첨부 -->
            <div class="form-group">
			 <label for="gdsImg">&nbsp;&nbsp;&nbsp;&nbsp;이미지</label>	
			 <input type="file" id="csThumbImg" name="file" />
			 <div class="select_img" style="margin: 20px 0;"><img src="" /></div>
			 
			 <script>
			  $("#csThumbImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
			 </script>
           	
            </div>
            

            <div class="form-send">
              <button type="submit" class="btn btn-large">등록하기</button>
            </div>

          </form>
      </div>
    </div>
  </div>


<script>


</script>

<%@ include file="../include/footer.jsp" %>