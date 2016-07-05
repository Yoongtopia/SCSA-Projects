<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/fullcalendar_seoulnori.css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap_datepicker.css">
<script type='text/javascript' src='${pageContext.request.contextPath}/js/fullcalendar_seoulnori.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/gcal.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/bootstrap-datepicker.js'></script>
<script>

$(function() {

	/* 캘린더 @sy */
	$("#calendar").fullCalendar({
		
		height: 650,
		
 		header: {
			left: 'today',
			center: 'prev,title,next',
			right: 'month,basicWeek'
		},
		
		<%if(request.getParameter("headerStatus") != null 
					&&request.getParameter("headerStatus").equals("week")){%>
			defaultView: 'basicWeek',
		<%}%>
			
		events: {
            url: '${pageContext.request.contextPath}/get_my_calendar_list.do',
            className: 'MyCalendarEvent',  
            data: { "userId" : "${sessionScope.member.userId}" },
            error: function() {
	            alert('there was an error while fetching events!');
	        }
        },
		
        // 행사 클릭 이벤트 pop up을 show @sy
		eventClick: function(event) {
		
	        if (event) {
				$.getJSON("${pageContext.request.contextPath}/popup_my_calendar.do",
						{ "userId" : "${sessionScope.member.userId}", "eventId" : event.id },
						function(jsonObj) {
						
							$("#eventId").val(jsonObj.eventId);
							
							$("#eventTitle").text(jsonObj.eventTitle);
							
							//제목의 byte 계산 @sy
							var strr = $("#eventTitle").text();
							var abc = (strr.length*9 - encodeURIComponent(strr).length)/8;
							var strrbyte = (strr.length - abc)*3 + abc;
							
							if(strrbyte > 43){
								$("#eventTitle").css("font-size", "18px");
								$("#betweenHr").css("margin", "5px 0 15px 0");
							} else {
								$("#eventTitle").css("font-size", "24px");
								$("#betweenHr").css("margin", "10px 0 20px 0");
							}
							
							$("#goEventDetail").click(function() {
								location.href="${pageContext.request.contextPath}/event_detail.do?eventId="+jsonObj.eventId;
							});
							
							$("#eventStartDate").text(jsonObj.eventStartDate);
							$("#eventEndDate").text(jsonObj.eventEndDate);
							
							$("#eventStartDatePick").val(jsonObj.eventStartDate);
							$("#eventEndDatePick").val(jsonObj.eventEndDate);
							
							$("#calendarMemo").val(jsonObj.calendarMemo);
							
							$("#calendarEventDate").remove();
							var input = $("<input/>").attr("type", "text").attr("size", "16").attr("class", "form-control")
																		.attr("id", "calendarEventDate").attr("name", "calendarEventDate");
							input.insertBefore( $("#BtnClearCalEventDate") );
							
							$("#BtnClearCalEventDate").click(function() {
								$("#calendarEventDate").val("");
								$("#calendarStatusN").attr("checked", "checked");
								$("#calendarStatusY").removeAttr("checked");
								$("#calendarStatusN").click();
							});
							
							$("#calendarEventDate").val(jsonObj.calendarEventDate);
							if(jsonObj.calendarStatus == "Y"){
								$("#calendarStatusY").attr("checked", "checked");
							} else {
								$("#calendarStatusN").attr("checked", "checked");
							}
							
							$('#calendarEventDate').datepicker({
								format: 'yyyy/mm/dd'
					  			 , onRender: function(date) {
									var startDate = new Date( $("#eventStartDatePick").val() );
									var endDate = new Date( $("#eventEndDatePick").val() );
									return date.valueOf() >= startDate.valueOf() && date.valueOf() <= endDate.valueOf() ? '' : 'disabled';
								  }
							}).on('changeDate', function(ev){
								var calendarStatus = $("input[type='radio'][name='calendarStatus'][checked='checked']").val();
								if( calendarStatus == "Y" 
												&& eval(new Date().format("yyyyMMdd")) - ev.date.format("yyyyMMdd") < 0 ){
									alert("갔다 온 날짜는 오늘 또는 오늘 이전으로 선택해야 합니다");
									$('#calendarEventDate').val("");
								} else {
									$('#calendarEventDate').datepicker('hide');
								}
							});
						
						$("#popup").show();
						
						});
	            return false;
	        }
	    }

	});
	
	
	$("#closePopup").click(function() {
		$("#popup").hide();
	});
	
	
	$("#deleteCalendarBtn").click(function() {
		var userId = "${sessionScope.member.userId}";
		var eventId = $("#eventId").val();
		location.href = "${pageContext.request.contextPath}/delete_my_calendar.do?userId="
									+userId+"&eventId="+eventId;
	});
	
	$("#updateForm").submit(function() {
		var headerStatus = "month";
		if(  $(".fc-state-active").text() == "주별" ){
			headerStatus = "week";
		}
		$("#headerStatus").val(headerStatus);
		return true;
	});
	
		
	$("#calendarStatusY").click(function() {
			
			if( $("#calendarEventDate").val() == null || $("#calendarEventDate").val() == "" ){
				alert("참여일을 먼저 선택해야 합니다");
				$("#calendarStatusN").attr("checked", "checked");
				$("#calendarStatusY").removeAttr("checked");
				$("#calendarStatusN").click();
				$("#calendarEventDate").focus();
			} else {
				if( new Date($("#calendarEventDate").val()).valueOf() > new Date().valueOf()  ){
					alert("참여일이 오늘 이후로 선택되어 있습니다");
					$("#calendarStatusN").attr("checked", "checked");
					$("#calendarStatusY").removeAttr("checked");
					$("#calendarStatusN").click();
				} else {
					$("#calendarStatusY").attr("checked", "checked");
					$("#calendarStatusN").removeAttr("checked");
				}
			}
	
		});
		
		$("#calendarStatusN").click(function() {
			$("#calendarStatusN").attr("checked", "checked");
			$("#calendarStatusY").removeAttr("checked");
		});

	
	});


	Date.prototype.format = function(f) {    
        if (!this.valueOf()) return " ";     
        
        var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];    
        var d = this;         

        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {        
            switch ($1) {            
               case "yyyy": return d.getFullYear();            
               case "yy": return (d.getFullYear() % 1000).zf(2);            
               case "MM": return (d.getMonth() + 1).zf(2);            
               case "dd": return d.getDate().zf(2);            
               case "E": return weekName[d.getDay()];            
               case "HH": return d.getHours().zf(2);            
               case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);            
               case "mm": return d.getMinutes().zf(2);            
               case "ss": return d.getSeconds().zf(2);            
               case "a/p": return d.getHours() < 12 ? "오전" : "오후";            
               default: return $1;        
             }    
        });}; 

    //한자리일경우 앞에 0을 붙여준다.
    String.prototype.string = function(len){
        var s = '', i = 0; 
        while (i++ < len) { s += this; } 
        return s;
    }; 
    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
    Number.prototype.zf = function(len){return this.toString().zf(len);};
	
