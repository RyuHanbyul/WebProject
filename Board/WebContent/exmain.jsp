<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./share/link.jsp"></jsp:include>
<!-- 연습용!!!! 페이스북 Like -->

</head>
<body>

	<div id="wrap">
		<jsp:include page="./share/header.jsp"></jsp:include>
		<div class="main-top">
			<jsp:include page="./share/main-header.jsp"></jsp:include>
		</div>

		<div id="content">
			<div id="fb-root"></div>
			<script>
				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=560735563942173";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<div id="category" class="row-fluid">
				<ul id="total" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<li class="span4"
							style="width: 29.3%; margin: 2%; text-align: center"><a
							href="#totalmyModal${bau.getSubstance().getId()}"
							class="thumbnail" data-toggle="modal"
							class="btn btn-primary btn-large"
							style="width: 450px; height: 336px;"> <c:out
									value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>

						<div id="totalmyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>

				<ul id="pin" class="thumbnails">
					<c:forEach var="pin" items="${pins}">
						<li class="span4"
							style="width: 29.3%; margin: 2%; text-align: center"><a
							href="#pinmyModal${pin.getSubstance().getId()}" class="thumbnail"
							data-toggle="modal" class="btn btn-primary btn-large"
							style="width: 450px; height: 336px;"> <c:out
									value="${pin.getSubstance().getImage()}" escapeXml="false" /></a></li>

						<div id="pinmyModal${pin.getSubstance().getId()}"
							class="modal hide fade" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="display: block;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h3 id="myModalLabel"
									style="text-align: center; font-size: 35px;">
									<c:out value="${pin.getSubstance().getSubject()}" />
								</h3>
							</div>
							<div class="modal-body">
								<div style="text-align: center">
									<a href="board?op=show&id=${pin.getSubstance().getId()}"> <c:out
											value="${pin.getSubstance().getImage()}" escapeXml="false" />
									</a>
								</div>
								<div style="float: right;">
									<b style="font-size: 15px;"><c:out
											value="${pin.getSubstance().getUser_id()}" /></b>
									<c:choose>
										<c:when test="${pin.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${pin.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${pin.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</ul>

				<ul id="seoul" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"서울\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#seoulmyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>


						<div id="seoulmyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
				<ul id="kyongki" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"경기도\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#kyongkimyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>

						<div id="kyongkimyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
				<ul id="kangwon" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"강원도\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#kangwonmyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>

						<div id="kangwonmyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
				<ul id="choongchung" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"충청도\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#choongchungmyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>

						<div id="choongchungmyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
				<ul id="junla" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"전라도\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#junlamyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>

						<div id="junlamyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
				<ul id="kyongsang" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"경상도\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#kyongsangmyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>

						<div id="kyongsangmyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
				<ul id="jeju" class="thumbnails">
					<c:forEach var="bau" items="${baus}">
						<c:if test="${bau.getSubstance().getCategory()==\"제주\"}">
							<li class="span4"
								style="width: 29.3%; margin: 2%; text-align: center"><a
								href="#jejumyModal${bau.getSubstance().getId()}"
								class="thumbnail" data-toggle="modal"
								class="btn btn-primary btn-large"
								style="width: 450px; height: 336px;"> <c:out
										value="${bau.getSubstance().getImage()}" escapeXml="false" /></a></li>
						</c:if>

						<div id="jejumyModal${bau.getSubstance().getId()}"
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
									<c:choose>
										<c:when test="${bau.getUser().getPhotoUrl()!=null }">
											<img src="./upload/${bau.getUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:when>
										<c:otherwise>
											<img src="${bau.getFbUser().getPhotoUrl()}"
												style="width: 40px; height: 40px;">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#category>ul").hide();
		$("#total").show();
	});
	function category(categoryName) {
		$("#category>ul").hide();
		$(categoryName).show();
	}
</script>
</html>