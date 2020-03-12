<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ include file="include/header.jsp" %>
<%-- <img src="<c:url value="/resources/myImg/messi2.png" />" /> --%>
<div class="container mt" style="margin:0; padding: 0; width: 100%;">
	<div class="row">
      <div class="col-lg-10 col-lg-offset-1 centered">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators" >
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="<c:url value="/resources/myImg/hithit.png" />" />
            </div>
            <div class="item">
              <img src="<c:url value="/resources/myImg/hithithti.png" />" />
            </div>
            <div class="item">
              <img src="<c:url value="/resources/myImg/hithithit.png" />" />
            </div>
          </div>
        </div>
      </div>
      <div class="clear" style="clear:both;"></div>
      
 <div id="portfoliowrap">
    <h3>BEST SELLER</h3>
    <div class="portfolio-centered" style="width: 100%; text-align: center;">
      <div class="recentitems portfolio" style="width:90%; margin-left: 50px; display: inline-block;">
      <c:forEach items="${bestList}" var="shopList">  
        <%--   <div class="col-lg-3 col-md-3 col-sm-3" style="margin: 0px;">
           <a href="/shop/view?n=${shopList.productNo}">
           <img src="<c:url value="${shopList.productImg }" />" style="width: 260px; height:200px;"/>
          </a>
          </div>
        <div class="he-view">
              <div class="bg a0" data-animate="fadeIn">
                <h3 class="a1" data-animate="fadeInDown">상세 보기</h3>
              </div>
              <!-- he bg -->
            </div> --%>
        
        <div class="portfolio-item graphic-design" style="margin: 5px;">
        <ul style="margin-left: 100px;">
          <div class="he-wrap tpl6">
          	<a href="/shop/view?n=${shopList.productNo}">
            <img src="<c:url value="/resources/myImg/footballfoot.jpg" />" style="width:170px;" />
            <div class="he-view">
              <div class="bg a0" data-animate="fadeIn">
                <h3 class="a1" data-animate="fadeInDown">상세 보기</h3>
              </div>
              <!-- he bg -->
            </div>
            <!-- he view -->
          </div>
          <!-- he wrap -->
          </ul>
        </div>
        <!-- end col-12 -->

    </c:forEach>
      </div>
      <!-- portfolio -->
    </div>
    <!-- portfolio container -->
  </div>
  <!--/Portfoliowrap -->
  </div>
 </div>

<%@ include file="include/footer.jsp" %>

</html>