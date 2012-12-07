<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
</head>
<body>

<c:if test="${id == repin.user_id }">
<c:if test="${substance.id == repin.post_id }">
	
	<div class="row-fluid">

				<ul class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<li class="span4"
							style="width: 29.3%; margin: 2%; text-align: center"><a
							href="#myModal${bau.getSubstance().getId()}" class="thumbnail"
							data-toggle="modal" class="btn btn-primary btn-large"
							style="width: 450px; height: 336px;"> <c:out
									value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>

						<div id="myModal${bau.getSubstance().getId()}"
							class="modal hide fade" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="display: block;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h3 id="myModalLabel"
									style="text-align: center; font-size: 35px;">
									<c:out value="${bau.getSubstance().getSubject()}" />
								</h3>
							</div>
							<div class="modal-body">
								<div style="text-align: center">
									<a href="board?op=show&id=${bau.getSubstance().getId()}"> <c:out
											value="${bau.getSubstance().getImage()}" escapeXml="false" />
									</a>
								</div>
								<div style="float: right;">
									<b style="font-size: 15px;"><c:out
											value="${bau.getSubstance().getUser_id()}" /></b>
									<c:if test="${id!=null }">
										<img src="./upload/${bau.getUser().getPhotoUrl()}"
											style="width: 40px; height: 40px;" escapeXml="false">
									</c:if>
									<c:if test="${fbid!=null }">
									<img src="./upload/${bau.getFbUser().getPhotoUrl()}"
											style="width: 40px; height: 40px;" escapeXml="false">
									</c:if>
								</div>
								</div>
							</div>
					
					</c:forEach>
				</ul>
			</div>
</c:if>
</c:if>


</body>
</html>