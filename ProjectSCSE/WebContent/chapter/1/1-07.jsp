<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css"/>
<script type="text/javascript">
	var detection = 41;
	var afterTimeOut="";
	$(document).on("click", "#run", function() {
		var code = "";
		$sortable = $(".items", "#board");
		for (var i = 0; i < $sortable.length; i++) {
			if ($sortable.eq(i).attr("id") == "for") {
				var foris = "for(i=1; i<=100; i++){";
				code = code + foris;
			} else if ($sortable.eq(i).attr("id") == "ifLeft") {
				var ifis = "if(detection>37){";
				code = code + ifis;
			} else if ($sortable.eq(i).attr("id") == "ifUp") {
				var ifis2 = "if((detection==37 || detection%7==2) && detection!=9){";
				code = code + ifis2;
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
		top: 450px;
		left: 450px;
	}
	#goal {
		top: 150px;
		left: 150px;
	}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<h2>명령어들</h2>
	<ul id="selector" class="sortable">
		<li class="items moveForward" id="moveUp();"><div class="trainLink"></div></li>
		<li class="items moveLeft" id="moveLeft();"><div class="trainLink"></div></li>
	</ul>
	<br/>
	<h2>보드</h2>

	<ul id="board" class="sortable">
		<li class="items startFor" check="startFor" id="for" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items ifLeft" id="ifLeft" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items endIf" id="}" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items ifUp" id="ifUp" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items endIf" id="}" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items endFor" check="endFor" id="}" style="z-index: 99;"><div class="trainLink"></div></li>
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile pig"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile tree"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile pig"></div><div class="tile pig"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile school1" ></div><div class="tile school2"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile school3" ></div><div class="tile school4"></div><div class="tile tree2"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile bush" ></div><div class="tile bush fail"></div><div class="tile green fail"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile corner2"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile tree"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>