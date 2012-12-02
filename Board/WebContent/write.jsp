<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./bootstrap/css/base.css" rel="stylesheet">
<script src="./js/jquery-1.8.2.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
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
								type="text" name="user_id" placeholder="ID"
								value="${substance.user_id}" /> <label class="board-label"
								for="subject">Subject</label> <input type="text"
								style="width: 700px" placeholder="제목" name="subject"
								value="${substance.subject}">
						</div>
						<div class="control-group">
							<label>Category</label>
							<div class="controls">
								<select name="category">
									<c:forEach var="categoryName" items="${substance.categoryNames}">
										<option ${substance.checkCategory(categoryName)}>${categoryName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="container">
						<label class="board-label" for="content">Content</label>
						<textarea name="content" id="content" rows="10" cols="100"
							style="width: 100%; height: 412px; display: none;">
							<c:out value="${substance.content}" />
						</textarea>
					</div>
					
					<input type="hidden" name="spot" id="spot" value="${substance.spot}"/> 
					
					
						<jsp:include page="./map.jsp"></jsp:include>
					<div class="form-actions" style="padding-left: 370px">
						<a href="board" class="btn">목록으로</a>
						<c:choose>
							<c:when test="${method=='POST'}">
								<input type="button" class="btn btn-primary" onclick=send() value="글쓰기">
							</c:when>
							<c:otherwise>
								<input type="submit" class="btn btn-primary" value="수정">
							</c:otherwise>
						</c:choose>
					</div>
				</fieldset>
			</form>
		
			<div style="height:50px">
			</div>
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
		trans();
		document.getElementById('act').submit();
	};
	function trans(){
		var markS="";
			for(var i=0 ; i<markPoints.length;i++){
				markS =markS.concat(markIds[i]+",")
				markS =markS.concat(markPoints[i].getLat());
				markS =markS.concat(","+markPoints[i].getLng()+";");
			}
		document.getElementById('spot').value = markS;
	};

</script>
</html>
