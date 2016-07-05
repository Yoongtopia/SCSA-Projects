<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="../assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="../assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="../assets/sui/css/semantic.css">
<script type="text/javascript" src="../assets/sui/javascript/jquery.address.js"></script>
<link href="../assets/css/page/mainFrame.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/${ requestScope.mission.cssName }" />
<c:if test="${ requestScope.mission.chapNum == 4 }">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/squared_paper.js"></script>
</c:if>
<script type="text/javascript">
	var afterTimeOut = "";
	var startTime = new Date().getTime();
	var studyTime = 0;
	$(document).ready(function() {
						$(".resultBtns").hide();
						$("#missionResult").hide();
						$(document)
								.on(
										"click",
										"#nextBtn",
										function() {
											if ("${ requestScope.mission.chapNum == 1 }" == "true"
													&& "${ requestScope.mission.quizNum == 12 }" == "true") {
												if ("${ requestScope.chaMap.pooh }" != "pooh") {
													$
															.getJSON(
																	"${ pageContext.request.contextPath }/success_chapter_quest.scse",
																	{
																		"chaNum1" : 5,
																		"chaNum2" : 6,
																		"chaNum3" : 7,
																		"chaNum4" : 8
																	});
													alert("푸우 시리즈 획득!");
												}
											} else if ("${ requestScope.mission.chapNum == 2 }" == "true"
													&& "${ requestScope.mission.quizNum == 7 }" == "true") {
												if ("${ requestScope.chaMap.cookieRun_brave }" != "cookieRun_brave") {
													$
															.getJSON(
																	"${ pageContext.request.contextPath }/success_chapter_quest.scse",
																	{
																		"chaNum1" : 9,
																		"chaNum2" : 10,
																		"chaNum3" : 11,
																		"chaNum4" : 12
																	});
													alert("쿠키런 시리즈 획득!");
												}
											} else if ("${ requestScope.mission.chapNum == 3 }" == "true"
													&& "${ requestScope.mission.quizNum == 10 }" == "true") {
												if ("${ requestScope.chaMap.pororo_pororo }" != "pororo_pororo") {
													$
															.getJSON(
																	"${ pageContext.request.contextPath }/success_chapter_quest.scse",
																	{
																		"chaNum1" : 13,
																		"chaNum2" : 14,
																		"chaNum3" : 15,
																		"chaNum4" : 16
																	});
													alert("뽀로로 시리즈 획득!");
												}
											} else if ("${ requestScope.mission.chapNum == 4 }" == "true"
													&& "${ requestScope.mission.quizNum == 10 }" == "true") {
												if ("${ requestScope.chaMap.snowwhite }" != "snowwhite") {
													$
															.getJSON(
																	"${ pageContext.request.contextPath }/success_chapter_quest.scse",
																	{
																		"chaNum1" : 17,
																		"chaNum2" : 18,
																		"chaNum3" : 19,
																		"chaNum4" : 20
																	});
													alert("공주 시리즈 획득!");
												}
											} else if ("${ requestScope.mission.chapNum == 5 }" == "true"
													&& "${ requestScope.mission.quizNum == 10 }" == "true") {
												if ("${ requestScope.chaMap.onepiece_luffy }" != "onepiece_luffy") {
													$
															.getJSON(
																	"${ pageContext.request.contextPath }/success_chapter_quest.scse",
																	{
																		"chaNum1" : 21,
																		"chaNum2" : 22,
																		"chaNum3" : 23,
																		"chaNum4" : 24
																	});
													alert("원피스 시리즈 획득!");
												}
											}
											location.href = "${ pageContext.request.contextPath }/find_missionIndex.scse?missionIndex=${ requestScope.mission.missionIndex+1 }";
										});
						$(document).on("click", "#retryBtn", function() {
							$("#retryForm").submit();
						});
						$('#run')
								.click(
										function() {
											if ("${ requestScope.mission.chapNum == 2 }" == "true") {
												if ($("#board").children()
														.size() != parseInt("${ requestScope.mission.rpsNum }")) {
													alert("모든 블럭을 사용해주세요 ㅠㅠ");
													return;
												}
												code = "initRps();";
												$sortable = $(".items",
														"#board");
												if (!checkError($sortable)) {
													return;
												}
											}
											if ($("#board").children().size() == 0) {
												alert("블럭을 1개 이상 사용해주세요 ㅠㅠ");
												return;
											}
											studyTime = Math
													.round((new Date()
															.getTime() - startTime) / 1000);
											if ("${ requestScope.user.uType }" == "s") {
												$
														.getJSON(
																"${ pageContext.request.contextPath }/run_mission.scse",
																{
																	"chapNum" : "${ requestScope.mission.chapNum }",
																	"quizNum" : "${ requestScope.mission.quizNum }",
																	"time" : studyTime
																});
											}
											$("#retryBoard").val(
													$("#boards").html());
											$("#retrySelector").val(
													$("#selector").html());
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
	$("#target").attr("id", "jobDone");
	function failUpdate() {
		if ("${ requestScope.user.uType }" == "s") {
			$
					.getJSON(
							"${ pageContext.request.contextPath }/fail_mission.scse",
							{
								"chapNum" : "${ requestScope.mission.chapNum }",
								"quizNum" : "${ requestScope.mission.quizNum }",
								"missionIndex" : "${ requestScope.mission.missionIndex }"
							},
							function(jsonObj) {
								if ("${ requestScope.chaMap.butterfly }" != "butterfly") {
									if (jsonObj.failNum == 3) {
										alert("석현이형 획득");
									}
								}
								if (jsonObj.totalNum == 300) {
									if ("${ requestScope.chaMap.ironman }" != "ironman") {
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 39
														});
										alert("아이언맨 획득!");
									}
								} else if (jsonObj.totalNum == 200) {
									if ("${ requestScope.chaMap.superman }" != "superman") {
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 38
														});
										alert("슈퍼맨 획득!");
									}
								} else if (jsonObj.totalNum == 100) {
									if ("${ requestScope.chaMap.barbie }" != "barbie") {
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 37
														});
										alert("바비나비 획득!");
									}
								}
							});
		}
	}
	function successUpdate() {
		if ("${ requestScope.user.uType }" == "s") {
			$
					.getJSON(
							"${ pageContext.request.contextPath }/next_mission.scse",
							{
								"missionIndex" : "${ requestScope.mission.missionIndex }"
							},
							function(jsonObj) {
								if ("${ requestScope.chaMap.doraemong }" != "doraemong") {
									if (jsonObj.todayNum == 5) {
										alert("도라에몽 획득!");
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 27
														});
									}
								}
								if (jsonObj.totalNum == 300) {
									if ("${ requestScope.chaMap.ironman }" != "ironman") {
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 39
														});
										alert("아이언맨 획득!");
									}
								} else if (jsonObj.totalNum == 200) {
									if ("${ requestScope.chaMap.superman }" != "superman") {
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 38
														});
										alert("슈퍼맨 획득!");
									}
								} else if (jsonObj.totalNum == 100) {
									if ("${ requestScope.chaMap.barbie }" != "barbie") {
										$
												.getJSON(
														"${ pageContext.request.contextPath }/success_quest.scse",
														{
															"chaNum" : 37
														});
										alert("바비나비 획득!");
									}
								}
							});
			if (parseInt("${ requestScope.mission.quizNum }") >= 5) {
				if ("${ requestScope.chaMap.sonic }" != "sonic") {
					if (studyTime <= 60) {
						alert("소닉 획득!");
						$
								.getJSON(
										"${ pageContext.request.contextPath }/success_quest.scse",
										{
											"chaNum" : 26
										});
					}
				}
				if ("${ requestScope.chaMap.conan }" != "conan") {
					$
							.getJSON(
									"${ pageContext.request.contextPath }/conan_quest.scse",
									{
										"missionIndex" : "${ requestScope.mission.missionIndex }"
									},
									function(jsonObj) {
										if (jsonObj.conanCount == 1) {
											alert("코난 획득!");
											$
													.getJSON(
															"${ pageContext.request.contextPath }/success_quest.scse",
															{
																"chaNum" : 25
															});
										}
									});
				}
			}
		}
	}
