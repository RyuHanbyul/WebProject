<div id="daumLocalForm">
    <input id="daumLocalSearch" type="text" value="삼평동" onkeydown="javascript:if(event.keyCode == 13) daumLocalSearch.search();"/>
    <input id="daumLocalSubmit" type="submit" value="검색" onclick="javascript:daumLocalSearch.search()"/>
</div >
<div id="daumLocalView" style="overflow-x:hidden; overflow-y:scroll;height:100px; padding:10px;"></div>
<div id="daumLocalScript"></div>
<jsp:include page="./mapJs.jsp"></jsp:include>