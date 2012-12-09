<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta charset="UTF-8">

  <link href="./bootstrap/css/base.css" rel="stylesheet">
  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="./css/main.css">
  <link rel="stylesheet" type="text/css" href="./css/reset.css">
  <link rel="stylesheet" type="text/css" href="./css/signup.css">
  <link rel="stylesheet" type="text/css" href="./css/mypage.css">
    <link rel="stylesheet" type="text/css" href="./css/repin.css">
  <script src="./js/jquery-1.8.3.js" type="text/javascript"></script>
  <script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="./js/bootstrap-dropdown.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
  <script type="text/javascript">
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