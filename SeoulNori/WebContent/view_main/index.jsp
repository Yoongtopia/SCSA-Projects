<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.seoulnori.vo.Event" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-seoulnori.css' />
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-theme-seoulnori.css' />
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.11.0.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



<script type="text/javascript">


	$(function() {
		
		/* footer 높이 */
		var browserHeight = document.documentElement.clientHeight;
		var bodyHeight = document.getElementById("mainBody").getBoundingClientRect().height;
		if(browserHeight-bodyHeight >= 120){
			$("#mainDiv").css("height", "694px");	
		}
		$("#seoulnoriFooter").css("display", "block");
	
		/* aside 메뉴 hover */
		$("#main-menu-top").hover(function() {
			$("#main-menu-top").attr("src", "${pageContext.request.contextPath}/images/main/top_green.png");
			$("#main-menu-top-title").css("visibility", "visible");
		}, function() {
			$("#main-menu-top").attr("src", "${pageContext.request.contextPath}/images/main/top.png");
			$("#main-menu-top-title").css("visibility", "hidden");
		});
		
		$("#main-menu-map").hover(function() {
			$("#main-menu-map").attr("src", "${pageContext.request.contextPath}/images/main/map_green.png");
			$("#main-menu-map-title").css("visibility", "visible");
		}, function() {
			$("#main-menu-map").attr("src", "${pageContext.request.contextPath}/images/main/map.png");
			$("#main-menu-map-title").css("visibility", "hidden");
		});
		
		$("#main-menu-calendar").hover(function() {
			$("#main-menu-calendar").attr("src", "${pageContext.request.contextPath}/images/main/calendar_green.png");
			$("#main-menu-calendar-title").css("visibility", "visible");
		}, function() {
			$("#main-menu-calendar").attr("src", "${pageContext.request.contextPath}/images/main/calendar.png");
			$("#main-menu-calendar-title").css("visibility", "hidden");
		});
		
		setTimeout(errorchecker, 500);
		
		
	});

	function errorchecker() {
		if($("#errorMessage").val()!=null&&$("#errorMessage").val().trim()!=""){
			window.location="${pageContext.request.contextPath}/seoulnori.do";
			alert($("#errorMessage").val());	
		}
	}
</script>
<style type="text/css">
#eventTodayBox{
	left: 1105px;
	top: 125px;
	position: fixed;
	width: 120px;
	border: 1px solid #ddd;
	background-color: #f8f8f8;
	padding-bottom: 12px;
	box-shadow: 2px 2px 1px rgba(192, 192, 192, 0.3);
}
#eventTodayBoxHeader {
	width: 120px;
	padding: 5px 0;
	color: gray;
	font-size: small;
	font-weight: bold;
	text-align: center;
	background-color: #fff;
	border-bottom: 2px solid #6dbd96;
}
.todayShow {
	padding: 15px 10px 0 10px;
}
.todayShow p {
	width: 90px;
	margin: 0;
	padding-top: 5px;
	font-size: smaller;
	font-weight: bold;
	color: #a1a1a1;
	max-height:39px;
	display:block;
	display:-webkit-box;
	-webkit-line-clamp:2;
	-webkit-box-orient:vertical;
	overflow:hidden;
	text-overflow:ellipsis;
}
.todayShow img {
	width: 80px;
	height: 65px;
	border-radius: 3px;
	border: 1px solid #eee;
}
.glyphicon-bookmark {
	color: #6dbd96;
}
#folding { color: #6dbd96; }
#folding:hover { color: gray; }
#main-menu-top-title, #main-menu-map-title, #main-menu-calendar-title {
	font-weight: bolder;
	font-size: small;
	color: gray;
	visibility: hidden;
}
#main-menu-top-title {
	margin-bottom: -4px;
}

