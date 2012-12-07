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
		<div>
			<form class="form-horizontal" name="form" action="user" method="POST"
				enctype="multipart/form-data">
				<fieldset>

					<legend class="legend">Edit Profile</legend>


					<c:if test="${method == 'PUT'}">
						<input type="hidden" name="id" value="${user.id}" />
						<input type="hidden" name="op_method" value="PUT" />
					</c:if>
					
					<div class="control-group">
						<div class="controls">
							<input type="email" placeholder="Email" disabled="disabled"
									name="email" value="${user.email}">
						</div>
					</div>

					<div class="control-group">
						<div class="controls">
							<input type="text" placeholder="UserID" name="userid"
								value="${user.userid}">
						</div>
					</div>

					<%-- 신규 가입일 때만 비밀번호 입력창을 나타냄 --%>
					<div class="control-group">
						<div class="controls">
							<input type="password" placeholder="Password" name="pwd">
						</div>
					</div>

					<div class="control-group">
						<div class="controls">
							<input type="password" placeholder="Password Confirmation" name="pwd_confirm">
						</div>
					</div>

					<div class="control-group">
						<div class="controls">
							<input type="file" name="photoUrl">
						</div>
					</div>


					<div class="form-action">
						<c:choose>
							<c:when test="${method=='POST'}">
								<input type="submit" class="btn btn-primary" value="가입">
							</c:when>
							<c:otherwise>
								<input type="submit" class="btn btn-primary" value="수정">
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