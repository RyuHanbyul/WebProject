<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../share/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
	<jsp:include page="../share/header.jsp">
		<jsp:param name="current" value="Sign Up" />
	</jsp:include>
	<div class="container">
		<div class="control-group">
			<legend class="legend">Login</legend>
		</div>
		<div class="control-group">
		<!-- 로그인 error msg -->
			<div class="alert alert-error">${msg}</div>
		</div>
		<div class="control-group">
			<%
				if (session.getAttribute("id") != null) {
			%>
			<a href="login?op=logout" class="btn btn-mini btn-danger">로그아웃</a>
			<%
				} else {
			%>
		</div>
		<div class="control-group">
			<form action="login" method="post">
				Email: <input type="text" name="email"> 
				Password: <input type="password" name="pwd"> <input type="submit" value="login">
			</form>
			<%
				}
			%>
		</div>
	</div>

	<jsp:include page="../share/footer.jsp"></jsp:include>
</body>
</html>