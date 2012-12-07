<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<jsp:include page="./share/link.jsp"></jsp:include>
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<jsp:include page="./share/header.jsp"></jsp:include>
	<div class="container">
		<div>
			<form id="act" class="form-horizontal" action="board" method="POST">
				<fieldset style="color: white;">
					<legend>Write</legend>

					<c:if test="${method == 'PUT'}">
						<input type="hidden" name="id" value="${substance.id }" />
						<input type="hidden" name="_method" value="PUT" />
					</c:if>
					
					<div style="clear: both">
						<div style="float: left">
							<label class="board-label" for="subject">Subject</label> <input
								type="text" style="width: 700px;" placeholder="제목"
								name="subject" value="${substance.subject}">
						</div>
						<div class="control-group">
							<label class="control-label" style="height:15px;text-align: left">Category</label>
							<div class="controls">
								<select name="category">
									<c:forEach var="categoryName"
										items="${substance.categoryNames}">
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
							<input type="hidden" name="spot" id="spot" value="${substance.spot}" />
							<input type="hidden" name="image" id="image" value="${substance.image}"/>
							<jsp:include page="./map.jsp"></jsp:include>
					<div class="form-actions" style="padding-left: 370px">
						<a href="board" class="btn">목록으로</a>
						<c:choose>
							<c:when test="${method=='POST'}">
								<input type="button" class="btn btn-primary" onclick=send() value="Write">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-primary" onclick=send() value="Modify">
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
		image();
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
	function image(){
		var str = document.getElementById('content').value;
		var str1 = str.search("<img");
		if(str1!=(-1)){
			var striii = str.substring(str1,str1+100);
			str1 = striii.search("<img");
			var str2 = striii.search(">");
			str = striii.substring(str1,str2);
			str = str.concat("style=\"width:450px;height:336px;\">");
		  document.getElementById('image').value = str;
		}
	};
	$(function() {
		var spot = $("#spot").val();
		if(!spot){
		    daumMap.init(37.566419230900905,126.97787415510291);  
		    daumLocalSearch.init();  
		    daumLocalSearch.search();
		}
			var spotView = spot.split(";");
			for ( var i = 0; i < spotView.length - 1; i++) {
				var totalSpot = spotView[i].split(",");
				if (i == 0) {
					daumMap.init(totalSpot[1], totalSpot[2]);
				}
				mark.spot(totalSpot[0], totalSpot[1], totalSpot[2]);
		}
	});
</script>
</html>
