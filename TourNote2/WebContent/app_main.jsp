<%@page import="java.util.List"%>
<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="com.scsa.wapl.entity.TravelSpot"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/bootstrap4.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&language=ko"></script>
<script type="text/javascript" src="./js/jssor.core.js"></script>
<script type="text/javascript" src="./js/jssor.utils.js"></script>
<script type="text/javascript" src="./js/jssor.slider.js"></script>
<script type="text/javascript">
var recordNum=<%= session.getAttribute("recordNum")%>	
	$(function(){
		$("#timeLinePage").hide();
		$("#recordBtn").click(recordTypeSelect);
		$("#recordStopBtn").click(recordStop);
 		$("#timeLine").click(timeLineCheck);
 		$("#uploadBySelect").click(selectPosition);
 		$("#uploadByCurrent").click(selectCurrent);
		$("#uploadByPhoto").click(selectPhoto);
		google.maps.event.addDomListener(window, 'load', getfirstLocation);
		
		if(recordNum != null){
			updateTimer();
			setInterval(updateTimer, 60000);  
			$("#timerCont").css("border", "2px solid white");
			
		} else {

		}
		
	});
	
	function updateTimer(){
		$.get("${pageContext.request.contextPath}/time_set.do",
				function(jsonObj){
					var days=jsonObj.days;
					var hours=jsonObj.hours;
					var minutes=jsonObj.minutes;
					$("#timerCont").text(days+"Day, "+hours+"H, "+minutes+"Min");
		});
	}
	
	// 세션에 기록번호 없을 때만 새로운 레코드 시작
	function recordTypeSelect(){
		if (recordNum == null){
			var href="${pageContext.request.contextPath}/record_start2.do";
			location.replace(href);
		} else {
			alert("기록을 진행 중에 있습니다. 새로운 기록을 원하시면 진행 중인 기록을 종료해주세요.");
		}
	}
	
	// 세션에 기록번호 있을 때만 기록 종료
	function recordStop(){
		if (recordNum != null){
			var href="${pageContext.request.contextPath}/end_check2.do";
			location.replace(href);
		} else {
			alert("진행 중인 기록이 없습니다.");
		}
	}
	
	var map;
	var myLatlng;
	
	// 현재 위치로 첫 페이지 로딩
	function getfirstLocation() {
		// navigator는 브라우저
		if (navigator.geolocation) {
			var options = {
				timeout : 60000
			};
			navigator.geolocation.getCurrentPosition(initialize, errorHandler,
					options);
		} else {
			alert("Sorry, browser does not support geolocation!");
		}
	}

	// 현재 위치 로딩 실패시 에러창
	function errorHandler(err) {
		if (err.code == 1) {
			alert("Error: Access is denied!");
		} else if (err.code == 2) {
			alert("Error: Position is unavailable!");
		}
	}

	// 페이지 첫 로딩시 지도 로딩
	function initialize(position) {
		$("#slider1_container").hide();
/* 		$("#timeLinePage").hide(); */
/* 		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude; */
		var avgLatitude="${latitude}";
 		var avgLongitude="${longitude}";
  		var latitude;
 		var longitude;
 		if (avgLatitude == "" || (avgLatitude == "0.0" && avgLongitude == "0.0")){
			latitude = position.coords.latitude;
			longitude = position.coords.longitude;
 		} else {
 			latitude = avgLatitude;
			longitude = avgLongitude;
 		}
		
		myLatlng = new google.maps.LatLng(latitude, longitude);
		var mapOptions = {
			scaleControl : true,
			center : myLatlng,
			zoom : 12
		};

		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		
		var markers = [
						<% ArrayList<TravelSpot> spotList=(ArrayList<TravelSpot>)request.getAttribute("spotList");
						
						if (spotList != null){
						for (TravelSpot spot : spotList){ %>
									{	lat: <%=spot.getSpotLatitude()%> , lng: <%=spot.getSpotLongitude()%>,
									name: "<%=spot.getSpotTitle()%>",
									info: "<h5><b><%=spot.getSpotTitle()%></b></h5><p><%= spot.getSpotCont()%></p><form method='post' action='${pageContext.request.contextPath}/delete_spot2.do'><input type='submit' value='삭제'><input type='hidden' id='spotNum' name='spotNum' value=<%=spot.getSpotNum()%>></form>"
									}
						<% if (spotList.get(spotList.size() -1) != spot) {%>
									,
						
						<%}}}%>
						];
		for (index in markers) addMarker(markers[index]);
		
	}
	
 	function timeLineCheck() {
		$("#map-canvas").hide();
		$("#timeLinePage").show();
<%--  		<% if (spotList != null){
			for (TravelSpot spot : spotList){ %>
		var span = $("<span/>").text("<%=spot.getSpotTime()%> >> ");
 		$("#viewTimeLine").append(span);
		<% } } %> 
 		$("#viewTimeLine").show(); --%>
	};
	
	function addMarker(data) {
 		var marker = new google.maps.Marker({
 							position: new google.maps.LatLng(data.lat, data.lng),
 							map: map,
 							draggable:false, // Bounce
							/* animation: google.maps.Animation.BOUNCE // Bounce */
 					});

 		var contentString = data.info;

 		var infowindow = new google.maps.InfoWindow({ content: contentString});

 		google.maps.event.addListener(marker, "click", function() {
						marker.setAnimation(null); 
 						infowindow.open(map,marker);
 						$("#slider1_container").show();
 						
 						<% 
 						List<Photo> pList = (ArrayList<Photo>)request.getAttribute("pList");
 						if(pList != null) {
 						for(Photo pp : pList) { %>
 						var pDiv = $("<div>").attr("id","picture").attr("class","picture");
 						var img = $("<img>").attr("u", "thumb").attr("width", "100px").attr("height", "100px").attr("src", "${pageContext.request.contextPath}/image/<%=pp.getPhotoName()%>");
 						pDiv.append(img);
 						$("#pictureDiv").append(pDiv);
 						<% } } %>
 					 	/* var a = $("<div>").attr("u", "prototype").attr("id", "prototype").attr("class", "p").attr("style", "POSITION: absolute; WIDTH: 99px; HEIGHT: 66px; TOP: 0; LEFT: 0;");
 						var b = $("<thumbnailtemplate>").attr("class", "i").attr("style", "position:absolute;");
 						var c = $("<div>").attr("class", "o");
 	                    var d = b.append(c);
 						a.append(d); */ 
 						
 						jssor_slider1_starter('slider1_container');
 		});
 
 		google.maps.event.addListener(marker, "click", function() {
 					 /* removeMark();  */
 		});
 	}

	// 직접 위치 지정하여 업로드
	function selectPosition() {
		if (recordNum != null){
			//클릭했을 때 이벤트
			google.maps.event.addListener(map,'click',function(event) {
								/* placeMarker(event.latLng); */
								infowindow.setContent("<form action='${pageContext.request.contextPath}/uploadCont_view2.do'><br>이곳에 여행 기록을 등록하시겠습니까?<br/><input type='submit' value='등록' id='regist'><input type='hidden' id='latitude' name='latitude'><input type='hidden' id='longitude' name='longitude'><input type='hidden' id='uploadType' name='uploadType' value='selectUpload'></form>"); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
								$("#latitude").val(event.latLng.lat());
								$("#longitude").val(event.latLng.lng());
								infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
							});
			// 클릭 했을때 이벤트 끝
			// 인포윈도우의 생성
			var infowindow = new google.maps.InfoWindow({
				content : '<br>여행 기록을 등록할 위치를 클릭하세요',
				size : new google.maps.Size(50, 50),
				position : myLatlng
			});
	
			infowindow.open(map);
		} else {
			alert("레코드 버튼을 눌러 여행 기록을 시작해주세요.");
		}
	} // function initialize() 함수 끝

	// 마커 생성 합수
	function placeMarker(location) {
		var clickedLocation = new google.maps.LatLng(location);
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
		map.setCenter(location);
	}
	
 	// 사진 위치 업로드 페이지로 이동
	function selectPhoto() {
		if (recordNum != null){
			var href="${pageContext.request.contextPath}/uploadCont_view2.do?uploadType=photoUpload";
			location.replace(href);
		} else {
			alert("레코드 버튼을 눌러 여행 기록을 시작해주세요.");
		}
	} 
	
	// 현재 위치로 업로드
	function selectCurrent(){
		if (recordNum != null){
			if(navigator.geolocation){
				var options = {timeout:60000};
				navigator.geolocation.getCurrentPosition(currentLocation,errorHandler,options);
			}else{
				alert("Sorry, browser does not support geolocation!");
			}
		} else {
			alert("레코드 버튼을 눌러 여행 기록을 시작해주세요.");
		}
	}
	
	function currentLocation(position) {
		
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
				
 		var href="${pageContext.request.contextPath}/uploadCont_view2.do?latitude="
 				+latitude+"&longitude="+longitude+"&uploadType=currentUpload";
		location.replace(href);
/* 		$("#currentLocationhref").attr("href",href); */
	}
	
	//사진 슬라이드
    jssor_slider1_starter = function (containerId) {
        var options = {
            /* $AutoPlay: true, */                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
          	/* $AutoPlayInterval: 4000, */                          //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
            /* $SlideDuration: 500, */                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
            /* $DragOrientation: 3, */                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

            $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                $Loop: 2,                                       //[Optional] Enable loop(circular) of carousel or not, 0: stop, 1: loop, 2 rewind, default value is 1
                $SpacingX: 3,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                $SpacingY: 3,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                $DisplayPieces: 6,                              //[Optional] Number of pieces to display, default value is 1
                $ParkingPosition: 204,                          //[Optional] The offset position to park thumbnail,

                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 6                                       //[Optional] Steps to go for each navigation request, default value is 1
                }
            }
        };

        var jssor_slider1 = new $JssorSlider$(containerId, options);

    };
