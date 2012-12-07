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
						<li class="active"><a href="#admin">관리자기능</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="tab-content">
				<div class="tab-pane fade in active" id="admin">
					<a href="user?op=index&id=${id}" class="btn btn-mini">유저 관리</a><a
						href="fbuser?op=index&fbid=${fbid}" class="btn btn-mini">페북유저
						관리</a> <a href="board?op=index2&id=${id}" class="btn btn-mini">게시글
						관리</a>
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
