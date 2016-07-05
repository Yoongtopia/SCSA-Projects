<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#infoData{
	margin-left: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
}
#title, #photoMsg, #continentalCheck, .open{
	margin-left: 10px;
}
#imageList{
	margin-top: 20px;
	margin-left: 10px;
	width: 450px;
	height: 130px;
	border: dotted;
	border-color: gray;
	border-width: thin;
	overflow-x: scroll;
}
.imageView{
	display: inline-block;
	margin-left: 30px;
	margin-top: 20px;
}
.ui-widget-header {
	border: 1px solid #8B75A1;
	background: #BA8DE8 url(images/ui-bg_gloss-wave_35_f6a828_500x100.png) 50% 50% repeat-x;
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
		$("#recordInfo").dialog({
			width: 550,
			buttons: {
					'등록하기': function(){
						$("#recordTitle").val($("#title").val());
						$("#recordPhoto").val($(".photoRadio:checked").val());
						var continentals="";
						$("input[name=continental]:checked").each(function() {
							if (continentals == ""){
								continentals = $(this).val();
							} else {
								continentals = continentals + "," + $(this).val();
							}
						});
						$("#recordContinental").val(continentals);
						$("#openPublic").val($(".open:checked").val());
						$("#goEdit").val(false);
						$("#registForm").submit();
					},
					'편집하기': function(){
						$("#recordTitle").val($("#title").val());
						$("#recordPhoto").val($(".photoRadio:checked").val());
						var continentals="";
						$("input[name=continental]:checked").each(function() {
							if (continentals == ""){
								continentals = $(this).val();
							} else {
								continentals = continentals + "," + $(this).val();
							}
						});
						$("#recordContinental").val(continentals);
						$("#openPublic").val($(".open:checked").val());
						$("#goEdit").val(true);
						$("#registForm").submit();
					},
					'취소': function(){
						var href="${pageContext.request.contextPath}/end_no.do";
						location.replace(href);
					}
				},
			modal: true,
			draggable: false
		});
		$(".ui-dialog-titlebar-close").hide();
	});
	
	function formCheck(){
		if ($("#title").val() == ""){
			alert("여행기 제목을 입력해주세요.");
			return false;
		}
		
		if ("${photoList.size()}" != "0"){
			if ($('.photoRadio:checked').val() == null){
				alert("대표 사진을 선택해주세요.");
				return false;
			}
		}
		
		
		if ($("#title").val() == ""){
			alert("여행기 제목을 입력해주세요.");
			return false;
		}
		
		var continentals=document.getElementsByName("continental");
		var continentalCount=0;
		for (var i=0; i<continentals.length; i++){
			if (continentals[i].checked){
				continentalCount++;
			}
		}
		
		if (continentalCount < 1){
			alert("여행하신 대륙을 선택해주세요.");
			return false;
		}

		return true;
	}

	
</script>
<title>Insert title here</title>
</head>
<body>
	<form id="registForm" method="post" action="${pageContext.request.contextPath}/end_record.do" onsubmit="return formCheck()">
	<div id="recordInfo" title="여행 기록 정보 입력">
		<div id="infoData">
			<div id="infoTitle">
				<h4>여행기 제목</h4>
				<input type="text" name="title" id="title" size="70" value="${recordTitle }">
			</div>
			<div id="infoImage">
				<h4>대표 사진을 선택하세요.</h4>
				<div id="imageList">
				<c:choose>
				<c:when test="${not empty photoList }">
					<c:forEach items="${photoList }" var="photo">
						<div class="imageView">
							<input type="radio" name="photoRadio" class="photoRadio" value="${photo.photoName}">
							<img class="image" src="${pageContext.request.contextPath}/image/${photo.photoName}" width="70" height="70">
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p id="photoMsg">등록하신 사진이 없습니다. (대표사진은 등록되지 않습니다.)</p>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div id="infoContinental">
				<h4>여행하신 대륙을 선택하세요.</h4>
				<div id="continentalCheck">
					<input type="checkbox" id="continental" name="continental" value="Europe">유럽
					<input type="checkbox" id="continental" name="continental" value="Asia">아시아
					<input type="checkbox" id="continental" name="continental" value="Africa">아프리카
					<input type="checkbox" id="continental" name="continental" value="Oceania">오세아니아
					<input type="checkbox" id="continental" name="continental" value="NorthAmerica">북아메리카
					<input type="checkbox" id="continental" name="continental" value="SouthAmerica">남아메리카
				</div>
			</div>
			<div id="openSelect">
				<h4>작성하신 여행기를 공개하시겠습니까?</h4>
				<input type="radio" id="open" name="open" class="open" value="true" checked="checked">예
				&nbsp;&nbsp;
				<input type="radio" id="open" name="open" class="open" value="false">아니오
			</div>
		</div>
	</div>
	<input type="hidden" name="recordTitle" id="recordTitle">
	<input type="hidden" name="recordPhoto" id="recordPhoto">
	<input type="hidden" name="recordContinental" id="recordContinental">
	<input type="hidden" name="openPublic" id="openPublic">
	<input type="hidden" name="goEdit" id="goEdit">
	</form>
</body>
</html>