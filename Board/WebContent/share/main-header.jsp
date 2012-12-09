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
		<li class="dropdown" id="menu1"><a class="dropdown-toggle" data-toggle="dropdown" href="#menu1"> 지역 <b	class="caret"></b>
		</a>
			<ul class="dropdown-menu">
				<li data-filter-camera-type="seoul"><a data-toggle="tab" href="#1" onclick="category(seoul)">서울</a></li>
				<li data-filter-camera-type="kyongki"><a data-toggle="tab" href="#2" onclick="category(kyongki)">경기도</a></li>
				<li data-filter-camera-type="kangwon"><a data-toggle="tab" href="#3" onclick="category(kangwon)">강원도</a></li>
				<li data-filter-camera-type="choongchung"><a data-toggle="tab" href="#4" onclick="category(choongchung)">충청도</a></li>
				<li data-filter-camera-type="junla"><a data-toggle="tab" href="#5" onclick="category(junla)">전라도</a></li>
				<li data-filter-camera-type="kyongsang"><a data-toggle="tab" href="#6" onclick="category(kyongsang)">경상도</a></li>
				<li data-filter-camera-type="jeju"><a data-toggle="tab" href="#7" onclick="category(jeju)">제주도</a></li>
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
