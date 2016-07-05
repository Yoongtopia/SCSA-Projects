<%@page import="com.scsa.wapl.entity.RecordRoute"%>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/bootstrap4.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/component.css" />
<script src="./js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&language=ko"></script>
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox.js"></script>
<script type="text/javascript" src="./js/jssor.core.js"></script>
<script type="text/javascript" src="./js/jssor.utils.js"></script>
<script type="text/javascript" src="./js/jssor.slider.js"></script>
<script src="js/lightbox.js"></script>
<script type="text/javascript">
	var recordNum=<%= session.getAttribute("recordNum")%>	
	<% ArrayList<TravelSpot> spotList=(ArrayList<TravelSpot>)request.getAttribute("spotList"); %>
	$(function(){
		
		$("#detailDialog").hide();
		
		
		//기록 진행 중이면 시간 update. 레코드 버튼 제어
		if(recordNum != null){
			updateTimer();
			setInterval(updateTimer, 60000);  	
			$("#aRecord").removeAttr("href");
			$("#aStop").attr("href","#");	
			
			setInterval(function() { 
				 $('#timerSpan').fadeOut('fast').fadeIn('fast'); 
			},1000);
			
			$("#modal-748746").attr("href","#modal");
			$("#modal-748746").click(function(event) {
				event.preventDefault();
				timeLineCheck();
			/* 	$(this).trigger('click'); */
			});
		} else {
			$("#aRecord").attr("href","#");
			$("#aStop").removeAttr("href");	
			
			$("#timerSpan").remove();
			$("#timerDiv").append($("<span>").text("00Day: 00H: 00Min").attr("id","timerSpan"));
			
			$("#modal-748746").removeAttr("href");
			$("#modal-748746").click(function(event) {
				alert("레코드 버튼을 눌러 기록을 시작해주세요.");
				
			});
		}
		
		// spotList있으면 기록 정보 보여줌
		<% if (spotList != null && spotList.size() > 0){%>
			var countSpot="<%= spotList.size() %>";
			var lastDate="<%= spotList.get(spotList.size()-1).getSpotTime() %>";
			var idx = lastDate.lastIndexOf(".");
			var lastDate2=lastDate.substring(0, idx);
			$("#spotInfo").text("현재 총 "+countSpot+"개의 여행 기록을 등록하셨습니다. 마지막 등록시간 : "+lastDate2);
		<% } %>
		
		$("#recordBtn").click(recordTypeSelect);
		$("#recordStopBtn").click(recordStop);
 		$("#uploadBySelect").click(selectPosition);
 		$("#uploadByCurrent").click(selectCurrent);
		$("#uploadByPhoto").click(selectPhoto);
		google.maps.event.addDomListener(window, 'load', getfirstLocation);
	
		$("#detailClose").click(function (e) {
		    e.preventDefault();
		    $("#detailDialog").hide();  
		}); 
		
	});
	
	function updateTimer(){
		$.get("${pageContext.request.contextPath}/time_set.do",
				function(jsonObj){
					var days=jsonObj.days;
					var hours=jsonObj.hours;
					var minutes=jsonObj.minutes;		
					$("#timerSpan").remove();
					$("#timerDiv").append($("<span>").text(days+"Day: "+hours+"H: "+minutes+"Min").attr("id","timerSpan"));
		});
	}

	// 세션에 기록번호 없을 때만 새로운 레코드 시작
	function recordTypeSelect(){
		if ("${member == null}" == "true"){
			alert("여행 기록을 원하시면 로그인을 해주세요.")
		} else if (recordNum == null){
			var href="${pageContext.request.contextPath}/record_start.do";
			location.replace(href);
		} else {
			alert("기록을 진행 중에 있습니다. 새로운 기록을 원하시면 진행 중인 기록을 종료해주세요.");
		}
	}
	
	// 세션에 기록번호 있을 때만 기록 종료
	function recordStop(){
		if (recordNum != null){
			var href="${pageContext.request.contextPath}/end_check.do";
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

	var markers;
	// 페이지 첫 로딩시 지도 로딩
	function initialize(position) {
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
			zoom : 10
		};

		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		
		markers = [
						<% if (spotList != null){
						for (TravelSpot spot : spotList){ %>
									{	lat: <%=spot.getSpotLatitude()%> , lng: <%=spot.getSpotLongitude()%>,
									name: "<%=spot.getSpotTitle()%>",
									num: <%=spot.getSpotNum()%>,
									uploadType : "<%=spot.getUploadType()%>",
									number: "<%=spot.getSpotNum()%>"
									}
						<% if (spotList.get(spotList.size() -1) != spot) {%>
									,
						
						<%}}}%>
						];
		for (index in markers) addMarker(markers[index]);
		
		var flightPlanCoordinates = [
		                             <%List<RecordRoute> routeList=(List<RecordRoute>)request.getAttribute("routeList");
		                             	if (routeList != null){
		                             		for (RecordRoute route : routeList){%>
		                             			new google.maps.LatLng(<%= route.getRecordLatitude()%>, <%= route.getRecordLongitude()%>)
		                             			<%if (routeList.get(routeList.size()-1) != route){%>
		                             				,
		                             <%				}
		                             		}
		                             	}
		                             %>
									];
		flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });
		
		flightPath.setMap(map);	
		
	}
	
	function timeLineCheck() {
 		$.get("${pageContext.request.contextPath}/timeline_list.do",
 			 	function(jsonObj) {
 					if (jsonObj.status){
 						$("#modalBody").children().remove();
 		 				$(jsonObj.timeLineList).each(function(index,item){
 		 					var title;
 		 					var cont;
 		 					if (item.spotTitle != null){
 		 						title=item.spotTitle;
 		 					} else {
 		 						title="(제목 없음)";
 		 					}
 		 					if (item.spotCont != null){
 		 						cont=item.spotCont;
 		 					} else {
 		 						cont="(내용 없음)";
 		 					}
 		 					var bTime=item.spotTime;
 		 					var idx = bTime.lastIndexOf(".");
 		 					var aTime=bTime.substring(0, idx);
 		 					
 		 					var ul = $("<ul>").attr("class", "cbp_tmtimeline").attr("id", "firstU");
 		 					var li = $("<li>");
 		 					var time = $("<time>").attr("class", "cbp_tmtime").attr("datetime", aTime);
 		 					var span = $("<span>").text(aTime);
 		 					var div = $("<div>").attr("class", "cbp_tmicon cbp_tmicon-phone");
 		 					var div2 = $("<div>").attr("class", "cbp_tmlabel");
 		 					var h4 = $("<h4>").text(item.spotNum + ". " + title);
 		 					var p = $("<p>").text(cont);	 			
 		 					
 		 					var div3 = $("<div>");	 			
 		 					
 		 					var time2 = time.append(span);
 		 					
 				 	       $(item.photoList).each(function(idx, itm) {
 				 	    	 	var img = $("<img>").attr("src", "${pageContext.request.contextPath}/image/"+itm.photoName).attr("alt", item.spotTitle).attr("width", "50px").attr("height", "50px");
 				 	    	 	/* var a = $("<a>").attr("href","${pageContext.request.contextPath}/image/"+itm.photoName).attr("data-lightbox", "image-1").attr("data-title", itm.photoName);
 				 	    	  	var a2 = a.append(img); */ 	  	
 				 	    	  	var span2 = $("<span>").append(img).attr("class", "uk");
 				 	    	  	div3.append(span2);
 				 	       });
 				 	       
 				 	     	var div4 = div2.append(h4, p, div3);
		 					var li2 = li.append(time2, div, div4);
		 					
		 					var after = ul.append(li2);
			 	 			$("#modalBody").append(after); 
 				 	    
 	  					});
 					} else {
 						$("#modalBody").children().remove();
 						var h4=$("<h4>").text("등록하신 여행 기록이 없습니다.");
 						$("#modalBody").append(h4);
 					} 					
 				}); 
	}; 
	
	function addMarker(data) {
		var image;
		if (data.uploadType == "currentUpload"){
			image="${pageContext.request.contextPath}/images/spotMain/marker1.png";
		} else if (data.uploadType == "selectUpload"){
			image="${pageContext.request.contextPath}/images/spotMain/marker2.png";
		} else {
			image="${pageContext.request.contextPath}/images/spotMain/marker3.png";
		}
		
 		var marker = new google.maps.Marker({
 							position: new google.maps.LatLng(data.lat, data.lng),
 							map: map,
 							icon: image,
 							draggable:false // Bounce
 							/* animation: google.maps.Animation.BOUNCE // Bounce */
 					});

 		var contentString = "<h3 style='font-weight: bold'>" + data.number + "</h3>";
 		/*  		var contentString = data.info; */
		var infobox = new InfoBox({
		 	         content: contentString,
		 	         disableAutoPan: false,
		 	         maxWidth: 10,
 		 	         pixelOffset: new google.maps.Size(-7, -60),
		 	         zIndex: null,
		 	         boxStyle: {
		 	            background: "url('http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/examples/tipbox.gif') no-repeat",
		 	            opacity: 0.75,
		 	            width: "50px"
		 	        },
		 	       closeBoxURL: "",
/*   		 	    closeBoxMargin: "12px 4px 2px 2px",
		 	        closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",  */
		 	        infoBoxClearance: new google.maps.Size(1,1)
		});


/*  		var infowindow = new google.maps.InfoWindow({ content: contentString}); */
 		infobox.open(map,marker);

 		google.maps.event.addListener(marker, "click", function(e) {
						marker.setAnimation(null);				
						viewDetail(data.num);
						$("#detailDialog").show();
 		});
 	}
	
	// 직접 위치 지정하여 업로드
	function selectPosition() {
		if (recordNum != null){
			//클릭했을 때 이벤트
			google.maps.event.addListener(map,'click',function(event) {
								/* placeMarker(event.latLng); */
								infowindow.setContent("<form action='${pageContext.request.contextPath}/uploadCont_view.do'><br>&nbsp;이곳에 여행 기록을 등록하시겠습니까?&nbsp; <input type='submit' value='등록' id='regist'><input type='hidden' id='latitude' name='latitude'><input type='hidden' id='longitude' name='longitude'><input type='hidden' id='uploadType' name='uploadType' value='selectUpload'></form>"); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
/* 								infowindow.setContent("<form action='${pageContext.request.contextPath}/uploadCont_view.do'><br>이곳에 여행 기록을 등록하시겠습니까?<br/><input type='submit' value='등록' id='regist'><input type='hidden' id='latitude' name='latitude'><input type='hidden' id='longitude' name='longitude'><input type='hidden' id='uploadType' name='uploadType' value='selectUpload'></form>"); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다. */
								$("#latitude").val(event.latLng.lat());
								$("#longitude").val(event.latLng.lng());
								infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
							});
			// 클릭 했을때 이벤트 끝
			// 인포윈도우의 생성
			var infowindow = new google.maps.InfoWindow({
				content : '<br>&nbsp; 여행 기록을 등록할 위치를 클릭하세요',
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
			var href="${pageContext.request.contextPath}/uploadCont_view.do?uploadType=photoUpload";
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
				
 		var href="${pageContext.request.contextPath}/uploadCont_view.do?latitude="
 				+latitude+"&longitude="+longitude+"&uploadType=currentUpload";
		location.replace(href);
/* 		$("#currentLocationhref").attr("href",href); */
	}
	
	// 스팟별 상세보기
	function viewDetail(spotNum){
		$.get("${pageContext.request.contextPath}/view_detail.do",
				{"spotNum" : spotNum}, function(data) {
					$("#modalDetailBody").html(data);
				}, "html");
		$("#spotNum").val(spotNum);
	};
</script>
<style type="text/css">
				.lb-outerContainer {
				  position: relative;
				  background-color: white;
				  *zoom: 1;
				  width: 300px;
				  height: 200px;
				  margin-top: 120px;
				  -webkit-border-radius: 4px;
				  -moz-border-radius: 4px;
				  -ms-border-radius: 4px;
				  -o-border-radius: 4px;
				  border-radius: 4px;
				}
				.uk{
					margin-right: 10px;
				}
				#regist{
					width: 60px;
					height: 25px;
					margin-top: 10px;
					border-radius:5px;
					font-weight: bold;
					background-color: #F5DF87;
				}
/* 				#timerCont{
					font-size: 15px;
					text-align: center;
					height: 8px;
					width: 150px;
				}	 */
 				#detailDialog{
					position: absolute;
					left: 50%;
					right: 50%;
					margin-top: -600px; 
					margin-left: -200px;
				}	
				#timerDiv{
					border: 2px solid black;
					width: 150px;
					height: 40px;
					padding: 10px;
					font-weight: bold;
					text-align: center;
				}
				#timerSpan{
					text-align: center;
				}
