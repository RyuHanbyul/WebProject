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
						<li class="active"><a href="#myWrite">내가쓴글</a></li>
						<li><a href="#myPin">MyPin</a></li>
						<li><a href="#editProfile">회원정보</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="tab-content">
				<div class="tab-pane fade in active" id="myWrite">
					<div class="row-fluid">
						<ul class="thumbnails">
						</ul>
					</div>
				</div>
				<div class="tab-pane fade" id="myPin">
					<div class="row-fluid">
						<ul class="thumbnails">
						</ul>
					</div>
				</div>
				<div class="tab-pane fade" id="editProfile" style="height:500px;text-align:center">
				<div style="height:100px;">
				</div>
					<c:choose>
						<c:when test="${id != null}">
								<a href="user?op=update&id=${id}" class="btn">유저
								회원정보를 수정하시겠습니까?</a>
						</c:when>
						<c:otherwise>
							<c:if test="${fbid != null}">
								<a href="fbuser?op=update&fbid=${fbid}" class="btn">페이스북
									회원정보를 수정하시겠습니까?</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<jsp:include page="./share/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
	$(function() {
		$('#myTab a:first').tab('show');
	});

	$('#myTab a').click(function(e) {
		e.preventDefault();
		console.log($(this).attr("href"));
		$(this).tab('show');
	});
</script>
</body>
</html>
