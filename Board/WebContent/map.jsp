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
		<!--a style="float:right" class="btn btn-small" onclick=local()>주소검색</a-->
</div>
<div id="daumLocalScript"></div>
<div id="daumMapView" style="height:350px;"></div>  
<jsp:include page="./mapJs.jsp"></jsp:include>
<script>
function local(){
	
	daumLocalSearch.search();
	
}
</script>