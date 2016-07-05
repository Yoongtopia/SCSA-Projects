<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
		<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/mode.css"/>
		<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/squared_paper_test.js"></script>
		<script type="text/javascript">
			var answer = "";
			$(document).on("click", "#run", function() {
				console.log(answer);
				setTimeout(function() {
					if(answer=="0010001110111110111000100") {
						alert("정답입니다!");
					}else {
						alert("틀렸습니다 ㅠㅠ");
					}
				}, interval);
			});
		</script>
		<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
		<style type="text/css">
			#tileBox {
				width: 520px;
			}
			#selector {
				width: 650px;
				height: 100px;
			}
			#board {
				width: 650px;
				height: 100px;
			}
		</style>
	</head>
	<body>
		<input type="button" value="색칠하기" id="paintBtn">
		<input type="button" value="색칠안하기" id="notPaintBtn">
		<input type="button" value="2번 반복하기" id="loopBtn2">
		<input type="button" value="3번 반복하기" id="loopBtn3">
		<input type="button" value="4번 반복하기" id="loopBtn4">
		<input type="button" value="5번 반복하기" id="loopBtn5">
		<h2>명령어들</h2>
	<ul id="selector" class="sortable">
	</ul>
	<br/>
	<h2>보드</h2>
	<ul id="board" class="sortable">
	</ul>
	<ul id="board1" class="sortable">
	</ul>
	<ul id="board2" class="sortable">
	</ul>
	<ul id="board3" class="sortable">
	</ul>
	<ul id="board4" class="sortable">
	</ul>
	<input type="button" id="run" value="실행">
	<input type="button" id="reset" value="원래대로">
	<br />
	<br />
	<footer>
		<div id="tileBox">
			<div class="tile" id="targetSquare"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
			<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
			<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
			<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
			<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
		</div>
	</footer>
	<img id="squaredAnswer" src="${ pageContext.request.contextPath }/assets/image/Chapter04/4-5.JPG" width="400" height="400">
	</body>
</html>