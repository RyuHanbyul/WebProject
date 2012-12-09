<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 자세히보기</title>
<jsp:include page="./share/link.jsp"></jsp:include>

</head>
<body>

	<!-- 페이스북 Like -->
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=560735563942173";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<jsp:scriptlet>pageContext.setAttribute("LF", "\r\n");</jsp:scriptlet>
	<div class="container">
		<fieldset>
			<legend class="legend">Post Show</legend>

			<!-- 좋아요 버튼의 Count 저장 -->

			<div style="float: right">
				<!-- 페이스북 Like Button & Button_Count -->
				<div class="fb-like"
					data-href="http://localhost:8080/Board/board?op=show&id=${substance.id }"
					data-send="false" data-layout="box_count" data-width="450"
					data-show-faces="true" data-font="tahoma"></div>
			</div>


			<div class="container" style="clear: both">
				<div style="float: left">
					<label class="board-label" for="subject">UserID</label>
					<div class="well" style="width: 206px; padding: 4px 6px">
						<c:out value="${substance.user_id}" />
					</div>
				</div>
				<div style="float: right">
					<div class="control-group">
						<label class="control-label">Category</label>
						<div class="well" style="width: 206px; padding: 4px 6px">
							<c:out value="${substance.category}" />
						</div>
					</div>
				</div>
			</div>

			<div class="control-group">
				<label class="board-label" for="subject">Subject</label>
				<div class="well" style="width: 700px; padding: 4px 6px">
					<c:out value="${substance.subject}" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Content</label>
				<div class="well">
					<c:out value="${substance.content}" escapeXml="false" />
				</div>
			</div>

			<div class="control-group">
				<div id="showMap">
					<label class="control-label">Map</label>
					<div class="well">
						<input type="hidden" id="spotView" value="${substance.spot}" />
						<div id="daumMapView" style="height: 350px;"></div>
					</div>
				</div>
			</div>


			<div class="form-actions" style="float: right">
				<a href="board" class="btn">목록으로</a> <a
					href="board?op=update&id=${substance.id}" class="btn btn-primary">수정</a>
				<a href="#" class="btn btn-danger" data-action="delete"
					data-id="${substance.id}">삭제</a>
			</div>
		</fieldset>
	</div>
</body>
</html>
<jsp:include page="./viewMapjs.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		var spot = $("#spotView").val();
		if (!spot) {
			$("#showMap").hide();
		} else {
			var spotView = spot.split(";");
			for ( var i = 0; i < spotView.length - 1; i++) {
				var totalSpot = spotView[i].split(",");
				if (i == 0) {
					daumMap.init(totalSpot[1], totalSpot[2]);
				}
				mark.spot(totalSpot[0], totalSpot[1], totalSpot[2]);
			}
		}
	});
	$(function() {
		$("a[data-action='delete']").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location = 'board?op=delete&id=' + $(this).attr('data-id');
			}
			return false;
		});
	});
	function send() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		trans();
		document.getElementById('act').submit();
	};
</script>