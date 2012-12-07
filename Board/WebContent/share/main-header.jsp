<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 65px; float: right">
	<p>
		<c:choose>
			<c:when test="${id!=null || fbid!=null }">
				<a class="btn btn-small" href="board?op=signup">글쓰기</a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-small" href="./login.jsp">글쓰기</a>
			</c:otherwise>
		</c:choose>
	</p>
</div>
<div style="width: 45%;float:right">
	<ul class="nav nav-pills">
		<li class="dropdown" id="menu1"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#menu1"> 
			지역 <b	class="caret"></b>
		</a>
			<ul class="dropdown-menu">
				<li data-filter-camera-type="seoul"><a onclick="category(seoul)" data-toggle="tab"
					href="#1">서울</a></li>
				<li data-filter-camera-type="kyongki"><a onclick="category(kyongki)" data-toggle="tab"
					href="#2">경기도</a></li>
				<li data-filter-camera-type="kangwon"><a onclick="category(kangwon)" data-toggle="tab"
					href="#3">강원도</a></li>
				<li data-filter-camera-type="choongchung"><a onclick="category(choongchung)" data-toggle="tab"
					href="#4">충청도</a></li>
				<li data-filter-camera-type="junla"><a onclick="category(junla)"data-toggle="tab"
					href="#5">전라도</a></li>
				<li data-filter-camera-type="kyongsang"><a onclick="category(kyongsang)"data-toggle="tab"
					href="#6">경상도</a></li>
				<li data-filter-camera-type="jeju"><a onclick="category(jeju)"data-toggle="tab"
					href="#7">제주도</a></li>
			</ul></li>
	</ul>
</div>
<div style="width:70px; float:right">
	<ul class="nav nav-pills">
		<li class="dropdown all-camera-dropdown"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#"> 정렬 <b
				class="caret"></b>
		</a>
			<ul class="dropdown-menu">
				<li data-filter-camera-type="seoul"><a data-toggle="tab"
					href="#">신규글</a></li>
				<li data-filter-camera-type="kyongki"><a data-toggle="tab"
					href="#">인기글</a></li>
			</ul></li>
	</ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".dropdown-toggle").dropdown();
});
</script>