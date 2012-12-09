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
			<div class="mypage tab-pane fade in active" id="myWrite"
				style="margin-top: 30px">
				<div class="row-fluid">
					<ul class="thumbnails">
						<c:forEach var="bau" items="${baus}">
							<c:if test="${bau.getFbUser().getfbId()==fbid}">
								<li class="span4"
									style="width: 29.3%; margin: 2%; text-align: center"><a
									href="#myWritemyModal${bau.getSubstance().getId()}"
									class="thumbnail" data-toggle="modal"
									class="btn btn-primary btn-large"
									style="width: 450px; height: 336px;"> <c:out
											value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
							</c:if>
							<div id="myWritemyModal${bau.getSubstance().getId()}"
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
								</div>
								<div class="modal-body">
									<div style="text-align: center">
										<a href="board?op=show&id=${bau.getSubstance().getId()}">
											<c:out value="${bau.getSubstance().getImage()}"
												escapeXml="false" />
										</a>
									</div>
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
			<div class="mypage tab-pane fade in active" id="myPin">
				<div class="row-fluid">
					<ul class="thumbnails">
						<c:forEach var="pin" items="${pins}">
							<c:if test="${pin.getRepin().getUser_id() == fbid}">
								<c:if
									test="${pin.getRepin().getPost_id() == pin.getSubstance().getId() }">
									<li class="span4"
										style="width: 29.3%; margin: 2%; text-align: center"><a
										href="#myPinmyModal${pin.getSubstance().getId()}"
										class="thumbnail" data-toggle="modal"
										class="btn btn-primary btn-large"
										style="width: 450px; height: 336px;"> <c:out
												value="${pin.getSubstance().getImage()}" escapeXml="false" /></a></li>
								</c:if>
							</c:if>

							<div id="myPinmyModal${pin.getSubstance().getId()}"
								class="modal hide fade" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true"
								style="display: block;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 id="myModalLabel"
										style="text-align: center; font-size: 35px;">
										<c:out value="${pin.getSubstance().getSubject()}" />
									</h3>
								</div>
								<div class="modal-body">
									<div style="text-align: center">
										<a href="board?op=show&id=${pin.getSubstance().getId()}">
											<c:out value="${pin.getSubstance().getImage()}"
												escapeXml="false" />
										</a>
									</div>
									<div style="float: right;">
										<b style="font-size: 15px;"><c:out
												value="${pin.getSubstance().getUser_id()}" /></b> <img
											src="./upload/${pin.getUser().getPhotoUrl()}"
											style="width: 40px; height: 40px;" escapeXml="false">
									</div>
								</div>
							</div>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="mypage tab-pane fade in active" id="editProfile"
				style="margin-top: 30px">
				<form class="form-horizontal" action="FBAuthServlet" method="GET">
					<input type="hidden" name="Fbid" value="${me.id}">
				</form>

				<div>
					<form class="form-horizontal" action="fbuser" method="POST">
						<fieldset>
							<c:choose>
								<c:when test="${fbid==null}">
									<legend class="legend">Create your account</legend>
								</c:when>
								<c:otherwise>
									<legend class="legend">Edit Profile !</legend>
								</c:otherwise>
							</c:choose>

							<c:if test="${method == 'PUT'}">
								<input type="hidden" name="id" value="${fbuser.id}" />
								<input type="hidden" name="_method" value="PUT" />
							</c:if>


							<input type="hidden" name="fbid" value="${me.id}">

							<c:if test="${fbid!=null }">
								<div class="control-group">
									<div class="controls signupInput">
										<input type="text" placeholder="User ID" disabled="disabled"
											value="${fbuser.userid}">
									</div>
								</div>
							</c:if>

							<c:if test="${method == 'POST'}">
								<%-- 신규 가입일 때만 유저ID 입력창을 나타냄 --%>
								<div class="control-group">
									<div class="controls signupInput">
										<input type="text" placeholder="User ID" name="userid"
											value="${fbuser.userid}">
									</div>
								</div>
							</c:if>

							<div class="control-group">
								<div class="controls signupInput">
									<input type="password" placeholder="Password" name="pwd">
								</div>
							</div>

							<div class="control-group">
								<div class="controls signupInput">
									<input type="password" placeholder="Password Confirm"
										name="pwd_confirm">
								</div>
							</div>
							<c:if test="${method == 'POST'}">
								<div class="control-group">
									<div class="controls signupInput">
										<input type="image" name="photoUrl"
											src="https://graph.facebook.com/${me.id}/picture?type=large"
											value="https://graph.facebook.com/${me.id}/picture?type=large" />
									</div>
								</div>
							</c:if>

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
			}
		</script>
</body>
</html>
