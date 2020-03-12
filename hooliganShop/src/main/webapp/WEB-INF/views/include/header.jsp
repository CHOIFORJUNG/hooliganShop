<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.spring.vo.UserVO" %>
<%-- <%
	HttpSession session2= request.getSession();
	UserVO loginUser = (UserVO)session2.getAttribute("loginUser");
%> --%>
 <!-- header -->
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>HooliganShop</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<c:url value="/resources/img/favicon.png" />" rel="icon">
  <link href="<c:url value="/resources/img/apple-touch-icon.png" />" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,700,900|Lato:400,900" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<c:url value="/resources/lib/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<c:url value="/resources/lib/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/lib/prettyphoto/css/prettyphoto.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/lib/hover/hoverex-all.css"/>" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
	
	
	
    <!-- JavaScript Libraries -->
  <script src="<c:url value="/resources/lib/jquery/jquery.min.js" />" ></script>
  <script src="<c:url value="/resources/lib/bootstrap/js/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/lib/php-mail-form/validate.js"/>"></script>
  <script src="<c:url value="/resources/lib/prettyphoto/js/prettyphoto.js"/>"></script>
  <script src="<c:url value="/resources/lib/isotope/isotope.min.js"/>"></script>
  <script src="<c:url value="/resources/lib/hover/hoverdir.js"/>"></script>
  <script src="<c:url value="/resources/lib/hover/hoverex.min.js"/>"></script>

  <!-- Template Main Javascript File -->
  <script src="<c:url value="/resources/js/main.js"/>"></script>
  
  <!-- =======================================================
    Template Name: Solid
    Template URL: https://templatemag.com/solid-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>

  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        <a class="navbar-brand" href="/"><i class="fa fa-soccer-ball-o"></i> &nbsp; HooLiGan</a>
      </div>
      <div class="navbar-collapse collapse navbar-right">
        <ul class="nav navbar-nav">
         <!--  <li class="active"><a href="/">홈으로</a></li> -->
          <li class="dropdown">
            <a href="/shop/list?c=100&l=1" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 15px;" >SHOES <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="/shop/list?c=101&l=2">NIKE</a></li>
              <li><a href="/shop/list?c=102&l=2">ADIDAS</a></li>
              <li><a href="/shop/list?c=103&l=2">PUMA</a></li>
              <li><a href="/shop/list?c=104&l=2">NEW BALANCE</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="/shop/list?c=200&l=1" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 15px;" >SHIRTS <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="/shop/list?c=201&l=2">NIKE</a></li>
              <li><a href="/shop/list?c=202&l=2">ADIDAS</a></li>
              <li><a href="/shop/list?c=203&l=2">PUMA</a></li>
              <li><a href="/shop/list?c=204&l=2">NEW BALANCE</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="/shop/list?c=300&l=1" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 15px;" >PLAYBALL <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="/shop/list?c=301&l=2">NIKE</a></li>
              <li><a href="/shop/list?c=302&l=2">ADIDAS</a></li>
              <li><a href="/shop/list?c=303&l=2">PUMA</a></li>
              <li><a href="/shop/list?c=304&l=2">NEW BALANCE</a></li>
            </ul>
          </li>
          <li><a href="/fboard/list" style="font-size: 15px;" >FOOTBALLTALK</a></li>
          <li><a href="/cs/list" style="font-size: 15px;" >고객센터</a></li>
          	<%-- <% if(loginUser == null) {%> --%>
	        <c:if test="${sessionScope.loginUser == null}">
	          <li><a href="/member/signup" class="btn" role="button" style="font-size: 15px;" >SIGNUP</a></li>
	          <li><a href="/member/login" class="btn btn-info" role="button" style="font-size: 15px;" >LOGIN</a></li>
   			</c:if>
   			<%-- <% } %> --%>
     <%--     	<% if(loginUser != null) {%> --%>
         	   <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.userId != 'admin'}">
             <li><a href="/shop/orderList" class="btn" role="button" style="font-size: 15px;" >MYPAGE</a></li>
	         <li><a href="/shop/cartList" class="btn btn-info" role="button" style="font-size: 15px;" >CART</a></li>
	        </c:if>
	        
         	  <c:if test="${sessionScope.loginUser != null}">
	          <li><a href="/member/logout" class="btn btn-info" role="button" style="font-size: 15px;" >LOGOUT</a></li>
	        </c:if>
	         <%-- <% } %> --%>
	 <%--         <% if(loginUser != null) {%>
		         <%String isAdmin = loginUser.getIsAdmin(); %>
		         <% if(isAdmin.equals("1")) { %> --%>
		         <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.isAdmin=='1' }">
		         <li><a href="/admin/adminpage" class="btn" role="button" style="font-size: 15px;" >ADMIN</a></li>
		         </c:if> 
		          <%-- <% } %>
	        <% } %> --%>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>
  <script>
  var result = '${msg}';
  
  var login = '${session.loginUser}';
  var loginUserId = '${session.loginUser.userId}';
 
  console.log(result);
  console.log("login:" + login);
  console.log("loginUserId:" + loginUserId);
  if(result == 'success') {
 		alert('로그인 되었습니다.');
 	} else if (result == 'logoutSuccess') {
 		alert('로그아웃 되었습니다.');
 	}
  </script>
