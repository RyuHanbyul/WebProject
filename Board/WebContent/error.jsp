<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
	<jsp:include page="./share/header.jsp">
		<jsp:param name="current" value="Sign Up" />
	</jsp:include>
<body>
	<div class="container">
		<div class="control-group">
			<div class="alert alert-error">

				<!-- 회원가입 errorMsgs -->
				<c:out value="${error}" />

				<c:if test="${errorMsgs != null || errorMsgs.size() > 0 }">
					<h3>Errors:</h3>
					<ul>
						<c:forEach var="msg" items="${errorMsgs}">
							<li>${msg}</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
