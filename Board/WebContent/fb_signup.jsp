<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<jsp:include page="./share/header.jsp"></jsp:include>

	<div class="container">
		<form class="form-horizontal" action="FBAuthServlet" method="GET">
			<input type="hidden" name="Fbid" value="${me.id}">
		</form>

		<div>
			<form class="form-horizontal" action="fbuser" method="POST">
				<fieldset>
					<legend class="legend">Create your account</legend>
					<c:if test="${method == 'PUT'}">
						<input type="hidden" name="id" value="${fbuser.id}" />
						<input type="hidden" name="_method" value="PUT" />
					</c:if>
					<div class="control-group">
						<div class="controls">
							<input type="text" placeholder="User ID" name="userid"
								value="${fbuser.userid}">
						</div>
					</div>

					<input type="hidden" name="fbid" value="${me.id}">

					<c:if test="${method == 'POST'}">
						<%-- 신규 가입일 때만 비밀번호 입력창을 나타냄 --%>
						<div class="control-group">
							<div class="controls">
								<input type="password" placeholder="Password" name="pwd">
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<input type="password" placeholder="Password Confirm"
									name="pwd_confirm">
							</div>
						</div>
					</c:if>

					<div class="control-group">
						<div class="controls">
							<input type="image" name="photoUrl"
								src="https://graph.facebook.com/${me.id}/picture?type=large"
								value="https://graph.facebook.com/${me.id}/picture?type=large" />
						</div>
					</div>

					<div class="form-action">
						<c:choose>
							<c:when test="${method=='POST'}">
								<input type="submit" class="btn btn-primary"
									value="Create Account">
							</c:when>
							<c:otherwise>
								<input type="submit" class="btn btn-primary" value="Modify">
							</c:otherwise>
						</c:choose>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<jsp:include page="./share/footer.jsp"></jsp:include>

</body>
</html>