<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<script type="text/javascript" src="assets/sui/javascript/jquery.address.js"></script>
<link href="assets/css/page/mainFrame.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/${ requestScope.mission.cssName }" />
<c:if test="${ param.chapNum == 4 }">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/squared_paper.js"></script>
</c:if>
<script type="text/javascript">
	var afterTimeOut = "";
	$(document).ready(function() {
		$("#missionResult").hide();
		$(document).on("click", "#submit", function() {
			location.href="${ pageContext.request.contextPath }/chapter/MissionIndexTest.jsp"
		});
		$('#run').click(function() {
			if("${ param.chapNum == 2 }" == "true") {
				if($("#board").children().size()!= parseInt("${ requestScope.mission.rpsNum }")) {
					alert("모든 블럭을 사용해주세요 ㅠㅠ");
					return;
				}
				code = "initRps();";
				$sortable = $(".items", "#board");
				if(!checkError($sortable)) {
					return;
				}
			}
			$('.left-sidebar').hide('slide', {
				direction : 'left'
			}, 700);
			$('.heading').hide('slide', {
				direction : 'up'
			}, 700);
			$('.container').hide('slide', {
				direction : 'right'
			}, 700, missionResult());
		});
		function missionResult() {
			setTimeout(function() {
				$("#missionResult").show();
			}, 1000);
			setTimeout(mission, 1000);
		}
	});
</script>
<!-- 코드 스크립트 -->
<c:choose>
	<c:when test="${ param.chapNum != 4 }">
		${ requestScope.mission.jsCode }
		${ requestScope.mission.targetCode }
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			var answer = "";
			function squaredPaperResult() {
				setTimeout(function() {
					if(answer=="${ requestScope.mission.jsCode }") {
						alert("정답입니다!");
					}else {
						alert("틀렸습니다 ㅠㅠ");
					}
				}, interval);
			}
		</script>
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
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/${ requestScope.mission.jsName }"></script>
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<title></title>
</head>
<body>
	<aside class="left-sidebar">
		<jsp:include page="../pages/HF/SideBarForStudent.jsp"></jsp:include>
	</aside>
	<header class="heading">
		<c:if test="${ param.chapNum == 4 }">
			<input type="button" value="색칠하기" id="paintBtn">
			<input type="button" value="색칠안하기" id="notPaintBtn">
			<input type="button" value="2번 반복하기" id="loopBtn2">
			<input type="button" value="3번 반복하기" id="loopBtn3">
			<input type="button" value="4번 반복하기" id="loopBtn4">
			<input type="button" value="5번 반복하기" id="loopBtn5">
		</c:if>
		<h2>명령어들</h2>
		<ul id="selector" class="sortable">
			${ requestScope.mission.selectorCode }
		</ul>
		<br />
	</header>
	<div class="container">
		<h2>보드</h2>
		<ul id="board" class="sortable">
			${ requestScope.mission.boardCode }
		</ul>
		<c:if test="${ param.chapNum == 4 }">
			<br/>
			<ul id="board1" class="sortable">
			</ul>
			<br/>
			<ul id="board2" class="sortable">
			</ul>
			<br/>
			<ul id="board3" class="sortable">
			</ul>
			<br/>
			<ul id="board4" class="sortable">
			</ul>
		</c:if>
		<input type="button" id="run" value="실행">
		<input type="button" id="reset" value="원래대로">
		<br /> <br />
	</div>
	<div id="missionResult">
		<div class="header"></div>
		<div class="content">
			<c:choose>
				<c:when test="${ param.chapNum != 2 }">
					<div id="tileBox">
						<c:choose>
							<c:when test="${ param.chapNum == 1 || param.chapNum == 0}">
								<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
								${ requestScope.mission.mapCode }
								<div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div><div class="voidTile"></div>
								<div id="target" class="target">블록</div>
								<div id="goal">성공</div>
							</c:when>
							<c:when test="${ param.chapNum == 3 }">
								${ requestScope.mission.mapCode }
							</c:when>
							<c:otherwise>
								<div class="tile" id="targetSquare"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
								<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
								<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
								<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
								<div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div><div class="tile"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:when>
				<c:otherwise>
					<table>
						<tr><td height="30" colspan="3" id="rpsHeader" width="1000"><span id="scissor">가위!</span> <span id="rock">바위!</span> <span id="paper">보!</span></td></tr>
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
					</table>
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="actions">
			<div id="cancel" class="ui negative black button">다시</div>
			<div id="submit" class="ui positive right labeled icon button">
				다음<i class="checkmark icon"></i>
			</div>
		</div>
	</div>
</body>
</html>