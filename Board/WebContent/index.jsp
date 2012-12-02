<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./share/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./share/header.jsp"></jsp:include>
<!-- 관리자의 회원 관리 페이지 -->
  <div class="container">
 		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					Total <b>${users.numItems }</b> 
				</div>
				<div class="pull-right">
					<b>${users.page }</b> page / total <b>${users.numPages}</b> pages
				</div>
 			</div>
 		</div>
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Email</th>
					<th>UserID</th>
					<th>PhotoUrl</th>
					<th></th>
				</tr>
			</thead>  
			<tbody>
			<c:forEach var="user" items="${users.list }">
				<tr>
					<td><a href="user?id=${user.id}"><c:out value="${user.id}"/></a></td>
					<td><c:out value="${user.email}"/></td>
					<td><c:out value="${user.userid}"/></td>
					<td><c:out value="${user.photoUrl}"/></td>
					<td><a href="user?op=update&id=${user.id}"
						class="btn btn-mini btn-danger" data-action="delete"
						data-id="${user.id}">delete</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table> 

    <jsp:include page="page.jsp">
      <jsp:param name="currentPage" value="${users.page}"/>
      <jsp:param name="url" value="user"/>
      <jsp:param name="startPage" value="${users.startPageNo}"/>
      <jsp:param name="endPage" value="${users.endPageNo}"/>
      <jsp:param name="numPages" value="${users.numPages}"/>
    </jsp:include>
	
  </div>
<jsp:include page = "./share/footer.jsp" />
</body>
<script>
$(function(){
	$("a[data-action='delete']").click(function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location = 'user?op=delete&id=' + $(this).attr('data-id');
		}
		return false;
	});
});
</script>
</html>