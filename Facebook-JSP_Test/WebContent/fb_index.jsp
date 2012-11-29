<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					Total <b>${fbuser.numItems }</b>
				</div>
				<div class="pull-right">
					<b>${fbuser.page }</b> page / total <b>${fbuser.numPages }</b> pages
				</div>
			</div>
		</div>
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>Id</th>
					<th>FacebookNumber</th>
					<th>UserID</th>
					<th>PhotoUrl</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fbuser" items="${fbusers.list}">
					<tr>
						<td><a href="fbuser?id=${fbuser.id}"><c:out
									value="${fbuser.id}" /></a></td>
						<td><c:out value="${fbuser.fbId}" /></td>
						<td><c:out value="${fbuser.userid}" /></td>
						<td><c:out value="${fbuser.photoUrl}" /></td>
						<td><a href="fbuser?op=update&id=${fbuser.id}"
							class="btn btn-mini btn-danger" data-action="delete"
							data-id="${fbuser.id}">delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<jsp:include page="page.jsp">
			<jsp:param name="currentPage" value="${fbusers.page}" />
			<jsp:param name="url" value="fbuser" />
			<jsp:param name="startPage" value="${fbusers.startPageNo}" />
			<jsp:param name="endPage" value="${fbusers.endPageNo}" />
			<jsp:param name="numPages" value="${fbusers.numPages}" />
		</jsp:include>

	</div>
	<jsp:include page="./share/footer.jsp" />
</body>
<script>
	$(function() {
		$("a[data-action='delete']").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location = 'fbuser?op=delete&id=' + $(this).attr('data-id');
			}
			return false;
		});
	});
</script>
</html>