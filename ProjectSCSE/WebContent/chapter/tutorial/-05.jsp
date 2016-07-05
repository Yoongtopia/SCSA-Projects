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
					steps : [
							{
								intro : "벌써 튜토리얼 5단계네요!"
							},
							{
								intro : "다음 단계인 6단계에서 우리는 반복 기차라는 새로운 명령어를 배우게 될거에요~"
							},
							{
								intro : "이번 단계에서는 먼저 반복 기차의 필요성을 한번 느껴보도록 할까요?"
							},
							{
								element: '#selector',
								intro : "여기 똑같은 명령어의 기차가 4개나 있네요"
							},
							{
								element: '#selector',
								intro : "주어진 기차들을 잘 활용해서"
							},
							{
								position: 'top',
								element: '#tileBox',
								intro : "우리 주인공을 목표지점까지 이동시켜주세요!"
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
				var number = $("#forLoop").val();
				var foris = "for(i=1; i<=" + number + "; i++){";
				code = code + foris;
				$sortable.eq(i).attr("id", "voidLi");
				$sortable.eq(i).children().attr("id", "voidInput");
			} else {
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
		left: 300px;
	}
	#goal {
		top: 450px;
		left: 300px;
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
		<li class="items moveBackward" id="moveDown();"><div class="trainLink"></div></li>
		<li class="items moveBackward" id="moveDown();"><div class="trainLink"></div></li>
		<li class="items moveBackward" id="moveDown();"><div class="trainLink"></div></li>
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
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile cow"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile green"></div><div class="tile corner4" ></div><div class="tile green"></div><div class="tile bush"></div><div class="tile cow"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile cow"></div><div class="tile sheep"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile cowreverse"></div><div class="tile bush"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile cowreverse"></div><div class="tile cowreverse"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile school1"></div><div class="tile school2"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile school3"></div><div class="tile school4"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>