<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
	<jsp:include page="./share/header.jsp"></jsp:include>
	<div class="container">
		<div class="control-group">
			<div class="alert alert-success">${msg}</div>
		</div>
		<div class="control-group">
			<div class="form-action">
				<a href="board" class="btn">게시판 목록으로</a>
			</div>
		</div>
	</div>
</body>
</html>