</style>
<title>Seoul Nori 서울노리</title>
</head>
<body id="mainBody">

	<!-- 사용자 메뉴 -->
	<div class="row" style="overflow: hidden; margin: 0; width: 1280px;">
		<div style="position: absolute; width: 100%;">
				<jsp:include page="/view_main/menu.jsp"/>
		</div>
	</div>
	
	<div>
	<!-- contentPage Check -->
	<c:choose>
		
		<c:when test="${ contentPage != null }">
		<!-- contentPage 있을 경우 -->
		
			<c:choose>
				<c:when test="${ contentPage == '' }">
					<!-- contentPage가 mypage인 경우 -->
					<div class="row" style="margin: 110px 0 0 0; overflow: hidden;">
						<jsp:include page="./../${contentPage}"/>
					</div>
				</c:when>
				<c:otherwise>
					<!-- contentPage가 mypage 아닌 경우 -->
					<div class="row" style="margin: 110px 0 0 0; overflow: hidden;">
						<jsp:include page="./../${contentPage}"/>
					</div>
				</c:otherwise>
			</c:choose>

		
		</c:when>
		
		
		<c:otherwise>
		<!-- contentPage 없을 경우: 메인 페이지로 -->	
		
				<!-- 메인 aside 메뉴 -->
					<div class="row" style="position: fixed; left: 1075px; z-index: 200; width: 170px;">
						<div class="col-md-2" style="text-align: center;">
							<table style="text-align: center; width: 170px; height: 650px;">
								<tr height="300px"><td></td></tr>
								<tr>
									<td>
										<span id="main-menu-top-title">위로</span><br/>
										<a href="#"><img id="main-menu-top" src="${pageContext.request.contextPath}/images/main/top.png" height="80px"/></a>
									</td>
								</tr>
								<tr>
									<td>
										<span id="main-menu-map-title">지도검색</span><br/>
										<a href="#mapPage">	<img id="main-menu-map" src="${pageContext.request.contextPath}/images/main/map.png" height="85px" /></a>
									</td>
								</tr>
								<tr>
									<td>
										<span id="main-menu-calendar-title">날짜검색</span><br/>
										<a href="#calendarPage"><img id="main-menu-calendar" src="${pageContext.request.contextPath}/images/main/calendar.png" height="80px" /></a>
									</td>
								</tr>
							</table>
						</div>	
					</div>
					
					<!-- 메인 페이지 -->
					<div class="row" style="margin: 110px 0 0 0; overflow: hidden;">
						<jsp:include page="main.jsp"/>
					</div>
					
					<br/><br/><br/><br/>
					
					<div id="mapPage"></div>
					<div class="row" style="margin: 0; overflow: hidden;">
						<c:import url="main_map.jsp"/>
					</div>

					<div id="calendarPage"></div>
					<div class="row" style="margin: 0; overflow: hidden;">
						<jsp:include page="main_calendar.jsp"/>
					</div>
			
		</c:otherwise>
		
	</c:choose>
	
	</div>
	
	<!-- footer -->
	<div id="seoulnoriFooter" style="width: 100%; height: 120px; background-color: #ddd; display: none;">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="padding: 25px 0; font-size: small;">
		<table>
			<tr>
				<td rowspan="3" style="padding-right: 10px;">
					<img src="${pageContext.request.contextPath}/images/main/nam.png" height="70px"/></td>
				<td>
					<span style="font-weight: 600;">프로젝트 서울노리</span> | 삼성 컨버전스 소프트웨어 아카데미 2기 SDS 1반 융토피아 오아앤드
				</td>
			</tr>
			<tr>
				<td>
					<span style="font-weight: 600;">대표</span> | 권오아&nbsp;&nbsp;
					<span style="font-weight: 600;">관리자</span> | 권순형&nbsp;&nbsp;
					<span style="font-weight: 600;">문의</span> | 010-4231-5352&nbsp;&nbsp;
					<span style="font-weight: 600;">이메일</span> | seoulnori@seoulnori.com&nbsp;&nbsp;
					<span style="font-weight: 600;">업무시간</span> | 24시간이 모자라
				</td>
			</tr>
			<tr>
				<td>
					Unofficial Seoul Tourism Website copyrights 2014.05 - 2014.06 SCSA 2nd SDS 1, YoongTopia, OaAnd all rights reserved.
				</td>
			</tr>
		</table>
		
		</div>
		<div class="col-md-2"></div>
	</div>
	
	
	<c:if test="${ contentPage != null }">
		<table id="eventTodayBox"></table>
	</c:if>
		
		<script type="text/javascript">
		if(typeof(Storage) !== "undefined") {
			$("#eventTodayBox").css("display","none");	
			$("#eventTodayBox").children().remove();
			$("#eventTodayBox").append($("<tr/>").append($("<td/>")
					.attr("id", "eventTodayBoxHeader")
					.html("<span class='glyphicon glyphicon-bookmark'></span> 오늘 본 노리")));
			if(localStorage!=null){
				if(localStorage.getItem("4")!=null&&localStorage.getItem("4").trim()!=""){
					var eventObj4=JSON.parse(localStorage.getItem("4"));
					if(eventObj4.eventThumbnail == null || eventObj4.eventThumbnail == "" || eventObj4.eventThumbnail == "null"){
						var img4=$("<img/>").attr("src", "${pageContext.request.contextPath}/images/main/noPhoto.png");
					} else {
						var img4=$("<img/>").attr("src", eventObj4.eventThumbnail);
					}
					var p4=$("<p/>").text(eventObj4.eventTitle);
					var div4=$("<div class='todayShow'/>").append(img4,p4);
					var a4=$("<a/>").attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+eventObj4.eventId)
					.append(div4);
					var td4=$("<td align='center'/>").append(a4);					
					var tr4=$("<tr/>").append(td4).attr("class", "eventTodayItem");			
					$("#eventTodayBox").append(tr4);					
				}
				if(localStorage.getItem("3")!=null&&localStorage.getItem("3").trim()!=""){
					var eventObj3=JSON.parse(localStorage.getItem("3"));
					if(eventObj3.eventThumbnail == null || eventObj3.eventThumbnail == "" || eventObj3.eventThumbnail == "null"){
						var img3=$("<img/>").attr("src", "${pageContext.request.contextPath}/images/main/noPhoto.png");
					} else {
						var img3=$("<img/>").attr("src", eventObj3.eventThumbnail);
					}
					var p3=$("<p/>").text(eventObj3.eventTitle);
					var div3=$("<div class='todayShow'/>").append(img3,p3);
					var a3=$("<a/>").attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+eventObj3.eventId)
					.append(div3);
					var td3=$("<td align='center'/>").append(a3);
					var tr3=$("<tr/>").append(td3).attr("class", "eventTodayItem");			
					$("#eventTodayBox").append(tr3);					
				}
				if(localStorage.getItem("2")!=null&&localStorage.getItem("2").trim()!=""){
					var eventObj2=JSON.parse(localStorage.getItem("2"));
					if(eventObj2.eventThumbnail == null || eventObj2.eventThumbnail == "" || eventObj2.eventThumbnail == "null"){
						var img2=$("<img/>").attr("src", "${pageContext.request.contextPath}/images/main/noPhoto.png");
					} else {
						var img2=$("<img/>").attr("src", eventObj2.eventThumbnail);
					}
					var p2=$("<p/>").text(eventObj2.eventTitle);
					var div2=$("<div class='todayShow'/>").append(img2,p2);
					var a2=$("<a/>").attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+eventObj2.eventId)
					.append(div2);
					var td2=$("<td align='center'/>").append(a2);					
					var tr2=$("<tr/>").append(td2).attr("class", "eventTodayItem");
					$("#eventTodayBox").append(tr2);					
				}
				if(localStorage.getItem("1")!=null&&localStorage.getItem("1").trim()!=""){
					var eventObj1=JSON.parse(localStorage.getItem("1"));
					if(eventObj1.eventThumbnail == null || eventObj1.eventThumbnail == "" || eventObj1.eventThumbnail == "null"){
						var img1=$("<img/>").attr("src", "${pageContext.request.contextPath}/images/main/noPhoto.png");
					} else {
						var img1=$("<img/>").attr("src", eventObj1.eventThumbnail);
					}
					var p1=$("<p/>").text(eventObj1.eventTitle);
					var div1=$("<div class='todayShow'/>").append(img1,p1);
					var a1=$("<a/>").attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+eventObj1.eventId)
					.append(div1);
					var td1=$("<td align='center'/>").append(a1);					
					var tr1=$("<tr/>").append(td1);
					$("#eventTodayBox").append(tr1).attr("class", "eventTodayItem");					
				}
				
				$("#eventTodayBox").css("display","block");	
			
			}
		} else {
		    // Sorry! No Web Storage support..
		}
		
		</script>
		<% if(request.getAttribute("error")!=null&&((String)request.getAttribute("error")).trim()!=""){
				String errorMessage=URLDecoder.decode((String)request.getAttribute("error"), "UTF-8");
				request.setAttribute("errorMessage", errorMessage);
			}
			%>
		<input type="hidden" id="errorMessage" value="${requestScope.errorMessage }">


</body>
</html>