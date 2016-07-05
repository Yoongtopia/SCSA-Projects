<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">
<script src="${pageContext.request.contextPath }/js/report_slider/bjqs-1.3.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/bjqs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/demo.css">
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css' />


<style>

.content{
width:696px;
border: 2px solid #C7C4C4;
height: 470px;
margin: 0px auto;
padding : 10px 75px 10px 75px;
background-color: #f0f0f0;
	border-radius : 30px 30px 30px 30px;
	font-family: 'Nanum Gothic';
	font-size: 25px;
}

body {font-family: 'Nanum Gothic'; }
h1{font-size: 40px;font-family: 'Nanum Gothic';}
#score{font-size: 55px;}
#riskAsset{font-size : 45px;}
#banner-fade{margin: 0px auto;	}
.littleScore{font-size : 30px;}
#chart_div1_risk{margin-left:-60px;}


.loaderGif{
position : absolute;
margin-left: 420px;
margin-top: 140px;
z-index: 9999;
}

.content.cover p{
	 font-size:0.65em;
	 color:rgb(218, 218, 218);
	 line-height:1.6em;
}


</style>

	<script type="text/javascript">
	
    

    
	
	$(document).ready(function() {
		
		//js.slider에 있는걸 불러옴.
		 $('#banner-fade').bjqs({
			    height      : 500,
			    width       : 850,
			    responsive  : true
			  });
		
		
		$(".variable").on("blur",function(){
			
			
			$.getJSON("${pageContext.request.contextPath}/recalculateRisk.do",{
				confidence : $("#confidenceLevel").val(),
				stdev : $("#stdev").text(),
				asset : $("#asset").val(),
				days : $("#days").val(),
				code : "000000" //임시로 이렇게 줌
			},function(jsonData){
				$("#riskAsset").text(Math.round(jsonData.riskAsset));
			});
		});
	}); //end ready()
	
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	
	function drawChart() {
		$.get("${pageContext.request.contextPath}/getRisk.do",{"code" : "${code}"},setData, "JSON");
		
	}//end drawChart();
	
	function setData(jsonData){
		$("#stdev").text(jsonData.risk.stdev).hide();
		$("#score").text(jsonData.risk.score);
		$("#riskAsset").text(Math.round(jsonData.risk.riskAsset));
		
		var options1 = {
				title: 'Orakgarak Risk : 위험성',
					histogram : {bucketSize: 0.01},
					backgroundColor : '#f0f0f0',
					width : 800,
					height : 360,
				legend : {
					position : 'none',
				},
				histrogram : {
					bucketSize : 0.01
				},
				hAxis : {
					maxValue : 0.15,
					minValue : -0.15,
					slantedTextAngle : 30,
				},
					
		};
		var growthArray=[['date','변동폭']];
		$.each(jsonData.trend.trendDatalist.reverse(), function(index, item) {
			var growthTrend = [item.tradeDate,item.growthRate];
			growthArray.push(growthTrend);
		});
		
		var data1 = google.visualization.arrayToDataTable(growthArray);
        var chart1 = new google.visualization.Histogram(document.getElementById('chart_div1_risk'));
        chart1.draw(data1, options1);
        $(".loaderGif").hide();
	}//end setData
	
	</script>


</head>
<body>

