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
								intro : "8단계에서는 명령어 기차가 반복문 안에 있을 때와 밖에 있을 때의 차이를 알아볼 거에요"
							},
							{
								element: '#board',
								intro : "여기 보드에 미리 주어진 기차들이 보이시나요?"
							},
							{
								element: '#board',
								intro : "이 상태에서 우리의 주인공이 어디로 이동할지 한번 생각해보세요"
							},
							{
								position: 'top',
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
		var code = "";
		$sortable = $(".items", "#board");
		for (var i = 0; i < $sortable.length; i++) {
			if ($sortable.eq(i).attr("id") == "for") {
				var foris = "for(i=1; i<=4; i++){";
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
		left: 150px;
	}
	#goal {
		top: 225px;
		left: 450px;
	}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<h2>명령어들</h2>
	<ul id="selector" class="sortable">
	</ul>
	<br/>
	<h2>보드</h2>

	<ul id="board" class="sortable">
		<li class="items startFor4" check="startFor" id="for" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items moveRight" id="moveRight();" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items moveBackward" id="moveDown();" style="z-index: 99;"><div class="trainLink"></div></li>
		<li class="items endFor" check="endFor" id="}" style="z-index: 99;"><div class="trainLink"></div></li>
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile sheep"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile corner"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile road"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green fail"></div><div class="tile road"></div><div class="tile road" ></div><div class="tile tree2"></div><div class="tile road"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile road"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile tree2"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile road"></div><div class="tile road"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile road wrongAnswer"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile tree" ></div><div class="tile green"></div><div class="tile sheep"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
				<div id="goal"></div>
		</div>
	</footer>
</body>
</html>