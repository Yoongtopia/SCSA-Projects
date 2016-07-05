<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>
		<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
		
		<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/maze.css"/>

		
		<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
		<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/mode.css"/>
		<script type="text/javascript">
			var afterTimeOut="";
			var kill = 0;
			var assist = 0;
			var detection = 1;
			var enemyHP = 0;
			var fireCount = 0;
			var bullets = 1;
			$(document).on("click", "#run", function() {
				var code = "";
				$sortable = $(".items", "#board");
				for (var i = 0; i < $sortable.length; i++) {
					code = code + $sortable.eq(i).attr("id");
				}
				try {
					eval(code);
				}catch(error) {
					$("#MakeAgainModal").modal('show');
				}
			});
			function checkGunshotResult() {
				if(kill==1 && assist==0) {
					$("#CorrectModal").modal('show');
				}else {
					$("#WrongModal").modal('show');
				}
			}
		</script>
		<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/gunshot.js"></script>
		<style>
			.target {
				top: 400px;
				left: 400px;
			}
			#enemy {
				top: 100px;
				left: 600px;
			}
			#tileBox {
				width: 1120px;
			}
		</style>
	</head>
	<body>
		<h2>명령어들</h2>
		<ul id="selector" class="sortable">
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
			<li class="items moveRight" id="moveRight();"><div class="trainLink"></div></li>
			<li class="items fire" id="gunShot();"><div class="trainLink"></div></li>
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
				<div class="tile desert"></div><div class="tile house1"></div><div class="tile house2"></div><div class="tile desert"></div><div class="tile desert" ></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile sun"></div>
				<div class="tile fire2"></div><div class="tile house3"></div><div class="tile house4"></div><div class="tile fire2"></div><div class="tile desert" ></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div>
				<div class="tile desert"></div><div class="tile fire2"></div><div class="tile fire2"></div><div class="tile desert"></div><div class="tile desert" ></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile fire2"></div><div class="tile fire2"></div><div class="tile fire2"></div><div class="tile desert"></div>
				<div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert" ></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div>
				<div class="tile cactus2"></div><div class="tile cactus2"></div><div class="tile cactus2"></div><div class="tile desert"></div><div class="tile corner" ></div><div class="tile road"></div><div id="finish" class="tile road"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile desert"></div>
				<div class="tile cactus2"></div><div class="tile cactus2"></div><div class="tile cactus2"></div><div class="tile cactus2"></div><div class="tile desert" ></div><div class="tile desert"></div><div class="tile desert"></div><div class="tile fox"></div><div class="tile stone"></div><div class="tile stone"></div><div class="tile desert"></div>
				<div id="enemy" class="enemy normalHP"></div>
				<div id="target" class="target" style="background-image: url('${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }'); background-size: 100% 100%">
				<div id="bullet"></div></div>
			</div>	
		</footer>
		
	</body>
</html>