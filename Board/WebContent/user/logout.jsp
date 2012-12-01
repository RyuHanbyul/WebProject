<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../share/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
	<jsp:include page="../share/header.jsp"></jsp:include>
	<div class="container">
		<div class="control-group">
			<div class="alert alert-success">로그아웃 성공!</div>
		</div>
		<div class="control-group">
			<a href="login.jsp" class="btn">로그인 페이지로 돌아가기</a>
		</div>
	</div>
</body>
</html>
