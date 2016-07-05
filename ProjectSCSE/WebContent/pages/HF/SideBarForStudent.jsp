<%@page import="com.scse.entity.User"%>
<%@page import="com.scse.entity.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en" data-useragent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script type="text/javascript">

	$(document).ready(function() {
		noticeReading();
		messageReading();
		$('.demo.menu .item').tab('change tab', 'second');	
		
		$("#view").on("click", function() {
			$('.ui.modal').modal('show');
		});
		$("#notice").on("click", function() {
			$('.notice').modal('show');
		});

		$(".dropdown").dropdown('mouse events', 'show');
		
			
		$(".blue.button").on("mouseenter", function() {
			$.post("find_max_mission_index.scse", function(jsonObj){

				if(jsonObj.status){
					$("#missionIndex").text(jsonObj.mission.chapNum
								+"-"+jsonObj.mission.quizNum+"번 문제를 풀 차례에요.")
				} else{
					$("#missionIndex").text("처음이신가요? 지금시작해봐요!")
				}}, "json");
		
		});
		
		//공지사항 20초 간격으로 로딩
		setInterval(noticeReading,  1000  * 20 );
				function noticeReading(){
					$(".noticeResult").remove();
					$.post("notice_read_ajax.scse",
						   function(jsonObj){
							if(jsonObj.status){
								$(".noticeResult").remove();
								$(jsonObj.noticeList).each(function(index, item){
									var td1 = $("<td/>").text(item.noticeDate);
									var td2 = $("<td/>").text(item.noticeContent);
									var tr = $("<tr/>").attr("class", "noticeResult").append(td1, td2);
									$("#noticeTarget").append(tr);
									console.log("알림장 로딩성공");
								});
							} else {
								$(".noticeResult").remove();
								var td1 = $("<td/>").text("등록된");
								var td2 = $("<td/>").text("알림장이 없습니다");
								var tr = $("<tr/>").attr("class", "noticeResult").append(td1, td2);
								$("#noticeTarget").append(tr);
								console.log("알림장 로딩실패");
							}
					}, "json");
				}
	
		
		//메시지 10초간격으로 읽어들이기
		setInterval(messageReading, 1000 * 5);
		
			function messageReading(){
				$.post("message_read_ajax.scse",
						function (jsonObj){
							if(!jsonObj.status){
								console.log('수신된 메시지가 없습니다.');
							} else {
								if(jsonObj.message.msContent =="false"){
									$("#ControlModal").modal("show");
								} else {
								$("#messageSender").text(jsonObj.message.msWriter);
								$("#messageTitle").text(jsonObj.message.msTitle);
								$("#messageDate").text(jsonObj.message.msDate);
								$("#messageContent").text(jsonObj.message.msContent);
								$(".message").modal('show');
								console.log('메시지 수신 성공');
								}
							}
					
				}, "json");
			}
			
		});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var tabHeight = $(".ui.pointing").css("height");
	var tH = parseInt(tabHeight, 10);
	var windowheight = $(window).height();
	
	var tableHeight = $("#tableHeight").height();
	
	var setting = windowheight-tH-45-tableHeight;
	var settings = setting+"px";
	var setting2 = windowheight-tH-45-tableHeight;
	var settings2 = setting2+"px";

	
	$(".tab").css("height", settings);
	$("#firstTab").css("height", settings2);
	$("#secondTab").css("height", settings2);
	
//맵에서 미션 제어하기.
<%-- <%int index = (Integer) session.getAttribute("missionIndex");
			for (int i = 55; i > index; i--) {%>
		$('#no<%=i%>').children().removeAttr("href");
		$('#no<%=i%>').children().children().addClass("disabled");
<%}%> --%>
	$("#mapshow").on("click", function() {
							$("#entireMap").modal("show");
						});

						 $(".missionImg").on("click", function() {
							$("#QuestionModal").modal("show");
						}); 

					});
</script>
</head>
<style type="text/css">
a {
	text-decoration: none;
}

.mainlogoImg {
	margin: 0 auto;
}

