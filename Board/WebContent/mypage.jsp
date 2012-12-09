<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
</head>
<body>
	<div id="wrap">
		<div id="top2">
			<jsp:include page="./share/header.jsp"></jsp:include>
			<div id="first-nav" class="navbar navmenu" style="height: 30px;">
				<div class="navbar-tabs navselect">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab"
							onclick="myPage(myWrite)")>내가쓴글</a></li>
						<li><a data-toggle="tab" onclick="myPage(myPin)">MyPin</a></li>
						<li><a data-toggle="tab" onclick="myPage(editProfile)">회원정보</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="mypage tab-pane fade in active" id="myWrite">
				<div class="row-fluid">
					<ul class="thumbnails">
						<c:forEach var="bau" items="${baus}">
							<c:if test="${bau.getUser().getId()==id}">
								<li class="span4"
									style="width: 29.3%; margin: 2%; text-align: center"><a
									href="#myModal${bau.getSubstance().getId()}" class="thumbnail"
									data-toggle="modal" class="btn btn-primary btn-large"
									style="width: 450px; height: 336px;"> <c:out
											value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
							</c:if>
							<div id="myModal${bau.getSubstance().getId()}"
								class="modal hide fade" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true"
								style="display: block;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 id="myModalLabel"
										style="text-align: center; font-size: 35px;">
										<c:out value="${bau.getSubstance().getSubject()}" />
									</h3>
									<a href="board?op=show&id=${bau.getSubstance().getId()}"> <c:out
											value="${bau.getSubstance().getImage()}" escapeXml="false" />
									</a>
									<div style="float: right;">
										<b style="font-size: 15px;"><c:out
												value="${bau.getSubstance().getUser_id()}" /></b>
										<c:if test="${bau.getUser().getPhotoUrl() != null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;" escapeXml="false">
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="mypage tab-pane fade in active" id="myPin"
				style="margin-top: 30px">
				<div class="row-fluid">
					<a href="board?op=mypin&id=${id}" class="btn btn-mini">ShowMyPin</a>
				</div>
			</div>

			<div class="mypage tab-pane fade in active" id="editProfile"
				style="margin-top: 30px">
				<form class="form-horizontal" action="user" method="POST"
					enctype="multipart/form-data">
					<fieldset>
						<c:choose>
							<c:when test="${id==null}">
								<legend class="legend">Create your account!</legend>
							</c:when>
							<c:otherwise>
								<legend class="legend">Edit Profile !</legend>
							</c:otherwise>
						</c:choose>

						<c:if test="${method == 'PUT'}">
							<input type="hidden" name="id" value="${user.id}" />
							<input type="hidden" name="op_method" value="PUT" />
						</c:if>

						<c:if test="${id!=null }">
							<div class="control-group">
								<div class="controls signupInput">
									<input type="email" placeholder="Email" disabled="disabled"
										name="email" value="${user.email}">
								</div>
							</div>
							<div class="control-group">
								<div class="controls signupInput">
									<input type="text" placeholder="UserID" disabled="disabled"
										name="userid" value="${user.userid}">
								</div>
							</div>
						</c:if>

						<c:if test="${method == 'POST'}">
							<div class="control-group">
								<div class="controls signupInput">
									<input type="email" placeholder="Email" name="email"
										value="${user.email}">
								</div>
							</div>
							<div class="control-group">
								<div class="controls signupInput">
									<input type="text" placeholder="UserID" name="userid"
										value="${user.userid}">
								</div>
							</div>
						</c:if>

						<%-- 신규 가입일 때만 비밀번호 입력창을 나타냄 --%>
						<div class="control-group">
							<div class="controls signupInput">
								<input type="password" placeholder="Password" name="pwd">
							</div>
						</div>

						<div class="control-group">
							<div class="controls signupInput">
								<input type="password" placeholder="Password Confirmation"
									name="pwd_confirm">
							</div>
						</div>

						<div class="control-group">
							<div class="controls signupInput">
								<input type="file" name="photoUrl" style="width: 220px">
							</div>
						</div>

						<div class="form-action">
							<c:choose>
								<c:when test="${method=='POST'}">
									<input type="submit" class="btn btn-primary"
										value="Create Account">

									<!-- Facebook 접속 버튼 -->
									<a class="btn btn-primary" id="btnLogin"
										href="FBAuthServlet.do" data-size="xlarge"> <span
										class="fb_button_text" style="color: white"> F.B Create
											Account</span>
									</a>

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
	</div>
	<script type="text/javascript">
		$(function() {
			$('.mypage').hide();
			$('#myWrite').show();
		});

		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});
		function myPage(name) {
				$('.mypage').hide();
				$(name).show();
		};
	</script>
</body>
</html>
