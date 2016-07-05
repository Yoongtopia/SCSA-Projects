<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/intro/intro.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/page/introjs.css" />
<script src="${ pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css" />
<script type="text/javascript">
	$(document).ready(function() {
		startIntro();
	});

	function startIntro() {
		var intro = introJs();
		intro.setOptions({
					steps : [
							{
								element: 'body',
								intro : "안녕하세요!<br/> 지금부터 슬기로운 코딩을 시작하겠습니다."
							},
							{
								element: 'body',
								intro : "슬기로운 코딩은 여러분들과 함께 컴퓨터 프로그램이 동작하는 원리에 대해서 알아보는 소프트웨어 입니다."
							}, {
								intro : "자, 저와 함께 한단계씩 따라해볼까요? 키보드 좌우 방향키로도 설명을 보실 수 있습니다."
							}, {
								element: '#order',
								intro : "여기 보이시나요? 여기에 있는 것을 우리는 <b>명령어 상자</b>라고 부릅니다. 명령어가 모여 있는 곳이죠."
							}, {
								element: '.moveRight',
								intro : "이 명령어판 안에 들어있는 기차들이 보이시나요? 이 기차들을 우리는 '명령어'라고 부릅니다."
							}, {
								element: '.board',
								intro : "여기를 우리는 <b>실행보드</b>라고 부릅니다. 위에 있는 명령어들을 옮겨와서 붙이는 곳이죠."
							}, {
								position: 'top',
								element : '#tileBox',
								intro : "여기는 여러분이 하나씩 풀어야할 문제를 보여주는 곳입니다. 문제가 보이시나요?"
							}, {
								intro : "위에 있는 명령어를 하나씩 끌어와서 실행보드에 붙이고 실행해서"
							}, {
								position: 'top',
								element : '#target',
								intro : "우리 주인공이 목표지점에 가게 하는 것이 이번 게임의 목표입니다."
							}, {
								intro : "자 그럼 시작해볼까요?"
							}, {
								position: 'top',
								element : '#tileBox',
								intro : "문제를 다시한번 볼까요? 우리 주인공이 오른쪽 두칸으로 가야하는군요!"
							}, {
								position: 'right',
								element: '.moveRight',
								intro : "자, 그럼 오른쪽으로 명령어 두개를 실행보드로 옮겨볼까요?"
							} ]
				});

		intro.start();
	}
	
	function secondIntro() {
		var intro = introJs();
		intro.setOptions({
					steps : [
							{
								intro : "잘하셨씁니다!"
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
				var number = $("#forLoop").val();
				var foris = "for(i=1; i<=" + number + "; i++){";
				code = code + foris;
				$sortable.eq(i).attr("id", "voidLi");
				$sortable.eq(i).children().attr("id", "voidInput");
			} else {
				code = code + $sortable.eq(i).attr("id");
			}
		}
		
		try {
			eval(code);
		} catch (error) {
			alert("다시 조립해주세요 ㅠㅠ");
		}
	});
</script>
<style>
.target {
	top: 300px;
	left: 225px;
}

#goal {
	top: 300px;
	left: 375px;
}
</style>

<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<input type="button" id="buttonId" value="??">
	<div id="order">
		<h2>명령어들</h2>
		<ul id="selector" class="sortable">
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
		</ul>
	</div>
	<br />
	<div class="board">
	<h2>보드</h2>
	<ul id="board" class="sortable">
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	</div>
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile sheep"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile tree"></div><div class="tile sheep"></div><div class="tile sheep"></div><div class="tile sheep"></div><div class="tile sheep"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile tree"></div><div class="tile tree"></div><div class="tile green"></div><div class="tile green"></div><div class="tile sheep"></div><div class="tile sheep"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile corner"></div><div class="tile road"></div><div class="tile road"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile horse"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile horse"></div><div class="tile green"></div><div class="tile cow"></div><div class="tile cow"></div><div class="tile tree2"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile cow"></div><div class="tile cow"></div><div class="tile cow"></div><div class="tile tree2"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>