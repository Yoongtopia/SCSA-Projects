<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


#trendscoretable{
	text-align: center;
	font-weight:700;
	font-size:0.8em;
}

#trendscoretable td{
	vertical-align: center;
}

.littleScore{
	font-size : 50px;
	z-index:1000000;
	text-align: center;
	vertical-align: center;
}

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

body {font-family: 'Nanum Gothic';}
h1{font-size: 40px;font-family: 'Nanum Gothic';}
#score{font-size: 55px;}
#banner-fade{margin: 0px auto;	}
.littleScore{font-size : 30px;}


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
	$(document).ready(function(){
		$('#banner-fade').bjqs({
		    height      : 500,
		    width       : 850,
		    responsive  : true
		  });
	});
	
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	
	function drawChart() {

		$.get("${pageContext.request.contextPath}/getTrend.do",{"code" : "${code}"},setData, "JSON");
		
	}//end drawChart()
	
	function setData(jsonData){
		
		$("#score").text(jsonData.score);
		$("#ten").text(Math.round(jsonData.trendTenDay*1000)/10 + "%");
		$("#thirty").text(Math.round(jsonData.trendThirtyDay*1000)/10 + "%");
		$("#fifty").text(Math.round(jsonData.trendFiftyDay*1000)/10 + "%");
		
		var options1 = {title: 'Orakgarak Trender : 가격',
				curveType: 'function',
				backgroundColor : '#f0f0f0',
				width : 700,
				height : 300,
				colors:['#e64a3c']};
				
		var options2 = {title: 'Orakgarak Trender : 거래량',
				backgroundColor : '#f0f0f0',
				width : 700,
				height : 300,
				curveType: 'function'};
		var priceArray=[['date','price']];
		var volumeArray=[['date','volume']];
		$.each(jsonData.trendDatalist.reverse(), function(index, item) {
			var priceTrend = [item.tradeDate,item.price];
			var volumeTrend = [item.tradeDate,item.volume];
			priceArray.push(priceTrend);
			volumeArray.push(volumeTrend);
		});
		
		var data1 = google.visualization.arrayToDataTable(priceArray);
		var data2 = google.visualization.arrayToDataTable(volumeArray);
        var chart1 = new google.visualization.LineChart(document.getElementById('chart_div1_trend'));
        var chart2 = new google.visualization.LineChart(document.getElementById('chart_div2_trend'));
        chart1.draw(data1, options1);
        chart2.draw(data2, options2);
        
        $(".loaderGif").hide();
		
	}//end setData
	
	</script>


</head>
<body>
<div id="banner-fade">
    <ul class="bjqs">
    
    	<li>
			<div class="content cover" style="background-color:#464040; color:white;">
	     		<h1 style="text-align:center">최근추세</h1>
	     		<br>
				<p style="text-align:center; font-size:0.8em; color:rgb(218, 218, 218);">오락가락의 최근추세는 해당 기업의 <span style="color:#009cd7; font-weight:bold">가격변동추세</span>를 기준으로 평가하였습니다</p>
				
				<span style="font-size:0.7em;font-weight:500;">Trend:</span>
				
				<p>&nbsp;&nbsp;&nbsp;
				해당 주식의 가격 변동 추세를 분석하고 수치화하여 가격 변동의 방향과 정도를 점수화 하였습니다.
				
				</p>
				<p style="font-size:0.5em; border:1px solid gray; border-radius:5px; padding:4px;">
				<span style="background:#e64a3c; padding:2px; border-radius:3px;">주의</span>&nbsp;본 서비스에서 제공하는 최근추세 점수는 단기적인 추세 데이터를 바탕으로 하며 따라서 중장기적인 분석에는 부적합 할 수 있습니다.
				</p>
				<p style="font-size:0.65em; color:rgb(218, 218, 218); line-height:1.6em; text-align:center">
				가격 변동 추세를 기준으로 <span style="color:#e64a3c; font-weight:700;">상승 추세가 높은 주식일수록</span> 최근추세점수를 높게 평가하였습니다
				</p>
			</div>	
        </li>
        <li><!-- 1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번 -->
        	<div class="content">
        	
			<h1 style="text-align:center;">최근추세 점수는 <span id="score"></span>점 입니다</h1>
			<hr>
			<br />
			
			
			
			
			<div style="margin:0 auto;">
				<table id="trendscoretable">
					<tr>
						<td><div style="width:200px;height:200px;background-color:#5F5151; color:white; border-radius:100px;float:left;margin:10px;"><br><br><br><span id="ten" class="littleScore"></span></div></td>
						<td><div style="width:200px;height:200px;background-color:#5F5151; color:white; border-radius:100px;float:left;margin:10px;"><br><br><br><span id="thirty" class="littleScore"></span></div></td>
						<td><div style="width:200px;height:200px;background-color:#5F5151; color:white; border-radius:100px;float:left;margin:10px;"><br><br><br><span id="fifty" class="littleScore"></span></div></td>
					</tr>
					<tr>
						<td>최근 10일</td>
						<td>최근 30일</td>
						<td>최근 50일</td>
					</tr>
				</table>
			</div>
			
			</div>
	       </li>
        <li><!-- 2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번 -->
        <div class="content">
        <h1>가격변동</h1>
					<hr>
			<div id="chart_div1_trend" ></div>
		</div>	
		</li>
		<li><!-- 1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번 -->
		<div class="content">
		<h1>거래량</h1>
					<hr>
        	<div id="chart_div2_trend"></div>
       	</div>	
        </li>
        
    </ul>
</div>





</body>
</html>