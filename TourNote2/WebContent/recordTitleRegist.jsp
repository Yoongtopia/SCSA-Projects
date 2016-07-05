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
#infoTitle{
	margin-left: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title{
	margin-left: 10px;
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
			width: 500,
			buttons: {
					'등록': function(){
						$("#recordTitle").val($("#title").val());
						$("#registForm").submit();
					},
					'취소': function(){
						var href="${pageContext.request.contextPath}/cancel_record.do";
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
			return false
		}
		return true;
	}
	

	
</script>
<title>Insert title here</title>
</head>
<body>
	<form id="registForm" method="post" action="${pageContext.request.contextPath}/regist_record.do" onsubmit="return formCheck()">
	<div id="recordInfo" title="여행기 제목 입력">
		<div id="infoTitle">
				<h4>등록하실 여행기의 제목을 입력해주세요.</h4>
				<input type="text" name="title" id="title" size="65">
		</div>
	</div>
	<input type="hidden" name="recordTitle" id="recordTitle">
	</form>
</body>
</html>