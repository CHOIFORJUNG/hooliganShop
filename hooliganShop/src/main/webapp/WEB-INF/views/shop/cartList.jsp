<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>

<head>
<style>
 /*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 */
 section#content ul li { margin:10px 0; }
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:250px; }
 section#content div.gdsInfo { float:right; width:calc(100% - 270px); }
 section#content div.gdsInfo { font-size:20px; line-height:2; }
 section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.gdsInfo .delete { text-align:right; }
 section#content div.gdsInfo .delete button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }

.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }

.orderInfo { border:5px solid #eee; padding:20px; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;} 
</style>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

</head>

<section id="content">


 <!-- 올체크 박스 -->
<ul>
 <li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
   <script>
	$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	 } else {
	  $(".chBox").prop("checked", false);
	 }
	});
	</script> 
  </div>
  
  
  
  
  <!-- 선택삭제 -->
  <div class="delBtn">
   <button type="button" class="selectDelete_btn">선택 삭제</button>
   <script>
	 $(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("data-cartNum"));
	   });
	    
	   $.ajax({
		   url : "/shop/deleteCart",
		   type : "post",
		   data : { chbox : checkArr },
		   success : function(result){
		    if(result == 1) {          
		     location.href = "/shop/cartList";
		    } else {
		     alert("삭제 실패");
		    }
		   }
		  });
	  } 
	 });
	</script> 
  </div>
  
  
  
  <!-- 카트리스트  -->
 </li>

<c:set var="sum" value="0" />

 <c:forEach items="${cartList}" var="cartList">
 <li>
  <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNo}" />
   <script>
	 $(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
	 });
	</script>
  </div>
 
  <div class="thumb">
   <img src="${cartList.productThumbImg}" />
  </div>
  <div class="gdsInfo">
   <p>
    <span>상품명</span>${cartList.productName}<br />
    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.productPrice}" /> 원<br />
    <span>구입 수량</span>${cartList.cartStock} 개<br />
    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.productPrice * cartList.cartStock}" /> 원
   </p>
   
   
   
   
   <!-- 삭제버튼의 삭제-->
   <div class="delete">
    <button type="button" class="delete_${cartList.cartNo}_btn" data-cartNo="${cartList.cartNo}">삭제</button>
	<script>
	 $(".delete_${cartList.cartNo}_btn").click(function(){
	  var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   checkArr.push($(this).attr("data-cartNo"));
	              
	   $.ajax({
	    url : "/shop/deleteCart",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
	     if(result == 1) {            
	      location.href = "/shop/cartList";
	     } else {
	      alert("삭제 실패");
	     }
	    }
	   });
	  } 
	 });
	</script>
   </div>
  </div>   
 </li>
 
 <c:set var="sum" value="${sum + (cartList.productPrice * cartList.cartStock)}" />
 
 </c:forEach>
</ul>

	<!-- 총합계  -->
	<div class="listResult">
	 <div class="sum">
	  총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
	 </div>
	 <div class="orderOpne">
	  <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
	  <script>
		 $(".orderOpne_bnt").click(function(){
		  $(".orderInfo").slideDown();
		  $(".orderOpne_bnt").slideUp();
		 });      
		</script>
	 </div>
	</div>
	
	<!-- 주문정보 -->
	<div class="orderInfo" style="display:none;">	<!-- name값은 controller로 넘기는데 굳이 화면에 나타낼 필요 없는 값은 hidden으로 숨겨준다 -->
	 <form role="form" method="post" autocomplete="off">
	  <input type="hidden" name="orderAmount" value="${sum}" />
      <c:if test='${sessionScope.loginUser != null }'>
	  <div class="inputArea">
	   <label for="">수령인</label>
	   <input type="text" name="userName" id="userName"  value="${sessionScope.loginUser.userName }" />
	  </div>
	  <div class="inputArea">
	   <label for="">수령인 연락처</label>
	   <input type="text" name="userPhone" id="userPhone" value="${sessionScope.loginUser.userPhone }" />
	  </div>
	  <div class="inputArea">
	   <label for="userAdd1">우편번호</label>
	   <input type="text" name="userAdd1" id="userAdd1" value="${sessionScope.loginUser.userAdd1 }" />
	  </div>
	  <div class="inputArea">
	   <label for="userAdd2">1차 주소</label>
	   <input type="text" name="userAdd2" id="userAdd2" value="${sessionScope.loginUser.userAdd2 }" />
	  </div>
	  <div class="inputArea">
	   <label for="userAdd3">2차 주소</label>
	   <input type="text" name="userAdd3" id="userAdd3" value="${sessionScope.loginUser.userAdd3 }" />
	  </div>
	  
	   </c:if>
	  <div class="inputArea">
	   <button type="submit" class="order_btn">주문</button>
	   <button type="button" class="cancel_btn">취소</button>
	   	<script>
		$(".cancel_btn").click(function(){
		 $(".orderInfo").slideUp();
		 $(".orderOpne_bnt").slideDown();
		});      
		</script>	   
	  </div>
	  
	 </form> 
	</div>
</section>



<%@ include file="../include/footer.jsp" %>
<script>
	var list = '${shopList}';
	console.log(list);
</script>

</html>