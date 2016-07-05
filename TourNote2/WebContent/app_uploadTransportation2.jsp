<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.scsa.wapl.entity.TravelTransportation"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery-ui-1.10.3.custom.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ko"></script>
<script src="./js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	var countryName;
	var usedTransport="";
	var usedTransportType="";
	var index=0;
	$(function(){
		$("#mainCont").dialog({
			width: 340,
			height: 500,
			buttons: {
					'뒤로': function(){
						$("#submitForm").attr("action","${pageContext.request.contextPath}/uploadCont_view_back2.do");
						$("#submitForm").submit();
					},
					'등록': function(){
						$("#submitForm").attr("action","${pageContext.request.contextPath}/upload_spot2.do");
						$("#submitForm").submit();
					},
					'취소': function(){
						var href="${pageContext.request.contextPath}/upload_delete2.do";
						location.replace(href);
					}
				},
			modal: true
		});
		$(".ui-dialog-titlebar-close").hide();
		
/* 		// upload type에 따라 title을 다르게 주기
		if ("${uploadType}"=="selectUpload"){
			$("#uploadTitle").text("지정 위치로 올리기 - 교통");	
		} else if ("${uploadType}" == "currentUpload"){
			$("#uploadTitle").text("현재 위치로 올리기 - 교통");	
		} else if ("${uploadType}" == "photoUpload"){
			$("#uploadTitle").text("지정 위치로 올리기 - 교통");	
		} */
		
		// hidden값 설정
		$("#uploadType").val("${uploadType}");
		$("#latitude").val("${latitude}");
		$("#longitude").val("${longitude}");
		
		
		// 현재 위치 나라정보 띄우는 것
		var latitude="${latitude}";
		var longitude="${longitude}";
		var geocoder = new google.maps.Geocoder();
		var latLng=new google.maps.LatLng(latitude,longitude);		
		
		geocoder.geocode({'latLng': latLng}, function(results, status) {
			      if (status == google.maps.GeocoderStatus.OK) {
					if (results[0]) {
						for (var i=0; i<results[0].address_components.length; i++){
							if (results[0].address_components[i].types[0] == "country"){
								countryName = results[0].address_components[i].long_name;
								$("#countryName").text(countryName);
								$("#country").val(countryName);
							}
						}
					}
			      }
		});
		
		// 뒤로가기 했다 온 경우, 이전에 등록한 교통정보 보여주기
		<% List<TravelTransportation> travelTransportationList=(List<TravelTransportation>)request.getAttribute("travelTransportationList");
			if(travelTransportationList.size() != 0){%>
			var listCountry="<%= travelTransportationList.get(0).getCountryName()%>";
			/* if (listCountry == countryName){ */
		<%		for (TravelTransportation travelTransportation : travelTransportationList){
		%>
			index=index+1;
			usedTransport="<%=travelTransportation.getTransportationName() %>";
			usedTransportType="<%=travelTransportation.getTransportationType() %>";
		
			var deleteBtn=$("<input/>").attr("type","button").attr("value",usedTransport+" x")
										.attr("id",index).attr("class",usedTransportType)
										.click(function(){
											$(this).remove();
										});
			$("#usedTransportation").append($("#usedTransportation"),deleteBtn);
			<% } %>
			/* } */
		<% } %>
		
		// 교통수단 종류 버튼 누르면 셀렉트박스 띄우도록
		$("#airplane").click(getTransportationList);
 		$("#train").click(getTransportationList);
		$("#bus").click(getTransportationList);
		$("#boat").click(getTransportationList);
		
/* 		// 버튼 클릭할 때마다 action값 다르게
		$("#backBtn").click(backFormAction);
		$("#submitBtn").click(submitFormAction); */
		
		// 교통수단 종류 선택할 때마다
		$("#transportationList").change(function(){
			if ($(this).val() == "selfInput"){
				var inputText=$("<input>").attr("type","text").attr("name","transportationName")
											.attr("id","selfInputTrans");
				$("#inputSelfTd").append(inputText);
			} else {
				$("#inputSelfTd > input").remove();
			}
		});
		
		// 교통등록 버튼 누르면 아래에 리스트 뿌리도록
		$("#addTransport").click(addTranportation);
		
		
	});
	
	// 교통수단 셀렉트박스
	function getTransportationList(){
		$.post("${pageContext.request.contextPath}/get_transportationList.do",
				{"country" : countryName, "transportationType" : $(this).val()},
				function(jsonObj){
					if (jsonObj.status){
						$("#transportationList > option").remove();
						$("#inputSelfTd > input").remove();
						var info=$("<option/>").attr("value","none").text("이용하신 교통을 선택하세요");
						$("#transportationList").append(info);
						$(jsonObj.transportList).each(function(index,item){
							var option=$("<option/>").attr("value",item.transportationName)
											.text(item.transportationName);
							$("#transportationList").append(option);
							$("#transportationList").attr("class",jsonObj.transportationType);
						})
						var otherOption=$("<option/>").attr("value","selfInput").text("직접 입력");
						$("#transportationList").append(otherOption);
					} else {
						$("#transportationList > option").remove();
						$("#inputSelfTd > input").remove();
						var info=$("<option/>").attr("value","none").text("이용하신 교통을 선택하세요");
						$("#transportationList").append(info);
						var otherOption=$("<option/>").attr("value","selfInput").text("직접 입력");
						$("#transportationList").append(otherOption);
						$("#transportationList").attr("class",jsonObj.transportationType);
					}
				}		
		)
	}
	
	// 교통수단 순서대로 써지도록 - 교통수단이름&종류 각각 버튼의 value와 class에 저장
	function addTranportation(){
		index=index+1;
		if ($("#transportationList").val() == "none"){
			alert("등록하실 교통수단을 선택해주세요.");
		} else if ($("#transportationList").val() != "selfInput"){
			usedTransport=$("#transportationList").val();
			usedTransportType=$("#transportationList").attr("class");
			
			var deleteBtn=$("<input/>").attr("type","button").attr("value",usedTransport+"  x")
										.attr("id",index).attr("class",usedTransportType)
										.click(function(){
											$(this).remove();
										});
			
			$("#usedTransportation").append($("#usedTransportation"),deleteBtn);
			
 		} else {
			usedTransport=$("#selfInputTrans").val();
			usedTransportType=$("#transportationList").attr("class");
			
			var deleteBtn=$("<input/>").attr("type","button").attr("value",usedTransport+"  x")
										.attr("id",index).attr("class",usedTransportType)
										.click(function(){
											$(this).remove();
										});
			
			$("#usedTransportation").append($("#usedTransportation"),deleteBtn);
		}
	}

	// 등록할 교통수단을 string으로
	var transportationString="";
	var transportationTypeString="";
	function transportationTransfer(){
		for (var i=1; i<=index; i++){
			if ($("#"+i).val() != null){
				var transportationType=$("#"+i).attr("class");
				var transportationName=$("#"+i).attr("value");
				var transportation=transportationName.replace("x","").trim();
				
				if (transportationString == ""){
					transportationString=transportation;
					transportationTypeString=transportationType;
				} else {
					transportationString=transportationString+","+transportation;
					transportationTypeString=transportationTypeString+","+transportationType;
				}
			}
		} 
		$("#transportation").val(transportationString);
		$("#transportationType").val(transportationTypeString);
		return true;
	}	
	
