<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
  <div id="wrap">
    <div id="top">
      <div id="top-exam">
      </div>
      <div id="top-left">
      </div>
      <div id="top-center">
        <a href="./main.jsp"><img src="./images/logo.jpg" alt = "mainlogo"></a>
        <div>
          신규글 | 인기글 
        </div>
			</div>
			<jsp:include page="top-right.jsp"></jsp:include>
      <div id="top-exam2">
      </div>
    </div>
    <div id="content" > 
      <div class="row-fluid">
        <ul class="thumbnails">
          <jsp:include page="content.jsp"></jsp:include>
          <jsp:include page="content.jsp"></jsp:include>
          <jsp:include page="content.jsp"></jsp:include>
        </ul>
          <jsp:include page="totalmodal.jsp"></jsp:include>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
   </div>
</body>
</html>