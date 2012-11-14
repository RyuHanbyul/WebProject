<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
  <div id="wrap">
    <div id="top">
      <div id="top-menu" style="clear:both;overflow:auto">
        <div id="top-exam">
        </div>
        <div id="top-left">
        </div>
        <div id="top-center">
          <a href="./main.jsp"><img src="./images/logo.jpg" alt = "mainlogo"></a>
        </div>
        <jsp:include page="top-right.jsp"></jsp:include>
      </div>
      <div id ="first-nav" class="navbar navmenu" style="height:30px;">
          <div class="navbar-tabs navselect">
            <ul class="nav nav-tabs" id="myTab">
            <li class="active"><a href="#myWrite">내가쓴글</a></li>
            <li><a href="#myPin">MyPin</a></li>
            <li><a href="#editProfile">회원정보</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div id="content" >
      <div class="tab-content">
        <div class="tab-pane fade in active" id="myWrite">
          <div class="row-fluid">
            <ul class="thumbnails">
              <jsp:include page="content.jsp"></jsp:include>
							<jsp:include page="content.jsp"></jsp:include>
							<jsp:include page="content.jsp"></jsp:include>
            </ul>
            <jsp:include page="totalmodal.jsp"></jsp:include>
          </div>
        </div>
        <div class="tab-pane fade" id="myPin">
          <div class="row-fluid">
            <ul class="thumbnails">
              <jsp:include page="content.jsp"></jsp:include>
          		<jsp:include page="content.jsp"></jsp:include>
          		<jsp:include page="content.jsp"></jsp:include>
            </ul>
          </div>
        </div>
        <div class="tab-pane fade" id="editProfile">
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>
<script type="text/javascript">
  $(function () {
      $('#myTab a:first').tab('show');
  });

  $('#myTab a').click(function (e) {
    e.preventDefault();
    console.log($(this).attr("href"));
    $(this).tab('show');
  });
</script>