

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="./share/header.jsp"></jsp:include>

	<div class="container">
		<div style="text-align: center">
			<fieldset>
			<div class="control-group">
				<legend class="legend">How make your account?</legend>
				<a class="btn btn-primary" href="user?op=signup" style="color: white">Create
					Account</a> <a class="btn btn-primary" id="btnLogin"
					href="FBAuthServlet.do" data-size="xlarge"> <span
					class="fb_button_text" style="color: white"> Facebook Create
						Account</span>
				</a>
				</div>
			</fieldset>
		</div>
	</div>
	<jsp:include page="./share/footer.jsp"></jsp:include>
</body>
</html>



