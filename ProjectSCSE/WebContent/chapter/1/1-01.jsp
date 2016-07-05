<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/sui/css/semantic.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/sui/javascript/jquery.address.js"></script>
<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css"/>
<script type="text/javascript">
	var detection = 1;
	var afterTimeOut = "";
	$(document).on("click", ".locomotive", function() {
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
		}catch(error) {
			alert("다시 조립해주세요 ㅠㅠ");
		}
	});
	
	
</script>
<style>
	.target {
		top: 300px;
		left: 150px;
	}
	#goal {
		top: 300px;
		left: 450px;
	}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<h2>명령어들</h2>
	<div id="equipment">
		<ul id="selector" class="sortable">
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
		</ul>
	</div>
	<br/>
	<h2>보드</h2>

	<ul id="board" class="sortable">
		
		<a href="javascript:void(0);"><li class="items locomotive ui-state-disabled" id=""></li></a>
	</ul>
	<!-- <input type="button" id="run" value="실행"> -->
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile bush"></div><div class="tile bush" ></div><div class="tile green"></div><div class="tile cow"></div><div class="tile cow"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile school1"></div><div class="tile school2"></div><div class="tile tree2" ></div><div class="tile tree2"></div><div class="tile cow"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile school3"></div><div class="tile school4"></div><div class="tile bush" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile corner"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile road"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile tree"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green" ></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile bush"></div><div class="tile green"></div><div class="tile green"></div><div class="tile bush" ></div><div class="tile bush"></div><div class="tile bush"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="tile green"></div><div class="tile green"></div><div class="tile green"></div><div class="tile bush" ></div><div class="tile tree"></div><div class="tile tree"></div><div class="tile green"></div><div class="voidTile"></div>
			<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
			<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
			<div id="goal"></div>
		</div>
	</footer>
	
		<!-- 정답 모달 -->
	<div class="ui small modal" id="CorrectModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #00A8C6; font-family: 'Nanum Gothic';">정답입니다!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/Correct.png"></td>		
				<tr>
					<td>축하드려요! 정답입니다!</td>
			</table>
			<div class="actions">
				<div id="retryBtn" class="ui negative black button resultBtns" style="margin-right: 60px; margin-left: 0em; float: left">한번더</div>
				<div id="nextBtn" class="ui positive icon button resultBtns">다음으로</div>
			</div>
		</div>
	</div>

	<!-- 실패 모달 -->
	<div class="ui small modal" id="WrongModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">정답입니다!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/Wrong.png"></td>		
				<tr>
					<td>아쉬워요 ~ 좀만 바꾸면 맞출 수 있는데!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div id="retryBtn" class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">다시 풀어보기</div>
			</div>
		</div>
	</div>

	<!-- 모든 블럭을 사용해 주셈 -->
	<div class="ui small modal" id="UseAllModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">블럭을 안쓰셨네요?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/UseAll.png"></td>		
				<tr>
					<td>모든 블럭을 사용해주셔야 되요!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" align="center" style="margin-left: 0px;">계속 풀어보기</div>
			</div>
		</div>
	</div>

	<!-- 한개이상의 블럭을 사용해주세요. -->
	<div class="ui small modal" id="OneMoreModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">블럭을 안쓰셨네요?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/OneMore.png"></td>		
				<tr>
					<td>한 개 이상의 블럭을 사용해주세요.</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" align="center" style="margin-left: 0px;">계속 풀어보기</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>