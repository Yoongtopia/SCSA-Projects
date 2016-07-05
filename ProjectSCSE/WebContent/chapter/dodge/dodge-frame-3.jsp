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
	
	$(document).ready(function() {
		$("#missionResult").hide();
		$('#goDemo').click(function() {
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
			$("#end").attr("id","targetScore");
			totalScore = 0;
			$('.left-sidebar').hide('slide', {
				direction : 'left'
			}, 700);
			$('.heading').hide('slide', {
				direction : 'up'
			}, 700);
			$('.container').hide('slide', {
				direction : 'right'
			}, 700, missionResult());
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
		});
	});
</script>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	body{
		font-family: "Nanum Gothic", Calibri;
	}
	.board {
		width: 800px;
	}
	#selector {
		height: 100px;
	}
	span {
		vertical-align: middle;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
<%-- <aside class="left-sidebar">
	<jsp:include page="../../pages/HF/SideBarForStudent.jsp"></jsp:include>
</aside> --%>
<header class="heading">
	<h2>명령어들</h2>
	<ul id="selector" class="sortable">
		<li class="items enemyNumOrder">
			<input type="number" min="1" max="15" id="easyEnemy" value="1" class="dodgeNumber1">
		</li>
		<li class="items enemySpeedOrder">
			<input type="number" min="1" max="15" id="easyEnemySpeed" value="1" class="dodgeNumber1">
		</li>
		<li class="items lifeOrder">
			<input type="number" min="1" max="15" id="easyLife" value="1" class="dodgeNumber2">
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
		<li class="items enemyNumOrder">
			<input type="number" min="1" max="15" id="hardEnemy" value="1" class="dodgeNumber1">
		</li>
		<li class="items enemySpeedOrder">
			<input type="number" min="1" max="15" id="hardEnemySpeed" value="1" class="dodgeNumber1">
		</li>
		<li class="items lifeOrder">
			<input type="number" min="1" max="15" id="hardLife" value="1" class="dodgeNumber2">
		</li>
	</ul>
	<br/>
</header>
<div class="container">
	<input type="button" value="게임해보기" id="goDemo">
	<h2>보드</h2>
	<ul id="easyMethodBoard" class="sortable board">
		<li class="items ifEasy startIfEasy">
		</li>
		<li class="items setDiff endIfSet">
		</li>
	</ul>
	<ul id="normalMethodBoard" class="sortable board">
		<li class="items ifNormal startIfCommon">
		</li>
		<li class="items setDiff endIfSet">
		</li>
	</ul>
	<ul id="hardMethodBoard" class="sortable board">
		<li class="items ifHard startIfHard">
		</li>
		<li class="items setDiff endIfSet">
		</li>
	</ul>
	<ul id="settingBoard" class="sortable board">
		<li class="items userSpeedOrder">
			<input type="number" id="speed" value="10" min="1" max="20" class="dodge" style="width: 75px;">
		</li>
		<li class="items backOrder">
			<select name="backgroundSelection" id="backgroundSelection" class="dodge">
				<option value="soccerfield.jpg">축구장</option>
			</select>
		</li>
		<li class="items enemyChaOrder">
			<select name="enemySelection" id="enemySelection" class="dodge">
				<option value="soccerball.png">축구공</option>
			</select>
		</li>
	</ul>
	<ul id="keyBoard" class="sortable board">
		<li class="items">
			만약
			<select name="left" id="left">
				<option value="65">a</option>
			</select>
			누르면
		</li>
		<li class="items" id="leftDirection">
			왼쪽으로 간다
		</li>
		<li class="items">
			만약
			<select name="right" id="right">
				<option value="68">d</option>
			</select>
			누르면
		</li>
		<li class="items" id="rightDirection">
			오른쪽으로 간다
		</li>
		<li class="items">
			만약
			<select name="up" id="up">
				<option value="87">w</option>
			</select>
			누르면
		</li>
		<li class="items" id="upperDirection">
			위쪽으로 간다
		</li>
		<li class="items">
			만약
			<select name="down" id="down">
				<option value="83">s</option>
			</select>
			누르면
		</li>
		<li class="items" id="downDirection">
			아래쪽으로 간다
		</li>
	</ul>
	</div>
<div id="missionResult">
	<div id="playground" style="width: 100vh; height: 80vh;">
		<div id="scoreDv">
			<span style="background: black; color: white; font-size: x-large;">점수: </span>
			<span style="background: black; color: white; font-size: x-large;" id="targetScore"></span>
		</div>
		<div style="float: right; background: black; color: white; font-size: x-large;" id="lifeDv">
			<span style="background: black; color: white; font-size: x-large;">라이프: </span> 
			<table>
				<tbody>
					<tr class="targetLife">
				</tbody>
			</table>
		</div>
		<div id="enemyGroup"></div>
		<div style="width: 100px; height: 100px;" id="player"></div>
	</div>
	<div class="actions">
		<div id="retryBtn" class="ui negative black button resultBtns">다시</div>
		<div id="nextBtn" class="ui positive right labeled icon button resultBtns">
			다음<i class="checkmark icon"></i>
		</div>
		<input type="button" value="쉬움" id="easyTest">
		<input type="button" value="보통" id="normalTest">
		<input type="button" value="어려움" id="hardTest">
	</div>
</div>
</body>
</html>