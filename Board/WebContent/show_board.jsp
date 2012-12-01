<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/base.css" rel="stylesheet">
  <script src="js/jquery-1.8.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="./share/header.jsp">
  <jsp:param name="current" value="Sign Up"/>
</jsp:include>
<jsp:scriptlet>pageContext.setAttribute("LF", "\r\n");</jsp:scriptlet>>
 <div class="container">
    <div>
      <ul>
      	<li>Subject 
      		<div class="well"><c:out value="${substance.subject}"/></div></li>
      	<li>Content
      		<div class="well"><c:out value="${substance.content}" escapeXml="false"/></div></li>
      </ul> 
      
    </div>      

	  <div class="form-actions">
	    <a href="board" class="btn">목록으로</a>
 	    <a href="board?op=update&id=${substance.id}" class="btn btn-primary">수정</a>
      <a href="#" class="btn btn-danger" data-action="delete" data-id="${substance.id}" >삭제</a>
    </div>
	<script>
	  $(function() {
	    $("a[data-action='delete']").click(function() {
	      if (confirm("정말로 삭제하시겠습니까?")) {
	        location = 'user?op=delete&id=' + $(this).attr('data-id');
	      }
	      return false;
	   });
	  });
	</script>  
  </div>
</body>
</html>