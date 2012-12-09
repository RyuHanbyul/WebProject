<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=63011caffd3d90523d444d7f743d03e72310aedb" charset="utf-8"></script>  
<script src="./js/jquery-1.8.3.js"></script>
<script language="Javascript" type="text/javascript">
    var markId;
    var markIds = new Array();
    var shoppingIcon = new daum.maps.MarkerImage( //shoppig
                './img/shopping.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
                
    );
    var movieIcon = new daum.maps.MarkerImage( //movie
                './img/movie.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var cafeIcon = new daum.maps.MarkerImage( //cafe
                './img/cafe.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var foodIcon = new daum.maps.MarkerImage( //food
                './img/food.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var motelIcon = new daum.maps.MarkerImage( //motel
                './img/motel.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    var sightsIcon = new daum.maps.MarkerImage( //sights
                './img/sights.jpg',
                new daum.maps.Size(30, 45),
                new daum.maps.Point(16,45),"poly",
                "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );
    /** 다음 Map **/  
    var daumMap = {   
        init : function(lat,lng){  
            this.map =  new daum.maps.Map(document.getElementById('daumMapView'), {  
                center: new daum.maps.LatLng(lat,lng),  
                level:7
            });  
            this.zoomControl = new daum.maps.ZoomControl();      
            this.map.addControl(this.zoomControl, daum.maps.ControlPosition.RIGHT);      
            this.mapTypeControl = new daum.maps.MapTypeControl();      
            this.map.addControl(this.mapTypeControl, daum.maps.ControlPosition.TOPRIGHT); 

            
        },  
        searchMark : function(lat,lng){  
            var po = new daum.maps.LatLng(lat, lng);  
            this.map.panTo(po);  
            this.marker.setPosition(new daum.maps.LatLng(lat,lng));  
        }
    }; 
    var markPoints = new Array();
    var mark = {
        spot : function(markId,lat,lng){
            var point = new daum.maps.LatLng(lat,lng);
            if(markId=="f"){
                new daum.maps.Marker({position : point, image:foodIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="c"){
                new daum.maps.Marker({position : point, image:cafeIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="m"){
                new daum.maps.Marker({position : point, image:movieIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="s"){
                new daum.maps.Marker({position : point, image:shoppingIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="t"){
                new daum.maps.Marker({position : point, image:motelIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else if(markId=="i"){
                new daum.maps.Marker({position : point, image:sightsIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }else{
                new daum.maps.Marker({position : point, image:foodIcon}).setMap(daumMap.map);
                markPoints.push(point);
                this.line();
            }
        },
        line : function(){
            
            var line = new daum.maps.Polyline();
            line.setPath(markPoints);
            line.setMap(daumMap.map);
        }
    };
</script>  