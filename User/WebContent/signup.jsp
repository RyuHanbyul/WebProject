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
			<form class="form-horizontal" action="user" method="POST">
				<fieldset>
					<legend class="legend">Sign Up !</legend>
					<c:if test="${method == 'PUT'}">
						<input type="hidden" name="id" value="${user.id}" />
						<input type="hidden" name="_method" value="PUT" />
					</c:if>
					<div class="control-group">
						<label class="text" for="email">E-mail</label>
						<div class="controls">
							<input type="email" placeholder="이메일" name="email"
								value="${user.email}">
						</div>
					</div>
					<div class="control-group">
						<label class="text" for="name">Name</label>
						<div class="controls">
							<input type="text" placeholder="이름" name="name"
								value="${user.name}">
						</div>
					</div>
					<c:if test="${method == 'POST'}">
						<%-- 신규 가입일 때만 비밀번호 입력창을 나타냄 --%>
						<div class="control-group">
							<label class="text" for="pwd">Password</label>
							<div class="controls">
								<input type="password" placeholder="비밀번호" name="pwd">
							</div>
						</div>

						<div class="control-group">
							<label class="text" for="pwd_confirm">Password
								Confirmation</label>
							<div class="controls">
								<input type="password" placeholder="비밀번호 재입력" name="pwd_confirm">
							</div>
						</div>

						<div class="control-group">
							<label class="text" for="url">Photo Url</label>
							<div class="controls">
								<input type="text" placeholder="사진 경로" name=""
									value="${user.photoUrl}"> <a class="btn btn-small"
									href="">사진 찾기</a>
							</div>
						</div>
					</c:if>
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