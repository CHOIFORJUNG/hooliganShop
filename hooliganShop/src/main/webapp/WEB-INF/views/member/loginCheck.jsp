<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title></title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<script>
		var result = '${msg}';
		console.log("msg: " + result);
		if(result == "loginFailure") {
			alert("존재하지 않는 회원입니다.");
			self.location="/member/login";
		} else if(result == "pwFailure") {
			alert("아이디와 비밀번호를 확인해주세요.");
			self.location="/member/login";
		} 
	</script>
</body>
</html>