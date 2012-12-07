<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="daumLocalForm">
    <input id="daumLocalSearch" type="text" value="삼평동" onkeydown="javascript:if(event.keyCode == 13) local();"/>
    <input id="daumLocalSubmit" type="button" value="검색" onclick="local()"/>
</div >
<div id="daumLocalView" style="overflow-x:hidden; overflow-y:scroll;height:100px; padding:10px;"></div>
<div id="markButton" style="height:55px;">
    <button type="button" class="icon" id="f" style="width:35px;height:50px;float:left;background-image:url('./img/food.jpg')"></button> <!-- food -->
    <button type="button" class="icon" id="c" style="width:35px;height:50px;float:left;background-image:url('./img/cafe.jpg')"></button><!-- cafe -->
    <button type="button" class="icon" id="m" style="width:35px;height:50px;float:left;background-image:url('./img/movie.jpg')"></button><!-- movie -->
    <button type="button" class="icon" id="s" style="width:35px;height:50px;float:left;background-image:url('./img/shopping.jpg')"></button><!-- shopping -->
    <button type="button" class="icon" id="t" style="width:35px;height:50px;float:left;background-image:url('./img/motel.jpg')"></button><!-- motel -->
    <button type="button" class="icon" id="i" style="width:35px;height:50px;float:left;background-image:url('./img/sights.jpg')"></button><!-- sights -->
		<button type="button" class="btn" style="float:right" onclick="refresh()">지도새로고침</button>
</div>
<div id="daumLocalScript"></div>
<div id="daumMapView" style="height:350px;"></div>
<c:choose>
  <c:when test="${method == 'PUT'}">
 		<jsp:include page="./putMapJs.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="./mapJs.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
<script>
function local(){
	daumLocalSearch.search();
};
function refresh(){
	var lat = daumMap.map.getCenter().getLat();
	var lng = daumMap.map.getCenter().getLng();
	daumMap.init(lat,lng);
	markPoints = new Array();
	markIds = new Array();
}
</script>