</style>
<style type="text/css">
	.cbp_tmtimeline > li .cbp_tmlabel {
		margin: 0 0 15px 25%;
		background: #DDDDDD;
		color: black;
		padding: 1em;
		font-size: 1em;
		font-weight: 300;
		line-height: 1.4;
		position: relative;
		border-radius: 5px;
		overflow-x: scroll;
		width: 520px;
	}
	.cbp_tmtimeline > li:nth-child(odd) .cbp_tmlabel {
		background: #DDDDDD;
	}
	.cbp_tmtimeline > li:nth-child(odd) .cbp_tmlabel:after {
		border-right-color: #DDDDDD;
	}
	.cbp_tmtimeline > li .cbp_tmicon {
		width: 40px;
		height: 40px;
		font-family: 'ecoico';
		speak: none;
		font-style: normal;
		font-weight: normal;
		font-variant: normal;
		text-transform: none;
		font-size: 1.4em;
		line-height: 40px;
		-webkit-font-smoothing: antialiased;
		position: absolute;
		color: black;
		background: #4EA74E;
		border-radius: 50%;
		box-shadow: 0 0 0 8px #DDDDDD;
		text-align: center;
		left: 20%;
		top: 0;
		margin: 0 0 0 -25px;
	}
	.cbp_tmtimeline:before {
		content: '';
		position: absolute;
		top: 0;
		bottom: 0;
		width: 10px;
		background: #DDDDDD;
		left: 20%;
		margin-left: -10px;
	}
	
