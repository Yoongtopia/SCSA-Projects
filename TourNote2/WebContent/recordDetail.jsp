<%@page import="com.scsa.wapl.entity.RecordRoute"%>
<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@page import="com.scsa.wapl.entity.TravelSpot"%>
<%@page import="com.scsa.wapl.entity.TravelRecord"%>
<%@page import="com.scsa.wapl.entity.TravelRecordReply"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ko"></script>
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox.js"></script>
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/component.css" />
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
  <script src="js/lightbox.js"></script>
  <link href="css/lightbox.css" rel="stylesheet" />
 <style>
#content{
margin-left:300px;
  margin-top: 100px;
  }
  
table{
width:700px;
background-color: white;
}  
  
td{
	text-align: center;
}

th{
background-color: #39ABB9;
color:white;
height: 40px;
border-radius:4px;
}

#header, #title, #map, #cont, #replybody, #transportation{
	width: 700px;
	font-size: 15px;		
}

#map-canvas {
  margin-left:150px;
  height: 400px;
  width : 400px;
}

#header{
	height:300px;
}

#rtitle{
font-size: 40px;
}

</style>
<script>		
					
	function recommend(){
		console.log("진입");
			$.get("${pageContext.request.contextPath}/check_recommend.do",
				{"memberId" : "${sessionScope.member.memberId }",
				"recordNum" : "${record.recordNum}" },
				function(jsonObj){
					if(jsonObj.status){
						alert("이미 추천하셨습니다.");
					}else{
						alert("추천되었습니다");	
						$("#countRecommend").text(jsonObj.recommend);
					}
					/* location.replace("http://localhost:8080/FinalProject_TourNote2/selectRecord.do?recordNum=${record.recordNum}"); */
				}, "json");
 			};	
	
  $(function() {
	  $("#recommendBtn").click(recommend);
    });

 
	function initialize() {
	  	var mapOptions = {
					   		 scaleControl: true,
					   		 center: new google.maps.LatLng("${record.travelSpotList[0].spotLatitude}","${record.travelSpotList[0].spotLongitude}"),
					   		 zoom: 16 
				 	 	};

	  	var map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
		

		var markers = [
		
						<% TravelRecord record=(TravelRecord) request.getAttribute("record"); 
						ArrayList<TravelSpot> spotList=(ArrayList<TravelSpot>) record.getTravelSpotList();
						if (spotList != null){
						for (TravelSpot spot : spotList){ 
						List<Photo> pList = spot.getPhotoList(); %>
									{	lat: <%=spot.getSpotLatitude()%> , lng: <%=spot.getSpotLongitude()%>,
									name: "<%=spot.getSpotTitle()%>",
									info: "<div style='width:200px; margin:10px;'><h5 style='padding:10px; text-align: left'><b><%=spot.getSpotTitle()%></b></h5><div style='margin-left:15px;'><%= spot.getSpotCont()%></div></div>",
		 							uploadType : "<%=spot.getUploadType()%>",
									number: "<%=spot.getSpotNum()%>"
									}
						<% if (spotList.get(spotList.size() -1) != spot) {%>
									,
						<%}}}%>
			];

		for (index in markers) addMarker(markers[index]);
		
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
	 							draggable:true, // Bounce
	 					});
	 		
	 		var contentString = data.info;
	 		var contentNum ="<h4 style='font-weight: bold'>" + data.number + "</h4>";
	 		
			var infobox = new InfoBox({
	 	         content: contentNum,
	 	         disableAutoPan: false,
	 	         maxWidth: 10,
	 	         pixelOffset: new google.maps.Size(-25, -48),
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

			var infowindow = new google.maps.InfoWindow({
							 				content: contentString,
							 				maxWidth: 300,
							 				mawHeight:100
				 				});

	 		google.maps.event.addListener(marker, "click", function() {
							marker.setAnimation(null); 

	 						infowindow.open(map,marker);
	 		});
	 		
/* 	 		google.maps.event.addListener(marker, "click", function() {
					removeMark();
		}); */
	 		
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
	 	
/* 	 // 마크 삭제하기
	 	function removeMark(){
	 		for (var i = 0; i < markers.length; i++) {
	 		    markers[i].setMap(null);
	 		  }
	 	}

	 	// 선택한 마크만 남겨두기
	 	function getMarkPos(){
	 	    var lat=globalMarker.getPosition().lat();
	 	    var lng=globalMarker.getPosition().lng();
	 	    
		 	new google.maps.Marker({
					position: new google.maps.LatLng(lat, lng),
					map: map,
					draggable:true, // Bounce
			});
	 	}		 */ 	
	}
	google.maps.event.addDomListener(window, 'load', initialize); 

  </script>
</head>
<body class="container-white">

	 <nav class="sidenav" style="top: 60%; position: fixed;">   
		 <a href="${pageContext.request.contextPath }#top" class="n1"><img src="./images/mainPage/sideButton1.png" width="40px"/><span>TOP</span></a>
		 <c:choose>
			<c:when test="${sessionScope.member!=null && sessionScope.recordNum!=null }">		 
		 		<a href="${pageContext.request.contextPath }/upload_detail.do#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:when>
   	 		<c:otherwise>
		 		 <a href="${pageContext.request.contextPath }#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:otherwise>
		</c:choose> 
		 <a href="${pageContext.request.contextPath }#2" class="n1"><img src="./images/mainPage/sideButton3.png" width="40px"/><span>TRAVEL BOARD</span></a> 
		 <a href="${pageContext.request.contextPath }#3" class="n1"><img src="./images/mainPage/sideButton4.png" width="40px"/><span>MY TRAVEL</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice" class="n1"><img src="./images/mainPage/sideButton5.png" width="40px"/><span>NOTICE</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna" class="n1"><img src="./images/mainPage/sideButton6.png" width="40px"/><span>Q&A</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_faq.do?boardCategory=faq" class="n1"><img src="./images/mainPage/sideButton7.png" width="40px"/><span>FAQ</span></a> 
   	 </nav>
   	 
<div id="content">
<div id="header" align="center">
<img src="${pageContext.request.contextPath}/image/${record.recordPhoto}" height="320"/>
</div>

<div style="height: 20px;"></div>

<div id="title">
<span id="rtitle">${record.recordTitle }</span><span>&nbsp;by ${record.recordWriter }</span>
<c:if test="${sessionScope.member.memberId!=null && sessionScope.member.memberId!=record.recordWriter}">
<form method="post" action="insertScrap.do">
<a href="#"><input type="submit" id="scrapBtn" name="scrapBtn" value="스크랩하기" class="ui button"></a>
<input type="hidden" name="memberId" value="${sessionScope.member.memberId }"/>
<input type="hidden" name="recordNum" value="${record.recordNum }"/>
<input type="button" name="recommend" value="추천" id="recommendBtn"  class="ui button"/>
 추천 수 : <span id="countRecommend">${record.recommend }</span>
</form>
</c:if>
</div>

<div style="height: 20px;"></div>

<div id="cont">
<table>
<tr><th>&nbsp;여행기</th></tr>
<tr><td>
<c:choose>
<c:when test="${not empty record.recordCont }">
<div>
${ record.recordCont}
</div>
</c:when>
<c:otherwise>
<div>
<ul class="cbp_tmtimeline">
 <c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status"> 
	<li>
		<time class="cbp_tmtime" datetime="${spotList.spotTime }"><span>${spotList.spotTime }</span></time>
		<div class="cbp_tmicon cbp_tmicon-phone"></div>
		<div class="cbp_tmlabel">
			<h2>${spotList.spotTitle }</h2>
			<p>${spotList.spotCont }</p>
			<c:forEach items="${spotList.photoList}" var="photo" varStatus="status_photo">
				<a href="${pageContext.request.contextPath}/image/${photo.photoName}" data-lightbox="image-1" data-title="${photo.photoName}"><img src="${pageContext.request.contextPath}/image/${photo.photoName}" alt="${spotList.spotTitle }" width=100 height=100/></a>
			</c:forEach>			
		</div>
	</li>
	</c:forEach>
</ul>
</div>
</c:otherwise>
</c:choose>
</td></tr>
</table>
</div>

<div style="height: 20px;"></div>

<div id="transportation">
<table>
<tr><th>&nbsp;교통</th></tr>
<tr><td height="20px"></td></tr>
<c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status"> 
<c:forEach items="${spotList.travelTransportationList}" var="trans" varStatus="status_photo">
<tr>
<td>
<c:choose>
<c:when test="${trans.transportation.link!=null}">
	${spotList.spotNum }. ${trans.countryName }, ${trans.transportation.transportationName } : <a href="http://${trans.transportation.link}">${trans.transportation.link}</a>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</c:forEach>
</table>
</div>

<div style="height: 20px;"></div>

<div id="map">
<table>
<tr><th>&nbsp;여행지도</th></tr>
<tr><td height="20px"></td></tr>
 <tr><td>
 <div id="map-canvas"></div>
 </td></tr>
</table>
</div>


<div style="height: 20px;"></div>

<div id="replybody">
 <form method="post" action="insertRecordReply.do">
 <table>
 <tr>
 <th colspan="4">&nbsp;댓글 작성(바르고 고운말을 씁시다)</th>
 </tr>
 
 <tr>
 <td>내용</td>
 <td>아이디</td>
 <td>작성시간</td>
 <td></td>

 </tr>
 	<c:choose>
		<c:when test="${not empty recordReply}">
			<c:forEach items="${recordReply}" var="recordReply">
 			<tr>
 			<td width="450">${recordReply.replyCont }</td>
 			<td>${recordReply.replyWriter }</td>
 			<td>${recordReply.replyDate }</td> 		
 			
 			<c:choose>
 				<c:when test="${sessionScope.member.memberId == recordReply.replyWriter }">	
 			<td><a href="deleteReply.do?replyNum=${recordReply.replyNum }&recordNum=${record.recordNum}">
 			<input type="button" name="deleteReply" value="DEL"/></a></td>
 				</c:when>
 				<c:otherwise>
 				</c:otherwise>
 			</c:choose>
 			<tr>
 			</c:forEach>
 		</c:when>
 	</c:choose>
 <tr>
<c:choose>
<c:when test="${sessionScope.member.memberId!=null}">	
 <td width="150px" colspan="3"><input size="80" type="text" id="replyCont" name="replyCont"/></td>
 <td width="100px"><input type="submit" id="reply" value="댓글 작성" class="ui button"/>
 <input type="hidden" name="replyWriter" value="${sessionScope.member.memberId }"/>
 <input type="hidden" name="recordNum" value="${record.recordNum }"/> </td>
 </c:when>
 <c:otherwise>
 <td colspan="3">댓글을 작성하시려면 로그인하세요.</td>
 </c:otherwise>
 </c:choose>
 </tr> 
</table>
</form>
</div>
</div>
</body>
</html>