</script>
<style type="text/css">

	/* 캘린더 style */
	.fc-button-prev, .fc-button-next { border: 0; }
	.fc-header-title { margin: 0 20px; }
	.fc-header-title > h2 { font-size: 25px; vertical-align: baseline; }
	.fc-event #99 { background-color: red; }
	#eventStartDate, #betweenDate, #eventEndDate { display: inline-block; }
	.fc-button { padding: 5px 11px; margin-bottom: 17px; vertical-align: middle; line-height: 14px; font-size: small; }
	.fc-event-title:hover, .fc-event-inner:hover, .fc-event:hover { color: #eee; }
	.titleNemo { 
		width: 10px; 
		height: 10px;  
		display: inline-block;
		margin-right: 3px;
	 }
	
</style>
</head>
<body>

			<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
				CALENDAR<font size="4em"><strong>&nbsp;내 캘린더</strong></font>
			</h2>
			<br/>
			<center>
			
			<div style="width: 746px; text-align: left; margin-top: -10px; margin-bottom: 10px; 
									font-weight: bold; color: gray;">
				<div class="titleNemo" style="background-color: steelblue;"></div>축제&nbsp;
				<div class="titleNemo" style="background-color: #ff4a50;"></div>공연&nbsp;
				<div class="titleNemo" style="background-color: slateblue;"></div>전시&nbsp;
				<div class="titleNemo" style="background-color: mediumseagreen;"></div>클래식&nbsp;
				<div class="titleNemo" style="background-color: lightsalmon;"></div>전통/기타&nbsp;
				<div class="titleNemo" style="background-color: gray;"></div>참여완료
			</div>
			
			<div id="calendar" style="width: 750px; text-decoration: none;"></div>
			
			<div id="popup" style="display: none; padding: 5px 20px;">
				<button type="button" class="close" id="closePopup" style="margin-top: -3px; margin-right: -15px;">×</button>
				<div style="height:280px;" id="popupDiv">
				
					<h3>
						<span  id="eventTitle">제목</span>
						<a href="#" id="goEventDetail" style="color: black;">
							<input type="button" class="btn btn-default btn-xs" value="GO" 
											style="font-size: x-small; border-radius: 10px; vertical-align: text-bottom;"/>
						</a>
					</h3>
					<h5 id="eventStartDate">시작일</h5>
					<h5 id="betweenDate">&nbsp;~&nbsp;</h5>
					<h5 id="eventEndDate">종료일</h5>
					<input type="hidden" id="eventStartDatePick"/>
					<input type="hidden" id="eventEndDatePick"/>
					<hr id="betweenHr" style="margin-top: 10px;"/>
					
					<form method="post" id="updateForm"
								action="${pageContext.request.contextPath}/update_my_calendar.do">
				    <table style="width: 358px;">
				    	<tr>
				    		<th style="width: 60px;">메모</th>
				    		<td>
				    			<input type="text" class="form-control" id="calendarMemo" name="calendarMemo" />
				    		</td>
				    	</tr>
				    	<tr>
				    		<th>참여일</th>
				    		<td>
				    			<input type="text" size="16" class="form-control" id="calendarEventDate" name="calendarEventDate" />
				    			<button type="button" class="close" id="BtnClearCalEventDate" 
				    							style="margin-left: -30px; margin-top: -30px; margin-right: 7px; color: black; padding: 3px;">×</button>
				    		</td>
				    	</tr>
				    	<tr>
				    		<th>참여</th>
				    		<td>
				    			<div class="radio" style="display: inline-block;">
				    				<input type="radio" class="form-control" id="calendarStatusY" name="calendarStatus" value="Y" style="height: 13px; width: 13px;"/>
				    				갔다왔어요
				    			</div>
				    			&nbsp;&nbsp;
				    			<div class="radio" style="display: inline-block; margin-top: 10px;">
				    				<input type="radio" class="form-control" id="calendarStatusN" name="calendarStatus" value="N" style="height: 13px; width: 13px;"/>
				    				아직이에요
				    			</div>
				    			<input type="hidden" id="userId"  name="userId" value="${sessionScope.member.userId}"/>
				    			<input type="hidden" id="eventId" name="eventId"/>
				    			<input type="hidden" id="headerStatus" name="headerStatus" value="${headerStatus}"/>
				    		</td>
				    	</tr>
				    	</form>
				    	<tr>
				    		<td colspan="2" style="text-align: center; padding-top: 5px;">
				    			<input type="submit" class="btn btn-default btn-sm" value="수정">
				    			&nbsp;
				    			<input type="button" class="btn btn-default btn-sm" id="deleteCalendarBtn" value="삭제">
				    		</td>
				    	</tr>
				    </table>
				    
			  </div>
			</div>
			
			</center>


</body>
</html>