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
			<div id="top-right" >
			  	<p>
					<a class="btn btn-small" href="./login.jsp">로그인</a>
          			<a class="btn btn-small" href="./join.jsp">회원가입</a>
          			<a class="btn btn-small" href="./mypage.jsp">마이페이지</a>
				</p>
      </div>
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