<div id="banner-fade">
    <ul class="bjqs">
    
    	<li>
			<div class="content cover" style="background-color:#464040; color:white;">
	     		<h1 style="text-align:center">안정성</h1>
	     		
				<p style="text-align:center; font-size:0.8em; color:rgb(218, 218, 218);">오락가락의 안정성은 금융 공학 모델 <span style="color:#009cd7; font-weight:bold">VaR</span>을 기준으로 평가하였습니다</p>
				
				<span style="font-size:0.7em;font-weight:500;">VaR:</span>
				
				<p>&nbsp;&nbsp;&nbsp;정상적인 시장 여건 하에서 일정기간 동안 발생할 수 있는 ‘최대손실금액’을 뜻합니다.
				예를 들어 목표기간 1년, 신뢰수준 95%에서 산출된 VaR이 10억이라면 1년 동안 발생할 수 있는 최대손실금액이
				10억보다 적을 확률이 95%라는 의미로, 10억의 자금을 조달할 수 있는 능력만 있으면 시장위험이 통제된다고 봅니다.
				<span style="color:white; font-weight:700;">금융시장의 대표적인 위험관리지표</span>로 사용되고 있습니다.
				
				</p>
				<p style="font-size:0.5em; border:1px solid gray; border-radius:5px; padding:4px;">
				<span style="background:#e64a3c; padding:2px; border-radius:3px;">주의</span>&nbsp;VaR 측정 방법으로는 분석적 방법(정규분포를 가정하고 공식을 이용하여 측정), 역사적 시뮬레이션(과거의 자료를 이용해 측정), 몬테카를로 시뮬레이션(리스크 요인의 확률모형을 통해 측정) 등이 있으며 본 서비스는 <span style="color:white; font-weight:700;">분석적 방법</span>을 사용하고 있습니다.
				</p>
				<p style="font-size:0.56em; color:rgb(218, 218, 218); line-height:1.6em; text-align:center">
				본 서비스는 <span style="color:#e64a3c; font-weight:700;">목표기간 10일</span>, <span style="color:#e64a3c; font-weight:700;">신뢰수준 95%</span>에서 산출된 VaR값을 근거로 그 <span style="color:#e64a3c; font-weight:700;">값이 낮을수록</span> 점수를 높게 책정하였습니다.</span>
				</p>
			</div>	
        </li>
    	
        
        <li><!-- 2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번 -->
			<div class="content">
	     		
				<h1 style="text-align:center">안정성 점수는 <span id="score"></span>점 입니다</h1>
				<hr>
				<span id="stdev"></span>
				<span style="font-size:0.8em; font-weight:550;">&nbsp;&nbsp;오락가락의 안정성 점수는 목표기간 10일, 신뢰수준 95%에서 산출된 VaR값을 표준으로 하였습니다</span>
				<br><br>
				<div class="risksimulation" style="border:4px solid #e64a3c;text-align:center;background-color:#464040; color:rgb(219, 214, 214); border-radius:10px; padding:15px;">
				<p style="font-weight:bold;text-align:center;margin: 16px;color:white;">위험한 시뮬레이션</p>
				투자금액 <input type="number" id="asset" value="10000" class="variable">원 중
				<select id="confidenceLevel" class="variable">
				<option value="1">1%</option>
				<option value="2">2%</option>
				<option value="3">3%</option>
				<option value="4">4%</option>
				<option value="5" selected="selected">5%</option>
				<option value="6">6%</option>
				<option value="7">7%</option>
				<option value="8">8%</option>
				<option value="9">9%</option>
				<option value="10">10%</option>
				<option value="15">15%</option>
				<option value="20">20%</option>
				<option value="25">25%</option>
				<option value="30">30%</option>
				<option value="35">35%</option>
				<option value="40">40%</option>
				<option value="45">45%</option>
				</select>
				의 확률로 
				<br/>
				<select id="days" class="variable">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
				<option value="60">60</option>
				<option value="70">70</option>
				<option value="80">80</option>
				<option value="90">90</option>
				<option value="100">100</option>
				</select>
				일동안 잃게되는 자산은
				<br/>
				<b><span id="riskAsset" style="color:#e64a3c"></span></b>원과 같습니다.
				</div>
				
				</div>
		</li>
		
		
		<li><!-- 1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번 -->
		<div class="content">
		<h1>주식등락폭분포</h1>
				<hr>
        	<div id="chart_div1_risk" ></div>
        	</div>
        </li>
    </ul>
</div>

<!-- <div class="ui inline small dropdown">
				    <div id ="confidenceLevel" class="text variable">5</div>%
				    <i class="dropdown icon"></i>
				    <div class="menu">
				      <div class="item" data-text="1" >1</div>
				      <div class="item" data-text="2">2</div>
				      <div class="item" data-text="3" >3</div>
				      <div class="item" data-text="4">4</div>
				      <div class="item active" data-text="5">5</div>
				      <div class="item" data-text="6" >6</div>
				      <div class="item" data-text="7">7</div>
				      <div class="item" data-text="8" >8</div>
				      <div class="item" data-text="9">9</div>
				       <div class="item" data-text="10" >10</div>
				      <div class="item" data-text="15">15</div>
				      <div class="item" data-text="20" >20</div>
				      <div class="item" data-text="25">25</div>
				      <div class="item" data-text="30" >30</div>
				      <div class="item" data-text="35">35</div>
				      <div class="item" data-text="40" >40</div>
				      <div class="item" data-text="45">45</div>
				    </div>
				  </div> -->


</body>
</html>