/* 	// 뒤로, 등록 버튼에 따라 action값 다르게 설정
	function backFormAction(){
		$("#submitForm").attr("action","${pageContext.request.contextPath}/uploadCont_view_back.do");
	}
	function submitFormAction(){
		$("#submitForm").attr("action","${pageContext.request.contextPath}/upload_spot.do");
	} */
</script>
<style type="text/css">
body{
	background-color: #E0F0FF;
}
#mainDiv{
	width: 310px;
	height: 100%;
	margin: 0 auto;
	padding: 5px;	
}
table{
	margin-top: 20px;
}
#airplane, #bus, #train, #boat{
	width: 55px;
	height: 25px;
}
select{
	width: 280px;
}
h4{
	margin-left: 5px;
}
#usedTransportation > input[type=button]{
	border-color: #8080B2;
	background-color: #eeeeee;
	border-radius: 10px;
	width: 80px;
	height: 25px;
	margin-left: 5px;
	margin-bottom: 5px;
}
#usedTransportation{
	width: 290px;
	height: 130px;
	overflow-y: scroll;
}
.ui-widget {
	font-family: Trebuchet MS,Tahoma,Verdana,Arial,sans-serif;
	font-size: 1em;
}
#progress{
	margin-left: 5px;
	margin-bottom: 10px;
}
</style>
<title>업로드 화면</title>
</head>

<body>
<c:choose>
<c:when test="${uploadType == 'photoUpload' }">
<div id="mainCont" title="사진 위치로 올리기">
</c:when>
<c:when test="${uploadType == 'selectUpload' }">
<div id="mainCont" title="지정 위치로 올리기">
</c:when>
<c:otherwise>
<div id="mainCont" title="현재 위치로 올리기">
</c:otherwise>
</c:choose>
	<form id="submitForm" method="post" enctype="multipart/form-data" onsubmit="return transportationTransfer()">
	<div id="mainDiv">				
		<div>
			<img id="progress" src="${pageContext.request.contextPath}/images/upload/progress2.png">
		</div>	
		
		<div id="transportationSelect">
		<table width="290">
			<tr height="30">
				<th id="countryName" align="center"></th>
				<td colspan="4" id="infoMsg" align="center">(교통수단 선택후 입력버튼 클릭)</td>
			</tr>
			<tr height="30">
				<td></td>
				<td align="center"><input type="button" id="airplane" value="plane"></td>
				<td align="center"><input type="button" id="train" value="train"></td>
				<td align="center"><input type="button" id="bus" value="bus"></td>
				<td align="center"><input type="button" id="boat" value="boat"></td>
			</tr>
			<tr height="40">
				<td colspan="5" align="center"><select id="transportationList">
					<option value="none" id="noTransportation">교통수단의 종류를 선택하세요</option>
				</select></td>
			</tr>
			<tr><td id="inputSelfTd" align="center" colspan="6" width="250px"></td></tr>
			<tr>
				<td colspan="5" id="addTrasnportTd" align="right"><input type="button" id="addTransport" value="입력"></td>
			</tr>
		</table>
		</div>
		<div id="selectedTransportation">
		<p>[ 이용 교통 수단 ]</p>
			<div id="usedTransportation"></div>
		</div>

<%-- 		<input type="submit" value="뒤로" id="backBtn">
		<a href="${pageContext.request.contextPath}/uploadCont_view_back.do?uploadType=${uploadType}&latitude=${latitude}&longitude=${longitude}"><input type="button" value="뒤로" id="backBtn"></a>
		<a href="${pageContext.request.contextPath}/upload_delete.do"><input type="button" value="취소" id="cancelBtn"></a>
		<input type="submit" value="등록" id="submitBtn">
	</div> --%>
	
	<input type="hidden" name="uploadType" id="uploadType">
	<input type="hidden" name="latitude" id="latitude">
	<input type="hidden" name="longitude" id="longitude">
	<input type="hidden" name="country" id="country">
	<input type="hidden" name="transportation" id="transportation">
	<input type="hidden" name="transportationType" id="transportationType">
	</form>
</div>
</body>
</html>