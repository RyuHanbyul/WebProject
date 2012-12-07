<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/login.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Facebook 접속에 쓰일 js -->
<script src="//connect.facebook.net/en_US/all.js"></script>
</head>
<body>
	<jsp:include page="./share/header.jsp"></jsp:include>
	<div class="container">
		<div class="control-group">
			<legend class="legend">Login</legend>
		</div>
		<div class="control-group">
			<!-- 로그인 error msg -->
			<c:if test="${msg != null || msg.size() > 0}">
				<div class="alert alert-success">${msg}</div>
			</c:if>
		</div>
		<div class="control-group">
			<c:choose>
				<c:when test="${id != null}">
					<div class="control-group">
						<a href="login?op=logout" class="btn btn-mini btn-danger">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="control-group">
						<form action="login" method="post">
							Email: <input type="text" name="email"> Password: <input
								type="password" name="pwd"> <input type="submit"
								value="login">
					</div>
					<div class="control-group">
						<h2>OR</h2>
					</div>

					<div class="control-group">

						<!-- Facebook 접속 버튼 -->
						<a class="fb_button fb_button_large" id="btnLogin"
							href="FBAuthServlet.do" data-size="xlarge"> <span
							class="fb_button_text"> Log In</span>
						</a>
					</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="./share/footer.jsp"></jsp:include>
</body>
</html>