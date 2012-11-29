<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
</head>
<body>
	<div id="wrap">
		<jsp:include page="./share/header.jsp"></jsp:include>
		<div class="container">
			<div class="control-group"><legend class="legend">신규글 | 인기글</legend></div>
		</div>

		<div id="content">
			<div class="row-fluid">
				<ul class="thumbnails">
					<jsp:include page="content.jsp"></jsp:include>
					<jsp:include page="content.jsp"></jsp:include>
					<jsp:include page="content.jsp"></jsp:include>
				</ul>
				<jsp:include page="./modal/totalmodal.jsp"></jsp:include>
			</div>
		</div>
		<jsp:include page="./share/footer.jsp"></jsp:include>
	</div>
</body>
</html>