<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/sui/css/semantic.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/sui/javascript/jquery.address.js"></script>
<link href="${ pageContext.request.contextPath }/assets/css/page/mainFrame.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/mode.css"/>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/dodge.js"></script>
<script type="text/javascript">

	var death = "";
	var check = "";
	var $sortable = "";

	$(document).ready(function() {
		$("#missionResult").hide();
		$('#goDemo').click(function() {
			$(".board").animate({ "left": "-1500px" }, {duration: 3000, easing: 'easeInBack', complete: function(){
			$(".container2").hide();
			$('.heading').hide({direction : 'up'});
			$('body').css('overflow','hidden');
			$("#goDemo").hide();
			if("${ requestScope.mission.quizNum >= 6 }" == "true") {
				check="";
				$sortable = $(".items", "#comboBonusBoard");
				for (var i = 0; i < $sortable.length; i++) {
					check += $sortable.eq(i).attr("check");
				}
				if(check != "1718192021") {
					$("#MakeAgainModal").modal("show");
					$(".board").show("slide", { direction: "right" });
					$('.heading').show('slide', {direction : 'down'});
					$('body').css('overflow','');
					$("#goDemo").show();
					$(".container2").show();
					return;
				}
			}
			if("${ requestScope.mission.quizNum >= 5 }" == "true") {
				check="";
				$sortable = $(".items", "#comboCollisionBoard");
				console.log($sortable);
				for (var j = 0; j < $sortable.length; j++) {
					check += $sortable.eq(j).attr("check");
				}
				if(check != "910111213141516") {
					$("#MakeAgainModal").modal("show");
					$(".board").show("slide", { direction: "right" });
					$('.heading').show('slide', {direction : 'down'});
					$('body').css('overflow','');
					$("#goDemo").show();
					$(".container2").show();
					return;
				}
			}
			if("${ requestScope.mission.quizNum >= 4 }" == "true") {
				check="";
				$sortable = $(".items", "#lifeCollisionBoard");
				for (var k = 0; k < $sortable.length; k++) {
					check += $sortable.eq(k).attr("check");
				}
				if(check != "12345678") {
					$("#MakeAgainModal").modal("show");
					$(".board").show("slide", { direction: "right" });
					$('.heading').show('slide', {direction : 'down'});
					$('body').css('overflow','');
					$("#goDemo").show();
					$(".container2").show();
					return;
				}
			}
			if("${ requestScope.mission.quizNum >= 3 }" == "true") {
				if(($(".enemyNumOrder","#easyMethodBoard").length!=1) || ($(".enemySpeedOrder","#easyMethodBoard").length!=1) || ($(".lifeOrder","#easyMethodBoard").length!=1)) {
					$("#MakeAgainModal").modal("show");
					$(".board").show("slide", { direction: "right" });
					$('.heading').show('slide', {direction : 'down'});
					$('body').css('overflow','');
					$("#goDemo").show();
					$(".container2").show();
					return;
				}
				if(($(".enemyNumOrder","#normalMethodBoard").length!=1) || ($(".enemySpeedOrder","#normalMethodBoard").length!=1) || ($(".lifeOrder","#normalMethodBoard").length!=1)) {
					$("#MakeAgainModal").modal("show");
					$(".board").show("slide", { direction: "right" });
					$('.heading').show('slide', {direction : 'down'});
					$('body').css('overflow','');
					$("#goDemo").show();
					$(".container2").show();
					return;
				}
				if(($(".enemyNumOrder","#hardMethodBoard").length!=1) || ($(".enemySpeedOrder","#hardMethodBoard").length!=1) || ($(".lifeOrder","#hardMethodBoard").length!=1)) {
					$("#MakeAgainModal").modal("show");
					$(".board").show("slide", { direction: "right" });
					$('.heading').show('slide', {direction : 'down'});
					$('body').css('overflow','');
					$("#goDemo").show();
					$(".container2").show();
					return;
				}
				$(".enemySpeedOrder","#easyMethodBoard").children().attr("id", "easyEnemySpeed");
				$(".lifeOrder","#easyMethodBoard").children().attr("id", "easyLife");
				$(".enemyNumOrder","#easyMethodBoard").children().attr("id", "easyEnemy");
				$(".enemySpeedOrder","#normalMethodBoard").children().attr("id", "normalEnemySpeed");
				$(".lifeOrder","#normalMethodBoard").children().attr("id", "normalLife");
				$(".enemyNumOrder","#normalMethodBoard").children().attr("id", "normalEnemy");
				$(".enemySpeedOrder","#hardMethodBoard").children().attr("id", "hardEnemySpeed");
				$(".lifeOrder","#hardMethodBoard").children().attr("id", "hardLife");
				$(".enemyNumOrder","#hardMethodBoard").children().attr("id", "hardEnemy");
			}
			$("#end").attr("id","targetScore");
			totalScore = 0;
			if("${ requestScope.user.uType }" == "s") {
				clearInterval(cap);	
			}
			/* $('.left-sidebar').hide('slide', {
				direction : 'left'
			}, 700);
			$('.heading').hide('slide', {
				direction : 'up'
			}, 700);
			$('.container2').hide('slide', {
				direction : 'right'
			}, 700, */ missionResult()/* ) */;
			if("${ requestScope.mission.quizNum >= 2 }" == "true") {
				setTimeout(function() {
					if("${ requestScope.mission.quizNum == 2 }" == "true") {
						quiz2Function();
					}else if ("${ requestScope.mission.quizNum > 2 }" == "true") {
						commonFunction();
						easyMethod();
					}
				}, 1000);
			}
			}});
		});
			
		$("#MissionClearConfirmBtn").click(function() {
/* 			$(".board").animate({ "left": "0px" }, 3000);
			$('.heading').show('slide', {direction : 'down'});
			$('body').css('overflow','');
			$(".container2").show();
			$("#goDemo").show();*/
			
			if("${ requestScope.mission.quizNum >= 3 }" == "true") {
				clearInterval(death);	
			}
			/* $("#enemyGroup").empty();
			$("#missionResult").hide(); */ 
			
			$("#endingModal").modal("show");
		});
		
		
			
			
			
		function missionResult() {
			setTimeout(function() {
				$("#missionResult").show();
			}, 1000);
		}
		$("#retryBtn").click(function() {
			$(".board").animate({ "left": "0px" }, 3000);
			$('.heading').show('slide', {direction : 'down'});
			$('body').css('overflow','');
			$(".container2").show();
			$("#goDemo").show();
			
			
			if("${ requestScope.mission.quizNum >= 3 }" == "true") {
				clearInterval(death);	
			}
			$("#enemyGroup").empty();
			$("#missionResult").hide();
			/* $('.left-sidebar').show('slide', {
				direction : 'left'
			}, 700);
			$('.heading').show('slide', {
				direction : 'up'
			}, 700);
			$('.container2').show('slide', {
				direction : 'right'
			}, 700); */
		});
		$("#nextBtn").click(function() {
			$("#leftHidden").val($("#left").val());
			$("#rightHidden").val($("#right").val());
			$("#upHidden").val($("#up").val());
			$("#downHidden").val($("#down").val());
			$("#enemySelectionHidden").val($("#enemySelection").val());
			$("#backgroundSelectionHidden").val($("#backgroundSelection").val());
			$("#speedHidden").val($("#speed").val());
			$("#hardLifeHidden").val($("#hardLife").val());
			$("#hardSpeedHidden").val($("#hardEnemySpeed").val());
			$("#hardEnemyHidden").val($("#hardEnemy").val());
			$("#normalLifeHidden").val($("#normalLife").val());
			$("#normalSpeedHidden").val($("#normalEnemySpeed").val());
			$("#normalEnemyHidden").val($("#normalEnemy").val());
			$("#easyLifeHidden").val($("#easyLife").val());
			$("#easySpeedHidden").val($("#easyEnemySpeed").val());
			$("#easyEnemyHidden").val($("#easyEnemy").val());
			$("#comboConstraintHidden").val($("#comboConstraint").val());
			$("#comboBonusHidden").val($("#comboBonus").val());
			$("#endingPointHidden").val($("#endingPoint").val());
			$("#quizCode").submit();
		});
		
		
		$("#left").val("${ requestScope.mission.left }");
		$("#right").val("${ requestScope.mission.right }");
		$("#up").val("${ requestScope.mission.up }");
		$("#down").val("${ requestScope.mission.down }");
		$("#enemySelection").val("${ requestScope.mission.enemySelection }");
		$("#backgroundSelection").val("${ requestScope.mission.backgroundSelection }");
		$("#speed").val("${ requestScope.mission.speed }");
		$("#easyLife").val("${ requestScope.mission.easyLife }");
		$("#easyEnemySpeed").val("${ requestScope.mission.easySpeed }");
		$("#easyEnemy").val("${ requestScope.mission.easyEnemy }");
		$("#normalLife").val("${ requestScope.mission.normalLife }");
		$("#normalEnemySpeed").val("${ requestScope.mission.normalSpeed }");
		$("#normalEnemy").val("${ requestScope.mission.normalEnemy }");
		$("#hardLife").val("${ requestScope.mission.hardLife }");
		$("#hardEnemySpeed").val("${ requestScope.mission.hardSpeed }");
		$("#hardEnemy").val("${ requestScope.mission.hardEnemy }");
		$("#comboConstraint").val("${ requestScope.mission.comboConstraint }");
		$("#comboBonus").val("${ requestScope.mission.comboBonus }");
		$("#endingPoint").val("${ requestScope.mission.endingPoint }");
		});
