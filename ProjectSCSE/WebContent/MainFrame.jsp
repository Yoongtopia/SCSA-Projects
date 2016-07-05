<%@page import="com.scse.entity.Mission"%>
<%@page import="com.scse.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>슬기로운 코딩, 미션모드에 오신것을 환영합니다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
*	{
font-family: "Nanum Gothic", Calibri;
}
td	{
	text-align: center;
}
.element {
	width: 60px;
	text-align: center;
}
.maptitle {
	width: 180px;
}

.mapTable {
	width: 70%;
	left: 0;
}
.aTag{
	text-decoration: none;
}
</style>
<meta charset="utf-8" />
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<script type="text/javascript" src="assets/sui/javascript/jquery.address.js"></script>
<link href="assets/css/page/mainFrame.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/${ requestScope.mission.cssName }" />
<c:if test="${ requestScope.mission.chapNum == 4 }">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/squared_paper.js"></script>
</c:if>
<script type="text/javascript">
	var afterTimeOut = "";
	var startTime = new Date().getTime();
	var studyTime = 0;
	function show(){
		$('#board').show();
		$('#board1').show();
		$('#board2').show();
		$('#board3').show();
		$('#board4').show();
	}
	
	$(document).ready(function() {
		$("#retryBtn").hide();
		$("#nextBtn").hide();
		$("#cloud").hide();
		$("#cloud2").hide();
		$("#cloud").css("position", "absolute");
		$("#cloud2").css("position", "absolute");
		$(document).on("click", ".questModal", function() {
			location.href="${ pageContext.request.contextPath }/find_missionIndex.scse?missionIndex=${ requestScope.mission.missionIndex+1 }";
		});
		
		setInterval(countingButton, 100);
	
		function countingButton(){
			if($('li').size() > 20){
				$('li:nth-child(15)').remove();
				$('li:nth-child(16)').remove();
			}
		}
		
		
		show();
		$(".modal").modal("setting", "closable", false);
		$(document).on("click", "#reset", function() {
			location.href="${ pageContext.request.contextPath }/find_missionIndex.scse?missionIndex=${ requestScope.mission.missionIndex }";
		});
		$("#missionResult").hide();
		$(document).on("click", "#nextBtn", function() {
			if("${ requestScope.mission.missionIndex == 49 }" != "true") {
				location.href="${ pageContext.request.contextPath }/find_missionIndex.scse?missionIndex=${ requestScope.mission.missionIndex+1 }";
			}else {
				location.href="${ pageContext.request.contextPath }/DodgeDemo.jsp";
			}
			
		});
		$(document).on("click", "#retryBtn", function() {
			show();
			$("#retryForm").submit();	
		});
		
		$(document).on("click", "#oneMoreBtn", function() {
			$("#pallete").show();
		});
		
		
		//미션4을 제외한 클릭
		/********************************************************/
		
		<% Mission mission = (Mission) request.getAttribute("mission"); 
		if(mission.getChapNum() != 4) {%>
		
		$('.locomotive').click(function() {
			
			if("${ requestScope.mission.chapNum == 2 }" == "true") {
				if($("#board").children().size()!= parseInt("${ requestScope.mission.rpsNum }")) {
					$("#UseAllModal").modal("show");
					return;
				}
				code = "initRps();";
				$sortable = $(".items", "#board");
				if(!checkError($sortable)) {
					return;
				}
			}
			if("${ requestScope.mission.chapNum != 4 }" == "true") {
				if($("#board").children().size() == 1) {
					$("#OneMoreModal").modal('show');
					return;
				}
			}
			
			studyTime = Math.round((new Date().getTime() - startTime)/1000);
			if("${ requestScope.user.uType }" == "s") {
				$.getJSON("${ pageContext.request.contextPath }/run_mission.scse", { "chapNum": "${ requestScope.mission.chapNum }", "quizNum": "${ requestScope.mission.quizNum }", "time": studyTime });
			}
			$("#retryBoard").val($("#boards").html());
			$("#retrySelector").val($("#selector").html());
			if("${ requestScope.user.uType }" == "s") {
				clearInterval(cap);	
			}
			$("#cloud").show('explode');
			$("#cloud").animate({top:'-500px', left:'2000px'}, 5000);
			setTimeout(function() {
				$("#cloud").stop();
			}, 2750);
			setTimeout(function(){
				$("#cloud2").show('explode')
				$("#cloud2").animate({top:'-500px', left:'2000px'}, 3500);			
			}, 1000);
			setTimeout(function() {
				$("#cloud2").stop();
			}, 3000);
			$("#board").hide('slide', {direction:'left', easing:'easeInBack'}, 3000, function(){
				console.log("callback");
				if("${ requestScope.mission.chapNum == 1 }" == "true") {
					afterTimeOut = setTimeout(function() {
						checkSuccess();
					}, 2000);
				}else if("${ requestScope.mission.chapNum == 3 }" == "true") {
					afterTimeOut = setTimeout(function() {
						checkGunshotResult();
					}, 2000);
				}
				$('.heading').hide('slide', {
					direction : 'up'
				}, 700);
				$('.container').hide('slide', {
					direction : 'right'
				}, 700, missionResult());
				
			});
		});
		
		//미션 4용 클릭
		<% } else {%>
		
		function board(){			
			$("#board").hide('slide', {direction:'left', easing:'easeInBack'}, 3000);
		}
		function board1(){
			$("#board1").hide('slide', {direction:'left', easing:'easeInBack'}, 3000);			
		}
		function board2(){
			$("#board2").hide('slide', {direction:'left', easing:'easeInBack'}, 3000);			
		}
		function board3(){
			$("#board3").hide('slide', {direction:'left', easing:'easeInBack'}, 3000);			
		}
		function board4(){			
			$("#board4").hide('slide', {direction:'left', easing:'easeInBack'}, 3000, function(){
				$('.heading').hide('slide', {
					direction : 'up'
				}, 700);
				$('.container').hide('slide', {
					direction : 'right'
				}, 700, missionResult());
				
			});
		}
		
		/* $('#gogogo').click(function(){
			$("#pallete").hide();			
		}); */
		
		
		$('.locomotive').click(function() {
			$("#pallete").hide();
			if($("#board").children().size()+$("#board1").children().size()+$("#board2").children().size()+$("#board3").children().size()+$("#board4").children().size() == 6) {
				$("#OneMoreModal").modal('show');
				return;
			}
			studyTime = Math.round((new Date().getTime() - startTime)/1000);
			if("${ requestScope.user.uType }" == "s") {
				$.getJSON("${ pageContext.request.contextPath }/run_mission.scse", { "chapNum": "${ requestScope.mission.chapNum }", "quizNum": "${ requestScope.mission.quizNum }", "time": studyTime });
			}
			$("#retryBoard").val($("#boards").html());
			$("#retrySelector").val($("#selector").html());
			if("${ requestScope.user.uType }" == "s") {
				clearInterval(cap);	
			}
			$("#cloud").show('explode');
			$("#cloud").animate({top:'-500px', left:'2000px'}, 5000);
			setTimeout(function() {
				$("#cloud").stop();
			}, 2750);
			setTimeout(function(){
				$("#cloud2").show('explode')
				$("#cloud2").animate({top:'-500px', left:'2000px'}, 3500);			
			}, 1000);
			setTimeout(function() {
				$("#cloud2").stop();
			}, 3050);
			setTimeout(board, 0);
			setTimeout(board1, 300);
			setTimeout(board2, 500);
			setTimeout(board3, 700);
			setTimeout(board4, 900);
		});
		
		<% } %>
		
		function missionResult() {
			setTimeout(function() {
				$("#missionResult").show();
				$("#pallete").hide();
			}, 1000);
			setTimeout(mission, 1000);
		}
	});
	$("#target").attr("id", "jobDone");
	function failUpdate() {
		if("${ requestScope.user.uType }" == "s") {
			$.getJSON("${ pageContext.request.contextPath }/fail_mission.scse", { "chapNum": "${ requestScope.mission.chapNum }", "quizNum": "${ requestScope.mission.quizNum }", "missionIndex":"${ requestScope.mission.missionIndex }" }, function(jsonObj) {
				if("${ requestScope.chaMap.butterfly }"!="butterfly") {
					if(jsonObj.failNum==3) {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":40 });
						 $("#butterflyModal").modal("show");
					}
				}
				if(jsonObj.totalNum==300) {
					if("${ requestScope.chaMap.ironman }"!="ironman") {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":39 });
						 $("#ironman").modal("show");
					}
				}else if(jsonObj.totalNum==200) {
					if("${ requestScope.chaMap.superman }"!="superman") {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":38 });
						 $("#SuperManModal").modal("show");
					}
				}else if(jsonObj.totalNum==100) {
					if("${ requestScope.chaMap.barbie }"!="barbie") {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":37 });
						$("#BarbieModal").modal("show");
					}
				}
			});
		}
	}
	function successUpdate() {
		if("${ requestScope.user.uType }" == "s") {
			$.getJSON("${ pageContext.request.contextPath }/next_mission.scse", { "missionIndex":"${ requestScope.mission.missionIndex }" }, function(jsonObj) {
				if("${ requestScope.chaMap.doraemong }"!="doraemong") {
					if(jsonObj.todayNum==5) {
						$("#DoraemonModal").modal("show");
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":27 });
					}
				}
				if(jsonObj.totalNum==300) {
					if("${ requestScope.chaMap.ironman }"!="ironman") {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":39 });
						$("#ironman").modal("show");
					}
				}else if(jsonObj.totalNum==200) {
					if("${ requestScope.chaMap.superman }"!="superman") {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":38 });
						 $("#SuperManModal").modal("show");
					}
				}else if(jsonObj.totalNum==100) {
					if("${ requestScope.chaMap.barbie }"!="barbie") {
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":37 });
						$("#BarbieModal").modal("show");
					}
				}
			});
			if(parseInt("${ requestScope.mission.quizNum }")>=5) {
				if("${ requestScope.chaMap.sonic }"!="sonic") {
					if(studyTime<=60) {
						$("#SonicModal").modal("show");
						$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":26 });
					}
				}
				if("${ requestScope.chaMap.conan }"!="conan") {
					$.getJSON("${ pageContext.request.contextPath }/conan_quest.scse", { "missionIndex":"${ requestScope.mission.missionIndex }" }, function(jsonObj) {
						if(jsonObj.conanCount == 1) {
							$("#ConanModal").modal("show");
							$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":25 });
						}
					});
				}
			}
			if("${ requestScope.mission.chapNum == 1 }" == "true" && "${ requestScope.mission.quizNum == 12 }" == "true") {
				if("${ requestScope.chaMap.pooh }"!="pooh") {
					$.getJSON("${ pageContext.request.contextPath }/success_chapter_quest.scse", { "chaNum1":5, "chaNum2":6, "chaNum3":7, "chaNum4":8 });
					$("#poohmodal").modal('show');
				}
			}else if("${ requestScope.mission.chapNum == 2 }" == "true" && "${ requestScope.mission.quizNum == 7 }" == "true") {
				if("${ requestScope.chaMap.cookieRun_brave }"!="cookieRun_brave") {
					$.getJSON("${ pageContext.request.contextPath }/success_chapter_quest.scse", { "chaNum1":9, "chaNum2":10, "chaNum3":11, "chaNum4":12 });
					$("#cookieRun").modal("show");
				}
			}else if("${ requestScope.mission.chapNum == 3 }" == "true" && "${ requestScope.mission.quizNum == 10 }" == "true") {
				if("${ requestScope.chaMap.pororo_pororo }"!="pororo_pororo") {
					$.getJSON("${ pageContext.request.contextPath }/success_chapter_quest.scse", { "chaNum1":13, "chaNum2":14, "chaNum3":15, "chaNum4":16 });
					$("#bororomodal").modal("show");
				}
			}else if("${ requestScope.mission.chapNum == 4 }" == "true" && "${ requestScope.mission.quizNum == 10 }" == "true") {
				if("${ requestScope.chaMap.snowwhite }"!="snowwhite") {
					$.getJSON("${ pageContext.request.contextPath }/success_chapter_quest.scse", { "chaNum1":17, "chaNum2":18, "chaNum3":19, "chaNum4":20 });
					 $("#princessModal").modal("show");
				}
			}else if("${ requestScope.mission.chapNum == 5 }" == "true" && "${ requestScope.mission.quizNum == 10 }" == "true"){
				if("${ requestScope.chaMap.onepiece_luffy }"!="onepiece_luffy") {
					$.getJSON("${ pageContext.request.contextPath }/success_chapter_quest.scse", { "chaNum1":21, "chaNum2":22, "chaNum3":23, "chaNum4":24 });
					$("#OnePeiceModal").modal("show");
				}
			}
		}
	}
	
	//엔터치면 클릭 되는 함수
    $(document).keypress(function(event){  // i called a clicked event in document here you can chnage it to any other event like.. input field keyup event or so....
       var keycode = (event.keyCode ? event.keyCode : event.which);
       if(keycode == '13'){
        	
        	$('#questionOk').trigger('click');   
       }

    });


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
					if(answer=="${ requestScope.mission.jsCode }") {
						$("#nextBtn").show();
						$("#CorrectModal").modal("show");
						successUpdate();
					}else {
						$("#retryBtn").show();
						$("#WrongModal").modal("show");
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
				width: 725px;
				height: 250px;
				margin-top: 10px;
			}
			
			#board {
				width: 800px;
				height: 110px;
			}
		</style>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/${ requestScope.mission.jsName }"></script>
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		if("${sessionScope.mission.quizNum}"==1){
			$("#chapterStartModal").css('margin-top', '0');
			var plz = document.getElementById("chapterStartModal");
			$("#chapterStartModal").css('top', '0px');
			$("#chapterStartModal").modal('setting', { detachable:true, allowMultiple:true  }).modal('show');
		}
		
		var plz = document.getElementById("QuestionModal");
		$("#QuestionModal").css('margin-top', '0');
		$("#QuestionModal").css('top', '0px');
		$("#QuestionModal").modal('setting', { detachable:true, allowMultiple:true  }).modal('show');
		$(".close").on("click", function(){
			console.log("?");
			event.preventDefault();
		});
		
		$('.modal').modal('setting', 'closable', false);
	});
