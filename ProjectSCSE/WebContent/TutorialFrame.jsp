<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>슬기로운 코딩, 튜토리얼에 오신것을 환영합니다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body{
font-family: "Nanum Gothic", Calibri;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/intro/intro.js"></script>
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<script type="text/javascript" src="assets/sui/javascript/jquery.address.js"></script>
<link href="assets/css/page/mainFrame.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/page/introjs.css" />
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/${ requestScope.mission.cssName }" />
<script type="text/javascript">
	var afterTimeOut = "";
	$(document).ready(function() {
		$(document).on("click", "#questionOk", function() {
			if("${ requestScope.mission.missionIndex == 1}" == "true") {
				startIntro();
			}
		});
		$("#QuestionModal").css('margin-top', '0');
		$("#QuestionModal").css('top', '0px');
		$("#QuestionModal").modal('setting', { detachable:true, allowMultiple:true  }).modal('show');
		$("#retryBtn").hide();
		$("#nextBtn").hide();
		$("#cloud").hide();
		$("#cloud2").hide();
		$("#cloud").css("position", "absolute");
		$("#cloud2").css("position", "absolute");
		$("#missionResult").hide();
		$(document).on("click", "#reset", function() {
			location.href="${ pageContext.request.contextPath }/find_tutorialIndex.scse?missionIndex=${ requestScope.mission.missionIndex }";
		});
		//$(".resultBtns").hide();
		$(document).on("click", "#nextBtn", function() {
			if("${ requestScope.mission.quizNum != 10}" == "true") {
				location.href="${ pageContext.request.contextPath }/find_tutorialIndex.scse?missionIndex=${ requestScope.mission.missionIndex+1 }";
			}else {
				location.href="${ pageContext.request.contextPath }/find_missionIndex.scse?missionIndex=${ requestScope.mission.missionIndex+1 }";
			}
			
		});
		$(document).on("click", "#retryBtn", function() {
			$("#retryForm").submit();
		});
		$('.locomotive').click(function() {
			if($("#board").children().size() == 1) {
				$("#OneMoreModal").modal('show');
				return;
			}
			$("#retryBoard").val($("#boards").html());
			$("#retrySelector").val($("#selector").html());
			if("${ requestScope.user.uType }" == "s") {
				clearInterval(cap);	
			}
			$("#cloud").show('explode');
			$("#cloud").animate({top:'-500px', left:'2000px'}, 5000);
			setTimeout(function() {
				$("#cloud").stop();
			}, 2750);
			setTimeout(function(){
				$("#cloud2").show('explode')
				$("#cloud2").animate({top:'-500px', left:'2000px'}, 3500);			
			}, 1000);
			setTimeout(function() {
				$("#cloud2").stop();
			}, 3000);
			$("#board").hide('slide', {direction:'left', easing:'easeInBack'}, 3000, function(){
			$(".heading").hide('slide', {direction:'up'}, 700, function(){
			$(".container").hide();
				
				missionResult();
				afterTimeOut = setTimeout(function() {
					checkSuccess();
				}, 2000);
				mission();
				});
			});
		});
	});
	function successUpdate() {
		$.getJSON("/ProjectSCSE/next_mission.scse", { "missionIndex":"${ requestScope.mission.missionIndex }" });
		if("${ requestScope.mission.quizNum == 10}" == "true") {
			if("${ requestScope.chaMap.zzangu }"!="zzangu") {
				$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":28 });
				$("#ZZanggu").modal("show");
			}
		}
	}
	function missionResult() {
		setTimeout(function() {
			$("#missionResult").show();
		}, 0);
	}
	
</script>
<style type="text/css">
			/* #tileBox {
				width: 520px;
			} */
			#selector {
				width: 725px;
				height: 250px;
				margin-top: 10px;
			}
			
			#board {
				width: 800px;
				height: 220px;
			}
		</style>