</script>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	body{
		font-family: "Nanum Gothic", Calibri;
	}
	.board {
		width: 900px;
	}
	
	#selector {
		width: 725px;
		height: 250px;
		margin-top: 10px;
			}			
		</style>	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>슬기로운 코딩, 미션모드에 오신것을 환영합니다.</title>
</head>
<body>
<nav>
	<jsp:include page="pages/HF/header.jsp"></jsp:include>
</nav>
<aside class="left-sidebar" style="z-index: 100">
	<jsp:include page="pages/HF/SideBarForStudent.jsp"></jsp:include>
</aside>
<header class="heading">
	<ul id="selector" class="sortable" style="height: 250px; float: left; ">
		${ requestScope.mission.selectorCode }
	</ul>
	<ul style="float: left;">
				<img src="${ pageContext.request.contextPath }/assets/image/sun9.png" >
		</ul>
	<br/>
</header>
<div class="container2">
	<div class="ui purple button" id="goDemo"><i class="play icon"></i>게임해보기</div>
	<c:choose>
	<c:when test="${ requestScope.mission.quizNum < 7 }">
		<form id="quizCode" method="post" action="${ pageContext.request.contextPath }/view_mission5.scse?missionIndex=${ requestScope.mission.missionIndex+1 }">
	</c:when>
	<c:otherwise>
		<form id="quizCode" method="post" action="${ pageContext.request.contextPath }/start_free.scse?missionIndex=${ requestScope.mission.missionIndex+1 }">
	</c:otherwise>
	</c:choose>
		<input type="hidden" name="left" id="leftHidden" value=0>
		<input type="hidden" name="right" id="rightHidden" value=0>
		<input type="hidden" name="up" id="upHidden" value=0>
		<input type="hidden" name="down" id="downHidden" value=0>
		<input type="hidden" name="backgroundSelection" id="backgroundSelectionHidden" value="">
		<input type="hidden" name="enemySelection" id="enemySelectionHidden" value="">
		<c:if test="${ requestScope.mission.quizNum >= 2 }">
			<input type="hidden" name="speed" id="speedHidden">
		</c:if>
		<c:if test="${ requestScope.mission.quizNum >= 3 }">
			<input type="hidden" name="easySpeed" id="easySpeedHidden">
			<input type="hidden" name="easyEnemy" id="easyEnemyHidden">
			<input type="hidden" name="easyLife" id="easyLifeHidden">
			<input type="hidden" name="normalSpeed" id="normalSpeedHidden">
			<input type="hidden" name="normalEnemy" id="normalEnemyHidden">
			<input type="hidden" name="normalLife" id="normalLifeHidden">
			<input type="hidden" name="hardSpeed" id="hardSpeedHidden">
			<input type="hidden" name="hardEnemy" id="hardEnemyHidden">
			<input type="hidden" name="hardLife" id="hardLifeHidden">
		</c:if>
		<c:if test="${ requestScope.mission.quizNum >= 6 }">
			<input type="hidden" name="comboConstraint" id="comboConstraintHidden">
			<input type="hidden" name="comboBonus" id="comboBonusHidden">
		</c:if>
		<c:if test="${ requestScope.mission.quizNum >= 7 }">
			<input type="hidden" name="endingPoint" id="endingPointHidden">
		</c:if>
	</form>
	<c:if test="${ requestScope.mission.quizNum >= 7 }">
		<ul id="endingBoard" class="sortable board">
		<li class="items endingCode ui-state-disabled" id="" check="">
		<li class="items untilGameEnd" id="startForEnding" check="22">
		</li>
			<c:if test="${ requestScope.mission.quizNum >= 8 }">
			<li class="items" id="ifNoLife" check="23">
			</li>
			<li class="items" id="orExceedPoint" check="24">
				<input type="number" min="5000" max="30000" id="endingPoint" value="5000" step="5000" class="dodgeNumber6">
			</li>
			<li class="items" id="ending" check="25">
			</li>
			<li class="items" id="endingEndIf" check="26">
			</li>
			</c:if>
		<li class="items gameLoop" id="endForEnding" check="27">
		</li>
		</ul>
	</c:if>
	<c:if test="${ requestScope.mission.quizNum >= 6 }">
		<ul id="comboBonusBoard" class="sortable board">
			<li class="items bonusCode ui-state-disabled" id="" check="">
			<li class="items untilGameEnd" id="startForBonusCombo" check="17">
			</li>
			<c:if test="${ requestScope.mission.quizNum >= 7 }">
				<li class="items" id="ifBonusCombo" check="18">
					<input type="number" min="5" max="20" id="comboConstraint" value="5" step="5" class="dodgeNumber3">
				</li>
				<li class="items" id="comboBonusLi" check="19">
					<input type="number" min="100" max="500" id="comboBonus" value="100" step="100" class="dodgeNumber4">
				</li>
				<li class="items" id="endIfBonusCombo" check="20">
				</li>
			</c:if>
			<li class="items gameLoop" id="endForBonusCombo" check="21">
			</li>
		</ul>
	</c:if>
	<c:if test="${ requestScope.mission.quizNum >= 5 }">
		<ul id="comboCollisionBoard" class="sortable board">
			<li class="items comboCode ui-state-disabled" id="" check="">
			<li class="items untilGameEnd" id="startForCollisionCombo" check="9">
			</li>
			<c:if test="${ requestScope.mission.quizNum >= 6 }">
				<li class="items ifCollision" id="ifCollisionCombo" check="10">
				</li>
				<li class="items" id="defaultCombo" check="11">
				</li>
				<li class="items" id="makemake" check="12">
				</li>
				<li class="items elseCollision" id="elseCollisionCombo" check="13">
				</li>
				<li class="items" id="plusCombo" check="14">
				</li>
				<li class="items" id="increase" check="15">
			</c:if>
			<li class="items gameLoop" id="endForCollisionCombo" check="16">
			</li>
		</ul>
	</c:if>
	<c:if test="${ requestScope.mission.quizNum >= 4 }">
		<ul id="lifeCollisionBoard" class="sortable board">
			<li class="items lifeCode ui-state-disabled" id="" check="">
			<li class="items untilGameEnd" id="startForCollisionLife" check="1">
			</li>
			<c:if test="${ requestScope.mission.quizNum >= 5 }">
				<li class="items ifCollision" id="ifCollisionLife" check="2">
				</li>
				<li class="items" id="minusLife" check="3">
				</li>
				<li class="items" id="decrease" check="4">
				</li>
				<li class="items elseCollision" id="elseCollisionLife" check="5">
				</li>
				<li class="items" id="keepGoing" check="6">
				</li>
				<li class="items" id="gogogogo" check="7">
				</li>
			</c:if>
			<li class="items gameLoop" id="endForCollisionLife" check="8">
			</li>
		</ul>
	</c:if>
	<c:if test="${ requestScope.mission.quizNum >= 3 }">
		<ul id="easyMethodBoard" class="sortable board">
			<li class="items easyCode ui-state-disabled" id="" check="">
			<li class="items ifEasy startIfEasy">
			</li>
			<c:if test="${ requestScope.mission.quizNum >= 4 }">
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="easyEnemy" value="1" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="easyEnemySpeed" value="1" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="easyLife" value="1" class="dodgeNumber2">
				</li>
			</c:if>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
		<ul id="normalMethodBoard" class="sortable board">
			<li class="items normalCode ui-state-disabled" id="" check="">
			<li class="items ifNormal startIfCommon">
			</li>
			<c:if test="${ requestScope.mission.quizNum >= 4 }">
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="normalEnemy" value="1" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="normalEnemySpeed" value="1" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="normalLife" value="1" class="dodgeNumber2">
				</li>
			</c:if>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
		<ul id="hardMethodBoard" class="sortable board">
			<li class="items hardCode ui-state-disabled" id="" check="">
			<li class="items ifHard startIfHard">
			</li>
			<c:if test="${ requestScope.mission.quizNum >= 4 }">
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="hardEnemy" value="1" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="hardEnemySpeed" value="1" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="hardLife" value="1" class="dodgeNumber2">
				</li>
			</c:if>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
	</c:if>
		<c:if test="${ requestScope.mission.quizNum >= 2 }">
			<ul id="settingBoard" class="sortable board">
				<li class="items settingCode ui-state-disabled" id="" check="">
				<c:if test="${ requestScope.mission.quizNum >= 3 }">
					<li class="items userSpeedOrder">
						<input type="number" id="speed" value="1" min="1" max="20" class="dodgeNumber2">
					</li>
					<li class="items backOrder">
						<select name="backgroundSelection" id="backgroundSelection" class="dodgeNumber1">
							<option value="">선택</option>
							<option value="soccerfield.jpg">축구장</option>
							<option value="sea.jpg">바다</option>
							<option value="sky.jpg">하늘</option>
							<option value="space.jpg">우주</option>
						</select>
					</li>
					<li class="items enemyChaOrder">
						<select name="enemySelection" id="enemySelection" class="dodgeNumber1">
							<option value="">선택</option>
							<option value="meteor.png">운석</option>
							<option value="soccerball.png">축구공</option>
							<option value="ufo.png">UFO</option>
							<option value="virus.png">바이러스</option>
						</select>
					</li>
				</c:if>
			</ul>
		</c:if>
		<ul id="keyBoard" class="sortable board">
			<li class="items directionCode ui-state-disabled" id="" check="">
			<c:if test="${ requestScope.mission.quizNum >= 2 }">
				<li class="items ifPush">
					<select name="left" id="left" class="directionSelect">
						<option value="">선택</option>
						<option value="37">←</option>
						<option value="38">↑</option>
						<option value="39">→</option>
						<option value="40">↓</option>
						<option value="65">a</option>
						<option value="68">d</option>
						<option value="83">s</option>
						<option value="87">w</option>
					</select>
				</li>
				<li class="items moveLeft" id="leftDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
				<li class="items ifPush">
					<select name="right" id="right" class="directionSelect">
						<option value="">선택</option>
						<option value="39">→</option>
						<option value="37">←</option>
						<option value="38">↑</option>
						<option value="40">↓</option>
						<option value="65">a</option>
						<option value="68">d</option>
						<option value="83">s</option>
						<option value="87">w</option>
					</select>
				</li>
				<li class="items moveRight" id="rightDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
				<li class="items ifPush">
					<select name="up" id="up" class="directionSelect">
						<option value="">선택</option>
						<option value="38">↑</option>
						<option value="39">→</option>
						<option value="37">←</option>
						<option value="40">↓</option>
						<option value="65">a</option>
						<option value="68">d</option>
						<option value="83">s</option>
						<option value="87">w</option>
					</select>
				</li>
				<li class="items moveForward" id="upperDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
				<li class="items ifPush">
					<select name="down" id="down" class="directionSelect">
						<option value="">선택</option>
						<option value="40">↓</option>
						<option value="37">←</option>
						<option value="38">↑</option>
						<option value="39">→</option>
						<option value="65">a</option>
						<option value="68">d</option>
						<option value="83">s</option>
						<option value="87">w</option>
					</select>
				</li>
				<li class="items moveBackward" id="downDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
			</c:if>
		</ul>
	</div>
