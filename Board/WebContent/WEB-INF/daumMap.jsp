<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=1928f72f40d278c51cbab768127fce3405e93f9c" charset="utf-8"></script>  
<script src="jquery-1.8.2.min.js"></script>
<script language="Javascript" type="text/javascript">
    var markId;
    var shoppingIcon = new daum.maps.MarkerImage(
                './images/shopping.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var movieIcon = new daum.maps.MarkerImage(
                './images/movie.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var cafeIcon = new daum.maps.MarkerImage(
                './images/cafe.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var foodIcon = new daum.maps.MarkerImage(
                './images/food.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var motelIcon = new daum.maps.MarkerImage(
                './images/motel.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var sightsIcon = new daum.maps.MarkerImage(
                './images/sights.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var daumLocalSearch = {  
        /** 초기화. **/  
        init : function(){  
            this.apikey = "9d9581984f3a03336e2feea265e7a0341e2f737b"  
            this.q = document.getElementById('daumLocalSearch');  
            this.v = document.getElementById('daumLocalView');  
            this.s = document.getElementById('daumLocalScript');  
        },  
        /** 검색 **/  
        search : function(){  
            this.query = '?apikey=' + this.apikey + '&output=json&q=' + encodeURI(this.q.value);  
              
            //검색어에 맞게 각각 첫페이지를 띄움.  
            this.pingSearch(1);  
        },  
        /** callback 함수 호출. **/  
        pingSearch : function(ds, api, pgno, callback, result){  
            this.s.innerHTML = "";  
              
            var s = document.createElement('script');  
            s.type = 'text/javascript';  
            s.charset = 'utf-8';  
            s.src = 'http://apis.daum.net/local/geo/addr2coord' + this.query +  '&callback=daumLocalSearch.pongSearch&result=50';   
              
            this.s.appendChild(s);  
        },  
        /** 결과를 뿌려줌. **/  
        pongSearch : function(z){  
            this.v.innerHTML ="";  
            var ul = document.createElement('ul');  
              
            for(var i=0; i<z.channel.item.length; i++){  
                var li = document.createElement('li');  
                var a = document.createElement('a');  
             
               a.href = 'javascript:daumMap.searchMark(' + z.channel.item[i].point_y + ',' + z.channel.item[i].point_x + ')';  
               a.innerHTML = daumLocalSearch.escapeHtml(z.channel.item[i].title)  
              
                li.appendChild(a);  
                ul.appendChild(li);  
            }  
  
            this.v.appendChild(ul);  
        },  
          
        /** HTML태그 안 먹게 하는 함수 **/  
        escapeHtml: function (str) {  
            str = str.replace(/&amp;/g, "&");  
            str = str.replace(/&lt;/g, "<");  
            str = str.replace(/&gt;/g, ">");  
            return str;  
        }  
    };  
    /** 다음 Map **/  
    var daumMap = {   
        init : function(lat,lng){  
            this.map =  new daum.maps.Map(document.getElementById('daumMapView'), {  
                center: new daum.maps.LatLng(lat,lng),  
                level:4  
            });  
            this.zoomControl = new daum.maps.ZoomControl();      
            this.map.addControl(this.zoomControl, daum.maps.ControlPosition.RIGHT);      
            this.mapTypeControl = new daum.maps.MapTypeControl();      
            this.map.addControl(this.mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);  
            this.marker = new daum.maps.Marker({position: new daum.maps.LatLng(lat, lng)});  
            this.marker.setMap(this.map);
            daum.maps.event.addListener(this.map,"click",function(MouseEvent){
                var latlng = MouseEvent.latLng;
                var marklat = latlng.getLat();
                var marklng = latlng.getLng();
                mark.spot(marklat,marklng);
            });
        },  
        searchMark : function(lat,lng){  
            var po = new daum.maps.LatLng(lat, lng);  
            this.map.panTo(po);  
            this.marker.setPosition(new daum.maps.LatLng(lat,lng));  
        }
    }  
    window.onload = function () {  
        daumMap.init(37.566419230900905,126.97787415510291);  
        daumLocalSearch.init();  
        daumLocalSearch.search(); 
    };
    var markPoints = new Array();
    var mark = {
        spot : function(lat,lng){
            var point = new daum.maps.LatLng(lat,lng);
            if(markId=="foodIcon"){
                new daum.maps.Marker({position : point, image:foodIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="cafeIcon"){
                new daum.maps.Marker({position : point, image:cafeIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="movieIcon"){
                new daum.maps.Marker({position : point, image:movieIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="shoppingIcon"){
                new daum.maps.Marker({position : point, image:shoppingIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="motelIcon"){
                new daum.maps.Marker({position : point, image:motelIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="sightsIcon"){
                new daum.maps.Marker({position : point, image:sightsIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }
        },
        line : function(){
            var line = new daum.maps.Polyline();
            line.setPath(markPoints);
            line.setMap(daumMap.map);
        }

    }
    $(function(){
        $(".icon").click(function(){
            markId = $(this).attr("id");
        });
    });
</script>  
<div id="daumLocalForm">
    <input id="daumLocalSearch" type="text" value="삼평동" onkeydown="javascript:if(event.keyCode == 13) daumLocalSearch.search();"/>
    <input id="daumLocalSubmit" type="submit" value="검색" onclick="javascript:daumLocalSearch.search()"/>
</div >
<div id="daumLocalView" style="overflow-x:hidden; overflow-y:scroll; width:860px; height:100px; padding:10px;"></div>
<div id="markButton" style="width:860px;height:55px;">
    <button class="icon" id="foodIcon" style="width:35px;height:50px;float:left;background-image:url('./images/food.jpg')"></button>
    <button class="icon"id="cafeIcon" style="width:35px;height:50px;float:left;background-image:url('./images/cafe.jpg')"></button>
    <button class="icon"id="movieIcon" style="width:35px;height:50px;float:left;background-image:url('./images/movie.jpg')"></button>
    <button class="icon"id="shoppingIcon" style="width:35px;height:50px;float:left;background-image:url('./images/shopping.jpg')"></button>
    <button class="icon"id="motelIcon" style="width:35px;height:50px;float:left;background-image:url('./images/motel.jpg')"></button>
    <button class="icon"id="sightsIcon" style="width:35px;height:50px;float:left;background-image:url('./images/sights.jpg')"></button>
</div>
<div id="daumMapView" style="width:860px;height:350px;"></div>  
<div id="daumLocalScript"></div>