<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
  <div class="container">
 		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					Total <b>${sub.numItems }</b> content
				</div>
				<div class="pull-right">
					<b>${sub.page }</b> page / total <b>${sub.numPages }</b> pages
				</div>
 			</div>
 		</div>
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th style="width:10%; text-align:center;">Number</th>
					<th style="width:70%; text-align:center;">subject</th>
					<!-- th style="width:20%; text-align:center;">Name</th-->
					<!-- <th></th> -->
				</tr>
			</thead>
			<tbody>
			<c:forEach var="substance" items="${sub.list }">
				<tr>
					<td style="text-align:center;"><c:out value="${substance.id}"/></td>
					<td><a href="board?id=${substance.id}"><c:out value="${substance.subject}"/></td>
					<!-- <td><a href="user?op=update&id=${user.id}"
						class="btn btn-mini">modify</a> <a href="#"
						class="btn btn-mini btn-danger" data-action="delete"
						data-id="${user.id}">delete</a></td> -->
				</tr>
			</c:forEach>
			</tbody>
		</table> 

    <jsp:include page="./page.jsp">
      <jsp:param name="currentPage" value="${sub.page}"/>
      <jsp:param name="url" value="board"/>
      <jsp:param name="startPage" value="${sub.startPageNo}"/>
      <jsp:param name="endPage" value="${sub.endPageNo}"/>
      <jsp:param name="numPages" value="${sub.numPages}"/>
    </jsp:include>

		<div class="form-action">
			<a href="board?op=signup" class="btn btn-primary">Write</a>
		</div>	 	
  </div>
<jsp:include page = "./share/footer.jsp" />
</body>
</html>