</script>

</head>
<body>

<div style="width:90%; height:100%; margin: 0 auto" id="media">

<div style="height:70px;"></div>

<!-- 레코드, 정지, 타임코드, 타임라인 버튼 -->
<table width="100%" class="topBtn">
<tr>
<td class="topBtn1" align="left">
<img class="topBtn" src="./images/record/Record-record.png" id="recordBtn"/>
<img class="topBtn" src="./images/record/Record-stop.png" id="recordStopBtn"/></td>
<td class="topBtn2" align="left" id="timerCont"></td>

<td class="topBtn1" width="200px" align="right"><img class="topBtn" src="./images/record/app_timeLine.png"/></td>
</table>

<div style="height:10px;"></div>

<!-- 지도 -->
<div>
<div class="mapDiv" style="width:100%; margin: 0 auto" id="map-canvas" ></div>
</div>
<script type="text/javascript">
 if (recordNum != null){
	navigator.geolocation.watchPosition(function(position){
		var latitude=position.coords.latitude;
		var longitude=position.coords.longitude;

		//비동기로 db에 바뀐 위치 저장하고, 저장된 모든 위치 가져와서 선으로 이어주기
		$.get("${pageContext.request.contextPath}/regist_route.do",
			{"latitude" : latitude, "longitude" : longitude},
			function(jsonObj){
<%-- 				var flightPlanCoordinates = [
							<% List<RecordRoute> routeList=(List<RecordRoute>)request.getAttribute("routeList");%>
							var size=<%=routeList.size()%>
							alert(size)
							<%if (routeList != null){
							for (RecordRoute route : routeList){ %>
							
								var latitude=<%=route.getRecordLatitude()%>
								var longitude=<%=route.getRecordLongitude()%>
								new google.maps.LatLng(latitude, longitude)
							<% if (routeList.get(routeList.size() -1) != route) {%>
										,
							
							<%}}}%>
							]; --%>
	
				var flightPlanCoordinates = [];
				$(jsonObj.routeList).each(function(index,item){
					var marker=new google.maps.LatLng(item.recordLatitude, item.recordLongitude);
					flightPlanCoordinates.push(marker)
				})
				flightPath = new google.maps.Polyline({
		          path: flightPlanCoordinates,
		          geodesic: true,
		          strokeColor: '#FF0000',
		          strokeOpacity: 1.0,
		          strokeWeight: 2
		        });
				flightPath.setMap(null);	
			/* 	var flightPlanCoordinates = [
				                             new google.maps.LatLng(37.772323, -122.214897),
				                             new google.maps.LatLng(21.291982, -157.821856),
				                             new google.maps.LatLng(-18.142599, 178.431),
				                             new google.maps.LatLng(-27.46758, 153.027892)
				                           ]; */
		        
		        flightPath.setMap(map);	
				
		});

/* 		new google.maps.Marker({
			position : new google.maps.LatLng(latitude,longitude),
			map : map
		}) */
	}, function(error){
		alert(error);
	})
 }
</script>
<div style="height:10px;"></div>

<!-- 업로드 버튼 -->
<div style="text-align: center;">
<img class="bottomBtn" src="./images/record/upload1.png"  id="uploadByCurrent"/>
</div>
<div style="height:5px;"></div>
<div style="text-align: center;">
<img class="bottomBtn"  src="./images/record/upload2.png" id="uploadBySelect"/>
</div>
<div style="height:5px;"></div>
<div style="text-align: center;">
<img class="bottomBtn"  src="./images/record/upload3.png" id="uploadByPhoto"/>
</div>




</div>

</body>
</html>