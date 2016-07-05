<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script>
/* if(window.addEventListener){
	window.addEventListener('load',function(){
    	$('.demo.menu .item').tab('change tab', 'second');
    },false); //W3C
}  */
$(document).ready(
 	function() {
 		//그룹정보 로딩
 		$.post("my_group_list_ajax.scse", function(jsonObj){
 			if(jsonObj.status){
 				$(jsonObj.list).each(function(index, item){
 					var a = $("<a/>").addClass("item").attr("href", "my_group_info.scse?groupNum="+item.groupNum+"&groupName="+item.groupName).text(item.groupName).css("text-align", "center");
 					$("#targetList").append(a);
 				});
 			}
 		}, "json");
 		
 		
		$('.demo.menu .item').tab('change tab', 'second');	
		//학생목록 20초 간격으로 로딩
		studenList();
		setInterval(studenList, 1000 * 20);

		//자기 그룹 학생들 목록보기
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
		
		//메시지 보내기용 모달 띄우기
		$(".student_name").on("click", function() {
			$(".message").modal('show');
			var sn = $(this).text();

			$("#targetClass").text(sn);
			$("#messageTarget").val(sn);

		});
		//메시지 전송
		$("#messageSend").on("click", function() {
			$.post("message_send_ajax.scse", {
				"messageWriter" : '${sessionScope.user.userId }',
				"messageTarget" : $("#messageTarget").val(),
				"messageTitle" : $("#messageTitle").val(),
				"messageContent" : $("#messageContent").text()
			}, function(jsonObj) {
				if (jsonObj.status) {
					alert("메시지전송에 성공하였습니다.");
					$(".message").modal('hide');
				}
			}, "json");
		});
				
		//공지사항 보내기 
		$("#noticeSend").on("click", function() {
			$.post("notice_send_ajax.scse", {
				"noticeTitle" : $("#noticeTitle").val(),
				"noticeContent" : $("#noticeContent").text(),
				"leaderId" : '${sessionScope.user.userId }',
				"groupNum" : '1'
			}, function(jsonObj) {
				if (jsonObj.status) {
					alert("공지사항 전송에 성공했습니다.");
					$('.ui.modal.school').modal('hide');
				}
			}, "json");
		});

		
		$("#show").on("click", function() {
			$('.ui.modal.school').modal('show');
		});
		
		$(".submit").on("click", function(){
			if($("#groupType").val()==""){
				$("#groupNameFormCheck").show();
			}
			$("#form").submit();
		});
		$(".formCheck").hide();
		
		 $(".circleProfile").css("height", $(".circleProfile").width());
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
	 top: 30%; 
	 margin: -100px 0 0;
	font-weight: bold;
	color: white;
}
a {
	text-decoration:none;
}

.mainlogoImg {
	margin-left: 1%;
	margin-right: 1%;
	margin-top: 0%;
}

.mapTable > tr > th {
	width: 60px;
}

.maptitle {
	width: 200px;
}

/* #copyStyle{
	cursor: pointer;
	display: inline-block;
	word-wrap: break-word;
	white-space: normal;
	background-color: #FFFFFF;
	padding: 0.65em 1em;
	line-height: 1.33;
	color: rgba(0, 0, 0, 0.8);
	-webkit-box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1) !important;
	box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.1) !important;
	border-radius: 0.3125em !important;
} */

.element {
	width: 62px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var width = $(".circleProfile").css("width");
	 $(".circleProfile").css("height", width); 
	
	var menuHeight = $(".small.menu").css("height");
	var mH = parseInt(menuHeight, 10);
	var tableSize = $("#tableSize").height();
	var tabHeight = $(".pointing.menu").css("height");
	var tH = parseInt(tabHeight, 10);
	var windowheight = $(window).height();

	var setting = windowheight-tH-mH-tableSize-24;
	console.log(setting);
	var settings = setting+"px";


	$("#firstTab").css("height", settings);
	$("#secondTab").css("height", settings);
	
	
	$(".submit").addClass("disabled");
	$("#groupName").on("blur", function(){
		$.post("group_name_check_ajax.scse", {
			"groupName" : $("#groupName").val()
		}, check, "json");
	});
	
	function check(jsonObj){
		if(jsonObj.status){
			$(".submit").removeClass("disabled");
			$("#exists").hide();
		} else {
			$(".submit").addClass("disabled");
			$("#exists").show();
		}
	}
	
	
	$("#showEntireMap").on("click", function(){
		$("#entireMap").modal("show");
	});
	
	//맵 누르면 문제 띄우는 모달
	$(".missionImg").on("click", function() {
		$("#QuestionModal").modal("show");
	});
	
	$("#copyStyle").on("click", function(){
		$("#GroupCreationModal").modal("show");
	});

	
});
</script>
</head>
<body>
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
				<div class="circleProfile" style="height: 280px;margin-top: -30%;">
					<div id="layer1" style="font-size:large; width:224px; margin-top: 50px; margin-left:25px">${sessionScope.user.userSchool.schoolName }</div>
					<h4 class="ui header" style="margin-top:45%; font-size:x-large; color: white;">${sessionScope.user.sName}선생님</h4>
				</div>
				</c:if>
				<c:if test="${user.uType == 'p'.charAt(0) }">
				<div class="circleProfile">
					<div id="layer3">${sessionScope.user.sName }</div>
					${sessionScope.user.sName}학부모님
				</div>
				</c:if>
			</td>
		</tr>
	</table>
	<input type="hidden" id="checkProblem" value="123">
	<div class="ui pointing secondary demo menu" style="margin: 0 auto; position: relative;">
		<a class="active red item fluid" data-tab="first" style="text-align: center; font-weight:bold; width: 50%;">상태보기</a> 
		<a class="purple item fluid" data-tab="second" style="text-align: center; font-weight:bold; width: 50%;">문제보기</a>
	</div>
	<div class="ui active tab segment" id="fisrtTab" data-tab="first" style="text-align: center; margin: 0 auto;">
		<br />
	
		<!-- <div class="ui fluid small button" style="width: 80%; margin: 0 auto; background: #FEEE0B7;"><i class="users icon"></i>그룹관리</div> -->
		
		<div class="ui selection dropdown fluid" align="center" style="font-family:Nanum Gothic; width: 80%; margin: 0 auto">
	      <a href="my_group_home.scse"><i class="icon users"></i>그룹관리</a><i class="dropdown icon"></i>
		      <div class="menu" id="targetList" align="center" style="width: 80%; margin: 0 auto">
		       <a class="item" href="my_group_home.scse" style="text-align: center; color: red;">전체그룹관리</a>
		       <a class="item" style="text-align: center; color: blue;" id="copyStyle">신규그룹생성</a>
		      </div>
 	  	 </div>
 	  			
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
		
	
	</div>

	<!-- 두번째 탭 -->
	<div class="ui tab segment" id="secondTab" data-tab="second" style="text-align: center; margin: 0;">
			<c:choose>
			<c:when test="${ requestScope.mission.chapNum < 50 }">
				<h5 class="ui top attached header" style="font-family: Nanum Gothic; background-color: rgba(45, 104, 255, 0.41)">${sessionScope.mission.chapNum}-${sessionScope.mission.quizNum}번 문제<br/><br/>${sessionScope.mission.quizDesc}</h5>
			</c:when>
			<c:otherwise>
				<h5 class="ui top attached header" style="font-family: Nanum Gothic;">${sessionScope.mission.quizHeader}</h5>
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
				<span>닷지 게임 만들기</span>
			</c:when>
			<c:otherwise>
				<br />
				<a href="enter_main.scse"><button class="ui green button" style="width: 80%">미션모드 시작하기</button></a>
				<br />
				<br />
			</c:otherwise>
		</c:choose>
	
		<div class="fluid ui button" style="width: 80%; margin: 0 auto; background: #F6E4D3;" id="showEntireMap"><i class="map icon"></i>전체 미션 보기</div>
	</div>


	<!-- 모달 -->
	<div class="ui modal small school">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">공지사항 전송하기</div>
		<div class="content">
			<table class="ui table segment">
				<thead>
					<tr>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 30%"><div class="ui input" style="width: 100%">
								<input type="text" placeholder="공지 제목을 입력하세요.">
							</div></td>
						<td style="width: 70%"><div class="ui icon input loading" style="width: 100%">
								<input type="text" placeholder="공지 내용을 입력하세요.">
								<i class="icon"></i>
							</div></td>
				</tbody>
			</table>
		</div>
		<div class="actions">
		
			<div class="ui orange right labeled icon button">
				Cancel<i class="repeat icon"></i>
			</div>
			<div class="ui orange right labeled icon button">
				<a href="${pageContext.request.contextPath }/notice_send_ajax.scse">OK<i class="forward mail icon"></i>
				</a>
			
			</div>
		</div>
	</div>

	<!-- 개인메시지용 모달 -->
	<div class="ui small modal" id="messageModal">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">메시지보내기</div>
		<div class="content">
			<div class="ui large form segment">
				<div class="two fields">
					<div class="field" style="width: 30%">
						<label>메시지 제목</label>
						<input type="hidden" id="targetVal">
						<input placeholder="메시지제목" type="text" class="messageTitle">
					</div>
					<div class="field" style="width: 70%">
						<label>메시지 내용</label>
						<input placeholder="메시지내용" type="text" class="messageContent">
					</div>
				</div>
			</div>
		</div>
		<div class="actions">			
			<div class="ui orange right labeled icon button">취소<i class="repeat icon"></i></div>
			<div class="ui orange right labeled icon button messageSubmit" id="messageSubmit">
				전송 <i class="checkmark icon"></i>
			
		</div>
	</div>
	</div>
	
	
	<!-- 공지사항용 모달 -->
	<div class="ui modal small school">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">공지사항 전송하기</div>
		<div class="content">
			<table class="ui table segment">
				<thead>
					<tr>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 30%"><div class="ui input" style="width: 100%">
								<input type="text" id="noticeTitle" placeholder="공지 제목을 입력하세요.">
							</div></td>
						<td style="width: 70%"><div class="ui icon input loading" style="width: 100%">
								<input type="text" id="noticeContent" placeholder="공지사항을 입력하세요.">
								<i class="icon"></i>
							</div></td>
				</tbody>
			</table>
		</div>
		<div class="actions">
			<div class="ui orange right labeled icon  button">
				Cancel<i class="remove icon"></i>
			</div>
			<div class="ui orange right labeled icon button" id="noticeSend">
				<a href="${pageContext.request.contextPath }/notice_send_ajax.scse"> OK<i class="forward mail icon"></i>
				</a>
			</div>
		</div>
	</div>

	<div class="ui modal map" id="entireMap">
		<i class="close icon"></i>
				<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">맵</div>
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
						<th class="element" id="11" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=11"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="12" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=12"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="13" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=13"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="14" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=14"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="15" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=15"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="16" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=16"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="17" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=17"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="18" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=18"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="19" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=19"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="20" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=20"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="21" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=21"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" id="22" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=22"><i class="flag circular purple inverted icon"></i></a></th>
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
						<th class="element" id="23"style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=23"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="24" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=24"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="25" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=25"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="26" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=26"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="27" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=27"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="28" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=28"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" id="29" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=29"><i class="flag circular red inverted icon"></i></a></th>
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
						<th class="element" id="30" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=30"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="31" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=31"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="32" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=32"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="33" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=33"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="34" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=34"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="35" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=35"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="36" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=36"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="37" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=37"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="38" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=38"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" id="39" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=39"><i class="flag circular green inverted icon"></i></a></th>
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
						<th class="element" id="40" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=40"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="41" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=41"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="42" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=42"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="43" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=43"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="44" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=44"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="45" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=45"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="46" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=46"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="47" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=47"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="48" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=48"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" id="49" style="text-align: center;"><a class="atag" href="find_missionIndex.scse?missionIndex=49"><i class="flag circular blue inverted icon"></i></a></th>
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
						<th class="element" id="50" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=50"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="51" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=51"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="52" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=52"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="53" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=53"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="54" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=54"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="55" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=55"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" id="56" style="text-align: center;"><a class="atag" href="view_mission5.scse?missionIndex=56"><i class="flag circular teal inverted icon"></i></a></th>
						
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
	
	
	<!-- 그룹등록 모달 -->
	
	<div class="ui small modal" id="GroupCreationModal">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #FBBD1A; font-family: 'Nanum Gothic';">그룹생성하기</div>
		<div class="content">
			<form method="post" action="new_Group.scse" id="form">
		<div class="ui form segment">
			<div class="three fields">
				<div class="field">
					<label>그룹이름</label>
					<input placeholder="새롭게 등록할 그룹 이름을 써주세요." class="" type="text" id="groupName" name="groupName">
					<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck">그룹이름을 입력해주세요.</div>
					<div class="ui red pointing above ui label formCheck" id="exists">이미 존재하는 그룹명입니다.</div>
				</div>
				<div class="field">
					<label>그룹타입</label>
					<div class="ui selection dropdown selectType">
						<input type="hidden" name="groupType" id="groupType">
						<div class="default text">그룹유형</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" data-value="1">학교</div>
							<div class="item" data-value="2">가정</div>
						</div>
						<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck">그룹타입을 선택해주세요.</div>
					</div>
				</div>
			</div>
		</div>
	</form>
		</div>
			<div class="actions">
		<div class="ui submit right labeled orange icon button">				
			생성<i class="checkmark icon"></i>
			</div>
			<div class="ui right labeled orange icon button">취소<i class="undo icon"></i></div>
		
	</div>

</body>
</html>