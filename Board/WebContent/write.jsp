<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/base.css" rel="stylesheet">
<script src="./js/jquery-1.8.2.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<div class="container">
		<div>
			<form id="act" class="form-horizontal" action="board" method="POST">
				<fieldset>
					<legend class="legend">Write</legend>

					<c:if test="${method == 'PUT'}">
						<input type="hidden" name="id" value="${substance.id }" />
						<input type="hidden" name="_method" value="PUT" />
						<h3>
							<!--c:out value="${}"/-->
						</h3>
					</c:if>

					<div class="container" style="clear: both">
						<div style="float: left">
							<label class="board-label" for="subject">UserID</label> <input
								type="text" name="user_id" value="${substance.user_id}" /> <label
								class="board-label" for="subject">Subject</label> <input
								type="text" style="width: 700px" placeholder="제목" name="subject"
								value="${substance.subject}">
						</div>
						<div style="float: right">
							<label class="board_label" for="category">Category</label> <select
								class="span2" name="category">
								<option value="seoul">서울</option>
								<option value="gyeonggi">경기도</option>
								<option value="gangwon">강원도</option>
								<option value="chungcheong">충청도</option>
								<option value="jeolla">전라도</option>
								<option value="gyeongsang">경상도</option>
								<option value="jeju">제주도</option>
							</select>
						</div>
					</div>

					<div class="container">
						<label class="board-label" for="content">Content</label>
						<textarea name="content" id="content" rows="10" cols="100"
							style="width: 100%; height: 412px; display: none;">
							<c:out value="${substance.content}" />
						</textarea>
					</div>

					<jsp:include page="./map.jsp"></jsp:include>

					<div class="form-actions" style="padding-left: 370px">
						<a href="user" class="btn">목록으로</a>
						<c:choose>
							<c:when test="${method=='POST'}">
								<input type="button" class="btn btn-primary" onclick=send()
									value="글쓰기">
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
</body>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "content",
		sSkinURI : "./SmartEditor2Skin.jsp",
		fCreator : "createSEditor2"
	});
	function send() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		document.getElementById('act').submit();
	}
</script>
</html>