<!-- 코드 스크립트 -->
		${ requestScope.mission.jsCode }
		${ requestScope.mission.targetCode }
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/${ requestScope.mission.jsName }"></script>
</head>
<body style="overflow: hidden">
	<nav>
		<jsp:include page="pages/HF/header.jsp"></jsp:include>
	</nav>
	<aside class="left-sidebar" style="z-index: 999">
		<jsp:include page="${requestScope.Sidebar}"></jsp:include>
	</aside>

	<%-- <div class="container">
		<c:import url="${requestScope.frame}"></c:import>
	</div> --%>
	
	<header class="heading">
		<div id="order">
		<!-- <h2>명령어들</h2> -->
		<ul id="selector" class="sortable" style="float: left;">
			<c:choose>
				<c:when test="${ requestScope.retryFlag }">
					${ param.retrySelector }
				</c:when>
				<c:otherwise>
					${ requestScope.mission.selectorCode }
				</c:otherwise>
			</c:choose>
		</ul>
			<ul style="float: left;">
				<img src="${ pageContext.request.contextPath }/assets/image/sun7.png" >
		</ul>
		<ul>
		<a href=javascript:void(0)>
			<img src="${pageContext.request.contextPath }/assets/image/reset3.png" id="reset" style="margin-left: 60px; margin-top: 70px;">		
		</a>
		</ul>
		</div>
		<br />
	</header>
	<img id="cloud" style="z-index: 900; left: 350px; top: 300px;" src="${pageContext.request.contextPath }/assets/image/cloud1.png">
	<img id="cloud2" style="width:120px; height: 60px; z-index: 900; left: 400px; top: 260px;" src="${pageContext.request.contextPath }/assets/image/cloud1.png">
	<div class="container">
		<!-- <h2>보드</h2> -->
		<div id="boards">
		<c:choose>
		<c:when test="${ requestScope.retryFlag }">
			${ param.retryBoard }
		</c:when>
		<c:otherwise>
		<ul id="board" class="sortable">
			<a href="javascript:void(0);"><li class="items locomotive ui-state-disabled" id=""></li></a>
			${ requestScope.mission.boardCode }
		</ul>
		</c:otherwise>
		</c:choose>
	</div>
	<form action="retry_tutorial.scse?missionIndex=${ requestScope.mission.missionIndex }" method="post" id="retryForm">
		<input type="hidden" name="retryBoard" id="retryBoard">
		<input type="hidden" name="retrySelector" id="retrySelector">
	</form>
	<!-- <input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로"> -->
	<br /> <br />
	</div>
	<div id="missionResult" style="width: 70%; height: 70%; margin-left: 25%; margin-top: 10%;">
		<div class="header"></div>
		<div class="content">
			<div id="tileBox">
				<!-- <div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div> -->
				${ requestScope.mission.mapCode }
				<!-- <div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div> -->
				<c:choose>
				<c:when test="${not empty sessionScope.characterInfo.chaImg }">
				<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
				</c:when>
				<c:otherwise>
				<img src="${pageContext.request.contextPath}/assets/image/Character/main_apeach.png" id="target" class="target">
				</c:otherwise>
				</c:choose>
				<div id="goal"></div>
			</div>
		</div>
		<div class="actions">
			<div id="retryBtn" class="ui negative black button resultBtns">다시</div>
			<div id="nextBtn" class="ui positive right labeled icon button resultBtns">
				다음<i class="checkmark icon"></i>
			</div>
		</div>
	</div>
	
	<!-- 짱구 모달 -->
	<div class="ui small modal" id="ZZanggu" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">빙글빙글어질어질비틀비틀</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">튜토리얼을 모두 완료했습니다!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/zzangu.png"></td>		
				<tr>
					<td style="text-align: center; font-size: medium;">돌아가는 짱구의 하루</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>
	
	<!-- 정답 모달 -->
	<div class="ui small modal" id="CorrectModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #00A8C6; font-family: 'Nanum Gothic';">정답입니다!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/Correct.png"></td>		
				<tr>
					<td>축하드려요! 정답입니다!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui positive icon button resultBtns">확인</div>
			</div>
		</div>
	</div>

	<!-- 실패 모달 -->
	<div class="ui small modal" id="WrongModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">실패하였습니다!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/Wrong.png"></td>		
				<tr>
					<td>아쉬워요 ~ 좀만 바꾸면 맞출 수 있는데!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>

	<!-- 모든 블럭을 사용해 주셈 -->
	<div class="ui small modal" id="UseAllModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">블럭을 안쓰셨네요?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/UseAll.png"></td>		
				<tr>
					<td>모든 블럭을 사용해주셔야 되요!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>

	<!-- 한개이상의 블럭을 사용해주세요. -->
	<div class="ui small modal" id="OneMoreModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">블럭을 안쓰셨네요?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/OneMore.png"></td>		
				<tr>
					<td>한 개 이상의 블럭을 사용해주세요.</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>

	<!-- 다시 조립해주세요. -->
	<div class="ui small modal" id="MakeAgainModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">다시 조립해주세요</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/OneMore.png"></td>		
				<tr>
					<td>블럭조립이 잘못되었어요. 다시 조립해주세요.</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
	
	<!-- 문제 띄우기용 모달 -->
	<div class="ui large modal" id="QuestionModal" style="margin-top: 0em;">
		<div class="ui inverted block header" style="background: #556270; font-family: 'Nanum Gothic';">${sessionScope.mission.quizDesc }</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4"></th>
				<tr>
					<td><img style="max-height: 100%; max-width: 100%; top: 0%; margin-top: 0%;" src="${pageContext.request.contextPath }/assets/image/Tutorial/b${sessionScope.mission.chapNum }-${sessionScope.mission.quizNum }.png"></td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" id = "questionOk" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
	
</body>
</html>