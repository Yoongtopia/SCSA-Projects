<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#recordMsg1, #recordMsg2{
	margin-left: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
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
		$("#recordMsg1").hide();
		$("#recordMsg2").hide();
		if ("${recordList == null}" == "true"){
			$("#recordType").dialog({
				width: 300,
				buttons: {
						'예': function(){
								var href="${pageContext.request.contextPath}/view_titleRegist2.do";
								location.replace(href);
						},
						'아니오': function(){
							var href="${pageContext.request.contextPath}/cancel_record2.do";
							location.replace(href);
						}
					},
				modal: true,
				draggable: false
			});
			$("#recordMsg1").show();
		} else {
			$("#recordType").dialog({
				width: 300,
				buttons: {
						'이어하기': function(){
								var href="${pageContext.request.contextPath}/view_recordList2.do";
								location.replace(href);
						},
						'새로하기': function(){
							var href="${pageContext.request.contextPath}/view_titleRegist2.do";
							location.replace(href);
						}
					},
				modal: true,
				draggable: false
			});
			$("#recordMsg2").show();
		}
		
		$(".ui-dialog-titlebar-close").hide();
	})
	

	
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="recordType" title="여행 기록 시작하기">
		<div id="recordMsg1">
			<p>작성 중이던 여행기가 존재하지 않습니다.</p>
			<p>새로운 기록을 시작하시겠습니까?</p>
		</div>
		<div id="recordMsg2">
			<p>작성 중이던 여행기가 존재합니다.</p>
			<p>기록을 이어하시겠습니까?</p>
		</div>
	</div>
</body>
</html>