.element {
	width: 62px;
}
</style>
<body>
	<!-- 스크린샷을 찍기 위한 코드 -->

	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/base64.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/canvas2image.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/html2canvas.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/jquery.plugin.html2canvas.js"></script>
	<script type="text/javascript">
		var cap = "";
		$(document).ready(function() {
			cap = setInterval(capture, 1000 * 20);

			function capture() {
				html2canvas(document.body, {
					onrendered : function(canvas) {
						$.post("user_screen_upload_ajax.scse", {
							"image" : canvas.toDataURL()
						}, function(jsonObj) {
							if (jsonObj.status) {
								console.log("캡쳐성공");
							} else {
								console.log("캡쳐실패");
							}
						}, "json");
					}
				});
			}
		});
	</script>
	<!-- 스크린샷용 코드 끝 -->

	<!-- 로고이미지 박혀야됨 -->
	<!-- 탭상단 -->
	<table id="tableHeight" style="margin: 0 auto;">
	<tr>
		<td>
			<a style="text-align: center" href="${ pageContext.request.contextPath }/introFrame.jsp"> <img align="middle" src="${ pageContext.request.contextPath }/assets/image/SGcoding_logo1.png" width="280px" height="80px" data-step="3" data-intro='슬코로고' data-position="bottom" class="mainlogoImg" id="mainlogoImg"></a>
		</td>
	</tr>
		<tr>
			<td>
				<div align="center" id="profileImage">
						<img align="middle" width="200px" height="200px" class="ui image" src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }">
				</div>
			</td>
		</tr>
	</table>
	<div align="center" style="font-weight: bold">${sessionScope.user.sName }님, 오늘도 열심히 공부해볼까요!</div>

	<!-- 탭 -->
	<div class="ui pointing secondary demo menu" style="margin: 0 auto; background: none;">
		<a class="active red item fluid" data-tab="first" style="text-align: center; width: 50%; font-weight: bold">문제보기</a> <a class="purple item fluid" data-tab="second" style="text-align: center; font-weight: bold; width: 50%;">상태보기</a>
	</div>
	<!-- 탭1 화면 -->
	<div class="ui active tab segment" data-tab="first" style="text-align: center; margin: 0;">
		<c:choose>
			<c:when test="${ requestScope.mission.missionIndex < 50 }">
				<h5 class="ui top attached header" style="font-family: Nanum Gothic;">${sessionScope.mission.chapNum}-${sessionScope.mission.quizNum}번 문제<br/><br/>${sessionScope.mission.quizDesc}</h5>
			</c:when>
			<c:otherwise>
				<h5 class="ui top attached header" style="font-family: Nanum Gothic;">${sessionScope.mission.chapNum}-${sessionScope.mission.quizNum}번 문제<br/><br/>${sessionScope.mission.quizHeader}</h5>
			</c:otherwise>
		</c:choose>
		<div style="height: 1%"></div>
		<c:choose>
			<c:when test="${ requestScope.mission.chapNum == 0 }">
				<a href="javascript:void(0)"><img class="missionImg" width="250px" height="250px" src="${ pageContext.request.contextPath }/assets/image/Tutorial/${requestScope.mission.chapNum}-${requestScope.mission.quizNum}.png"></a>
			</c:when>
			<c:when test="${ requestScope.mission.chapNum == 1 }">
				<a href="javascript:void(0)"><img class="missionImg" width="250px" height="250px" src="${ pageContext.request.contextPath }/assets/image/Chapter01/${requestScope.mission.chapNum}-${requestScope.mission.quizNum}.png"></a>
			</c:when>
			<c:when test="${ requestScope.mission.chapNum == 2 }">
				<a href="javascript:void(0)"><img class="missionImg" width="250px" height="250px" src="${ pageContext.request.contextPath }/assets/image/Chapter02/${requestScope.mission.chapNum}-${requestScope.mission.quizNum}.png"></a>
			</c:when>
			<c:when test="${ requestScope.mission.chapNum == 3 }">
				<a href="javascript:void(0)"><img class="missionImg" width="250px" height="250px" src="${ pageContext.request.contextPath }/assets/image/Chapter03/${requestScope.mission.chapNum}-${requestScope.mission.quizNum}.png"></a>
			</c:when>
			<c:when test="${ requestScope.mission.chapNum == 4 }">
				<a href="javascript:void(0)"><img class="missionImg" width="250px" height="250px" src="${ pageContext.request.contextPath }/assets/image/Chapter04/${requestScope.mission.chapNum}-${requestScope.mission.quizNum}.png"></a>
			</c:when>
			<c:when test="${ requestScope.mission.chapNum == 5 }">
				<span style="font-size: large; font-weight: bold; margin-top: 20px">닷지 게임 만들기</span>
			</c:when>
			<c:otherwise>
				<br />
				<a href="enter_main.scse"><button class="ui blue button" style="width: 80%">미션모드 시작하기</button></a>
				<br />
				<br />
			</c:otherwise>
		</c:choose>
		<div class="ui purple button" style="margin-top:20px; width=90%; "id="mapshow">
			<i class="map icon"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진도보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>

	<!-- 두번째 탭 -->
	<div class="ui tab padded" id="secondTab" data-tab="second" style="text-align: center; margin: 0; background: white;">
	<div style="height: 25px"></div>
	<div class="ui blue medium button" data-value="male" style="width: 90%;"><a href="character_list.scse" style="text-decoration: none; color: black;"><i class="user icon"></i>캐릭터바꾸기</a></div>
 	<div style="height: 25px"></div>
	<div class="ui top label fluid" style="max-width: 90%; font-size: large; font-weight: bold"><i class="teal bell outline icon"></i>알림장</div>
	<div style="height: 25px"></div>
		<div style="width: 100%; height: 70%; overflow-y: scroll; overflow-x: hidden;">
		<table class="ui table segment" style="width: 100%">
			<thead>
				<tr>
					<th style="text-align: center; width: 30%;">날짜</th>

					<th style="text-align: center; width: 70%;">내용</th>

				</tr>
			</thead>
			<tbody id="noticeTarget">
			</tbody>
		</table>
		</div>
		<br />

	</div>


	<!-- 모달 -->
	<div class="ui modal">
		<i class="close icon"></i>
				<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">알림장</div>
		<div class="content">
			<div class="left">Content can appear on left</div>
			<div class="right">Content can appear on right</div>
		</div>
		<div class="actions">
			<div class="ui right labeled orange icon button">Cancel<i class="undo icon"></i></div>
			<div class="ui right labeled orange icon button">OK<i class="checkmark icon"></i></div>
		</div>
	</div>

	<!-- 메시지 읽기용 모달 -->
	<div class="ui small modal message">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">메시지</div>
		<div class="content">
			<table class="ui segment table">
				<tr>
					<th style="width: 20%;">보낸사람:</th>
					<td id="messageSender"></td>
				<tr>
					<th>메시지제목:</th>
					<td id="messageTitle"></td>
				<tr>
					<th>보낸날짜:</th>
					<td id="messageDate"></td>
				<tr>
					<th>내용:</th>
					<td id="messageContent"></td>
			</table>
		</div>
		<div class="actions">
			<div class="ui right labeled orange icon button">확인<i class="checkmark icon"></i></div>
		</div>
	</div>


	<!-- 맵모달 -->
	<div class="ui modal map" id="entireMap">
		<i class="close icon"></i>
				<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">${sessionScope.user.sName }님의모험, 어디까지 왔을까요?</div>
		<div class="content">
			<div class="contents">

				<!-- 튜토리얼 -->
				<table class="ui table mapTable segment" id="chatper0">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 15%;">튜토리얼</th>
						<th class="element" id="no1" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=1"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no2" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=2"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no3" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=3"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no4" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=4"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no5" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=5"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no6" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=6"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no7" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=7"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no8" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=8"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no9" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=9"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element" id="no10" style="text-align: center;"><a class="atag" href="find_tutorialIndex.scse?missionIndex=10"><i class="flag circular pink inverted icon" style="background-color: rgba(255, 151, 203, 1)"></i></a></th>
						<th class="element"></th>
						<th class="element"></th>
					</tr>
					<tr>
						<td>튜-1</td>
						<td>튜-2</td>
						<td>튜-3</td>
						<td>튜-4</td>
						<td>튜-5</td>
						<td>튜-6</td>
						<td>튜-7</td>
						<td>튜-8</td>
						<td>튜-9</td>
						<td>튜-10</td>
					</tr>
				</table>

				<!-- 1판 -->
				<table class="ui table mapTable segment" id="chatper1">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 15%;">아코를 찾아라</th>
						<th class="element" id="no11" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=11"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no12" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=12"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no13" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=13"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no14" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=14"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no15" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=15"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no16" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=16"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no17" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=17"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no18" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=18"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no19" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=19"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no20" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=20"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no21" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=21"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="no22" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=22"><i class="flag circular purple inverted icon"></i></a></th>
					</tr>
					<tr>
						<td>1-1</td>
						<td>1-2</td>
						<td>1-3</td>
						<td>1-4</td>
						<td>1-5</td>
						<td>1-6</td>
						<td>1-7</td>
						<td>1-8</td>
						<td>1-9</td>
						<td>1-10</td>
						<td>1-11</td>
						<td>1-12</td>
					</tr>
				</table>
				<!-- 2판 -->
				<table class="ui table mapTable segment" id="chatper2">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 15%;">아코와의 한판 승부</th>
						<th class="element" id="no23" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=23"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="no24" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=24"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="no25" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=25"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="no26" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=26"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="no27" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=27"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="no28" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=28"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="no29" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=29"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>



					</tr>
					<tr>
						<td>2-1</td>
						<td>2-2</td>
						<td>2-3</td>
						<td>2-4</td>
						<td>2-5</td>
						<td>2-6</td>
						<td>2-7</td>




					</tr>
				</table>
				<!-- 3판 -->
				<table class="ui table mapTable segment" id="chatper3">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 15%;">서부의 무법자, 아코</th>
						<th class="element" id="no30" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=30"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no31" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=31"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no32" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=32"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no33" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=33"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no34" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=34"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no35" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=35"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no36" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=36"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no37" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=37"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no38" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=38"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="no39" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=39"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element"></th>
						<th class="element"></th>

					</tr>
					<tr>
						<td>3-1</td>
						<td>3-2</td>
						<td>3-3</td>
						<td>3-4</td>
						<td>3-5</td>
						<td>3-6</td>
						<td>3-7</td>
						<td>3-8</td>
						<td>3-9</td>
						<td>3-10</td>
					</tr>
				</table>
				<!-- 4판 -->
				<table class="ui table mapTable segment" id="chatper4">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 15%;">친구들아 도와줘!</th>
						<th class="element" id="no40" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=40"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no41" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=41"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no42" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=42"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no43" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=43"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no44" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=44"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no45" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=45"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no46" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=46"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no47" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=47"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no48" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=48"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="no49" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=49"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element"></th>
						<th class="element"></th>
					</tr>
					<tr>
						<td>4-1</td>
						<td>4-2</td>
						<td>4-3</td>
						<td>4-4</td>
						<td>4-5</td>
						<td>4-6</td>
						<td>4-7</td>
						<td>4-8</td>
						<td>4-9</td>
						<td>4-10</td>
					</tr>
				</table>
				<!-- 5판 -->
				<table class="ui table mapTable segment" id="chatper5">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 15%;">아코의 습격</th>
						<th class="element" id="no50" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=50&from=progressMap"> <i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="no51" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=51&from=progressMap"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="no52" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=52&from=progressMap"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="no53" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=53&from=progressMap"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="no54" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=54&from=progressMap"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="no55" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=55&from=progressMap"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="no56" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=56&from=progressMap"><i class="flag circular teal inverted icon"></i></a></th>
				
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
					</tr>
					<tr>
						<td>5-1</td>
						<td>5-2</td>
						<td>5-3</td>
						<td>5-4</td>
						<td>5-5</td>
						<td>5-6</td>
						<td>5-7</td>
					</tr>
				</table>
				<!-- 자유모드 -->
				<table class="ui table mapTable segment" id="freemode">
					<tr>
						<th rowspan="2" class="maptitle" style="width:15%;">자유모드로 가기</th>
						<th class="element" id="no56" style="text-align: center;"><a class="atag" href="${ pageContext.request.contextPath }/enter_main.scse"> <i class="flag circular yellow inverted icon"></i></a></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
						<th class="element"></th>
					</tr>
					<tr>
					<td>자유모드</td>
				</tr>				
				</table>
			</div>
		</div>
		<div class="actions">
			<div class="ui orange right labeled icon button">닫기<i class="remove icon"></i></div>
		</div>
	</div>
	
	<!-- 제어요청이 왔습니다. -->
	<div class="ui small modal" id="ControlModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #FF5344; font-family: 'Nanum Gothic';">선생님이 도와주실거예요!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/UseAll.png"></td>		
				<tr>
					<td>선생님이 여러분의 컴퓨터에 접속하여 도와주실거예요.</td>
				<tr>
					<td>잠시만 기다려주세요.</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui right labeled orange icon button" align="center" style="margin-left: 0px;">확인<i class="checkmark icon"></i></div>
			</div>
		</div>
	</div>
	
</body>
</html>