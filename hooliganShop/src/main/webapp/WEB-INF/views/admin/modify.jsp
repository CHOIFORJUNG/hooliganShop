<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>



<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

<input type="hidden" name="productNo" value="${product.productNo}" />

<div class="inputArea"> 
 <label>1차 분류</label>
 <select class="category1">
  <option value="">전체</option>
  
 </select>   
 <label>2차 분류</label>
 <select class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
 
</div>
<div class="inputArea">
 <label for="productName">상품명</label>
 <input type="text" id="productName" name="productName" value="${product.productName}"/>
</div>
<div class="inputArea">
 <label for="productPrice">상품가격</label>
 <input type="text" id="productPrice" name="productPrice" value="${product.productPrice}"/>
</div>
<div class="inputArea">
 <label for="productStock">상품수량</label>
 <input type="text" id="productStock" name="productStock" value="${product.productStock}"/>
</div>
<div class="inputArea">
 <label for="productDetails">상품소개</label>
 <textarea rows="5" cols="50" id="productDetails" name="productDetails">${product.productDetails}</textarea>
</div>

<div class="inputArea">
 <label for="productImg">이미지</label>
 <input type="file" id="productImg" name="file" />
 <div class="select_img">
  <img  class="img-responsive" src="${product.productImg}" style="width: 500px;" />
  <input type="hidden" name="productImg" value="${product.productImg}" />
 </div>
 
 <script>
  $("#productImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <%=request.getRealPath("/") %>
</div>

<%--  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">이미지</label>
                              <div class="col-sm-10">
                              <img class="img-responsive" src="${product.productImg }" alt=""
					style="height: 400px; width: 400px; margin-right: 0; margin-left: 100px;" />
                                  <input type="file" name="file" id="productImg" class="form-control">
                              	  <div class="select_img" style="margin: 20px 0;"><img src="" /></div>
                              	  <script>
								  $("#productImg").change(function(){
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
 --%>
<div class="inputArea">
	 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
	 <button type="button" id="back_Btn" class="btn btn-warning">취소</button>
	 
	<script>
	 $("#back_Btn").click(function(){
	  //history.back();
	  location.href = "/admin/view?n=" + ${product.productNo};
	 });
	 
	 
	 var select_cateCode = '${product.cateCode}';
	 var select_cateCodeRef = '${product.cateCodeRef}';
	 var select_cateName = '${product.cateName}';

	 if(select_cateCodeRef != null && select_cateCodeRef != '') {
	  $(".category1").val(select_cateCodeRef);
	  $(".category2").val(select_cateCode);
	  $(".category2").children().remove();
	  $(".category2").append("<option value='"
	        + select_cateCode + "'>" + select_cateName + "</option>");
	 } else {
	  $(".category1").val(select_cateCode);
	  //$(".category2").val(select_cateCode);
	  // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
	  $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
	 }
	</script> 
</div>   
</form>

<%@ include file="../include/footer.jsp" %>