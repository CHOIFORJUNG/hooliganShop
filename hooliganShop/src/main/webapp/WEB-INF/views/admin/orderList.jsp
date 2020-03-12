<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>
<head>
<style>
/*
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
       text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
</head>
<div id="menu">
<%@ include file="../include/aside.jsp" %>
</div>


<div class="container mtb">
		<div class="row">
			<div class="col-lg-12" style="width: 100%; text-align: center;">

				<div class="hline"></div>

				<div id="container_box" style="display: inline-block; width: 400px;">
					<h2>상품목록</h2><br/>
					
<ul class="orderList" style="list-style:none;">
 <c:forEach items="${orderList}" var="orderList">
 <li>
 <div>
  <p style="text-align:left;"><span>주문번호</span><a href="/admin/orderView?n=${orderList.orderNo}">${orderList.orderNo}</a></p>
  <p style="text-align:left;"><span>주문날짜 <fmt:formatDate value="${orderList.orderDate}" pattern="yyyy.MM.dd:HH.mm"/></span></p>
  <p style="text-align:left;"><span>주문자</span>${orderList.userId}</p>
  <p style="text-align:left;"><span>수령인</span>${orderList.userName}</p>
  <p style="text-align:left;"><span>주소</span>(${orderList.userAdd1}) ${orderList.userAdd2} ${orderList.userAdd3}</p>
  <p style="text-align:left;"><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.orderAmount}" /> 원</p>
  <p style="text-align:left;"><span>상태</span>${orderList.delivery}</p> 
 </div>
 </li>
 </c:forEach>
</ul>

				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>