<%@page import="com.scse.entity.User"%>
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
	function formCheck (){
		var endingPoint = $("#endingPoint").val();
		var comboConstraint = $("#comboConstraint").val();
		var comboBonus = $("#comboBonus").val();
		var easyEnemy = $("#easyEnemy").val();
		var easyEnemySpeed = $("#easyEnemySpeed").val();
		var easyLife = $("#easyLife").val();		
		var normalEnemy = $("#normalEnemy").val();
		var normalEnemySpeed = $("#normalEnemySpeed").val();
		var normalLife = $("#normalLife").val();
		var hardEnemy = $("#hardEnemy").val();
		var hardEnemySpeed = $("#hardEnemySpeed").val();
		var hardLife = $("#hardLife").val();
		var speed = $("#speed").val();
		var backgroundSelection = $("#backgroundSelection").val();
		var enemySelection = $("#enemySelection").val();
		var left = $("#left").val();
		var right = $("#right").val();
		var up = $("#up").val();
		var down = $("#down").val();
		console.log(endingPoint);
		console.log(comboConstraint);
		console.log(comboBonus);
		console.log(easyEnemy);
		console.log(easyEnemySpeed);
		console.log(easyLife);
		console.log(normalEnemy);
		console.log(normalEnemySpeed);
		console.log(normalLife);
		console.log(hardEnemy);
		console.log(hardEnemySpeed);
		console.log(hardLife);
		console.log(speed);
		console.log(backgroundSelection);
		console.log(enemySelection);
		console.log(left);
		console.log(right);
		console.log(up);
		console.log(down);
		/* if(endingPoint == ""){
			console.log("1");
			return false;
		}
		if (comboConstraint == ""){
			console.log("2");
			return false;
		} 
		if (comboBonus == ""){
			console.log("3");
			return false;
		} 
		if (easyEnemy == ""){
			console.log("4");
			return false;
		}  
		if (easyEnemySpeed == ""){
			console.log("5");
			return false;
		}  
		if (easyLife == ""){
			console.log("6");
			return false;
		} 
		if (normalLife == ""){
			console.log("7");
			return false;
		} 
		if (normalEnemy == ""){
			console.log("8");
			return false;
		}
		if (normalEnemySpeed == ""){
			console.log("9");
			return false;
		} 
		if (hardEnemy == ""){
			console.log("10");
			return false;
		}
		if (hardEnemySpeed == ""){
			console.log("11");
			return false;
		} 
		if (hardLife == ""){
			console.log("12");
			return false;
		}
		if (speed == ""){
			console.log("13");
			return false;
		}
		if (backgroundSelection == ""){
			console.log("14");
			return false;
		}
		if(enemySelection == ""){
			console.log("15");
			return false;
		} 
		if (left == ""){
			console.log("16");
			return false;
		}
		if (right == ""){
			console.log("17");
			return false;
		} 
		if (up == ""){
			console.log("18");
			return false;
		} 
		if (down == ""){
			console.log("19");
			return false;
		}
			return true;
		 */
		
	} 


	var death = "";
	var check = "";
	var $sortable = "";

	$(document).ready(function() {
		
		$(document).on("click", "#likeBtn", function() {
			$("#likeBtn").hide();
			$.getJSON("${ pageContext.request.contextPath }/like_free_code_ajax.scse", { codeNum : "${ requestScope.likeCodeNum }" });
		});
		$("#missionResult").hide();
		$('#goDemo').click(function() {
			/* formCheck(); */
			$("#end").attr("id","targetScore");
			totalScore = 0;
			$('body').css('overflow','hidden');
			$(".container").hide("slide", {direction:'left', easing:'easeInBack'}, 3000, function(){
			$('.heading').hide('slide', {direction : 'up'}, 700);
			$("#goDemo").hide();
			/* if("${ requestScope.user.uType }" == "s") {
				clearInterval(cap);	
			} */
			missionResult();
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
		$("#retryBtn").click(function() {
			clearInterval(death);	
			$('body').css('overflow','');
			$("#enemyGroup").empty();
			$("#missionResult").hide();
			$('.left-sidebar').show('slide', {
				direction : 'left'
			}, 700);
			$('.heading').show('slide', {
				direction : 'up'
			}, 700);
			$('.container').show('slide', {
				direction : 'right'
			}, 700);
			$("#goDemo").show();
		});
		
	});
		$("#left").val("${ requestScope.freeCode.left }");
		$("#right").val("${ requestScope.freeCode.right }");
		$("#up").val("${ requestScope.freeCode.up }");
		$("#down").val("${ requestScope.freeCode.down }");
		$("#enemySelection").val("${ requestScope.freeCode.enemySelection }");
		$("#backgroundSelection").val("${ requestScope.freeCode.backgroundSelection }");
		$("#speed").val("${ requestScope.freeCode.speed }");
		$("#easyLife").val("${ requestScope.freeCode.easyLife }");
		$("#easyEnemySpeed").val("${ requestScope.freeCode.easySpeed }");
		$("#easyEnemy").val("${ requestScope.freeCode.easyEnemy }");
		$("#normalLife").val("${ requestScope.freeCode.normalLife }");
		$("#normalEnemySpeed").val("${ requestScope.freeCode.normalSpeed }");
		$("#normalEnemy").val("${ requestScope.freeCode.normalEnemy }");
		$("#hardLife").val("${ requestScope.freeCode.hardLife }");
		$("#hardEnemySpeed").val("${ requestScope.freeCode.hardSpeed }");
		$("#hardEnemy").val("${ requestScope.freeCode.hardEnemy }");
		$("#comboConstraint").val("${ requestScope.freeCode.comboConstraint }");
		$("#comboBonus").val("${ requestScope.freeCode.comboBonus }");
		$("#endingPoint").val("${ requestScope.freeCode.endingPoint }");
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
<title>슬기로운 코딩 자유모드</title>
</head>
<body>
<% User user = (User) session.getAttribute("user"); %>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/base64.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/canvas2image.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/html2canvas.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/jquery.plugin.html2canvas.js"></script>
	<script type="text/javascript">

	function capture() {
		html2canvas($('#playground'), {
				onrendered : function(canvas) {
					var cap = canvas.toDataURL();
					$.post("save_image_free_ajax.scse", {"codeScreenShot":cap}, function(jsonObj){
						if(jsonObj.status){
							console.log("성공");
						} else {
							console.log("실패");
						}
					} , "json");
				}
			});
		}
	
	
	function saveCodeData() {
		capture();
		var gameName = $("#GameName").val();
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
		$("#codeNameHidden").val(gameName);
		$("#resultImgHidden").val(gameName+".png");
		$("#codeData").submit();
	}
	

	
	</script>

<nav>
	<jsp:include page="pages/HF/header.jsp"></jsp:include>
</nav>
<aside class="left-sidebar" style="z-index: 120">
	<jsp:include page="pages/HF/SidebarForFree.jsp"></jsp:include>
</aside>
<header class="heading">
	
	<ul id="selector" class="sortable" style="float: left;">
	</ul>
	<ul style="float: left;">
				<img src="${ pageContext.request.contextPath }/assets/image/sun9.png" >
		</ul>
	<br/>
</header>
<div class="container" style="float:left; margin: 0 auto; width: 60%; margin-left: 22%;">
	<div class="ui purple button" id="goDemo"><i class="play icon"></i>게임해보기</div>
		<c:choose>
		<c:when test="${ requestScope.freeCode.codeNum == null || requestScope.freeCode.codeNum == -1 }">
			<form id="codeData" method="post" action="${ pageContext.request.contextPath }/manage_free_code.scse?manageFlag=insert">
		</c:when>
		<c:otherwise>
			<form id="codeData" method="post" action="${ pageContext.request.contextPath }/manage_free_code.scse?manageFlag=update&codeNum=${ requestScope.freeCode.codeNum }">
		</c:otherwise>
		</c:choose>
			<input type="hidden" name="left" id="leftHidden" value=0>
			<input type="hidden" name="right" id="rightHidden" value=0>
			<input type="hidden" name="up" id="upHidden" value=0>
			<input type="hidden" name="down" id="downHidden" value=0>
			<input type="hidden" name="backgroundSelection" id="backgroundSelectionHidden" value="">
			<input type="hidden" name="enemySelection" id="enemySelectionHidden" value="">
			<input type="hidden" name="speed" id="speedHidden">
			<input type="hidden" name="easySpeed" id="easySpeedHidden">
			<input type="hidden" name="easyEnemy" id="easyEnemyHidden">
			<input type="hidden" name="easyLife" id="easyLifeHidden">
			<input type="hidden" name="normalSpeed" id="normalSpeedHidden">
			<input type="hidden" name="normalEnemy" id="normalEnemyHidden">
			<input type="hidden" name="normalLife" id="normalLifeHidden">
			<input type="hidden" name="hardSpeed" id="hardSpeedHidden">
			<input type="hidden" name="hardEnemy" id="hardEnemyHidden">
			<input type="hidden" name="hardLife" id="hardLifeHidden">
			<input type="hidden" name="comboConstraint" id="comboConstraintHidden">
			<input type="hidden" name="comboBonus" id="comboBonusHidden">
			<input type="hidden" name="endingPoint" id="endingPointHidden">
			<input type="hidden" name="resultImg" id="resultImgHidden" value="">
			<input type="hidden" name="codeName" id="codeNameHidden" value="">
		</form>
		<ul id="endingBoard" class="sortable boardFree">
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
		<ul id="comboBonusBoard" class="sortable boardFree">
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
		<ul id="comboCollisionBoard" class="sortable boardFree">
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
		<ul id="lifeCollisionBoard" class="sortable boardFree">
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
		<ul id="easyMethodBoard" class="sortable boardFree">
			<li class="items easyCode ui-state-disabled" id="">
			<li class="items ifEasy startIfEasy">
			</li>
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="easyEnemy" value="1" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="easyEnemySpeed" value="1" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="easyLife" value="1" class="dodgeNumber2">
				</li>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
		<ul id="normalMethodBoard" class="sortable boardFree">
			<li class="items normalCode ui-state-disabled" id="">
			<li class="items ifNormal startIfCommon">
			</li>
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="normalEnemy" value="1" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="normalEnemySpeed" value="1" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="normalLife" value="1" class="dodgeNumber2">
				</li>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
		<ul id="hardMethodBoard" class="sortable boardFree">
			<li class="items hardCode ui-state-disabled" id="">
			<li class="items ifHard startIfHard">
			</li>
				<li class="items enemyNumOrder">
					<input type="number" min="1" max="15" id="hardEnemy" value="1" class="dodgeNumber1">
				</li>
				<li class="items enemySpeedOrder">
					<input type="number" min="1" max="15" id="hardEnemySpeed" value="1" class="dodgeNumber1">
				</li>
				<li class="items lifeOrder">
					<input type="number" min="1" max="15" id="hardLife" value="1" class="dodgeNumber2">
				</li>
			<li class="items setDiff endIfSet">
			</li>
		</ul>
			<ul id="settingBoard" class="sortable boardFree">
					<li class="items settingCode ui-state-disabled" id="">
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
			</ul>
		<ul id="keyBoard" class="sortable boardFree">
			<li class="items directionCode ui-state-disabled" id="">
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
		<div id="retryBtn" class="ui red right labeled icon button resultBtns">다시<i class="refresh icon"></i></div>
		<c:if test="${ requestScope.freeCode.codeNum == -1 }">
			<div id="likeBtn" class="ui blue right labeled icon button resultBtns">좋아요<i class="checkmark icon"></i></div>
		</c:if>
	</div>
	<!-- 저장하기 & 스샷 -->
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