</script>
</head>
<body>

	<nav>
		<jsp:include page="pages/HF/header.jsp"></jsp:include>
	</nav>
	<aside class="left-sidebar" style="z-index: 120">
		<jsp:include page="${requestScope.Sidebar}"></jsp:include>
	</aside>
	<header class="heading" style="padding-top: 0.5%; z-index: 20;" >

		<%-- <c:if test="${ requestScope.mission.chapNum == 4 }">
		<div class="six fluid ui buttons">
			<div class="circular ui blue button chapter4Button" id="paintBtn"><i class="teal pencil icon"></i>파랑색</div>
			<div class="circular ui blue button chapter4Button" id="notPaintBtn"><i class="yellow pencil icon"></i>노랑색</div>	
			<div class="circular ui blue button chapter4Button" id="loopBtn2"><i class="red repeat icon"></i>2번 반복</div>	
			<div class="circular ui blue button chapter4Button" id="loopBtn3"><i class="red repeat icon"></i>3번 반복</div>	
			<div class="circular ui blue button chapter4Button" id="loopBtn4"><i class="red  repeat icon"></i>4번 반복</div>	
			<div class="circular ui blue button chapter4Button" id="loopBtn5"><i class="red repeat icon"></i>5번 반복</div>
		</div>
		</c:if> --%>


		<ul id="selector" class="sortable" style="float: left;">
			<c:choose>
				<c:when test="${ requestScope.retryFlag }">
					${ param.retrySelector }
				</c:when>
				<c:otherwise>
					${ requestScope.mission.selectorCode }
				</c:otherwise>
			</c:choose>
		</ul>
		<ul style="float: left;">
				<img src="${ pageContext.request.contextPath }/assets/image/sun7.png" >
		</ul>
		<ul>
		<a href=javascript:void(0)>
			<img src="${pageContext.request.contextPath }/assets/image/reset3.png" id="reset" style="margin-left: 60px; margin-top: 70px;">		
		</a>
		</ul>
		<br />
		</header>
		
	<img id="cloud" style="z-index: 900; left: 350px; top: 300px;" src="${pageContext.request.contextPath }/assets/image/cloud1.png">
	<img id="cloud2" style="width:120px; height: 60px; z-index: 900; left: 400px; top: 260px;" src="${pageContext.request.contextPath }/assets/image/cloud1.png">
	<div class="container" style="float:left; z-index: 50;">
		<div id="boards" style="z-index: 50; float: left;">
		<c:choose>
		<c:when test="${ requestScope.retryFlag }">
			${ param.retryBoard }
		</c:when>
		<c:when test="${ requestScope.mission.chapNum == 1 }">
			<ul id="board" class="sortable" style="z-index: 55;">
				<a href="javascript:void(0);"><li class="items locomotive ui-state-disabled" id=""></li></a>
				${ requestScope.mission.boardCode }				
			</ul>
			
		</c:when>
		<c:when test="${ requestScope.mission.chapNum == 3 }">
			<ul id="board" class="sortable">
				<a href="javascript:void(0);"><li class="items locomotive ui-state-disabled" id=""></li></a>
				${ requestScope.mission.boardCode }
			</ul>
		</c:when>
		<c:when test="${ requestScope.mission.chapNum == 4 }">
			<ul id="board" class="sortable" style="width: 750px;">
				<a href="javascript:void(0);"><li class="items locomotive ui-state-disabled" id=""></li></a>
				<li class="items line1 ui-state-disabled" id=""><div class="trainLink"></div></li>
			</ul>
			<c:if test="${ requestScope.mission.chapNum == 4 }">
				<br/>
			<ul id="board1" class="sortable" style="width: 750px;" >
				<li class="items line2 ui-state-disabled" id=""></li>
			</ul>
				<br/>
			<ul id="board2" class="sortable"  style="width: 750px;">
				<li class="items line3 ui-state-disabled" id=""></li>
			</ul>
				<br/>
			<ul id="board3" class="sortable"  style="width: 750px;">
				<li class="items line4 ui-state-disabled" id=""></li>
			</ul>
				<br/>
			<ul id="board4" class="sortable"  style="width: 750px;">
				<li class="items line5 ui-state-disabled" id=""></li>
			</ul>
			</c:if>
		</c:when>
		<c:otherwise>
			<ul id="board" class="sortable">
				<a href="javascript:void(0);"><li class="items locomotive ui-state-disabled" id=""></li></a>
				${ requestScope.mission.boardCode }
			</ul>
		</c:otherwise>
		</c:choose>
		</div>
		<form action="retry_mission.scse?missionIndex=${ requestScope.mission.missionIndex }" method="post" id="retryForm" onsubmit="show();">
			<input type="hidden" name="retryBoard" id="retryBoard">
			<input type="hidden" name="retrySelector" id="retrySelector">
		</form>
