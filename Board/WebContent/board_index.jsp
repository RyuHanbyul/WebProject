<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<jsp:include page="./share/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./share/header.jsp" />
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
					<th style="width: 10%; text-align: center;">Number</th>
					<th style="width: 10%; text-align: center;">Category</th>
					<th style="width: 70%; text-align: center;">Subject</th>
					<th style="width: 70%; text-align: center;">UserID</th>
					<!-- th style="width:20%; text-align:center;">Name</th-->
					<!-- <th></th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="substance" items="${sub.list }">
					<tr>
						<td style="text-align: center;"><c:out
								value="${substance.id}" /></td>
						<td style="text-align: center;"><c:out
								value="${substance.category}" /></td>
						<td><a href="board?op=show&id=${substance.id}"><c:out
									value="${substance.subject}" /></a></td>
						<td style="text-align: center;"><c:out
								value="${substance.user_id}" /></td>
						<!-- <td><a href="user?op=update&id=${user.id}"
						class="btn btn-mini">modify</a> <a href="#"
						class="btn btn-mini btn-danger" data-action="delete"
						data-id="${user.id}">delete</a></td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<jsp:include page="./page.jsp">
			<jsp:param name="currentPage" value="${sub.page}" />
			<jsp:param name="url" value="board" />
			<jsp:param name="startPage" value="${sub.startPageNo}" />
			<jsp:param name="endPage" value="${sub.endPageNo}" />
			<jsp:param name="numPages" value="${sub.numPages}" />
		</jsp:include>

		<div class="form-action">
				<c:choose>
					<c:when test="${id!=null || fbid!=null }">
						<a class="btn btn-primary" href="board?op=signup">Write</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="./login.jsp">Write</a>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
	<jsp:include page="./share/footer.jsp" />
</body>
</html>