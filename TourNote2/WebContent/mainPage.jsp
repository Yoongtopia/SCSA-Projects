<%@page import="com.scsa.wapl.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>TOUR NOTE</title>
<meta charset="utf-8">
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,400italic" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/bootstrap4.css">
<link rel="stylesheet" href="./css/animate.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="./css/carousel.css" rel="stylesheet">
</head>

<style type="text/css">
	
	#boat {
		position: relative;
		/* background-image: url(./images/mainPage/boat.png); */
		background-repeat: no-repeat;
		z-index: 9999999999999;
	}
	
	.modal-content {
		position: relative;
		background-color: #ffffff;
		border: 1px solid #999999;
		border: 1px solid rgba(0, 0, 0, 0.2);
		outline: none;
		-webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
		        box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
		background-clip: padding-box;
		margin-top: 100px;
		margin-left: -250px;
		width: 1030px;
		height: 600px;
	}
	
	.modal-header {
	    min-height: 16.428571429px;
	    padding: 15px;
	    border-bottom: 1px solid #e5e5e5;
	    background-color: rgba(137, 82, 163, 0.5) !important;
	}
	
	.uknow {
		position: relative !important;
	    padding: 20px !important;
	    height: 520px !important;
	    overflow: hidden !important;
	    margin-top: 25px;
	}
	
	.uknow > span {
		position: absolute;
	}
	.uknow > span:nth-child(1){
		left: 0px;
	}
	.uknow > span:nth-child(2){
		left: 1200px;
	}
	.uknow > span:nth-child(3){
		left: 2400px;
	}
	.uknow > span:nth-child(4){
		left: 3600px;
	}
	.uknow > span:nth-child(5){
		left: 4800px;
	}
	.uknow > span:nth-child(6){
		left: 6000px;
	}
	
</style>

