<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css"/>
<script type="text/javascript">
	var detection = 49;
	var afterTimeOut="";
	$(document).on("click", "#run", function() {
		var code = "";
		$sortable = $(".items", "#board");
		for (var i = 0; i < $sortable.length; i++) {
			if ($sortable.eq(i).attr("id") == "for") {
				var foris = "for(i=1; i<=15; i++){";
				code = code + foris;
			} else if ($sortable.eq(i).attr("id") == "ifDown") {
				var ifis2 = "if((detection==2 || detection%7==2) && detection!=30){";
				code = code + ifis2;
			} else if ($sortable.eq(i).attr("id") == "ifLeft") {
				var ifis = "if(detection>2 && detection <=7){";
				code = code + ifis;
			} else if ($sortable.eq(i).attr("id") == "ifUp") {
				var ifis3 = "if(detection%7==0){";
				code = code + ifis3;
			} else {
				code = code + $sortable.eq(i).attr("id");
			}
		}
		try {
			eval(code);
		}catch(error) {
			alert("다시 조립해주세요 ㅠㅠ");
		}
	});
</script>
<style>
	.target {
		top: 525px;
		left: 525px;
	}
	#goal {
		top: 375px;
		left: 150px;
	}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<h2>명령어들</h2>
	<ul id="selector" class="sortable">
		<li class="items moveBackward" id="moveDown();"><div class="trainLink"></div></li>
		<li class="items moveLeft" id="moveLeft();"><div class="trainLink"></div></li>
		<li class="items moveForward" id="moveUp();"><div class="trainLink"></div></li>
		<li class="items ifDown" id="ifDown"><div class="trainLink"></div></li>
		<li class="items endIf" id="}"><div class="trainLink"></div></li>
		<li class="items ifLeft" id="ifLeft"><div class="trainLink"></div></li>
		<li class="items endIf" id="}"><div class="trainLink"></div></li>
		<li class="items ifUp" id="ifUp"><div class="trainLink"></div></li>
		<li class="items endIf" id="}"><div class="trainLink"></div></li>
		<li class="items startFor" check="startFor" id="for"><div class="trainLink"></div></li>
		<li class="items endFor" check="endFor" id="}"><div class="trainLink"></div></li>
	</ul>
	<br/>
	<h2>보드</h2>

	<ul id="board" class="sortable">
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile fail"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile tree"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile tree"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile bush"></div><div class="tile cow"></div><div class="tile green"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile bush"></div><div class="tile bush"></div><div class="tile cow"></div><div class="tile cow"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile green fail"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile tree2"></div><div class="tile tree2"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile green fail"></div><div class="tile corner3"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile fail"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>