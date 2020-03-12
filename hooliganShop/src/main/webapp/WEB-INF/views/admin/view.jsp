<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>



  <div class="container mtb">
    <div class="row">
      <div class="col-lg-12">
        <h5>상품등록</h5>

        <div class="hline"></div>
        <form role="form" method="post" autocomplete="off">
		<input type="hidden" name="n" value="${product.productNo}" />
		<div class="inputArea">
			<label>1차분류</label>
			<span class="category1"></span>
			<label>2차분류</label>
			<span class="category2">${product.cateCode} </span>
		</div>            

		<div class="inputArea">
			<label for="productName">상품명</label>
			<span>${product.productName}</span>
		</div>
		
		<div class="inputArea">
			<label for="productPrice">상품가격</label>
			<span><fmt:formatNumber value="${product.productPrice}" pattern="###,###,###"/></span>
		</div>
		
		<div class="inputArea">
			<label for="productStock">상품수량</label>
			<span>${product.productStock}</span>
		</div>
		
		<div class="inputArea">
			<label for="productDetails">상품상세</label>
			<span>${product.productDetails}</span>
		</div>
		<div class="productImg">
				<img class="img-responsive" src="${product.productImg }" alt=""
					style="height: 400px; width: 400px; margin-right: 0; margin-left: 100px;" />
	    </div>
			
		<div class="inputArea">
			<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
			<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
			 <script>
			  var formObj = $("form[role='form']");
			  
			  $("#modify_Btn").click(function(){
			   formObj.attr("action", "/admin/modify");
			   formObj.attr("method", "get")
			   formObj.submit();
			  });
			  
			  $("#delete_Btn").click(function(){
				  
				  var con = confirm("정말 삭제하겠습니까?");
			   formObj.attr("action", "/admin/delete");
			   formObj.submit();
			  
			  });
			 </script>			
		</div>
        </form>
      </div>
    </div>
  </div>


<%@ include file="../include/footer.jsp" %>