<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/aside.jsp" %>

<style>
.select_img img { margin:20px 0; }
</style>

<!-- *****************************************************************************************************************
	 CONTACT FORMS
	 ***************************************************************************************************************** -->
<div id="menu">

</div> 
  <div class="container mtb">
    <div class="row">
      <div class="col-lg-12">
        <h5>상품등록</h5>

        <div class="hline"></div>
        <form class="form-horizontal style-form" method="post" enctype="multipart/form-data">
                           
             <label>1차 분류</label>
			 <select class="category1">
			  <option value="">전체</option>
			 </select>
			 
			 <label>2차 분류</label>
			 <select class="category2" name="cateCode">
			  <option value="">전체</option>
			 </select>
			            
            <div class="form-group">
              <input type="text" name="productName" class="form-control" id="productName" placeholder="상품이름" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>
			
<!-- 			<div class="form-group">
              <input type="text" name="cateCode" class="form-control" id="cateCode" placeholder="상품코드" />data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject"
              <div class="validate"></div>
            </div> -->
			
			<div class="form-group">
              <input type="text" name="productStock" class="form-control" id="productStock" placeholder="상품재고" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>
			
			<div class="form-group">
              <input type="text" name="productPrice" class="form-control" id="productPrice" placeholder="상품가격" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>
			
			<div class="form-group">
              <input type="text" name="productDetails" class="form-control" id="productDetails" placeholder="상세설명" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>
			
			
			
            <div class="form-group">
              <textarea class="form-control" name="productSize" id="productSize" placeholder="사이즈" rows="5"></textarea> <!-- data-rule="required" data-msg="Please write something for us" -->
              <div class="validate"></div>
            </div>
            
            
			<div class="form-group">
              <input type="text" name="productCorp" class="form-control" id="productCorp" placeholder="회사이름" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>

           <div class="form-group">
               <label class="col-sm-2 col-sm-2 control-label">이미지</label>
               <div class="col-sm-10">
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

            <div class="form-send">
              <button type="submit" class="btn btn-large">등록</button>
            </div>
                      </form>
      </div>
    </div>
  </div>
<script>
	//컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	//1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	
		if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
		}
	}
	
	//1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	
	for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	   + cate1Arr[i].cateName + "</option>"); 
	}
	
	$(document).on("change", "select.category1", function(){

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cateCode = jsonData[i].cateCode;
		   cate2Obj.cateName = jsonData[i].cateName;
		   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
		   
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");
		 
		 
		 for(var i = 0; i < cate2Arr.length; i++) {
		   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		        + cate2Arr[i].cateName + "</option>");
		 }
		 
		 
		 cate2Select.children().remove();
		 

		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();  
		  cate2Select.append("<option value=''>전체</option>");
		  
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectVal == cate2Arr[i].cateCodeRef) {
		    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		         + cate2Arr[i].cateName + "</option>");
		   }
		  }
		  
		 });
		 
		});

</script>

<!-- <script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$('.btn').on("click", function() {
		alert('상품등록 완료!');
		formObj.attr("action", "/admin/register");
		formObj.attr("method", "post");
		formObj.submit();
	});
	
}); // document
</script>
 -->
<%@ include file="../include/footer.jsp" %>