<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<head>
	<style>
		div{float:center;}
		/*
		 section#content ul li { display:inline-block; margin:10px; }
		 section#content div.goodsThumb img { width:200px; height:200px; }
		 section#content div.goodsName { padding:10px 0; text-align:center; }
		 section#content div.goodsName a { color:#000; }
		*/
		 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
		 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
	</style>
</head>
	<section id="content">
 
		 <ul class="orderList">
			  <c:forEach items="${orderList}" var="orderList">
				  <li>
					  <div>
					   <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderNo}">${orderList.orderNo}</a></p>
					   <p><span>주문날짜</span>
					   <fmt:formatDate value="${orderList.orderDate}" pattern="yyyy.MM.dd:HH.mm"/></p>
					   <p><span>수령인</span>${orderList.userName}</p>
					   <p><span>주소</span>(${orderList.userAdd1}) ${orderList.userAdd2} ${orderList.userAdd3}</p>
					   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.orderAmount}" /> 원</p>
					   <p><span>배송상태</span>${orderList.delivery}</p>
					  </div>
				  </li>
			  </c:forEach>
		 </ul>
		
	</section>

<%@ include file="../include/footer.jsp" %>
<script>
	var list = '${shopList}';
	console.log(list);
</script>

</html>