<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title></title>
</head>
<body>
<div class="col-lg-12">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">인터셉터 결과 데이터</h3>
		</div>
		<div class="box-body">
			<a href="${path}/interceptor/doB">dob 페이지로 이동</a>
		</div>
		<div class="box-footer">
			<p>결과데이터 : ${result}</p>
		</div>
	</div>
</div>
</body>
</html>