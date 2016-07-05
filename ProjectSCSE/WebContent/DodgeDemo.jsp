<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게임을 만들어보아요!</title>
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
		$("#selector").hide();
		$(".board").show();
		$("#missionResult").hide();
		$('#goDemo').click(function() {
			$('body').css('overflow','hidden');
			$(".board").hide("slide", {direction:'left', easing:'easeInBack'}, 3000, function(){
				
			$("#chap5Intro").hide();
			$("#goDemo").hide();
			if("${ requestScope.mission.quizNum >= 6 }" == "true") {
				check="";
				$sortable = $(".items", "#comboBonusBoard");
				for (var i = 0; i < $sortable.length; i++) {
					check += $sortable.eq(i).attr("check");
				}
				if(check != "1718192021") {
					alert("다시 조립해주세요 ㅠㅠ");
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
					alert("다시 조립해주세요 ㅠㅠ");
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
					alert("다시 조립해주세요 ㅠㅠ");
					return;
				}
			}
			if("${ requestScope.mission.quizNum >= 3 }" == "true") {
				if(($(".enemyNumOrder","#easyMethodBoard").length!=1) || ($(".enemySpeedOrder","#easyMethodBoard").length!=1) || ($(".lifeOrder","#easyMethodBoard").length!=1)) {
					alert("다시 조립해주세요 ㅠㅠ");
					return;
				}
				if(($(".enemyNumOrder","#normalMethodBoard").length!=1) || ($(".enemySpeedOrder","#normalMethodBoard").length!=1) || ($(".lifeOrder","#normalMethodBoard").length!=1)) {
					alert("다시 조립해주세요 ㅠㅠ");
					return;
				}
				if(($(".enemyNumOrder","#hardMethodBoard").length!=1) || ($(".enemySpeedOrder","#hardMethodBoard").length!=1) || ($(".lifeOrder","#hardMethodBoard").length!=1)) {
					alert("다시 조립해주세요 ㅠㅠ");
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
			if("${ sessionScope.user.uType }" == "s") {
				clearInterval(cap);	
			}
			/* $('.left-sidebar').hide('slide', {
				direction : 'left'
			}, 700);
			$('.heading').hide('slide', {
				direction : 'up'
			}, 700);
			$('.container').hide('slide', {
				direction : 'right'
			}, 700,  */missionResult();
			setTimeout(function() {
				commonFunction();
				easyMethod();
			}, 1000);
		});
		function missionResult() {
			setTimeout(function() {
				$("#missionResult").show();
			}, 1000);
		}
		$("#nextBtn").click(function() {
			location.href="${ pageContext.request.contextPath }/view_mission5.scse?missionIndex=50";
		});
	});
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
		height: 100px;
	}
	.container {
		margin-left: 250px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<nav>
	<jsp:include page="pages/HF/header.jsp"></jsp:include>
</nav>
<aside class="left-sidebar">
	<jsp:include page="pages/HF/SideBarForStudent.jsp"></jsp:include>
</aside>
<header class="heading">
	<ul id="selector" class="sortable">
		${ requestScope.mission.selectorCode }
	</ul>
	<div style="margin-top: 5%; margin-left: 0.5%;" id="chap5Intro">
	<div class="ui ribbon blue label" style="z-index: 1; margin-left: 20px;">Chapter5에 오신 것을 환영합니다.</div>
	<div class="ui ignored info message" style="width: 85%; font-size: large; font-family: 'Nanum Gothic'; margin-top: -10px;">
		이제부터 여러분과 함께 '닷지(Dodge)'라는 게임을 만들어 볼 거예요. 닷지는 영어로 '피하다' 라는 뜻으로, 주인공이 악당을 오래 피하면 승리하는 게임입니다.<br/>
		밑에 보이는 기차는 이제 여러분들이 하나 하나 만들어 나갈 기차를 보여드린 거예요.<br/>
		기차가 많아 보인다구요? 걱정 마세요. 저희 슬기로운 코딩과 함께 하나씩 만들어 나가다보면, 어느새 게임이 완성되어 있을 거예요! <br/>
		자, 기차를 한 번 천천히 보시고, 우리가 만들 게임이 무엇인지 한 번 해볼까요?
	</div>
	</div>
	<br/>
</header>
<div class="container">
	<div class="ui purple button" id="goDemo"><i class="play icon"></i>게임해보기</div>
		<ul id="endingBoard" class="sortable board">
		<li class="items endingCode ui-state-disabled" id="">
		<li class="items untilGameEnd" id="startForEnding" check="22">
		</li>
			<li class="items" id="ifNoLife" check="23">
			</li>
			<li class="items" id="orExceedPoint" check="24">
				<input type="number" min="5000" max="30000" id="endingPoint" value="5000" step="5000" class="dodgeNumber6">
			</li>
			<li class="items" id="ending" check="25">
			</li>
			<li class="items" id="endingEndIf" check="26">
			</li>
		<li class="items gameLoop" id="endForEnding" check="27">
		</li>
		</ul>
		<ul id="comboBonusBoard" class="sortable board">
		<li class="items bonusCode ui-state-disabled" id="">
			<li class="items untilGameEnd" id="startForBonusCombo" check="17">
			</li>
				<li class="items" id="ifBonusCombo" check="18">
					<input type="number" min="5" max="20" id="comboConstraint" value="5" step="5" class="dodgeNumber3">
				</li>
				<li class="items" id="comboBonusLi" check="19">
					<input type="number" min="100" max="500" id="comboBonus" value="100" step="100" class="dodgeNumber4">
				</li>
				<li class="items" id="endIfBonusCombo" check="20">
				</li>
			<li class="items gameLoop" id="endForBonusCombo" check="21">
			</li>
		</ul>
		<ul id="comboCollisionBoard" class="sortable board">
		<li class="items comboCode ui-state-disabled" id="">
			<li class="items untilGameEnd" id="startForCollisionCombo" check="9">
			</li>
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
			<li class="items gameLoop" id="endForCollisionCombo" check="16">
			</li>
		</ul>
		<ul id="lifeCollisionBoard" class="sortable board">
		<li class="items lifeCode ui-state-disabled" id="">
			<li class="items untilGameEnd" id="startForCollisionLife" check="1">
			</li>
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
			<li class="items gameLoop" id="endForCollisionLife" check="8">
			</li>
		</ul>
		<ul id="easyMethodBoard" class="sortable board">
		<li class="items easyCode ui-state-disabled" id="">
			<li class="items ifEasy startIfEasy">
			</li>
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="easyEnemy" value="10" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="easyEnemySpeed" value="5" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="easyLife" value="10" class="dodgeNumber2">
				</li>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
		<ul id="normalMethodBoard" class="sortable board">
		<li class="items normalCode ui-state-disabled" id="">
			<li class="items ifNormal startIfCommon">
			</li>
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="normalEnemy" value="10" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="normalEnemySpeed" value="7" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="normalLife" value="10" class="dodgeNumber2">
				</li>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
		<ul id="hardMethodBoard" class="sortable board">
		<li class="items hardCode ui-state-disabled" id="">
			<li class="items ifHard startIfHard">
			</li>
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="hardEnemy" value="15" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="hardEnemySpeed" value="9" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="hardLife" value="5" class="dodgeNumber2">
				</li>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
			<ul id="settingBoard" class="sortable board">
			<li class="items settingCode ui-state-disabled" id="">
					<li class="items userSpeedOrder">
						<input type="number" id="speed" value="15" min="1" max="20" class="dodgeNumber2">
					</li>
					<li class="items backOrder">
						<select name="backgroundSelection" id="backgroundSelection" class="dodgeNumber1">
							<option value="space.jpg">우주</option>
						</select>
					</li>
					<li class="items enemyChaOrder">
						<select name="enemySelection" id="enemySelection" class="dodgeNumber1">
							<option value="virus.png">바이러스</option>
						</select>
					</li>
			</ul>
		<ul id="keyBoard" class="sortable board">
		<li class="items directionCode ui-state-disabled" id="">
				<li class="items ifPush">
					<select name="left" id="left" class="directionSelect">
						<option value="37">←</option>
					</select>
				</li>
				<li class="items moveLeft" id="leftDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
				<li class="items ifPush">
					<select name="right" id="right" class="directionSelect">
						<option value="39">→</option>
					</select>
				</li>
				<li class="items moveRight" id="rightDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
				<li class="items ifPush">
					<select name="up" id="up" class="directionSelect">
						<option value="38">↑</option>
					</select>
				</li>
				<li class="items moveForward" id="upperDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
				<li class="items ifPush">
					<select name="down" id="down" class="directionSelect">
						<option value="40">↓</option>
					</select>
				</li>
				<li class="items moveBackward" id="downDirection">
				</li>
				<li class="items" id="directionEndIf">
				</li>
		</ul>
	</div>
<div id="missionResult">
	<div id="playground" style="width: 100vh; height: 80vh;">
		<div id="scoreDv">
			<span style="background: black; color: white; font-size: x-large;">점수: </span>
			<span style="background: black; color: white; font-size: x-large;" id="targetScore"></span>
				<span style="background: black; color: white; font-size: x-large;" id="comboAlert"></span>
		</div>
			<div id="comboDv">
			<span style="background: black; color: white; font-size: x-large;" id="targetCombo"></span>
		</div>
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
	<div class="blue buttons right actions" style="width: 500px; margin: 0 auto; margin-right: 20%; margin-top: 1%;">
		<input type="button" class="ui button" value="쉬움" id="easyTest">
		<input type="button" class="ui button" value="보통" id="normalTest">
		<input type="button" class="ui button" value="어려움" id="hardTest">
		<div id="nextBtn" class="ui blue right labeled icon button resultBtns">다음<i class="checkmark icon"></i></div>
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
				<div id="retryBtn" class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
</body>
</html>