</style>
<title>기록 화면</title>
</head>
<body>

		<div class="container">
			<div class="row">
				<div class="span12 centered">
					<h2 class="wow bounceInLeft animated" style="visibility: visible;">
					TRAVEL RECORD</h2>
					<p class="subheader wow bounceInRight animated"
						style="visibility: visible;">
					RECORD YOUR TRAVEL</p>
				</div>
			</div>
		</div>

<table width="1185px" height="545px">
<tr>
<td width="120px"></td>

<!-- 큰 블럭 -->
<td width="720px" height="530" background="./images/mainPage/spotBackground.png">
<table>
<tr>

<!-- 좌측 메뉴 블럭 -->
<td width="300px" height="545px">
<table>
<tr>
<td>
<table>
<tr><td width="300px" height="70px"></td></tr>
</table>
</td>
</tr>

<tr>
<td>
<table>
<tr>
<td width="65px" height="70px"></td>
<td><img src="./images/record/peng.png" width="50px" height="50px"></td>
<td width="5px" height="70px"></td>
<td width="50px" height="70px">
<a href="#" id="aRecord"><img src="./images/record/record.png" id="recordBtn"></a>
</td>
<td width="15px" height="70px"></td>
<td width="50px" height="70px">
<a id="aStop"><img src="./images/record/stop.png" id="recordStopBtn"></a>
</td>
<td width="50px" height="70px"></td>
</tr>
</table>
</td>
</tr>

