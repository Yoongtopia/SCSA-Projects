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
								intro : "9단계에서는 신호등이 등장했어요"
							},
							{
								position: 'top',
								element: '.light',
								intro : "여기 신호등이 보이시나요? 우리의 주인공은 신호등이 빨간불일 때 잠시 멈췄다가 가야해요"
							},
							{
								element: '#board',
								intro : "여기 새로운 만약 기차가 등장했어요"
							},
							{
								element: '#board',
								intro : "여기 새로운 만약 기차가 등장했어요"
							},
							{
								
								element: '.wrongAnswer',
								intro : "반복 기차를 잘 이해한 여러분이라면 주인공이 여기로 이동할거란 사실을 아실거에요"
							},
							{
								element: '#goal',
								intro : "그러면 주인공이 이곳으로 가기 위해서는 어떻게 해야 할까요?"
							},
							{
								element: '#goal',
								intro : "힌트를 드리면, 명령어 기차 하나를 반복문 밖으로 빼내면 된답니다~"
							}]
				});

		intro.start();
	}
</script>
<script type="text/javascript">
	var detection = 1;
	var afterTimeOut = "";
	$(document).on("click", "#run", function() {
		var code = "for(i=1; i<=6; i++){moveRight();";
		$sortable = $(".items", "#board");
		for (var i = 0; i < $sortable.length; i++) {
			code = code + $sortable.eq(i).attr("id");
		}
		code += "}";
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
		top: 300px;
		left: 75px;
	}
	#goal {
		top: 300px;
		left: 525px;
	}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/tutorial.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<h2>명령어들</h2>
	<ul id="selector" class="sortable">
		<li class="items wait" id="redSignal"><div class="trainLink"></div></li>
		<li class="items keepGoing" id="greenSignal"><div class="trainLink"></div></li>
	</ul>
	<br/>
	<h2>보드</h2>

	<ul id="board" class="sortable">
		<li class="items ifRed" id="setRedSign("><div class="trainLink"></div></li>
		<li class="items plainEndIf" id=");"><div class="trainLink"></div></li>
		<li class="items ifGreen" id="setGreenSign("><div class="trainLink"></div></li>
		<li class="items plainEndIf" id=");"><div class="trainLink"></div></li>
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile sheep"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile green" ></div><div class="tile sheep"></div><div class="tile sheep"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile corner"></div><div class="tile road"></div><div class="tile road"></div><div class="tile light trafficLight1" ></div><div class="tile road"></div><div class="tile light trafficLight2"></div><div class="tile road"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile cowreverse" ></div><div class="tile cow"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile cow" ></div><div class="tile cow"></div><div class="tile cow"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile tree"></div><div class="tile tree"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>