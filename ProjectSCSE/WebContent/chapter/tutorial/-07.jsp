<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/intro/intro.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/page/introjs.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css"/>
<script type="text/javascript">
	$(document).ready(function() {
		startIntro();
	});
	function startIntro() {
		var intro = introJs();
		intro.setOptions({
					steps : [{
								intro : "이번 단계에서는 좀 더 어려운 문제로 반복 기차를 연습해보도록 해요"
							},
							{
								element: '#selector',
								intro : "반복 기차가 2쌍이 주어졌네요"
							},
							{
								position: 'top',
								element: '#tileBox',
								intro : "주인공이 아코를 잡으려면 어떻게 움직여야 할지 잘 생각해 보세요!"
							} ]
				});

		intro.start();
	}
</script>
<script type="text/javascript">
	var detection = 1;
	var afterTimeOut = "";
	$(document).on("click", "#run", function() {
		var code = "";
		$sortable = $(".items", "#board");
		for (var i = 0; i < $sortable.length; i++) {
			if ($sortable.eq(i).attr("id") == "for") {
				code = code + "for(i=1; i<=4; i++){";
			} else if($sortable.eq(i).attr("id") == "for4") {
				code = code + "for(j=1; j<=4; j++){";
			}else {
				code = code + $sortable.eq(i).attr("id");
			}
		}
		alert(code);
		try {
			eval(code);
		}catch(error) {
			alert("다시 조립해주세요 ㅠㅠ");
		}
	});
</script>
<style>
	.target {
		top: 150px;
		left: 450px;
	}
	#goal {
		top: 450px;
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
		<li class="items startFor4" check="startFor" id="for"><div class="trainLink"></div></li>
		<li class="items endFor" check="endFor" id="}"><div class="trainLink"></div></li>
		<li class="items startFor4" check="startFor" id="for4"><div class="trainLink"></div></li>
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
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile tree"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile corner2"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green fail"></div><div class="tile road"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green fail"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile tree" ></div><div class="tile sheep"></div><div class="tile cow"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile cowreverse" ></div><div class="tile sheep"></div><div class="tile cow"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile road"></div><div class="tile green"></div><div class="tile cowreverse" ></div><div class="tile cow"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile tree2"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
				<div id="goal"></div>
		</div>
	</footer>
</body>
</html>