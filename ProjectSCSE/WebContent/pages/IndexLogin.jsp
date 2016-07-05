<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en" data-useragent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)">
<head>
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="assets/js/jquery.fullPage.js"></script>
<script type="text/javascript" src="assets/js/fullPageExamples.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<link rel="stylesheet" type="text/css" href="assets/css/page/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css" href="assets/css/page/fullPageExamples.css" />
<script type="text/javascript" src="assets/sui/javascript/jquery.address.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript">

	$(document).ready(
			function() {
				var version = getInternetExplorerVersion();
				if (version != -1 && version <= 9) {
					$(".ie").modal('setting', {

						onDeny : function() {
							return false;
						}
					}).modal('show');
				}

				$(".container").hide();
				
				/* 풀페이지 실행 스크립트 */
				$('#fullpage').fullpage({
				 slidesColor : [ 'transparent', 'transparent','transparent','transparent','transparent' ],
				 anchors : [ 'firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
				 menu: '#menu',
			     loopBottom: true


				 });

				$("body").on(
						"mouseenter",
						function() {
							$.post("find_max_mission_index.scse", function(
									jsonObj) {

								if (jsonObj.status) {
									if(jsonObj.mission.missionIndex<57){
										$("#missionIndex").text(
												jsonObj.mission.chapNum + "-"
														+ jsonObj.mission.quizNum
														+ "번 문제를 풀 차례에요.");
									}else{
										$("#missionIndex").text("자유모드를 시작합니다.");
									}
									
								} else {
									$("#missionIndex").text("처음이신가요? 지금시작해봐요!");
								}
							}, "json");

						});

				/* 	$("#enter").on("mouseleave", function(){
									$("#missionIndex").text("");
									
					}); */
				$("#goButton").on("click", function() {
					location.href = "enter_main.scse";
				});
					
					
			// 선생님 소개 화면 모달
				$("#introForTeacher").on("click", function() {
					$("#introTextForTeacher").modal("show");
				});	
			// 학생 소개 풀페이지
				$("#introForStudent").on("click", function() {
					location.href="#secondPage"
				});	

			});

	function getInternetExplorerVersion() {
		var rv = -1;
		if (navigator.appName == 'Microsoft Internet Explorer') {
			var ua = navigator.userAgent;
			var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
			if (re.exec(ua) != null)
				rv = parseFloat(RegExp.$1);
		}
		if (rv < 8) {
			var trident = navigator.userAgent.match(/Trident\/(\d.\d)/i);
			if (trident != null) {
				rv = trident[1] * 1 + 4;
			}
		}
		return rv;
	}
</script>
</head>
<body>
	<!-- 풀페이지 버튼 헤더로 올려서 지움 -->
	<!-- 	<ul id="menu">
		<li data-menuanchor="firstPage"><a href="#firstPage">메인화면</a></li>
		<li data-menuanchor="secondPage"><a href="#secondPage">슬기로운 코딩이란?</a></li>
		<li data-menuanchor="3rdPage"><a href="#3rdPage">게임 스토리</a></li>
	</ul>  -->
	

		

	<div id="fullpage">
		
		<div class="section " id="section0" style="background-image: url('img/mainback.png'); background-attachment: fixed;  background-repeat: repeat-none;">
			<div id="fullpage1" style="padding-top: 30px;">
			
					<div id="mainlogo" align="center">
				<!-- <img src="http://placehold.it/750x375&text=mainlogo!" data-step="3" data-intro='우리 로고입니다. 이쁘죠?' data-position="bottom" id="mainlogoImg"> -->
					<img src="${ pageContext.request.contextPath }/assets/image/SGcoding_logo1.png" data-step="3" data-intro='우리 로고입니다. 이쁘죠?' style="width:60%;height:30%;"   data-position="bottom" id="mainlogoImg">
				</div>
				<div class="cont" align="center">
					<div style="margin-top: 6%"></div>
					<c:choose>
						<c:when test="${not empty sessionScope.user }">
							<div class="ui animated button" id="goButton">
								<div class="visible content" id="enter">
									<i class="red off icon"></i><span>&nbsp;&nbsp;&nbsp;지금 시작해요, 슬기로운 코딩!&nbsp;&nbsp;&nbsp;</span>
								</div>
								<div class="hidden content">
									<i class="red right arrow icon"></i><span id="missionIndex"></span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="ui animated button" id="goButtonWhenNotLogin">
								<div class="visible content" id="enter">
									<i class="red off icon"></i><span>&nbsp;&nbsp;&nbsp;지금 시작해요, 슬기로운 코딩!&nbsp;&nbsp;&nbsp;</span>
								</div>
								<div class="hidden content">
									<i class="play red icon"></i> 로그인이 필요합니다.
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<br />
					<div style="margin-top: 2%"></div>
					
					<div class="ui animated button" id="introForStudent">
						
						<div class="visible content">
							<i class="red question icon"></i>&nbsp;&nbsp;&nbsp;슬기로운 코딩은 무엇인가요?&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="hidden content" align="center">
							<i class="red info icon"></i>슬기로운 코딩에 대해서 알아볼까요?
						</div>
						
					</div>

					<div style="margin-top: 2%"></div>
					
					<div class="ui animated button" id= "introForTeacher">
						<div class="visible content">
							<i class="red male icon"></i>선생님, 저희에 대해 궁금하신가요?
						</div>
						<div class="hidden content" align="center">
							<i class="red music icon"></i>학생들과 놀면서 즐기는 컴퓨터 수업!
						</div>
					</div>
					
					
					<div style="margin-bottom: 6%"></div>


					<!--
				<input type="button" id="enter" class="btn btn-primary btn-lg" data-step="5" data-intro='자, 그럼이제 시작합니다!' data-position="bottom" value="지금 시작해요, 슬기로운 코딩!"> 
				<br /> <br />
					<input type="button" id="intro" class="btn btn-warning btn-lg" data-step="4" data-intro='우리가 누구인지 궁금한가요? 클릭하세요!' data-position="top" value="슬기로운 코딩은 무엇인가요?">
				-->
				</div>
	

			</div>
		</div>
		
		<div class="section" id="section1" valign="middle" style="background-image: url('img/introback.png'); background-attachment: fixed;  background-repeat: repeat-none;">
		 <div class="intro1">
<!-- 		 <h2>슬기로운 코딩은 무엇인가요?</h2><br/>
			 <h3>여러분은 컴퓨터가 어떻게 움직이는지 아시나요? 슬기로운 코딩은 컴퓨터를 배우는 프로그램입니다.</h3>
			 <h3>슬기로운 코딩으로 컴퓨터를 배우고, 컴퓨터에게 일을 시키고, 프로그램을 만들면서 재미를 느껴보아요!<h3>
			 <br/>
			 <h2>무엇이 재밌나요?</h2>
			 <br/>
			 <h3>컴퓨터에게 내가 원하는 일을 시킬 수 있어요!</h3>
			 <h3>슬기와 함께 컴퓨터를 괴롭히는 악당 아코를 잡아보아요!</h3>
			 <h3>아코를 잡았다구요? 친구들과 만든 프로그램을 공유할 수 있어요!</h3> -->
		 
			  <img style="width: 70%;height:70%;margin-bottom: 10%" 
				src = "${ pageContext.request.contextPath }/assets/image/Introduction/introForStudent.png"/> 
		 	<!-- 풀페이지 맨 위로 버튼 -->
			<ul id="menu">
				<li data-menuanchor="firstPage"><a href="#firstPage">맨 위로</a></li>
			</ul>
		 
		  </div>
		</div> 
		
		 <div class="section" id="section2" style="background-image: url('img/introback.png'); background-attachment: fixed;  background-repeat: repeat-none;">
		 	<div class="slide" id="slide1">
		 		 <div class="intro2">
		 		 <!-- <h2>게임 스토리</h2><br/>
		 		 
		 		 <h3>때는 서기 2020년...</h3>
		 		 <h3>악당 ‘아코’는 컴퓨터 네트워크 세상을 바이러스와 악성코드로 뒤덮으려는 야심 찬 계획을 세우고 있습니다.</h3> -->	
				 <img style="width: 70%;height:70%;margin-bottom: 10%" 
					src = "${ pageContext.request.contextPath }/assets/image/Introduction/backstory1.png"/>
			
				 </div>
			</div>
	    	<div class="slide" id="slide2">
	    		<img style="width: 70%;height:55%;margin-bottom: 10%" 
					src = "${ pageContext.request.contextPath }/assets/image/Introduction/backstory2.png"/>
			
	    		<!-- <h3>여러분은 주인공이 되어서 ‘아코’를 잡기 위하여 험난한 모험을 떠날 거에요.</h3> -->
	    	</div>
	    	<div class="slide" id="slide3">
	    		<!-- <h3>아코를 잡기 위한 모험은 코딩 게임이라는 형식을 통해 펼쳐져요. </h3>
	    		<h3>게임을 수행하면서 ‘아코’를 물리치고 바이러스와 악성코드 없는 세상을 만드어 주세요.</h3> -->
				<img style="width: 70%;height:57%;margin-bottom: 10%" 
					src = "${ pageContext.request.contextPath }/assets/image/Introduction/backstory3.png"/>
			
	    	</div>
	  		  <!-- 풀페이지 맨 위로 버튼 -->
			<ul id="menu">
				<li data-menuanchor="firstPage"><a href="#firstPage">맨 위로</a></li>
			</ul>
		</div>
		
		<div class="section" id="section3" style="background-image: url('img/introback.png'); background-attachment: fixed;  background-repeat: repeat-none;">
			<div class="intro3">
			
				 <img style="width: 50%;height:25%;margin-bottom: 10%" 
				src = "${ pageContext.request.contextPath }/assets/image/Introduction/companyLogo.png"/> 
			
			<%-- <img style="margin-top : 100px" width = "900px" height = "500px" 
				src = "${ pageContext.request.contextPath }/assets/image/Introduction/intro3.png"/>
			 --%>
		<!-- 풀페이지 맨 위로 버튼 -->
		<ul id="menu">
			<li data-menuanchor="firstPage"><a href="#firstPage">맨 위로</a></li>
		</ul>
			</div>
		</div> 	
			
	</div>

<!-- 선생님 소개 모달 -->
	<div class="ui small modal" id="introTextForTeacher" style="margin-top: 0em;">
		<div class="ui inverted block header" style="background: #556270; font-family: 'Nanum Gothic';">슬기로운 코딩 소개(선생님)</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="4"></th>
				<tr>
					<td><img style="max-height: 100%; max-width: 100%; top: 0%; margin-top: 0%;" src="${pageContext.request.contextPath }/assets/image/Introduction/introForTeacher.png"></td>
			</table>
			<div class="actions" style="text-align: center">
				<div class="ui negative button" id = "questionOk" align="center" style="margin-left: 0px;">확인</div>
			</div>
		</div>
	</div>


	<!-- IE튕기기용 모달 -->
	<div class="ui small ie modal" id="registerChoice">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">슬기로운 코딩이 실행될 수 있는 환경이 아닙니다.</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th colspan="3">슬기로운 코딩은 다음과 같은 인터넷 브라우저를 추천해드립니다.</th>
				<tr>
					<td><img width="150px" height="150px" class="ui image rounded" src="http://brandthunder.com/wp/wp-content/uploads/2014/01/Internet-Explorer-11-logo.png"></td>
					<td><img width="150px" height="150px" class="ui image rounded" src="http://www.wikinoticia.com/images2//s3.bitelia.com/files/2012/05/Google-Chrome-Logo.jpg"></td>
					<td><img width="150px" height="150px" class="ui image rounded" src="http://mozorg.cdn.mozilla.net/media/img/firefox/firefox-256.jpg"></td>
				<tr>
					<td>익스플로러</td>
					<td>크롬</td>
					<td>파이어폭스</td>
			</table>
		</div>
	</div>

</body>
</html>