<meta charset="utf-8">
  <title>mainpage</title>
  <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="./stylesheet/main.css">
  <link rel="stylesheet" type="text/css" href="./stylesheet/reset.css">
  <link rel="stylesheet" type="text/css" href="./stylesheet/login.css">
  <link rel="stylesheet" type="text/css" href="./stylesheet/mypage.css">
  <script src="./jquery-1.8.2.min.js" type="text/javascript"></script>
  <script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
  <script src="assets/js/bootstrap-modal.js"></script>
  <script>
    $(function(){
      $(document).scroll(function(){
        scrollTop=$(document).scrollTop();
      if(scrollTop>0)
      {
        $("#top").addClass("fixed");
    }
      else
      {
        $("#top").removeClass("fixed");
    }
      });
    });
</script>