<!-- <tr>
<td>
<table>
<tr>
<td width="300px" height="10px" bgcolor="black"></td>
</tr>
</table>
</td>
</tr> -->

<tr>
<td>
<table>
<tr>
<td width="65px" height="55px"></td>
<td width="170px" height="55px">
<c:choose>
<c:when test="${recordNum == null}">
<img src="./images/record/onAir1.png"/>
</c:when>
<c:otherwise>
<img src="./images/record/onAir2.png"/>
</c:otherwise>
</c:choose>
</td>
<td width="65px" height="55px"></td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
<table>
<tr><td width="300px" height="55px"></td></tr>
</table>
</td>
</tr>

<tr>
<td>
<table>
<tr>
<td width="45px" height="60px"></td>
<td width="235px" height="60px">
<img src="./images/record/upload1_1.png" id="uploadByCurrent"/>
</td>
<td width="30px" height="60px"></td>
</tr>
<tr>
<td width="48px" height="15px"></td>
<td width="230px" height="15px"></td>
<td width="27px" height="15px"></td>
</tr>
<tr>
<td width="48px" height="60px"></td>
<td width="230px" height="60px">
<img src="./images/record/upload2_1.png" id="uploadBySelect"/>
</td>
<td width="27px" height="60px"></td>
</tr>
<tr>
<td width="48px" height="15px"></td>
<td width="230px" height="15px"></td>
<td width="27px" height="15px"></td>
</tr>
<tr>
<td width="48px" height="60px"></td>
<td width="230px" height="60px">
<img src="./images/record/upload3_1.png" id="uploadByPhoto"/>
</td>
<td width="27px" height="60px"></td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
<table>
<tr><td width="300px" height="30px"></td></tr>
</table>
</td>
</tr>



