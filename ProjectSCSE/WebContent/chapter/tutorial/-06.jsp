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
								intro : "어떤가요? 같은 명령어의 기차를 반복해서 사용하니 불편하지 않았나요?"
							},
							{
								intro : "그래서 새로운 명령어의 기차를 준비했어요!"
							},
							{
								element: '#board',
								intro : "여기 저희가 미리 보드에 배치해 둔 빨간 기차가 보이세요?"
							},
							{
								element: '#board',
								intro : "이 기차들이 바로 이번 단계에서 새로 배우게 될 반복 기차에요"
							},
							{
								element: '#board',
								intro : "반복 기차는 반복 시작 기차와 반복 끝 기차가 짝을 이루어서 반복문을 만들어요"
							},
							{
								element: '#for',
								intro : "반복 시작 기차는 반복문의 시작을 의미하고 반복 횟수가 적혀있어요"
							},
							{
								element: '.endFor',
								intro : "반복 끝 기차는 반복문의 종료를 의미해요"
							},
							{
								element: '#board',
								intro : "반복 시작 기차와 반복 끝 기차 사이에 있는 명령어 기차는 횟수만큼 반복해서 실행할 수 있어요"
							},
							{
								element: '.moveForward',
								intro : "그럼 명령어 기차를 반복 시작 기차와 반복 끝 기차 사이로 옮겨볼까요?"
							},
							{	
								element: '#for',
								intro : "꼭 기억하세요! 반복하고 싶은 명령어 기차는 반드시 반복 시작 기차와"
							},
							{	
								element: '.endFor',
								intro : "반복 끝 기차 사이에 위치해요 해요"
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
		top: 450px;
		left: 300px;
	}
	#goal {
		top: 150px;
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
		<li class="items moveForward" id="moveUp();"><div class="trainLink"></div></li>
	</ul>
	<br/>
	<h2>보드</h2>

	<ul id="board" class="sortable">
		<li class="items startFor4" check="startFor" id="for"><div class="trainLink"></div></li>
		<li class="items endFor" check="endFor" id="}"><div class="trainLink"></div></li>
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile cowreverse"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile cowreverse"></div><div class="tile sheep"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile school1"></div><div class="tile school2"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile bush"></div><div class="tile cowreverse"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile school3"></div><div class="tile school4"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile sheep"></div><div class="tile cow"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile green"></div><div class="tile road" ></div><div class="tile green"></div><div class="tile cow"></div><div class="tile cow"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile green"></div><div class="tile corner3" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
				<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
</body>
</html>