</script>
<!-- 코드 스크립트 -->
<c:choose>
	<c:when test="${ requestScope.mission.chapNum != 4 }">
		${ requestScope.mission.jsCode }
		${ requestScope.mission.targetCode }
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			var answer = "";
			function squaredPaperResult() {
				setTimeout(function() {
					if (answer == "${ requestScope.mission.jsCode }") {
						alert("정답입니다!");
						$("#nextBtn").show();
						successUpdate();
					} else {
						alert("틀렸습니다 ㅠㅠ");
						$("#retryBtn").show();
						failUpdate();
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
<div id="drawCanvas">

</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/base64.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/canvas2image.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/html2canvas.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/Html2Canvas/jquery.plugin.html2canvas.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#찍기").on("click", function(){
				capture();
			});
			
			function capture() {
				html2canvas(document.body, {
					onrendered : function(canvas) {
						$.post("../user_screen_upload_ajax.scse", {"image":canvas.toDataURL()},function(jsonObj){
							if(jsonObj.status){
								alert("성공");
							} else {
								alert("실패");
							}
							
						} ,"json").error(function(){alert("에러")});
					}
				});
			}
		});
	</script>

	<input type="button" value="스샷" id="찍기">

	<%-- <aside class="left-sidebar">
		<jsp:include page="../pages/HF/SidebarForFree.jsp"></jsp:include>
	</aside> --%>
	<header class="heading">
		<c:if test="${ requestScope.mission.chapNum == 4 }">
			<input type="button" value="색칠하기" id="paintBtn">
			<input type="button" value="색칠안하기" id="notPaintBtn">
			<input type="button" value="2번 반복하기" id="loopBtn2">
			<input type="button" value="3번 반복하기" id="loopBtn3">
			<input type="button" value="4번 반복하기" id="loopBtn4">
			<input type="button" value="5번 반복하기" id="loopBtn5">
		</c:if>
		<h2 class="ui header">명령어들</h2>
		<ul id="selector" class="sortable">
			<c:choose>
				<c:when test="${ requestScope.retryFlag }">
					${ param.retrySelector }
				</c:when>
				<c:otherwise>
					${ requestScope.mission.selectorCode }
				</c:otherwise>
			</c:choose>
		</ul>
		<br />
	</header>
	<div class="container" id="container">
		<h2>보드</h2>
		<div id="boards">
			<c:choose>
				<c:when test="${ requestScope.retryFlag }">
			${ param.retryBoard }
		</c:when>
				<c:otherwise>
					<ul id="board" class="sortable">${ requestScope.mission.boardCode }
					</ul>
					<c:if test="${ requestScope.mission.chapNum == 4 }">
						<br />
						<ul id="board1" class="sortable">
						</ul>
						<br />
						<ul id="board2" class="sortable">
						</ul>
						<br />
						<ul id="board3" class="sortable">
						</ul>
						<br />
						<ul id="board4" class="sortable">
						</ul>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
		<form action="retry_mission.scse?missionIndex=${ requestScope.mission.missionIndex }" method="post" id="retryForm">
			<input type="hidden" name="retryBoard" id="retryBoard">
			<input type="hidden" name="retrySelector" id="retrySelector">
		</form>
		<input type="button" id="run" value="실행">
		<input type="button" id="reset" value="원래대로">
		<br /> <br />
	</div>
	<div id="missionResult">
		<div class="header"></div>
		<div class="content">
			<c:choose>
				<c:when test="${ requestScope.mission.chapNum != 2 }">
					<div id="tileBox">
						<c:choose>
							<c:when test="${ requestScope.mission.chapNum == 1 || requestScope.mission.chapNum == 3}">
								${ requestScope.mission.mapCode }
							</c:when>
							<c:otherwise>
								<div class="tile" id="targetSquare"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
								<div class="tile"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:when>
				<c:otherwise>
					<table>
						<tr>
							<td height="30" colspan="3" id="rpsHeader" width="1000"><span id="scissor">가위!</span> <span id="rock">바위!</span> <span id="paper">보!</span></td>
						</tr>
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
			<div id="retryBtn" class="ui negative black button resultBtns">다시</div>
			<div id="nextBtn" class="ui positive right labeled icon button resultBtns">
				다음<i class="checkmark icon"></i>
			</div>
		</div>
	</div>
</body>
</html>