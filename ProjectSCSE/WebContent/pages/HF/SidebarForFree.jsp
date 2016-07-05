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
$(document).ready(function(){
	
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
	
	studenList();
	setInterval(studenList, 1000 * 60);
	$(".dropdown").dropdown();
	$(".circleProfile").css("height", $(".circleProfile").width());
	
	//그룹정보 로딩
		$.post("my_group_list_ajax.scse", function(jsonObj){
			if(jsonObj.status){
				$(jsonObj.list).each(function(index, item){
					var a = $("<a/>").addClass("item").attr("href", "my_group_info.scse?groupNum="+item.groupNum+"&groupName="+item.groupName).text(item.groupName).css("text-align", "center");
					$("#targetList").append(a);
				});
			}
		}, "json");
		
});

function studenList() {
	$("#myStudent").empty();
	$.post("all_my_student_login.scse", function(jsonObj) {
		if (jsonObj.status) {
			$(jsonObj.list).each(
					function(index, item) {
						if(item.checkConnect=='y'){
						var td1 = $("<td/>").text(item.userId);
						var td2 = $("<td/>").text(item.userGroup.groupName);
						var td3 = $("<td/>").html("<i class='lightbulb circular inverted yellow icon'></i>");
							var tr = $("<tr/>").attr("class","searchResult ui primary segment").append(td1,td2,td3);
						$("#myStudent").append(tr);
						} else {
							var tdd1 = $("<td/>").text(item.userId);
							var tdd2 = $("<td/>").text(item.userGroup.groupName);
							var tdd3 = $("<td/>").html("<i class='lightbulb icon'></i>");
								var trr = $("<tr/>").attr("class","searchResult ui tertiary segment").append(tdd1,tdd2,tdd3);
							$("#myStudent").append(trr);
						};
					});
		} else {
			var td1 = $("<td/>").attr("colspan", "3").text("그룹에 아무도 없습니다.");
			var tr = $("<tr/>").attr("class", "searchResult")
					.append(td1);
			$("#myStudent").append(tr);
		}
	}, "json");
}
if(window.addEventListener){
    window.addEventListener('load',function(){
    	$('.demo.menu .item').tab('change tab', 'second');
    },false);
}
	$(document).ready(function() {
		$(document).on("click", "#galeryWalk", function() {
			location.href="${ pageContext.request.contextPath }/free_code_list.scse?orderType=codeDate";
		});
		$(document).on("click", "#selectMission", function() {
			$("#entireMap").modal("show");
		});
		$(document).on("click", "#codeDelBtn", function() {
			location.href="${ pageContext.request.contextPath }/del_free_code.scse?codeNum=" + $(this).val();
		});
		$(document).on("click", "#codeSaveBtn", function() {
			if("${ requestScope.freecode.codeNum == null }" == "true") {
				saveCodeData();
			}else {
				
			}
		});
		noticeReading();
		$('.demo.menu .item').tab('change tab', 'second');	
		
		$("#view").on("click", function() {
			$('.ui.modal').modal('show');
		});
		$("#notice").on("click", function() {
			$('.notice').modal('show');
		});
		
		noticeReading();
		$(".dropdown").dropdown('mouse events', 'show');
		
			
		$(".blue.button").on("mouseenter", function() {
			$.post("find_max_mission_index.scse", function(jsonObj){

				if(jsonObj.status){
					$("#missionIndex").text(jsonObj.mission.chapNum
								+"-"+jsonObj.mission.quizNum+"번 문제를 풀 차례에요.")
				} else{
					$("#missionIndex").text("처음이신가요? 지금시작해봐요!")}}, "json");
		
		});
		
		//공지사항 1분간격으로 로딩
		setInterval(noticeReading, 1000 * 10 * 6);
				function noticeReading(){
					$(".noticeResult").remove();
					$.post("notice_read_ajax.scse",
						   function(jsonObj){
							if(jsonObj.status){
								$(".noticeResult").remove();
								$(jsonObj.noticeList).each(function(index, item){
									for(var i = 1; i<=item.length; i++){
									var td1 = $("<td/>").text(item[i].noticeDate);
									var td2 = $("<td/>").text(item[i].noticeContent);
									var tr = $("<tr/>").attr("class", "noticeResult").append(td1, td2);
									$("#noticeTarget").append(tr);
									}
								});
							} else {
								$(".noticeResult").remove();
								var td1 = $("<td/>").text("등록된");
								var td2 = $("<td/>").text("알림장이 없습니다");
								var tr = $("<tr/>").attr("class", "noticeResult").append(td1, td2);
								$("#noticeTarget").append(tr);
							}
					}, "json");
				}
	
		
		//메시지 1분간격으로 읽어들이기
		setInterval(messageReading, 1000 * 60);
		
			function messageReading(){
				$.post("message_read_ajax.scse", {"userId": '${sessionScope.user.userId}'},
						function (jsonObj){
							if(!jsonObj.status){
								console.log('LoadMessage....');
							} else {
								$("#messageSender").text(jsonObj.message.msWriter);
								$("#messageTitle").text(jsonObj.message.msTitle);
								$("#messageDate").text(jsonObj.message.msDate);
								$("#messageContent").text(jsonObj.message.msContent);
								$(".message").modal('show');
							}
					
				}, "json");
			}
			
			$("#saveButton").on("click", function(){
				$("#save").modal("show");
			});
			
		});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var tabHeight = $(".ui.pointing").css("height");
	var tH = parseInt(tabHeight, 10);
	var windowheight = $(window).height();
	
	var tableHeight = $("#tableHeight").height();
	
	var setting = windowheight-tH-50-tableHeight;
	var settings = setting+"px";
	var setting2 = windowheight-tH-50-tableHeight;
	var settings2 = setting2+"px";

	
	$(".tab").css("height", settings);
	$("#secondTab").css("height", settings2);
	
	<%int index = (Integer) session.getAttribute("missionIndex");
			for (int i = 55; i > index; i--) {%>
		$('#no<%=i%>').children().removeAttr("href");
		$('#no<%=i%>').children().children().addClass(
								"disabled");
<%}%>
	$("#mapshow").on("click", function() {
							$("#entireMap").modal("show");
						});

						$(".missionImg").on("click", function() {
							$("#QuestionModal").modal("show");
						});

					});
