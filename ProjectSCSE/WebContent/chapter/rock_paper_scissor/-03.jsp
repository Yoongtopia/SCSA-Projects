<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="${ pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>
		<script src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
		<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/mode.css"/>
		<script type="text/javascript">
			var interval = 0;
			$(document).on("click", "#run", function() {
				if($("#board").children().size()!=3) {
					alert("다시 조립해주세요 ㅠㅠ");
					return;
				}
				var code = "initRps();";
				$sortable = $(".items", "#board");
				if(!checkError($sortable)) {
					return;
				}
				for (var i = 0; i < $sortable.length; i++) {
					if ($sortable.eq(i).attr("id") == "ifRock") {
						code = code + "";
					}else if($sortable.eq(i).attr("id") == "}") {
						code = code + "";
					}else {
						code = code + $sortable.eq(i).attr("id");
					}
				}
				try {
					eval(code);
				}catch(error) {
					alert("다시 조립해주세요 ㅠㅠ");
				}
			});
			function showResult(finalResult) {
				if(finalResult=="win") {
						alert("성공하였습니다!");
					}else {
						alert("실패하였습니다!");
					}
				interval+=1000;
			}
		</script>
		<script src="${ pageContext.request.contextPath }/assets/js/Mission/rock_paper_scissor.js"></script>
	</head>
	<body>
		<h2>명령어들</h2>
		<ul id="selector" class="sortable">
			<li class="items scissor" check="decision" id="setTimeout(function(){checkResult('rock','scissor');}, interval);"><div class="trainLink"></div></li>
			<li class="items rock" check="decision" id="setTimeout(function(){checkResult('rock','rock');}, interval);"><div class="trainLink"></div></li>
			<li class="items paper" check="decision" id="setTimeout(function(){checkResult('rock','paper');}, interval);"><div class="trainLink"></div></li>
			<li class="items ifRock" check="condition" id="ifRock"><div class="trainLink"></div></li>
			<li class="items rpsEndIf" id="}"><div class="trainLink"></div></li>
		</ul>
		<br/>
		<h2>보드</h2>
	
		<ul id="board" class="sortable">
		</ul>
		<input type="button" id="run" value="실행">
		<input type="button" id="reset" value="원래대로">
		<br />
		<br />
		<!-- <table border="1">
			<tr><td colspan="3" width="1000" style="text-align: center">바위만 내는 아코 이기기</td></tr>
			<tr><td height="30" colspan="3" id="rpsHeader"><span id="scissor">가위!</span> <span id="rock">바위!</span> <span id="paper">보!</span></td></tr>
			<tr>
				<td height="400" width="400" id="knowEnemy">
					<div id="achoRockImg" class="rpsImg"></div>
					<div id="achoPaperImg" class="rpsImg"></div>
					<div id="achoScissorImg" class="rpsImg"></div>
				</td>
				<td width="200" id="versus">vs</td>
				<td id="knowMyself">
					<div id="playerRockImg" class="rpsImg"></div>
					<div id="playerPaperImg" class="rpsImg"></div>
					<div id="playerScissorImg" class="rpsImg"></div>
				</td>
			</tr>
		</table> -->
		<table id="rcpRing">
			<tr><td colspan="3" width="1000" style="text-align: center">바위만 내는 아코 이기기</td></tr>
			<tr><td height="30" colspan="3" id="rpsHeader"></tr>
			<tr>
				<td height="250" width="400" id="knowEnemy">
					<div id="achoRockImg" class="rpsImg bad"></div>
					<div id="achoPaperImg" class="rpsImg bad"></div>
					<div id="achoScissorImg" class="rpsImg bad"></div>
				</td>
				<td width="250" height="400" id="versus" style="overflow: visible;">
				<div class="showMent" id="scissor"></div> 
				<div class="showMent" id="rock"></div> 
				<div class="showMent" id="paper"></div>
				<div class="showMent" id="vs">vs</div></td>
				<td height="250" width="400" id="knowMyself">
					<div id="playerRockImg" class="rpsImg good"></div>
					<div id="playerPaperImg" class="rpsImg good"></div>
					<div id="playerScissorImg" class="rpsImg good"></div>
				</td>
			</tr>
		</table>
	</body>
</html>