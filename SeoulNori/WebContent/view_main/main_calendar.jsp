<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/fullcalendar_seoulnori.css' />
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/flapper.css' />
<script type='text/javascript' src='${pageContext.request.contextPath}/js/fullcalendar_seoulnori.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/gcal.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/moment-with-langs.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.flapper.js'></script>
<script type="text/javascript">

	$(function() {
		
		$('#calendarTab a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
		});
	
		
		$('.bxSlider-calendar').bxSlider({
		    slideWidth: 373,
		    minSlides: 2,
		    maxSlides: 2,
		    moveSlides: 2,
		    slideMargin: 10,
		    auto: true,
		    autoHover: true
		  }); 
		
		
		$("#mainCalendar").fullCalendar({
			
			height: 330,
			
	 		header: {
				left: 'today',
				center: 'prev, title, next',
				right: ''
			},
			
			 dayClick: function(date) {
					 var calendarDate = date.format('yyyy/MM/dd').toString();
					 searchByDate(calendarDate, "");
			    }
	
		})

		
		// 날짜별 검색시 다시 달력 영역으로, 선택한 날짜 css 변경, 선택한 날짜 페이지로 @sy
		if( $("#selectedDate").val() != ""){
			if($("#fromMain").val() == "" && $("#clickedGuName").val() == "" && $("#clickedSubwayName").val() == ""){
				$("#main-menu-calendar").click();
			}
			var dateStr = $("#selectedDate").val();
			var yy= moment(dateStr).format('YYYY').toString();
			var m = moment(dateStr).format('MM');
			var mm= (moment(dateStr).format('MM')-1).toString();
			var dd= moment(dateStr).format('D').toString();
			
			// 날짜 표시 (flapper) 
			var $header_display = $('#header_display');
			$header_display.flapper({
					width:8,
					chars_preset: 'num',
					timing: 250
			});
			 
			setTimeout(function(){
				$header_display.val(yy+m+dd).change();
				},2000);
			
			$("#mainCalendar").fullCalendar('gotoDate', yy, mm, dd);
			$('td[data-date='+$("#selectedDate").val()+']').children().children().eq(0).css("font-weight", "bold")
																																				.css("color", "salmon")
																																				.css("font-size", "large");
		}
		
		// 날짜별 검색시 선택했던 카테고리 탭 활성화 @sy
		if( $("#selectedCategory").val() != "" ){
			$("#"+$("#selectedCategory").val()).click();
		}
		
		$("#calendarTab a").click(function() {
			var selectedDate = $("#selectedDate").val();
			if( selectedDate == "" ){
				selectedDate = new Date().format("yyyy/MM/dd").toString();
			}
			var categoryId = $('#calendarTab li[class="active"]').children().attr("id");
			searchByDate(selectedDate, categoryId);
		});
		
		
	});
	
	
	function searchByDate(calendarDate, categoryId) {
		var category = "";
		if(categoryId == "calAllTab" || categoryId == ""){
			category="all";
		} else if(categoryId == "calFestivalTab"){
			category="festival";
		} else if(categoryId == "calPerformanceTab"){
			category="performance";
		} else if(categoryId == "calExhibitionTab"){
			category="exhibition";
		} else if(categoryId == "calClassicTab"){
			category="classic";
		} else if(categoryId == "calTraditionalTab"){
			category="ect";
		}
		location.href="${pageContext.request.contextPath}/event_by_calendarDate.do?"
										+"calendarDate="+calendarDate
										+"&category="+category
										+"&selectedCategory="+categoryId;
	}
	
	
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

	.fc-header-title { margin: 0 20px; font-weight: bold; color: gray; }
	.fc-header-title > h2 { font-size: 22px; vertical-align: baseline;}
	.fc-event #99 { background-color: red; }
	.fc-day-header { color: #fff; border-color: #6dbd96; font-size: medium; }
	.fc-grid th { background-color: #6dbd96; }
	.fc-day { border-color: #B1CEC0; }
	.fc-dat > div { height: 100%; }
	.fc-button { border-color: transparent; color: #6dbd96; }
	.fc-button-today { border-color: #ccc; }
	.fc-day-number {
		width: 100%;
		text-align: center;
		color: gray;
		height: 42px;
		vertical-align: middle;
		line-height: 45px;
		font-size: medium;
	}
	.fc-day-number:hover { 
		font-weight: bold; 
		color: salmon; 
		font-size: large;
	}
	#calendarInfo {
		display: inline-block; 
		width: 363px;
		height: 70px;
		margin-bottom: 30px;
		border: 1px solid #ddd; 
		border-radius: 5px;
		background-color: #f7f7f7;
		vertical-align: middle; 
		line-height: 70px; 
		font-size: 14px;
	}
	
</style>
</head>
<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
		<br/>
		<div class="row" style="padding: 15px 0;">
			<span class="glyphicon glyphicon-calendar seoulnori-mid-title" style="font-size: 24px;"></span>
			<span class="seoulnori-mid-title" style="font-size: 20px;">날짜별 노리찾기</span> 
		</div>
			<input type="hidden" id="fromMain" value="${fromMain}" />
			<input type="hidden" id="selectedDate" value="${selectedDate}" />
			<input type="hidden" id="selectedDateType" value="${selectedDateType}" />
			
		<div class="row" id="topContents" style="margin-top: 10px;">
			<!-- 캘린더 -->
			<div id="mainCalendar" style="width: 360px; text-decoration: none; display: inline-block;"></div>
			
			<!-- 캘린더 옆 -->
			<div style="display: inline-block; width: 489px; text-align: center; position: absolute; padding-top: 110px;">
				<div id="calendarInfo">
					<span class="glyphicon glyphicon-hand-left" 
								style="font-size: x-large; color: #6dbd96; vertical-align: sub;"></span>&nbsp;
					<span style="color: gray">행사정보를 검색하고자 하는 날짜를 클릭하세요</span>
				</div>
				<!-- 날짜 flapper -->
				<div class="display" style="display: inline-block; ">
					<input class="M light" id="header_display" />
				</div>
			</div>
		</div><!-- end row:topContents -->
		
		<br/>
		<div class="row" id="MainContents" 
			style="margin-top: 10px; padding: 0;  height: 420px; ">
			
			<input type="hidden" id="selectedCategory" value="${selectedCategory}"/>
			
			<ul class="nav nav-tabs-seoulnori" id="calendarTab">
			  <li class="active"><a id="calAllTab" href="#calAll">전체</a></li>
			  <li><a id="calFestivalTab" href="#calFestival">축제</a></li>
			  <li><a id="calPerformanceTab" href="#calPerformance">공연</a></li>
			  <li><a id="calExhibitionTab" href="#calExhibition">전시</a></li>
			  <li><a id="calClassicTab" href="#calClassic">클래식</a></li>
			  <li><a id="calTraditionalTab" href="#calTraditional">전통/기타</a></li>
			</ul>
			 
			 <input type="hidden" id="calendarDate" value="${calendarDate}" />
			 
			<div class="tab-content">
			
				<div class="tab-pane active" id="calAll"></div>
				<div class="tab-pane" id="calFestival"></div>
				<div class="tab-pane" id="calPerformance"></div>
				<div class="tab-pane" id="calExhibition"></div>
				<div class="tab-pane" id="calClassic"></div>
				<div class="tab-pane" id="calTraditional"></div>
				
			</div> <!-- end tab-content -->
			
			<div id="calendarSearchedResult" style="height: 307px;">
					<c:if test="${ eventListByDate != null && eventListByDate.size() != 0 }">
						<div style="margin-left: 50px; font-weight: bold; margin-top: 15px;">
						<span class="glyphicon glyphicon-search" style="font-size: medium; color: gray;"></span> 
						<span style="font-weight: bold;">검색결과 ${ eventListByDate.size() }건</span>
						</div>
					</c:if>
					
					<c:choose>
						<c:when test="${ eventListByDate != null && eventListByDate.size() != 0 }">					
							
							<div class="bxSlider-calendar" style="width: 800px;">
							
							<c:forEach items="${eventListByDate}" var="event" varStatus="status">
	
								<c:if test="${ status.index%3 == 0 }">  
									 <!-- 이미지 슬라이더 contents : start -->
									  <div class="slide">
								</c:if>
	
											<table class="mapSlideTable">
												<tr>
													<td style="width: 82px;">
														<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}">
															<c:if test="${event.eventThumbnail != null}">
																<img class="mapSlideImg" src="${event.eventThumbnail}"/>
															</c:if>
															<c:if test="${event.eventThumbnail == null}">
																<img class="mapSlideImg" src="${pageContext.request.contextPath}/images/main/noPhoto.png"/>
															</c:if>
														</a>
													</td>
													<td class="mapSlideTd">
														<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}" style="width: 280px;">
															<span class="mapSlideTitle">
																${event.eventTitle}
															</span>
														</a>
														<hr class="mapSlideHr"/>
														<span class="mapSlideDate">${event.eventStartDate} ~ ${event.eventEndDate}</span>
													</td>
												</tr>		
											</table>
											
									<c:if test="${ status.index%3 == 2 || status.index == eventListByDate.size()-1 }">
										</div>
										<!-- 이미지 슬라이더 contents : end -->
									</c:if>
							
								</c:forEach>
								
								<c:if test="${ eventListByDate.size() < 4 }">
										
										<div class="slide">
											<table class="mapSlideTable">
												<tr><td style="width: 82px;"></td>
													<td class="mapSlideTd"><a style="width: 280px;"><span class="mapSlideTitle"></span></a>
														<hr class="mapSlideHr" style="border-color: transparent;"/>
														<span class="mapSlideDate"></span>
												</td></tr>		
											</table>
										</div>
											
								</c:if>
							
							</div> <!-- end bxSlider-map -->
						</c:when>
						<c:otherwise>
						
							<c:if test="${ eventListByDate.size() == 0 }">
								<div style="padding: 80px; text-align: center;">
									<div style="height: 32px; vertical-align: middle; line-height: 32px; display: inline-block; color: gray;"> 
										<span class="glyphicon glyphicon-ok-circle" style="font-size: x-large; color: #6dbd96; margin-bottom: 10px;"></span><br/>
										선택하신 날짜 및 분류에 해당하는 행사정보가 없습니다
									</div>
								</div>
							</c:if>
							
							<c:if test="${ eventListByDate == null }">
								<div style="padding: 100px; text-align: center;">
									<div style="vertical-align: middle; line-height: 32px; display: inline-block; color: gray; font-size: 14px;"> 
										<div style="border: 1px solid #ddd; border-radius: 5px; background-color: #f7f7f7; padding: 20px 20px;">
											<span class="glyphicon glyphicon-hand-up" style="font-size: x-large; color: #6dbd96; margin-bottom: 10px;"></span><br/>
											행사정보를 검색하고자 하는 날짜를 클릭하세요
										</div>
									</div>
								</div>
							</c:if>
							
						</c:otherwise>
					</c:choose>
			
			</div><!-- calendarSearchedResult -->
			
		</div><!-- end row:MainContents -->
	</div><!-- end col-md-8 -->
	
	<div class="col-md-2"></div>

</div>
<br/><br/><br/>

</body>
</html>