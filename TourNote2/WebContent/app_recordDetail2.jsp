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
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/component2.css" />
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
  <script src="js/lightbox.js"></script>
  <link href="css/lightbox.css" rel="stylesheet" />
 <style>

#title1{
	font-size: 30px;
	font-weight: bold;
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
						alert("이미 추천한 글입니다");
					}else{
						alert("추천되었습니다");						
					}
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
									info: "<h3><%=spot.getSpotNum() + spot.getSpotTitle()%></h3><p><%= spot.getSpotCont()%></p><ul><li><% if(pList != null) { for(Photo pp : pList) {  %><img src=${pageContext.request.contextPath}/image/<%=pp.getPhotoName()%> width=100 height=100/><%}}%></li></ul>"
									}
						<% if (spotList.get(spotList.size() -1) != spot) {%>
									,
						<%}}}%>
			];

		for (index in markers) addMarker(markers[index]);
		
	 	function addMarker(data) {

	 		var marker = new google.maps.Marker({
	 							position: new google.maps.LatLng(data.lat, data.lng),
	 							map: map,
	 							draggable:true, // Bounce
	 					});
	 		
	 		var contentString = data.info;

	 		var infowindow = new google.maps.InfoWindow({ content: contentString});

	 		google.maps.event.addListener(marker, "click", function() {
							marker.setAnimation(null); 

	 						infowindow.open(map,marker);
	 		});
	 		
	 		google.maps.event.addListener(marker, "click", function() {
					removeMark();
		});
	 		

	 	}
	 	
	 // 마크 삭제하기
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
	 	}		 	
	}
	google.maps.event.addDomListener(window, 'load', initialize); 

  </script>
</head>
<body>

<div style="height:80px;"></div>

<div style="width:95%; height: 100%; background-color: white; border-radius:10px; margin: 0 auto">

<div style="height:10px;"></div>

<div style="width:90%; height:100%; margin: 0 auto" id="media">

<div id="title1" style="text-align: center; border-bottom: 1px solid orange">
<span>${record.recordTitle }</span>
</div>

<div style="height:10px;"></div>

<div>
<img src="${pageContext.request.contextPath}/image/${record.recordPhoto}" class="mapDiv" style="width:100%; margin: 0 auto" />
</div>

<div style="height:10px;"></div>

<div id="cont1" style="width: 100%; margin: 0 auto;">
<div style="text-align: center; border-bottom: 1px solid orange"><h3>여행기</h3></div>
<div style="height: 8px;"></div>
<div style="width:100%; margin: 0 auto;">
<c:choose>
<c:when test="${not empty record.recordCont }">
<div>
${ record.recordCont}
</div>
</c:when>
<c:otherwise>
<div style="width:100%;">
<ul class="cbp_tmtimeline">
 <c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status"> 
	<li style="width:100%;">
		<time class="cbp_tmtime" datetime="${spotList.spotTime }"><span style="width:100%">${spotList.spotTime }</span></time>
		
		<div class="cbp_tmlabel" style="width:100%;">
			<h2>${spotList.spotTitle }</h2>
			<p>${spotList.spotCont }</p>
			<c:forEach items="${spotList.photoList}" var="photo" varStatus="status_photo">
				<a href="${pageContext.request.contextPath}/image/${photo.photoName}" data-lightbox="image-1" data-title="${photo.photoName}"><img src="${pageContext.request.contextPath}/image/${photo.photoName}" alt="${spotList.spotTitle }" width=95 height=95/></a>
			</c:forEach>
		</div>
	</li>
	</c:forEach>
</ul>
</div>
</c:otherwise>
</c:choose>
</div>

</div>

<div style="height:20px;"></div>

<div id="transportation1" style="width: 100%;">
<div style="text-align: center; border-bottom: 1px solid orange"><h3>교통정보</h3></div>
<table>
<c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status"> 
<c:forEach items="${spotList.travelTransportationList}" var="trans" varStatus="status_photo">
<tr>
<td>
<c:choose>
<c:when test="${trans.transportation!=null}">
	${spotList.spotNum }. ${trans.countryName }, ${trans.transportation.transportationName } : <a href="http://${trans.transportation.link}">${trans.transportation.link}</a>
	</c:when>
	<c:otherwise>
	등록된 교통수단이 없습니다.
	</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</c:forEach>
</table>
</div>

<div style="height:30px;"></div>

<div style="text-align: center;">
<div style="text-align: center; border-bottom: 1px solid orange;"><h3>여행 경로</h3></div>
<div style="height:5px;"></div>
<div class="mapDiv" style="width:100%; margin: 0 auto" id="map-canvas" ></div>
</div>

<div style="height:30px;"></div>

<div id="replybody1">
<form method="post" action="insertRecordReply2.do">
<div style="border-bottom: 1px solid orange; text-align: center;"><h3>댓글 작성</h3></div>

<table> 
<tr>
<td>내용</td>
<td>아이디</td>
<td></td>
</tr>
 	<c:choose>
		<c:when test="${not empty recordReply}">
			<c:forEach items="${recordReply}" var="recordReply">
 			<tr>
 			<td>${recordReply.replyCont }</td>
 			<td>${recordReply.replyWriter }</td>
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
 <td><input type="text" id="replyCont" name="replyCont"/></td>
 <td><input type="submit" id="reply" value="댓글 작성"/>
 <input type="hidden" name="replyWriter" value="${sessionScope.member.memberId }"/>
 <input type="hidden" name="recordNum" value="${record.recordNum }"/> </td>
 </tr> 
</table>
</form>
</div>

<div>
<c:if test="${sessionScope.member.memberId!=null }">
<form method="post" action="insertScrap2.do">
<a href="#"><input type="submit" id="scrapBtn" name="scrapBtn" value="스크랩"></a>
<input type="hidden" name="memberId" value="${sessionScope.member.memberId }"/>
<input type="hidden" name="recordNum" value="${record.recordNum }"/>
<input type="button" name="recommend" value="추천" id="recommendBtn"/>
 추천 수 : ${record.recommend }
</form>
</c:if>

</div>

</div>

</div>
</body>
</html>