<!-- 		<input type="button" id="run" value="실행">
		<input type="button" id="reset" value="원래대로">
		<br /> <br />
 -->	
 	</div>
 	<c:if test="${ requestScope.mission.chapNum == 4 }">
 	<div style="width:160px; height:360px; float:left; margin-top:110px; margin-left:5px;  background-image: url('${pageContext.request.contextPath}/assets/image/Chapter04/paint_back.png'); background-size: 100% 100%" id="pallete">
		<div class="six vertical circular ui buttons" style="backgroundfloat:left; margin-left:8px; margin-top:40px;">
			<div class="circular ui button chapter4Button" style="width:145px; margin-top: 25px;" id="paintBtn"><i class="  purple pencil icon"></i>파랑색</div>
			<div class="circular ui button chapter4Button" style="width:145px; margin-top: 5px;" id="notPaintBtn"><i class="  yellow pencil icon"></i>노랑색</div>	
			<div class="circular ui button chapter4Button" style="width:145px; margin-top: 5px;" id="loopBtn2"><i class="  blue repeat icon"></i>2번 반복</div>	
			<div class="circular ui button chapter4Button" style="width:145px; margin-top: 5px;" id="loopBtn3"><i class="  blue repeat icon"></i>3번 반복</div>	
			<div class="circular ui button chapter4Button" style="width:145px; margin-top: 5px;" id="loopBtn4"><i class="  blue  repeat icon"></i>4번 반복</div>	
			<div class="circular ui button chapter4Button" style="width:145px; margin-top: 5px;" id="loopBtn5"><i class="  blue repeat icon"></i>5번 반복</div>
		</div>
	</div>
		</c:if>
 
 	
 	
 	
 	
 	
	<div style="height: 2%;"></div>
	<div id="missionResult" style="margin-top:5%; margin-left:25%; width: 70%;">
		<div class="header"></div>
		<div class="content">
			<c:choose>
				<c:when test="${ requestScope.mission.chapNum != 2 }">
					<div id="tileBox">
						<c:choose>
							<c:when test="${requestScope.mission.chapNum == 3}">
								${ requestScope.mission.mapCode }
								<c:choose>
								<c:when test="${not empty sessionScope.characterInfo.chaImg }">
								<div id="target" class="target" style="background-image: url('${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }'); background-size: 100% 100%">
								<div id="bullet"></div></div>
								</c:when>
								<c:otherwise>
								<div id="target" class="target" style="background-image: url('${pageContext.request.contextPath}/assets/image/Character/main_apeach.png'); background-size: 100% 100%">
								<div id="bullet"></div></div>
								</c:otherwise>
								</c:choose>
								<!-- </div> -->
							</c:when>
							<c:when test="${requestScope.mission.chapNum == 1 }">
								${ requestScope.mission.mapCode }
								<c:choose>
								<c:when test="${not empty sessionScope.characterInfo.chaImg }">
								<img src="${pageContext.request.contextPath}/assets/image/Character/${sessionScope.characterInfo.chaImg }" id="target" class="target">
								</c:when>
								<c:otherwise>
								<img src="${pageContext.request.contextPath}/assets/image/Character/main_apeach.png" id="target" class="target">
								</c:otherwise>
								</c:choose>
								<div id="goal"></div>
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
					<table id="rcpRing">
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
							<td height="250" width="400" id="knowMyself">
								<div id="playerRockImg" class="rpsImg good"></div>
								<div id="playerPaperImg" class="rpsImg good"></div>
								<div id="playerScissorImg" class="rpsImg good"></div>
							</td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="actions resultBtnSet">
			<div id="retryBtn" class="ui negative black button resultBtns">한번 더</div>
			<div id="nextBtn" class="ui positive right labeled icon button resultBtns">
				다음으로<i class="checkmark icon"></i>
			</div>
		</div>
	</div>
	
	
	<!-- 캐릭터 획득 메시지 모달 시리즈 -->
	<!-- 푸우모달 -->
	<div class="ui modal" id="poohmodal">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">푸우 친구들 안녕?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4">챕터1, 아코를 찾아라를 완료하여 푸우친구들을 만날 수 있게 되었습니다!</th>
				<tr>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/pooh.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/piglet.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/eeyore.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/tigger.png"></td>
				<tr>
					<td>푸우</td>
					<td>피글렛</td>
					<td>이요르</td>
					<td>티거</td>
					<tr>
					<td colspan="4">
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>
	
	<!-- 쿠키런 모달 -->
	<div class="ui modal" id="cookieRun">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">쿠키친구들, 함께 달려보지 않을래?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4">챕터2, 아코를 이겨라를 완료하여 쿠키런 시리즈를 얻게 되었습니다!</th>
				<tr>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/cookieRun_brave.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/cookieRun_figure.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/cookieRun_hook.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/cookieRun_zombie.png"></td>
				<tr>
					<td>우리의 히어로 용감한쿠키군</td>
					<td>피겨 맛은 도대체 뭘까 피겨맛쿠키</td>
					<td>좀비는 위험해 좀비맛쿠키</td>
					<td>해적 맛은 바다맛일까 해적맛쿠키</td>
				<tr>
					<td colspan="4">
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>
	
	<!-- 뽀로로모달 -->
	<div class="ui modal" id="bororomodal">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">뽀롱뽀롱 뽀로로~ 뽀뽀뽀로로~♡</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4">챕터3, 서부의 무법자 아코를 완료하여 뽀로로시리즈를 획득하였습니다.</th>
				<tr>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/pororo_pororo.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/pororo_petty.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/pororo_loopy.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/pororo_crong.png"></td>
				<tr>
					<td>우리의 친구 뽀로로</td>
					<td>뽀로로의 여자친구 패티</td>
					<td>뽀로로의 두번째 여자친구 루피</td>
					<td>크롱 크롱 크크크크로로로롱~</td>
					<tr>
					<td colspan="4">
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>
	
	<!-- 공주모달 -->
	<div class="ui modal" id="princessModal">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">나는 예쁜 공주랍니다~</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4">챕터4, 친구들아 도와줘를 완료하여 공주시리즈를 획득했습니다.</th>
				<tr>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/snowwhite.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/cinderella.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/rapunzel.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/mermaid.png"></td>
				<tr>
					<td colspan="4">
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 원피스 시리즈 모달 -->
	<div class="ui modal" id="OnePeiceModal">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">루피의 꿈은 해적왕, 우리의 꿈은 코딩왕?!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4">챕터5, 아코의 습격을 완료하여 원피스 시리즈를 얻게되었습니다!</th>
				<tr>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/onepiece_luffy.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/onpiece_sangji.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/onepiece_zoro.png"></td>
					<td><img width="150px" height="150px" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/onepiece_usopp.png"></td>
				<tr>
					<td>고무고무 팔 원피스의 루피</td>
					<td>발차기의 달인 상디</td>
					<td>삼도류의 조로</td>
					<td>거짓말을 잘하는 우솝</td>
				<tr>
					<td colspan="4">
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>
	
	<!-- 도라에몽 모달 -->
	<div class="ui small modal" id="DoraemonModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">도라에몽처럼 똑똑하군요!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">5개 이상의 퀘스트를 완료하여 도라에몽을 얻게 되었습니다!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/doraemong.png"></td>		
				<tr>
					<td>아시아에서 가장 껴안아주고 싶은 영웅 1위, 도라에몽</td>
			<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 아이언맨 모달 -->
	<div class="ui small modal" id="ironman" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">힘세고 강한 아이언맨</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">미션모드에서 300번 시도를 하여 아이언맨을 획득했습니다. <br/> 어마어마하시네!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/ironman.png"></td>		
				<tr>
					<td>힘세고 강하다, 아이언맨!</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 나비 모달 -->
	<div class="ui small modal" id="butterflyModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">호접지몽, 융토피아의 나-비</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">저 한마리 나비 처럼 근성을!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/butterfly.png"></td>		
				<tr>
					<td>삼성 SDS SCSA 2기 융토피아 코코코코팀 조석현 교육생</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 슈퍼맨 모달 -->
	<div class="ui small modal" id="SuperManModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">191cm에 107kg, 슈퍼맨~</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">슬기로운 코딩 학습 200회 돌파!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/superman.png"></td>		
				<tr>
					<td>우리들의 영웅 슈퍼맨</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 바비 모달 -->
	<div class="ui small modal" id="BarbieModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">이런게 진짜 이쁜 나비겠죠?</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">슬기로운 코딩 학습 100회 돌파!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/barbie.png"></td>		
				<tr>
					<td>아름다운 바비 나비 인형</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 코난 모달 -->
	<div class="ui small modal" id="ConanModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">내 이름은 코난, 코딩왕이죠</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">한 방에 문제 해결!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/conan.png"></td>		
				<tr>
					<td>다시 고등학생 명탐정은 언제 될까요? 코난!</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

	<!-- 소닉 모달 -->
	<div class="ui small modal" id="SonicModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">와우, 엄청 빠르게 풀었네요!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">빠른 시간내에 문제해결!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/sonic.png"></td>		
				<tr>
					<td>세상에서 제일 빠른 고슴도치, 소닉</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>

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
			<div class="actions" style="text-align: center">
				<div class="ui positive icon button resultBtns">확인</div>
			</div>
		</div>
	</div>

	<!-- 실패 모달 -->
	<div class="ui small modal" id="WrongModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">실패하였습니다!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/Wrong.png"></td>		
				<tr>
					<td>아쉬워요 ~ 좀만 바꾸면 맞출 수 있는데!</td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">확인</div>
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
				<div class="ui negative button" align="center" style="margin-left: 0px;">확인</div>
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
				<div id="oneMoreBtn" class="ui negative button" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>

	<!-- 다시 조립해주세요. -->
	<div class="ui small modal" id="MakeAgainModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #ED303C; font-family: 'Nanum Gothic';">다시 조립해주세요</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Message/OneMore.png"></td>		
				<tr>
					<td>블럭조립이 잘못되었어요. 다시 조립해주세요.</td>
			</table>
			<div class="actions" style="text-align: center">
				<div id="retryBtn" class="ui negative black button resultBtns" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
		
	<!-- 문제 띄우기용 모달 -->
	<div class="ui large modal" id="QuestionModal" style="margin-top: 0em;">
		<div class="ui inverted block header" style="background: #556270; font-family: 'Nanum Gothic';">${sessionScope.mission.quizDesc }</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4"></th>
				<tr>
					<td><img style="max-height: 100%; max-width: 100%; top: 0%; margin-top: 0%;" src="${pageContext.request.contextPath }/assets/image/Chapter0${sessionScope.mission.chapNum }/b${sessionScope.mission.chapNum }-${sessionScope.mission.quizNum }.png"></td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" id = "questionOk" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
	
	
		<!-- 챕터 시작 모달 -->

	<div class="ui large modal" id="chapterStartModal" style="margin-top: 0em;">
		<div class="ui inverted block header" style="background: #556270; font-family: 'Nanum Gothic';">이제 Chapter${sessionScope.mission.chapNum }을 시작합니다.</div>
		<div class="content" style="padding: 0;">
			<table class="ui table segment">
				<tr>
					<th colspan="4"></th>
				<tr>
					<td><img style="max-height: 100%; max-width: 100%; top: 0%; margin-top: 0%;" src="${pageContext.request.contextPath }/assets/image/Chapter0${sessionScope.mission.chapNum }/chapter${sessionScope.mission.chapNum }StartModal.png"></td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" id = "chapterStartOk" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>
	

</body>
</html>