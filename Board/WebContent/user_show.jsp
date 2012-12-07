<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="./share/link.jsp">
</head>
<body>
<jsp:include page="./share/header.jsp">
  <jsp:param name="current" value="Sign Up"/>
</jsp:include>

 <div class="container">
    <div>
      <h3><c:out value="${user.name}"></c:out></h3>
      <ul>
        <li>ID: <c:out value="${user.id}"/></li>
        <li>Email: <a href="mailto:${user.email}"><c:out value="${user.email}"/></a></li>
        <li>Name: <c:out value="${user.name }"/></li>
      </ul>
    </div>      

	  <div class="form-actions">
	    <a href="user" class="btn">ëª©ë¡ì¼ë¡</a>
 	    <a href="user?op=update&id=${user.id}" class="btn btn-primary">ìì </a>
      <a href="#" class="btn btn-danger" data-action="delete" data-id="${user.id}" >ì­ì </a>
    </div>
	<script>
	  $(function() {
	    $("a[data-action='delete']").click(function() {
	      if (confirm("ì ë§ë¡ ì­ì íìê² ìµëê¹?")) {
	        location = 'user?op=delete&id=' + $(this).attr('data-id');
	      }
	      return false;
	    });
	  });
	</script>  
  </div>
</body>
</html>