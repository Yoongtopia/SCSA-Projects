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
			var check = "";
			$sortable = $(".items", "#comboBonusBoard");
			for (var i = 0; i < $sortable.length; i++) {
				check += $sortable.eq(i).attr("check");
			}
			if(check != "12345") {
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
				clearInterval(death);	
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
<aside class="left-sidebar">
	<jsp:include page="../../pages/HF/SideBarForStudent.jsp"></jsp:include>
</aside>
<header class="heading">
<h3>데모 플레이</h3>
	<h2>명령어들</h2>
</header>
<div class="container">
	<input type="button" value="게임해보기" id="goDemo">
	<h2>보드</h2>
	<ul id="comboBonusBoard" class="sortable board">
		<li class="items" id="startForBonusCombo" check="1">
			게임이 끝날 때까지
		</li>
		<li class="items" id="ifBonusCombo" check="2">
			만약
			<input type="number" min="5" max="20" id="comboConstraint" value="5" step="5" class="dodge" style="width: 75px;">
			콤보 이상이면
		</li>
		<li class="items" id="comboBonusLi" check="3">
			<input type="number" min="100" max="500" id="comboBonus" value="100" step="100" class="dodge" style="width: 75px;">
			점
		</li>
		<li class="items" id="endIfBonusCombo" check="4">
			보너스로 받기
		</li>
		<li class="items" id="endForBonusCombo" check="5">
			반복하기
		</li>
	</ul>
	<ul id="comboCollisionBoard" class="sortable board">
		<li class="items" id="startForCollisionCombo" check="1">
			게임이 끝날 때까지
		</li>
		<li class="items" id="ifCollisionCombo" check="2">
			만약 적과 부딪히면
		</li>
		<li class="items" id="defaultCombo" check="3">
			콤보 0 만들기
		</li>
		<li class="items" id="elseCollisionCombo" check="4">
			그렇지 않으면
		</li>
		<li class="items" id="plusCombo" check="5">
			콤보 1 증가하기
		</li>
		<li class="items" id="endForCollisionCombo" check="6">
			반복하기
		</li>
	</ul>
	<ul id="lifeCollisionBoard" class="sortable board">
		<li class="items" id="startForCollisionLife" check="1">
			게임이 끝날 때까지
		</li>
		<li class="items" id="ifCollisionLife" check="2">
			만약 적과 부딪히면
		</li>
		<li class="items" id="minusLife" check="3">
			생명 감소하기
		</li>
		<li class="items" id="elseCollisionLife" check="4">
			그렇지 않으면
		</li>
		<li class="items" id="keepGoing" check="5">
			계속 진행하기
		</li>
		<li class="items" id="endForCollisionLife" check="6">
			반복하기
		</li>
	</ul>	
	<ul id="easyMethodBoard" class="sortable board">
		<li class="items enemyNumOrder">
			<select id="easyEnemy" class="dodge">
				<option value="10">10</option>
			</select>
		</li>
		<li class="items enemySpeedOrder">
			<input type="number" min="1" max="15" id="easyEnemySpeed" value="3" class="dodge" style="width: 75px;">
		</li>
		<li class="items lifeOrder">
			<input type="number" id="easyLife" value=5 class="dodge" style="width: 75px;">
		</li>
	</ul>
	<ul id="normalMethodBoard" class="sortable board">
		<li class="items enemyNumOrder">
			<select id="normalEnemy" class="dodge">
				<option value="10">10</option>
			</select>
		</li>
		<li class="items enemySpeedOrder">
			<input type="number" min="1" max="15" id="normalEnemySpeed" value="5" class="dodge" style="width: 75px;">
		</li>
		<li class="items lifeOrder">
			<input type="number" id="normalLife" value=5 class="dodge" style="width: 75px;">
		</li>
	</ul>
	<ul id="hardMethodBoard" class="sortable board">
		<li class="items enemyNumOrder">
			<select id="hardEnemy" class="dodge">
				<option value="10">10</option>
			</select>
		</li>
		<li class="items enemySpeedOrder">
			<input type="number" min="1" max="15" id="hardEnemySpeed" value="10" class="dodge" style="width: 75px;">
		</li>
		<li class="items lifeOrder">
			<input type="number" id="hardLife" value=5 class="dodge" style="width: 75px;">
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
			<span style="background: black; color: white; font-size: x-large;" id="comboAlert"></span>
		</div>
		<div id="comboDv">
			<span style="background: black; color: white; font-size: x-large;" id="targetCombo"></span>
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