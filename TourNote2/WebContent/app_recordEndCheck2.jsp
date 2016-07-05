<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
#endCheck,#checkMsg{
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
		if ("${spotList.size()}" == "0"){
			var h1=$("<p/>").text("등록된 여행 기록이 없습니다.");
			var h2=$("<p/>").text("여행기를 삭제하고, 여행 기록을 종료하시겠습니까?");
			var h3=$("<p/>").text("(아니오를 누르시면 기록 화면으로 이동합니다.)");
			$("#checkMsg").append(h1,h2,h3);
			
			$("#endCheck").dialog({
				width: 300,
				buttons: {
						'예': function(){
							var href="${pageContext.request.contextPath}/end_yes_delete2.do";
							location.replace(href);
						},
						'아니오': function(){
							var href="${pageContext.request.contextPath}/end_no2.do";
							location.replace(href);
						}
					},
				modal: true,
				draggable: false
			});
		} else {
			var h=$("<p/>").text("여행 기록을 종료하시겠습니까?");
			$("#checkMsg").append(h);
			
			$("#endCheck").dialog({
				width: 300,
				buttons: {
						'예': function(){
							var href="${pageContext.request.contextPath}/end_yes_view2.do";
							location.replace(href);
						},
						'아니오': function(){
							var href="${pageContext.request.contextPath}/end_no2.do";
							location.replace(href);
						}
					},
				modal: true,
				draggable: false
			});
		}
		$(".ui-dialog-titlebar-close").hide();
		
	})
	

	
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="endCheck" title="여행 기록 종료">
		<div id="checkMsg">
		</div>
	</div>
</body>
</html>