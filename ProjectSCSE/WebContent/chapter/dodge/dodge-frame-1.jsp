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
			$('.left-sidebar').hide('slide', {
				direction : 'left'
			}, 700);
			$('.heading').hide('slide', {
				direction : 'up'
			}, 700);
			$('.container').hide('slide', {
				direction : 'right'
			}, 700, missionResult());
		});
		function missionResult() {
			setTimeout(function() {
				$("#missionResult").show();
			}, 1000);
		}
		$("#retryBtn").click(function() {
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
	<br/>
</header>
<div class="container">
	<input type="button" value="게임해보기" id="goDemo">
	<h2>보드</h2>
	<ul id="keyBoard" class="sortable board">
	</ul>
	</div>
<div id="missionResult">
	<div id="playground" style="width: 100vh; height: 80vh;">
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