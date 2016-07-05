<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css"/>
<script type="text/javascript">
	var detection = 1;
	var afterTimeOut="";
	$(document).on("click", "#run", function() {
		var code = "";
		$sortable = $(".items", "#board");
		for (var i = 0; i < $sortable.length; i++) {
			if ($sortable.eq(i).attr("id") == "for") {
				var foris = "for(i=1; i<=29; i++){";
				code = code + foris;
			} else if ($sortable.eq(i).attr("id") == "ifDown") {
				var ifis = "if((detection==7 || detection%7==0) || (detection==19 || detection%7==5) && detection!=5 && detection!=47){";
				code = code + ifis;
			} else if ($sortable.eq(i).attr("id") == "ifLeft") {
				var ifis1 = "if((detection>43 && detection <=49) || (detection<=33 && detection>31)){";
				code = code + ifis1;
			} else if ($sortable.eq(i).attr("id") == "ifUp") {
				var ifis2 = "if(detection%7==1 && detection != 1){";
				code = code + ifis2;
			} else if ($sortable.eq(i).attr("id") == "ifRight") {
				var ifis3 = "if(detection<7 || (detection>=15 && detection<19)){";
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
		top: 75px;
		left: 75px;
	}
	#goal {
		top: 375px;
		left: 225px;
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
		<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
		<li class="items ifDown" id="ifDown"><div class="trainLink"></div></li>
		<li class="items endIf" id="}"><div class="trainLink"></div></li>
		<li class="items ifLeft" id="ifLeft"><div class="trainLink"></div></li>
		<li class="items endIf" id="}"><div class="trainLink"></div></li>
		<li class="items ifUp" id="ifUp"><div class="trainLink"></div></li>
		<li class="items endIf" id="}"><div class="trainLink"></div></li>
		<li class="items ifRight" id="ifRight"><div class="trainLink"></div></li>
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
			<div class="voidTile"></div><div class="voidTile fail"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile fail"></div><div class="voidTile"></div>
			<div class="voidTile fail"></div><div class="tile corner"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="voidTile fail"></div>
			<div class="voidTile"></div><div class="tile green fail"></div><div class="tile sheep"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile tree2"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile green"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile road"></div><div class="tile green"></div><div class="tile green"></div><div class="tile cow" ></div><div class="tile road"></div><div class="tile green"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile road"></div><div class="tile green"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile green"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile road"></div><div class="tile tree2"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile sheep"></div><div class="tile sheep"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="voidTile fail"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile fail"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>