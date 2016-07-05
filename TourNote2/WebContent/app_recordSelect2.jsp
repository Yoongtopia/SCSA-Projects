<%@page import="com.scsa.wapl.entity.TravelRecord"%>
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
#recordList{
	margin-left: 20px;
	height: 200px;
	overflow-y: scroll;
	margin-top: 15px;
	margin-bottom: 15px;
}
.recordRadio, .recordSpan{
	margin-bottom: 10px;
}
h4{
	margin-left: 25px;
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
		$("#record").dialog({
				width: 300,
				buttons: {
						'선택': function(){
							var recordNum=$(':radio:checked').val();
							if (recordNum == null){
								alert("이어서 작성하실 기록을 선택하세요.")
							} else {
								var href="${pageContext.request.contextPath}/continue_record2.do?recordNum="+recordNum;
								location.replace(href);
							}
						},
						'취소': function(){
							var href="${pageContext.request.contextPath}/cancel_record2.do";
							location.replace(href);
						}
					},
				modal: true,
				draggable: false

		});
		$(".ui-dialog-titlebar-close").hide();
		
		<% List<TravelRecord> recordList=(List<TravelRecord>)request.getAttribute("recordList");
			for (TravelRecord record : recordList){ %>
				var recordNum=<%= record.getRecordNum() %>
				var recordTitle="<%= record.getRecordTitle() %>"
				var spanTitle=$("<span/>").attr("class","recordSpan").text(recordTitle);
				var record=$("<input/>").attr("type","radio").attr("name","recordRadio").attr("class","recordRadio").attr("value",recordNum);
				<%-- <% if(recordList.indexOf(record) == 0){%>
					record=$("<input/>").attr("type","radio").attr("name","recordRadio").attr("value",recordNum).attr("checked","checked");
				<% } else { %>
					record=$("<input/>").attr("type","radio").attr("name","recordRadio").attr("value",recordNum);
				<% } %> --%>
				$("#recordList").append(record," ",spanTitle,$("<br/>"));
		<% } %>
		
	});
	

	
</script>
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="record" title="이어갈 여행 기록 선택">
		<p>이어서 기록할 여행기를 선택해주세요.</p>
		<div id="recordList">
		</div>
	</div>
</body>
</html>