</table>
</td>

<!-- 중간 여백 조금 -->
<!-- <td width="30px" height="550px"></td> -->

<!-- 우측 지도 블럭 -->
<td>
<table>
<tr><td width="700px" height="30px"></td></tr>
<tr>
<td>
<table width="700px">
<tr>
<td width="200px" height="40px" id="timerCont">
	<div id="timerDiv"></div>
</td>
<td width="350px" height="40px"></td>
<td width="150px" height="40px">
<a id="modal-748746" role="button" class="btn" data-toggle="modal">
<img src="./images/record/timeLine2.png"/></a></td>
</tr>
</table>
</td>
</tr>
<tr><td width="700px" height="20px"></td></tr>
<tr><td width="700px" height="400px" id="map-canvas" class="mapTable" style="border: 1px solid black;"></td></tr>

<tr><td width="700px" height="25px"></td></tr>



</table>
</td>


</tr>
</table>
</td>

</tr>

<tr>
<td colspan="3" id="spotInfo" width="500px" height="50px" align="right"></td>
</tr>

</table>

<div class="modal fade" id="modal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px !important; height: 500px !important; margin-top: 130px; margin-left: -130px; ">
	
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 class="modal-title" id="myModalLabel" style="color: skyblue;"><b>Time Line</b></h3>
			</div>
			
			<div class="modal-body" id="modalBody" style="height: 430px !important; margin-top: 0px; overflow: scroll !important; ">
			</div>		
			
		</div>
	</div>
</div>

<div class="modal-dialog" id="detailDialog">
<form method='post' action='${pageContext.request.contextPath}/delete_spot.do'>
		<div class="modal-content" style="width: 650px !important; height: 500px; margin-top: 0px; ">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="detailClose">×</button>
				<h3 class="modal-title" id="myModalLabel" style="color: skyblue;"><b>Spot Detail</b></h3>
			</div>
			
			<div class="modal-body" id="modalDetailBody" style="height: 350px !important; ">
			</div>
		
			<div class="modal-footer" style="height: 50px !important">
				<input type='submit' value='삭제' style="margin-bottom: 10px; margin-top: 10px; margin-left: 380px; size: 50px">
				<input type='hidden' id='spotNum' name='spotNum'>
			</div>
			
		</div>
</form>
</div>

</body>
</html>