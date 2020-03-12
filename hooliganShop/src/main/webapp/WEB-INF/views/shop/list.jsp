<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<head>
	<style>
		div{float:center;}
	</style>
</head>

	<section id="container">
	  <div class="container mtb">
    <div class="row centered">
      <h3 class="mb">${cateName}</h3>


<c:forEach items="${shopList}" var="shopList">  
      <div class="col-lg-3 col-md-3 col-sm-3" style="margin: 0px;">
			<ul>
        <div class="he-wrap tpl6">
          <a href="/shop/view?n=${shopList.productNo}">
          <img src="<c:url value="${shopList.productImg }" />" style="width: 260px; height:200px;"/>
          <div class="he-view">
            <div class="bg a0" data-animate="fadeIn">
              <h3 class="a1" data-animate="fadeInDown">상세 보기</h3>
            </div>
            <!-- he bg -->
          </div>
          <!-- he view -->
        </div>
        <!-- he wrap -->
        <h4>${shopList.productName}</h4>
        </a>
        <h5 class="ctitle">${shopList.productPrice}원</h5>
        <div class="hline"></div>
        </ul>
      </div>
 </c:forEach>
    </div>
  </div>
  
<%--  		<div id="container_box">
			<section id="content">
			<ul>
			 <c:forEach items="${shopList}" var="shopList">
			 <li>
			  	<div class="productThumb">
			   	<img src="<c:url value="/resources/myImg/messi2.png" />" />
			  	</div> 
			  <div class="productName">
			   <a href="/shop/view?n=${shopList.productNo}">${shopList.productName}</a>
			  </div>
			 </li>
			 </c:forEach>
			</ul>
			</section>
		</div>  --%>
	</section>

<%@ include file="../include/footer.jsp" %>
<script>
	var list = '${shopList}';
	console.log(list);
</script>

</html>