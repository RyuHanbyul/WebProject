<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/base.css" rel="stylesheet">
<script src="./js/jquery-1.8.2.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:scriptlet>pageContext.setAttribute("LF", "\r\n");</jsp:scriptlet>
	<div class="container">
		<div>
			<ul>
				<li>Category
					<div class="well">
						<c:out value="${substance.category}" />
					</div>
				</li>
				<li>UserID
					<div class="well">
						<c:out value="${substance.user_id}" />
					</div>
				</li>
				<li>Subject
					<div class="well">
						<c:out value="${substance.subject}" />
					</div>
				</li>
				<li>Content
					<div class="well">
						<c:out value="${substance.content}" escapeXml="false" />
					</div>
				</li>
				<li>Map
					<div class="well">
						<input type="hidden" id ="spotView" value="${substance.spot}" />
						<div id="daumMapView" style="height:350px;"></div>
					</div>
				</li>
			</ul>

		</div>

		<div class="form-actions">
			<a href="board" class="btn">목록으로</a> <a
				href="board?op=update&id=${substance.id}" class="btn btn-primary">수정</a>
			<a href="#" class="btn btn-danger" data-action="delete" data-id="${substance.id}">삭제</a>
		</div>
	</div>
</body>
</html>
<jsp:include page="./viewMapjs.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		var spot = $("#spotView").val();
		var spotView = spot.split(";");
		for(var i=0;i<spotView.length-1;i++){
			var totalSpot = spotView[i].split(",");
			if(i==0){
				daumMap.init(totalSpot[1],totalSpot[2]);
			}
			mark.spot(totalSpot[0],totalSpot[1],totalSpot[2]);
		}
	});
	$(function() {
		$("a[data-action='delete']").click(
				function() {
					if (confirm("정말로 삭제하시겠습니까?")) {
						location = 'board?op=delete&id='
								+ $(this).attr('data-id');
					}
					return false;
				});
	});
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "content",
		sSkinURI : "./SmartEditor2Skin.jsp",
		fCreator : "createSEditor2"
	});
	function send() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		trans();
		document.getElementById('act').submit();
	};
</script>