<div id="missionResult">
	<c:choose>
	<c:when test="${requestScope.mission.missionIndex != 51 && requestScope.mission.missionIndex != 50 }">
	<div class="blue buttons right actions" style="width: 54%; margin: 0 auto; margin-right: 13%; margin-top: 1%;">
		<input type="button" class="ui button" value="쉬움" id="easyTest">
		<input type="button" class="ui button" value="보통" id="normalTest">
		<input type="button" class="ui button" value="어려움" id="hardTest">
		<div id="retryBtn" class="ui red right labeled icon button resultBtns">다시<i class="refresh icon"></i></div>
		<div id="nextBtn" class="ui blue right labeled icon button resultBtns">다음<i class="checkmark icon"></i></div>
	</div>
	</c:when>
	<c:when test="${requestScope.mission.missionIndex == 51 || requestScope.mission.missionIndex == 50 }" >
	<div class="blue buttons right actions" style="width: 500px; margin: 0 auto; margin-right: 20%; margin-top: 1%;">
		<div id="retryBtn" class="ui red right labeled icon button resultBtns">다시<i class="refresh icon"></i></div>
		<div id="nextBtn" class="ui blue right labeled icon button resultBtns">다음<i class="checkmark icon"></i></div>
	</div>	
	</c:when>
	</c:choose>	
	<div id="playground" style="width: 100vh; height: 80vh;">
		<div id="scoreDv">
			<span style="background: black; color: white; font-size: x-large;">점수: </span>
			<span style="background: black; color: white; font-size: x-large;" id="targetScore"></span>
			<c:if test="${ requestScope.mission.quizNum >= 6 }">
				<span style="background: black; color: white; font-size: x-large;" id="comboAlert"></span>
			</c:if>
		</div>
		<c:if test="${ requestScope.mission.quizNum >= 5 }">
			<div id="comboDv">
			<span style="background: black; color: white; font-size: x-large;" id="targetCombo"></span>
		</div>
		</c:if>
		<div style="float: right; background: black; color: white; font-size: x-large;" id="lifeDv">
			<span style="background: black; color: white; font-size: x-large;">라이프: </span> 
			<table id="lifeTable">
				<tbody>
					<tr class="targetLife">
				</tbody>
			</table>
		</div>
		<div id="enemyGroup"></div>
		<div style="width: 100px; height: 100px;" id="player"></div>
	</div>