<body>
	
	<!-- 좌측 네비게이션 -->
	 <nav class="sidenav" style="top: 60%; position: fixed;">   
		 <a href="${pageContext.request.contextPath }#top" class="n1"><img src="./images/mainPage/sideButton1.png" width="40px"/><span>TOP</span></a>
		 <c:choose>
			<c:when test="${sessionScope.member!=null && sessionScope.recordNum!=null }">		 
		 		<a href="${pageContext.request.contextPath }/upload_detail.do#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:when>
   	 		<c:otherwise>
		 		 <a href="${pageContext.request.contextPath }#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:otherwise>
		</c:choose> 
		 <a href="${pageContext.request.contextPath }#2" class="n1"><img src="./images/mainPage/sideButton3.png" width="40px"/><span>TRAVEL BOARD</span></a> 
		 <a href="${pageContext.request.contextPath }#3" class="n1"><img src="./images/mainPage/sideButton4.png" width="40px"/><span>MY TRAVEL</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice" class="n1"><img src="./images/mainPage/sideButton5.png" width="40px"/><span>NOTICE</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna" class="n1"><img src="./images/mainPage/sideButton6.png" width="40px"/><span>Q&A</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_faq.do?boardCategory=faq" class="n1"><img src="./images/mainPage/sideButton7.png" width="40px"/><span>FAQ</span></a> 
   	 </nav>

	<!-- 메인페이지 상단-->
	<div class="container-hero" style="height: 895px">
		<div class="container">
			<div class="row">
				<div class="span12 centered">
					<br/><br/><br/>
					<img src="images/mainPage/logo3.png" data-wow-delay="0.4s"
						class="wow slideInDown animated"
						style="visibility: visible; -webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;">
					<h1 data-wow-delay="0.3s" class="wow slideInDown animated"
						style="visibility: visible; -webkit-animation-delay: 0.3s; -moz-animation-delay: 0.3s; animation-delay: 0.3s;">
						Make Your Journey More Memorable</h1>
				</div>
				<div>
					<img id="mainimage" src="./images/mainPage/landMark.png" height="220px" data-wow-delay="0.2s"
						class="wow slideInDown animated"
						style="visibility: visible; -webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
				</div>		
			</div>
		</div>
		<div style="height: 240px; margin-top: 170px; background-image: url('./images/spotMain/spotMain_cloud.png'); overflow: hidden; " >
			<span id="boat" style="width: 200px; height: 200px; margin-left: 250px; ">
				<img src="./images/mainPage/boat.png" height="120px" style="margin-top: -3px; ">
			</span>
			<span>
				<a style="background-color: yellow; text-decoration: none; " id="clickMe">Click me!</a>
			</span>
			<span style="margin-left: 500px; ">
				<a id="Tutorial" href="#tutorialModal" data-toggle="modal"><img src="./images/mainPage/tutorial.png" style="width: 140px"></a>
			</span>
		</div>
	</div>
	
	<div class="modal fade" id="tutorialModal" role="dialog" style="z-index: 9999999999 !important;">
	<div class="modal-dialog">
		<div class="modal-content">
	
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 class="modal-title" id="myModalLabel" style="color: skyblue;"><b>USER GUIDE</b></h3>
			</div>
			
			<div class="modal-body uknow" >		
					<span>
						<a><img style="margin-left: 20px; "></a>
							<img class="tutorialImage" src="./images/tutorial/recordTutorial01.png" width="850px" height="450px" style="margin-left: 33px; ">
						<a href="#"><img class="tutorialNext" src="./images/next.png" style="margin-left: 18px; "></a>
					</span>
					<span>
						<a href="#"><img class="tutorialPrev" src="./images/prev.png" style="margin-left: 20px; "></a>
							<img class="tutorialImage" src="./images/tutorial/recordTutorial02.png" width="850px" height="450px" style="margin-left: 33px; ">
						<a href="#"><img class="tutorialNext" src="./images/next.png" style="margin-left: 18px; "></a>
					</span>
					<span>
						<a href="#"><img class="tutorialPrev" src="./images/prev.png" style="margin-left: 20px; "></a>
							<img class="tutorialImage" src="./images/tutorial/recordTutorial03.png" width="850px" height="450px" style="margin-left: 33px; ">
						<a href="#"><img class="tutorialNext" src="./images/next.png" style="margin-left: 18px; "></a>
					</span>
					<span>
						<a href="#"><img class="tutorialPrev" src="./images/prev.png" style="margin-left: 20px; "></a>
							<img class="tutorialImage" src="./images/tutorial/recordTutorial04.png" width="850px" height="450px" style="margin-left: 33px; ">
						<a href="#"><img class="tutorialNext" src="./images/next.png" style="margin-left: 18px; "></a>
					</span>
					<span>
						<a href="#"><img class="tutorialPrev" src="./images/prev.png" style="margin-left: 20px; "></a>
							<img class="tutorialImage" src="./images/tutorial/recordTutorial05.png" width="850px" height="450px" style="margin-left: 33px; ">
						<a href="#"><img class="tutorialNext" src="./images/next.png" style="margin-left: 18px; "></a>
					</span>	
					<span>
						<a href="#"><img class="tutorialPrev" src="./images/prev.png" style="margin-left: 20px; "></a>
							<img class="tutorialImage" src="./images/tutorial/recordTutorial06.png" width="850px" height="450px" style="margin-left: 33px; ">
						<a><img style="margin-left: 18px; "></a>
					</span>					
			</div>
						
		</div>
	</div>
	</div>
	
	<!-- 첫번째 페이지 -->
	
	<div id="1" class="container-blue2" style="height: 900px">
		<c:choose>
			<c:when test="${sessionScope.member.memberId!=null }">
				<c:import url="spotMain.jsp"></c:import>
			</c:when>
			<c:otherwise>
				<!-- 로그인이 필요한 페이지입니다. 라고 새로운 창을 만들어야 함 -->
				<c:import url="loginHasem.jsp"></c:import>		
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 두번째 페이지 -->
	<div id="2"  class="container-blue" style="height: 900px">
		<c:import url="travelRecordList.jsp"></c:import>
	</div>
	
	<!-- 세번째 페이지 -->
	<div id="3" class="container-blue2"  style="height: 900px">
	<c:choose>
		<c:when test="${sessionScope.member.memberId!=null }">
			<c:import url="myTravelRecord.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<!-- 로그인이 필요한 페이지입니다. 라고 새로운 창 만들어야 함-->
			<c:import url="loginHasem2.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	</div>
		
	<!-- JQuery -->
	<script async="" src="//www.google-analytics.com/analytics.js"></script>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<!-- Google Analytics -->
	<script type="text/javascript">
	    $(document).ready(function() {
	    	
	    	$("#clickMe").hide();
	    	$("#Tutorial").hide();	    	

	    	$('#boat').mouseover(function() {
	    		$("#clickMe").show();	    		
	    	});
	    	
	    	$('#boat').mouseout(function() {
	    		$("#clickMe").hide();	    		
	    	});
	    	
	    	$('#boat').click(function() {
	    		$("#clickMe").remove();
		        var screenWidth = $(document).width();
		        var startPos = screenWidth;
		        var boat = $('#boat');
		        flyPenguin();
		        
		        function flyPenguin(){
		        	boat.css('right', startPos);
		        	boat.animate({left: +500}, 2000, "linear", function() {
		        		$("#Tutorial").fadeIn();	        		
		        	});		     	
		        };
	    	});

	    	$(".tutorialPrev").click(function() {
	    		$(".uknow > span").animate({left: '+=1200px' }, 10, "linear");
	    	});
	    	
	    	$(".tutorialNext").click(function() {
	    		$(".uknow > span").animate({left: '-=1200px' }, 10, "linear");
	    	});
	    	
	    	$()
	    	
	       });	    
	</script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-15651803-15', 'streamlineicons.com');
		ga('send', 'pageview');
	</script>
	<!-- Get Clicky -->
	<script src="//static.getclicky.com/js" type="text/javascript"></script>
	<script type="text/javascript">	
		try {
			clicky.init(100673816);
		} catch (e) {
		}
	</script>
	<noscript>&lt;p&gt;&lt;img alt="Clicky" width="1" height="1"
		src="//in.getclicky.com/100673816ns.gif" /&gt;&lt;/p&gt;</noscript>
	<!-- Scripts -->
	<script type="text/javascript" src="./js/scripts.js"></script>
	<!-- Wow -->
	<script src="./js/wow.min.js"></script>
	<script>
		var wow = new WOW({
			boxClass : 'wow', // animated element css class (default is wow)
			animateClass : 'animated', // animation css class (default is animated)
			offset : 0, // distance to the element when triggering the animation (default is 0)
			mobile : false
		// trigger animations on mobile devices (true is default)
		});
		wow.init();
		
	</script>

</body>