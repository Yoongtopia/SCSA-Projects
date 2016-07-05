<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="./css/jquery.fullPage.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/jquery.fullPage.js"></script>

<script src="js/jQCloud/jqcloud-1.0.4.min.js"></script>
<link href="css/jQCloud/jqcloud.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/animate.css" />
<link rel="stylesheet" href="./css/animate.min.css" />
<style type="text/css">
	#test{
		position: absolute;
		left: 700px;
		top: 320px;
	}
	.default-height{
		top: 50px;
	}
	.panel-body{
		padding: 0px;
	}
	#main-content{
		position: relative;
		width: 700px;
		/* top: 130px;
		left: 390px; */
		margin: 0;
	}
	#2nd-sub-content span{
		position: relative;
		float: left;
	}
	
	.firstLine{
		position: relative;
		overflow: hidden;
	}
	
	#logoName{
		background-color: #ff6600;
		position: absolute;
		float:right;
		width: 300px;
		height: 260px;	
		z-index: 1;
		
	}
	
	#logoName2{
		z-index: 1;
		color: white;
		line-height: 260px;
		font-size: 17px;
		font-weight: bold;
		padding-right: 40px;
	}
	
	.secondLine{
		text-align: left;
		margin-left: 20px;
		position: relative;
	}
	.footerMain{
		list-style: none;
		line-height: 35px;
		font-size: 13px;
		position: absolute;
		left: 190px;
		margin-top: 235px;
	}
	.footerSide{
		position: absolute;
		left: 184px;
	}
	
	.footerMain span{
		font-weight: bold;
		color: #3C3B3C;
	}
	
	.footerTitle1{
		color: #3C3B3C;
		font-size: 14px;
		letter-spacing: 1px;
		padding: 0px 10px;
		border: 2px solid #333;
		width: 120px;
		text-align: center;
		font-weight: bold;
		margin-bottom: 10px;	
	}
	.footerTitle2{
		color: #3C3B3C;
		font-size: 14px;
		letter-spacing: 1px;
		padding: 0px 10px;
		border: 2px solid #333;
		width: 200px;
		text-align: center;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	.footerSide{
		list-style: none;
		line-height: 35px;
		font-size: 13px;
		position: absolute;
	}
	
	.footerSide span{
		font-weight: bold;
	}
	
	.thirdLine{
		position: absolute;
		background-color:#003366;
		width: 100%;
		height: 150px;
		z-index: 999;
	}
	
	#left{
		float:left;
		z-index: 1;
		color: white;
		line-height: 100px;
		padding-left: 20px;
		font-size: 12px;
	}
	
	#right{
		float:right;
		z-index:1;
		color:white;
		line-height: 100px;
		padding-right:20px;
		font-size: 12px;
	}
	#fullPage-nav span{
		background: white;
		width: 12px;
		height: 12px;
	}
	/* 두번째 페이지 css 건들지 맛요 */
	
	.second_full_page{
		margin-top: 30px;
		position: relative;
	}
	.second_full_page > * {
		position: absolute;
	}
	.guide{
		top: 3.5em;
		left: 11em;
		color: #003366;
		font-weight: bold;
		font-size: 13px;
	}
	.guide > *{
		font-family: 맑은 고딕;
		font-size: 13px;
		display: none;
	}

	.univ_search{
		top: 5em;
		left: 10em;
		width: 26em;
		overflow: hidden;
	}
	
	.univ_search > *{
		float: left;
	}
	
	.map{
		right: 10em;
		width: 600px;
		height: 600px;
	}
		
	.map > svg{
		width: 600px;
		height: 600px;
	}
	.square_info_area > .univ{
		position: relative;
		overflow: hidden;
	}
	.square_info_area > .univ > img{
		float: left;
		width: 25px;
		height: 25px;
		margin: 2px; 
	}
	.square_info_area > img:AFTER{
		clear: both;
	}
	.square_info_area{
		top: 8em;
		left: 10em;
	  	height: 32em; width: 26em;
		padding: 5px;	
		padding-top:50px;
	    z-index: 100;
	    background: white;
	    border: 1px solid black;
		border-radius: 10px;
	   /*  opacity: 0.7; */
	    
	}
	.square_info_area > button {
/* 		position: absolute;
		bottom: 0; */
	}
	div.gu > *{
		float: left;
		margin-right: 2px;
	}
	div.gu {
		position: relative;
		overflow: hidden;
		margin-bottom: 10px;
	}
	#wordcloud{
		position: relative;
		height: 300px;
	}
	#wordcloud span{
		cursor: pointer;
	}
	#list_btn:HOVER{
		background-color: #EE9A00;
	}

}
	
