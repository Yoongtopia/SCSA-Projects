

<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=e884819be47db73bb0384b4749511ccf"></script>
</head>
<body>
<p style="display: none;" id="mapX">${eventDetail.mapX }</p>
<p style="display: none;" id="mapY">${eventDetail.mapY }</p>
<div id = "testMap" style="width:811px; height:360px; margin:20px 0; display: inline-block;">
<script type="text/javascript">
			
			var mapX = $("#mapX").text();
			console.log(mapX);
			var mapY = $("#mapY").text();
			console.log(mapY);
            var oCenterPoint = new nhn.api.map.LatLng(mapY, mapX);
            nhn.api.map.setDefaultPoint('LatLng');
            oMap = new nhn.api.map.Map('testMap' ,{
                        point : oCenterPoint,
                        zoom : 10,
                        enableWheelZoom : false,
                        enableDragPan : true,
                        enableDblClickZoom : false,
                        mapMode : 0,
                        activateTrafficMap : false,
                        activateBicycleMap : false,
                        minMaxLevel : [ 1, 14 ],
                        size : new nhn.api.map.Size(811, 350),
           			

                    });
            		
            var markerCount = 0; 
			var oSize = new nhn.api.map.Size(28, 37); 
			var oOffset = new nhn.api.map.Size(14, 37); 
			var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
             
			var mapInfoTestWindow = new nhn.api.map.InfoWindow(); 
            mapInfoTestWindow.setVisible(false); 
            oMap.addOverlay(mapInfoTestWindow);
            
            var oLabel = new nhn.api.map.MarkerLabel(); 
            oMap.addOverlay(oLabel); 

            
            var oMarker = new nhn.api.map.Marker(oIcon, { title : '위치 : ' + oCenterPoint.toString() });
            oMarker.setPoint(oCenterPoint);
            oMap.addOverlay(oMarker);
            
			var mapZoom = new nhn.api.map.ZoomControl(); 
			mapZoom.setPosition({left:10, bottom:60}); 
			oMap.addControl(mapZoom); 
			mapTypeChangeButton = new nhn.api.map.MapTypeBtn(); 
			mapTypeChangeButton.setPosition({top:10, left:10}); 
			oMap.addControl(mapTypeChangeButton); 

</script> 
</div>

</body>
</html>