</div>


<!-- 죽음 모달 -->
	<div class="ui small modal" id="DeathModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">게임오버</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/death.png"></td>		
				<tr>
					<td>게임이 종료 되었습니다.</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						</span>
					</td>
			</table>
		</div>
	</div>
	
<!-- 키빠짐 모달 -->
	<div class="ui small modal" id="NullKey" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">키가 설정이 안되있습니다.</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/NullKey.png"></td>		
				<tr>
					<td>방향키가 모두 제대로 설정 되어 있나요?</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						</span>
					</td>
			</table>
		</div>
	</div>
<!-- 다시 조립해주셈 -->

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
				<div id="retryBtn" class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
<!-- 미션완료 -->
	<div class="ui small modal" id="MissionClearModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">미션을 성공했습니다!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/MissionComplete.png"></td>		
				<tr>
					<td>미션을 성공하였습니다!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div id="MissionClearConfirmBtn" class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
	
		<!-- 챕터5 앤딩 모달 -->
	<div class="ui large modal" id="endingModal" style="margin-top: 0em;">
		<div class="ui inverted block header" style="background: #556270; font-family: 'Nanum Gothic';">미션을 모두 완료했습니다. 이제 자유모드를 시작해봐요!</div>
		<div class="content" style="padding: 0;">
			<table class="ui table segment">
				<tr>
					<th colspan="4"></th>
				<tr>
					<td><img style="max-height: 100%; max-width: 100%; top: 0%; margin-top: 0%;" src="${pageContext.request.contextPath }/assets/image/Chapter05/endingModal.png"></td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" id = "endingOk" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
</body>
</html>