</style>

<body style="font-family: 맑은 고딕;">
	<div id="fullpage">
		<!-- 첫번째 페이지 -->
		<div style="width: 100%; height: 600px;

					background-image: url('./images/background/background6.png');
					padding: 0px; margin: 0px; line-height: 100%;
					position: relative;
					left:0px; top:0px;"
					class="section">
			<div class="top-height-control" style="height: 150px"></div>
			<div id="main-content">
				<div id="1st-sub-content"  class="animated bounceInDown">
					<img alt="MyPriceTag" width="550px" height="120px" src="./images/contents/main_logo3.png">
				</div>
				<br/><br/>
				<div id="2nd-sub-content">
					<hr width="550px"/>
					<span><img alt="MyPriceTag" width="550px" height="120px" src="./images/contents/item8.png"></span>
					<!-- <span><img alt="MyPriceTag" width="137px" height="120px" src="./images/main/time2.png" class="mainImg"></span>
					<span><img alt="MyPriceTag" width="137px" height="120px" src="./images/main/safe2.png" class="mainImg"></span>
					<span><img alt="MyPriceTag" width="137px" height="120px" src="./images/main/matching2.png" class="mainImg"></span> -->
				</div>
				<br/><br/>
				<div id="3nd-sub-content"" >
					<hr width="550px"/>
					<span><img alt="MyPriceTag" width="500px" height="70px" src="./images/contents/item4.png"></span>
				</div>
			</div>
		</div>
		
		<!-- 두번째 페이지 -->
		<div class="section" align="center"
			 style="height: 600px; position: relative;
			 padding: 0px; margin: 0px; line-height: 100%; left:0px; top:0px;
			 /* background-image: url('./images/background/background5.png'); */
			 background-color:lightgray;
			 background-size: cover;
			 ">
			<div class="second_full_page">
				<div class="guide"><span></span></div>
				<div class="univ_search" >
					<input id="fullpage_search" class="form-control input-sm" style="width: 314px"/>
					<button type="button" class="btn btn-default btn-sm"><i class="orange large search basic icon"></i></button>
				</div> 
				<div class="square_info_area" style="display: none;">
					<!-- <div class="gu" style="font-weight: bold;"></div> -->
					<div id="wordcloud"></div><br/><br/><br/>
					<button type="button" class="btn btn-warning btn-sm" style="background-color: #FF6600; border: 1px solid #FF6600; font-weight: bold;" id="list_btn">
					<i class="big forward mail icon"></i>등록된 상품 보러가기</button><br/><br/><br/>
				</div>
				<div class="map" style="font-family: 맑은 고딕;">
				<span class="region" style="top: 30.5em; left:39.5em;">광진구</span>
					<span class="region" style="top: 30.5em; left:46.5em;">강동구</span>
					<span class="region" style="top: 37.5em; left:42.5em;">송파구</span>
					<span class="region" style="top: 39.5em; left:36em;">강남구</span>
					<span class="region" style="top: 41.5em; left:30em;">서초구</span>
					<span class="region" style="top: 44.5em; left:22em;">관악구</span>
					<span class="region" style="top: 37.5em; left:22em;">동작구</span>
					<span class="region" style="top: 44.5em; left:16em;">금천구</span>
					<span class="region" style="top: 39em; left:9em;">구로구</span>
					<span class="region" style="top: 34.5em; left:10em;">양천구</span>
					<span class="region" style="top: 34.5em; left:16em;">영등포구</span>
					<span class="region" style="top: 27.5em; left:7em;">강서구</span>
					<span class="region" style="top: 28.5em; left:18em;">마포구</span>
					<span class="region" style="top: 25em; left:20em;">서대문구</span>
					<span class="region" style="top: 18em; left:20em;">은평구</span>
					<span class="region" style="top: 23em; left:26em;">종로구</span>
					<span class="region" style="top: 28em; left:28em;">중구</span>
					<span class="region" style="top: 32.5em; left:26em;">용산구</span>
					<span class="region" style="top: 29.5em; left:34em;">성동구</span>
					<span class="region" style="top: 24.5em; left:35em;">동대문구</span>
					<span class="region" style="top: 21em; left:31.5em;">성북구</span>
					<span class="region" style="top: 22em; left:40.5em;">중랑구</span>
					<span class="region" style="top: 13em; left:38.5em;">노원구</span>
					<span class="region" style="top: 10em; left:33em;">도봉구</span>
					<span class="region" style="top: 15em; left:31em;">강북구</span>
				<c:import url="seoul_map.jsp"/>
				</div>
			</div>
				<div class="univ" style="border: 1px solid black; border-radius:10px; display: none; background-color: white; padding: 10px; margin-top:45em; width:78%; "></div>
			
		</div>
		<!-- <script type="text/javascript">
	
			
		</script> -->
		<!-- 세번째 페이지 -->
		<div class="section"
			 style="height: 600px; position: relative; line-height: 100%;">
			<div class="firstLine">
				<img alt="background" src="./images/background/background7.jpg" width="800px" height="260px">
				<span id="logoName">
					<span id="logoName2">M  Y  P  R  I  C  E  T  A  G</span>
				</span>
			</div>
			<br>
			<br>
			<br>
			<div class="secondLine">
				<!-- <img alt="logo" src="./images/background/logo.png" height="80" width="130"> -->
				
				<ul class="footerSide">
					<li class="footerTitle2">FOUNDING FAMILY</li>
						<span>Bob</span>&nbsp;&nbsp;Project Manager&nbsp;&nbsp;&nbsp;&nbsp;
						<span>Charles</span>&nbsp;&nbsp;Coding specialist&nbsp;&nbsp;&nbsp;&nbsp;
						<span>Donovan</span>&nbsp;&nbsp;Coding specialist&nbsp;&nbsp;&nbsp;&nbsp;
						<span>Tom</span>&nbsp;&nbsp;UI/UX specialist&nbsp;&nbsp;&nbsp;&nbsp;
						<span>Channel</span>&nbsp;&nbsp;UI/UX master&nbsp;&nbsp;&nbsp;&nbsp;
					<li>
					<img alt="image" src="./images/character/person1.png" height="150" width="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img alt="image" src="./images/character/person2.png" height="150" width="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img alt="image" src="./images/character/person3.png" height="150" width="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img alt="image" src="./images/character/person4.png" height="150" width="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img alt="image" src="./images/character/person1.png" height="150" width="90">
					</li>
				</ul>
				<br/>
				<br/>
				<br/>
				<br/>
				<ul class="footerMain">
					<li class="footerTitle1">I N F O</li>
					
					<li><span>M Y P R I C E I N F O . c o . l t d</span>
					<li><span>HEAD OFFICE</span>&nbsp;&nbsp;서울시 강남구 역삼동 MYPRICETAG building&nbsp;&nbsp;
					<span>TEL</span>&nbsp;&nbsp;02-3429-5114&nbsp;&nbsp;
					<span>MAIL</span>&nbsp;&nbsp;mypricetag@samsung.net</li>
				</ul>
			 </div>
			
			<div class="thirdLine">
				<span id="left">
				2014 @ COPYRIGHT. ALL RIGHT RESERVED&nbsp;&nbsp; M Y P R I C E T A G 
				</span>
				<span id="right">
				CONTACT US : <span>www.mypricetag.com, 02-3429-5114</span>
				</span>
			</div>
		
		</div>
		
		
		
	</div>