</script>
<style type="text/css">
.circleProfile{
	width: 100%;
	height: 200px;
	margin-top: 25%;
	margin-left: 0%;
	margin-right: auto;
	/* margin-bottom: 10%; */
	/* background: #FCFBE3; */
	background-image: url("/ProjectSCSE/assets/image/teacherback5.png");
	opacity:0.75;
	background-repeat: no-repeat;
	
}
.circleProfile > *{
	 position: relative; 
	 top: 40%; 
	 margin: -100px 0 0;
	font-weight: bold;
	color: white;
}

.element {
	width: 62px;
}
</style>
</head>
<body>
	<%User user = (User) session.getAttribute("user");
	if(user.getuType() == 's') {%>
	<table id="tableHeight" style="margin: 0 auto;">
		<tr>
			<td><a style="text-align: center" href="${ pageContext.request.contextPath }/introFrame.jsp"> <img align="middle" src="${ pageContext.request.contextPath }/assets/image/SGcoding_logo1.png" width="280px" height="80px" data-step="3" data-intro='슬코로고' data-position="bottom" class="mainlogoImg" id="mainlogoImg"></a></td>
		</tr>
		<tr>
			<td>
				<div align="center" id="profileImage">
					<img align="middle" width="200px" height="200px" class="ui image" src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }">
				</div>
			</td>
		</tr>
	</table>
	<% } else { %>
	<table id="tableSize" style="margin: 0 auto;">
		<tr>
			<td>
				<a href="${ pageContext.request.contextPath }">
					<img src="${ pageContext.request.contextPath }/assets/image/SGcoding_logo1.png" style="position:relative;" width="280px" height="80px" class="mainlogoImg">
				</a>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 프로필 이미지 -->
				<c:if test="${user.uType == 't'.charAt(0) }">
				<div class="circleProfile" style="height: 220px;">
					<div id="layer1">${sessionScope.user.userSchool.schoolName }</div>
					<h4 class="ui header">${sessionScope.user.sName}선생님</h4>
				</div>
				</c:if>
				<c:if test="${user.uType == 'p'.charAt(0) }">
				<div class="circleProfile" style="height: 220px;">
					<div id="layer3">${sessionScope.user.sName }</div>
					${sessionScope.user.sName}학부모님
				</div>
				</c:if>
			</td>
		</tr>
	</table>
	<% } %>
	
	<div align="center" style="font-weight: bold">${sessionScope.user.sName }님,오늘도 열심히 공부해볼까요!</div>
	<div class="ui pointing secondary demo menu" style="margin: 0 auto;">
		<a class="active red item fluid" data-tab="first" style="text-align: center; width: 50%;">자유모드</a> 
		<a class="purple item fluid" data-tab="second" style="text-align: center; width: 50%;">상태보기</a>
	</div>
	
	
	
	
	
	
	
	<div class="ui active tab segment" data-tab="first" style="text-align: center; margin: 0;">
		<div style="height: 2%;"></div>

			<button class="ui blue button" id="selectMission"><i class="circular purple inverted book icon"></i>미션모드 시작하기</button>
			<div style="height: 2%;"></div>
			<a href="${ pageContext.request.contextPath }/enter_main.scse"><button class="ui blue button"><i class="circular purple inverted plane icon"></i>자유모드 시작하기</button></a>
		<div style="height: 3%"></div>
		<div style="width: 100%; height: 250px; overflow-y: scroll; overflow-x: hidden;">
			<table class="ui table segment" style="width: 100%">
				<thead>
					<tr>
						<td colspan="3" style="text-align: center; font-size: large; margin-top:20px; font-weight: bold;">내가 저장한 게임</td>
					<tr>
						<th style="text-align: center" colspan="3">게임이름</th>
					</tr>
				</thead>
				<tbody id="codeTarget">
					<tr>
						<th style="text-align: center">코드 이름</th>
						<th style="text-align: center">저장 날짜</th>
						<th style="text-align: center">삭제</th>
					</tr>
					<c:forEach items="${ requestScope.codeList }" var="freeCode">
						<tr>
							<td><a href="${ pageContext.request.contextPath }/select_free.scse?codeNum=${ freeCode.codeNum }&freeUserId=${ freeCode.userId }" style="text-decoration: none">
							<div class="circular small ui button">
							${ freeCode.codeName }</div></a></td>
							<td>${ freeCode.codeDate }</td>
							<td><div class="circular ui icon button" id="codeDelBtn" value="${ freeCode.codeNum }"><i class="black trash icon"></i></div></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="fluid ui button" id="saveButton" style="width: 80%; margin: 0 auto; background: #F6E4D3;">
			<i class="save icon"></i>내 게임 저장하기
		</div>
		<div style="height: 1%"></div>
		<div class="fluid ui button" style="width: 80%; margin: 0 auto; background: #F6E4D3;" id="galeryWalk">
			<i class="map icon"></i>친구의 게임보기
		</div>
	</div>
	<!-- 두번째 탭 -->
	<div class="ui tab segment" id="secondTab" data-tab="second" style="text-align: center; margin: 0;">
	<% if(user.getuType()=='s'){ %>
		<div style="height: 25px"></div>
		<% if(user.getuType()=='s') { %>
		<div class="ui blue medium button" style="width: 90%;" data-value="male">
			<a href="character_list.scse" style="text-decoration: none; width: 80%; color: black;"><i class="user icon"></i>캐릭터바꾸기</a>
		</div>
		<div style="height: 25px"></div>
		<%} %>
		<div class="ui top label fluid" style="max-width: 90%; font-size: large; font-weight: bold">
			<i class="teal bell outline icon"></i>알림장
		</div>
		<div style="height: 25px"></div>
		<div style="width: 100%; height: 60%; overflow-y: scroll; overflow-x: hidden;">
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
		<% } else { %>
			<br />
	
		<!-- <div class="ui fluid small button" style="width: 80%; margin: 0 auto; background: #FEEE0B7;"><i class="users icon"></i>그룹관리</div> -->
		
		<div class="ui selection dropdown fluid" align="center" style="font-family:Nanum Gothic; width: 80%; margin: 0 auto">
	      <i class="icon users"></i>&nbsp;&nbsp;그룹관리<i class="dropdown icon"></i>
	      <div class="menu" id="targetList" align="center" style="width: 80%; margin: 0 auto">
	       <!--  <a class="item">Inbox</a>
	        <a class="item">Archive</a> -->
	      </div>
 	  	 </div>
 	  	<!--  <div class="ui fluid button small" align="center" style="font-family:Nanum Gothic; font-size:small; width: 89%; margin: 0 auto" id="copyStyle"><i class="edit icon"></i>그룹등록</div>
		 -->
		
		<div style="height: 1%"></div>
		<h4 class="ui header">학생리스트</h4>
		<div align="center" style="width:80%; margin: 0 auto; width: 250px; height: 350px; overflow:auto; overflow-x:hidden;">
		<table class="ui table segment" >
			<thead>
				<tr>
					<td>이름</td>
					<td>그룹이름</td>
					<td>접속중</td>
				</tr>
			</thead>
			<tbody id="myStudent">

			</tbody>
		</table>
		</div>
		
		<% } %>
	</div>
	<!-- 메시지 읽기용 모달 -->
	<div class="ui small modal message">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">메시지</div>
		<div class="content">
			<table class="ui segment table">
				<tr>
					<th>보낸사람:</th>
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
			<div class="ui orange button">OK</div>
		</div>
	</div>
	
	
	<div class="ui small modal" id="save" style="width: 30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #4099FF; font-family: 'Nanum Gothic';">내 게임 저장하기</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">게임을 저장해서 전국에 자랑하세요!</th>
				<tr>
					<td align="center" style="text-align: center;">
						<div class="ui left icon input">
							<input type="text" placeholder="게임이름을 넣어주세요" id="GameName" name="GameName">
							<i class="save icon"></i>
						</div>
					</td>
			</table>
			<div class="actions">
				
				<div class="small ui orange right labeled icon button" id="codeSaveBtn">확인 <i class="checkmark icon"></i></div>
				<div class="small ui orange right labeled icon button">취소<i class="repeat icon"></i></div>

			</div>
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
			<div class="ui button">닫기</div>
		</div>
	</div>
</body>
</html>