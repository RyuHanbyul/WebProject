<div id="daumLocalForm">
    <input id="daumLocalSearch" type="text" value="삼평동" onkeydown="javascript:if(event.keyCode == 13) daumLocalSearch.search();"/>
    <input id="daumLocalSubmit" type="submit" value="검색" onclick="javascript:daumLocalSearch.search()"/>
</div >
<div id="daumLocalView" style="overflow-x:hidden; overflow-y:scroll; width:860px; height:100px; padding:10px;"></div>
<div id="markButton" style="width:860px;height:55px;">
    <button type="button" class="icon" id="foodIcon" style="width:35px;height:50px;float:left;background-image:url('./img/food.jpg')"></button>
    <button type="button" class="icon" id="cafeIcon" style="width:35px;height:50px;float:left;background-image:url('./img/cafe.jpg')"></button>
    <button type="button" class="icon" id="movieIcon" style="width:35px;height:50px;float:left;background-image:url('./img/movie.jpg')"></button>
    <button type="button" class="icon" id="shoppingIcon" style="width:35px;height:50px;float:left;background-image:url('./img/shopping.jpg')"></button>
    <button type="button" class="icon" id="motelIcon" style="width:35px;height:50px;float:left;background-image:url('./img/motel.jpg')"></button>
    <button type="button" class="icon" id="sightsIcon" style="width:35px;height:50px;float:left;background-image:url('./img/sights.jpg')"></button>
</div>
<div id="daumMapView" style="width:860px;height:350px;"></div>  
<div id="daumLocalScript"></div>
<jsp:include page="./mapJs.jsp"></jsp:include>