<script type="text/javascript">

	$(document).ready(function(){
		
 		var square_num;
		
 		$("body").on("click","div.square_info_area > button",function(){
			location.href="product_list_by_square.do?square_num="+$(this).attr("square_num");
 		});
		
 		var now = 1;
 		$t = $(".guide span");
 		$t.text("어디에 살고 계신가요?").fadeIn();
 		setInterval(function() {
 			$t.fadeOut();
 			if (now != 1) {
				setTimeout(function() {
			 		$t.text("지역 이름으로 검색해보세요.").fadeIn();
				}, 1000);
				now = 1;
			}else{
				setTimeout(function() {
			 		$t.text("학교 이름으로 검색해보세요.").fadeIn();
				}, 1000);
				now = 2;
			}
		}, 5000);
 		
		/* 지도 클릭 */
		$("path").click(function(e) {
			e.stopPropagation();

			if(square_num != $(this).attr('square_num')){
				square_num = $(this).attr('square_num');
				
				$(".square_info_area").show().find("div").html("");
				/* 학교 정보 뿌려주고 */
				showSquareInfo(square_num);
				/* 구 정보 뿌리고  */
				$.post("gu_list_by_square.do", {"square_num": square_num}, function(data) {
					showSquareInfo2(data);
				}, "json");
				
				/* 태그 뿌려주고 */
				wordCloud(square_num).css("font-family","맑은 고딕");
				$(".square_info_area").show();
				
			}			
		});
	
/* 		mouse_on_result = 'no';
		$("#result").hover(function() {
			mouse_on_result = 'yes';
		}, function() {
			mouse_on_result = 'no';			
		}); */
		
		/* 풀페이지 스크롤 관련 */
 		$('#fullpage').fullpage({
			menu: '#menu',
			easing: 'easeOutBack',
			navigation: true,
			navigationPosition: 'right',
			navigationTooltips: ['first', 'second', 'third']
		});
		
		/* 태그 클릭 */
		$("body").on("click", "div.jqcloud span", function() {
			$("#hidden_text").val($(this).text());
			$("#hidden_square_num").val(square_num);			
			$("#search").submit();
		});
		
		/* page2 에서 대학교 검색 */
		var search_count = 0;
		$(".univ_search > button").click(function() {
			$("path").attr("class", function(index, classNames) {
				return classNames.replace(' clicked', '');
			});
			
			/* 일단 학교 이름으로 검색하고 리턴~*/
			$.post("find_square_num.do", {"univ_name": $("#fullpage_search").val()}, function(square_num) {
				if (square_num != 0) {
						$(".square_info_area").slideUp().find("div").html("");
						/* 학교 정보 뿌려주고 */
						showSquareInfo(square_num);
						
						/* 구 정보 뿌리고  */
						$.post("gu_list_by_square.do", {"square_num": square_num}, function(data) {
							showSquareInfo2(data);
						}, "json");
						
						/* 태그 뿌려주고 */
						wordCloud(square_num);
						
						
						$(".square_info_area").slideDown();
						/* 표시하는거  */
						changeMap(square_num);
				}else{
					/* 없으면 구이름으로 검색  */
					$.post("square_by_gu_name.do", {"name": $("#fullpage_search").val()}, function(data) {
						$(".square_info_area").slideUp().find("div").html("");
						/* 학교 정보 뿌리고 */
						showSquareInfo(data.square_num);
						/* 구정보 뿌리고 */
						showSquareInfo2(data);
						/* 태그 뿌려주고  */
						wordCloud(data.square_num);	
						
						$(".square_info_area").slideDown();
						changeMap(data.square_num);
					},"json");
				}
			},"json");
		});
		
		//워드 뿌리기
		function wordCloud(square_num) {
			$.post("tag_list_by_square_num.do", {"square_num" :square_num}, function(data) {
				$("#wordcloud").jQCloud(data);
			},"json");
		}
		
		//스퀘어 넘으로 학교 리스트 뿌림
		function showSquareInfo(square_num) {
			$(".univ").children($(".uu")).remove();
			$.post("univ_list_by_square.do", {"square_num": square_num}, function(data) {
				$(data).each(function(index, univ) {
					$(".univ").css("display","block").append($("<img src=images/univ_logo2/" + univ.univ_img + ">").attr("class","uu").css("width","60px").css("height","70px"));
				});
				$(".square_info_area > button").attr("square_num", square_num);
			},"json");			
		}
		//구 받아서 뿌림
		function showSquareInfo2(data){
			$(data.gu).each(function(index, g) {
				$(".square_info_area").find("div.gu").append($("<div>/").text(g));
			});
		}
		//지도 색 바꾸기
		function changeMap(square_num) {
			$(".Square" + square_num).attr("class", function(index, classNames) {
				return classNames + ' clicked';
			});
		}
		
		$('.mainImg').animate({left: '100'});
		
		//지역이름 마우스 오버 이벤트 막기 1차시도
		
		$(".region").mouseover(function(e) {
			e.preventDefault();
		})
	});

</script>

</body>
</html>