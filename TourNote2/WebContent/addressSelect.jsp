<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/ui-lightness/jquery-ui-1.10.3.custom.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body { 
 	font-size: 98% 
}
#errorMsg,#mainList{
	margin-left: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
}
img, input[type=radio]{
	display: inline-block;
}
.ui-widget-header {
	border: 1px solid #6A84B8;
	background: #A6B5D4 url(images/ui-bg_gloss-wave_35_f6a828_500x100.png) 50% 50% repeat-x;
	color: #ffffff;
	font-weight: bold;
}
.ui-widget {
	font-family: Trebuchet MS,Tahoma,Verdana,Arial,sans-serif;
	font-size: 0.9em;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ko"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="./js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	$(function(){
		$("#errorMsg").hide();
		<% List<Photo> photoList=(List<Photo>)request.getAttribute("photoList");
			if(photoList.size() != 0){
		%>
			$("#address").dialog({
				width: 550,
				buttons: {
						'선택': function(){
								var gps=$(':radio:checked').val();
								if (gps == null){
									alert("기록을 등록하실 위치를 선택하세요.")
								} else {
									var uploadType="${uploadType}"
									var href="${pageContext.request.contextPath}/regist_gps.do?uploadType="+uploadType+"&gps="+gps;
									location.replace(href);
								}
						},
						'뒤로': function(){
							var uploadType="${uploadType}"
							var href="${pageContext.request.contextPath}/uploadCont_view_back.do?uploadType="+uploadType;
							location.replace(href);
						}
					},
				modal: true
			});
		<% } else { %>
			$("#address").dialog({
				width: 600,
				buttons: {
						'뒤로': function(){
							var uploadType="${uploadType}"
							var href="${pageContext.request.contextPath}/uploadCont_view_back.do?uploadType="+uploadType;
							location.replace(href);
						}
					},
				modal: true
			});
			$("#errorMsg").show();
		<%}%>	
		
		
	 	var geocoder = new google.maps.Geocoder();

		<% if (photoList.size() != 0){
			for (Photo photo:photoList){%>
			var latitude=<%=photo.getLatitude()%>	
			var longitude=<%=photo.getLongitude()%>	
			var latLng=new google.maps.LatLng(latitude, longitude);
			var addressList;
			
			
			geocoder.geocode({'latLng': latLng}, function(results, status) {
 				if (status == google.maps.GeocoderStatus.OK) {
						if (results[0]) {
							var imgName="<%=photo.getPhotoName()%>";
							var img=$("<img/>").attr("src","${pageContext.request.contextPath}/image/"+imgName)
											.attr("width","50px").attr("height","50px").css("margin-top","10px");
							var gps=results[0].geometry.location.k+"/"+results[0].geometry.location.A;
			 				var address_nm = results[0].formatted_address; 
			 				addressList=$("<input/>").attr("type","radio").attr("name","gpsRadio")
			 										.attr("value",gps).css("margin-bottom","10px");
			 				$("#mainList").append(img,"&nbsp;",addressList,"&nbsp;",address_nm,$("<br/>"));
						}
				}
			});
		<%}}%>
		
		$(".ui-dialog-titlebar-close").hide();
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="address" title="여행 기록 위치 선택">
		<div id="errorMsg">
			<p>등록하신 사진에는 위치 정보가 존재하지 않습니다.</p>
			<p>다시 사진을 등록해주세요.</p>
		</div>
		<div id="mainList">
		</div>
	</div>
</body>
</html>