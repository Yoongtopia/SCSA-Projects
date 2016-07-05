<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css' />
<title>Insert title here</title>

<style>

#bigdatascoretable{
	text-align: center;
	font-weight:700;
	font-size:0.8em;
}

#bigdatascoretable td{
	vertical-align: center;
}

#chart_div1{
	width : 220px;
	float : left;
}
#chart_div2{
	width : 220px;
	float : left;
}
#chart_div3{
	width : 220px;
	float : left;
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

#score{
	font-size: 55px;
}

body {
	font-family: 'Nanum Gothic';
}



h1{
	font-size: 40px;
	font-family: 'Nanum Gothic';
}

#banner-fade{
	margin: 0px auto;	
}

.littleScore{
	font-size : 50px;
	z-index:1000000;
	text-align: center;
	vertical-align: center;
}

#googleChart{
margin-top : -50px;
}

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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/js/report_slider/bjqs-1.3.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/bjqs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/demo.css">


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
		$.post("${pageContext.request.contextPath}/getBigData.do",{"code" : "${code}", "keyword" : "${name}"},setData, "JSON");
		
	}//end drawChart()
	
	function setData(jsonData){
		
		
		$("#score").text(jsonData.score);
		$("#dayScore").text(jsonData.dayScore);
		$("#weekScore").text(jsonData.weekScore);
		$("#monthScore").text(jsonData.monthScore);
		
		var options1 = {
				title: '하루 / 1주',
				backgroundColor : '#f0f0f0',
				titleTextStyle : {
					fontSize: 20,
					fontName:'Nanum Gothic',
				},
				chartArea : {
					left : 0,
				},
				pieSliceText : 'value',
				pieSliceTextStyle : {
					fontSize : 16,
					fontColor : '#000000',
				},
				legend : {
					position : 'none',
				},
				is3D: true
				
		};
		
		var options2 = {
				title: '1주 / 한달',
				backgroundColor : '#f0f0f0',
				titleTextStyle : {
					fontSize: 20,
					fontName:'Nanum Gothic',
				},
				chartArea : {
					left : 0,
				},
				pieSliceText : 'value',
				pieSliceTextStyle : {
					fontSize : 16,
					fontColor : '#000000',
				},
				legend : {
					position : 'none',
				},
				is3D: true
		};
		
		var options3 = {
				title: '한달 / 6개월',
				backgroundColor : '#f0f0f0',
				titleTextStyle : {
					fontSize: 20,
					fontName:'Nanum Gothic',
				},
				chartArea : {
					left : 0,
				},
				pieSliceText : 'value',
				pieSliceTextStyle : {
					fontSize : 16,
					fontColor : '#000000',
				},
				legend : {
					position : 'none',
				},
				is3D: true
		};
		
		var d = jsonData.newsInterestDay;
		var w = jsonData.newsInterestWeek;
		var m = jsonData.newsInterestMonth;
		var m6 = jsonData.newsInterest6Month;
		
		var BigDataArray1=[['항목','갯수']];
		var BigDataArray2=[['항목','갯수']];
		var BigDataArray3=[['항목','갯수']];
		
			var BigDataTrend11 = ['today',d];
			var BigDataTrend12 = ['week',w-d];
			var BigDataTrend21 = ['week',w];
			var BigDataTrend22 = ['month',m-w];
			var BigDataTrend31 = ['month',m];
			var BigDataTrend32 = ['6month',m6-m];
			BigDataArray1.push(BigDataTrend11);
			BigDataArray1.push(BigDataTrend12);
			BigDataArray2.push(BigDataTrend21);
			BigDataArray2.push(BigDataTrend22);
			BigDataArray3.push(BigDataTrend31);
			BigDataArray3.push(BigDataTrend32);
		
		
		var data1 = google.visualization.arrayToDataTable(BigDataArray1);
		var data2 = google.visualization.arrayToDataTable(BigDataArray2);
		var data3 = google.visualization.arrayToDataTable(BigDataArray3);
        var chart1 = new google.visualization.PieChart(document.getElementById('chart_div1'));
        var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
        var chart3 = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart1.draw(data1, options1);
        chart2.draw(data2, options2);
        chart3.draw(data3, options3);
        
        $(".loaderGif").hide();
		
	}//end setData
	
	</script>

</head>
<body>
<div id="banner-fade">
    <ul class="bjqs">
    
    	<li>
			<div class="content cover" style="background-color:#464040; color:white;">
	     		<h1 style="text-align:center">관심지수</h1>
	     		<br>
				<p style="text-align:center; font-size:0.8em; color:rgb(218, 218, 218);">오락가락의 관심지수는 뉴스를 파싱한 <span style="color:#009cd7; font-weight:bold">Big Data</span>를 기준으로 평가하였습니다</p>
				
				<span style="font-size:0.7em;font-weight:500;">Big Data:</span>
				
				<p>&nbsp;&nbsp;&nbsp;
				각종 인터넷 뉴스를 파싱한 정보를 저장하고 분석하여 해당 기업에 대한 언론의 관심도를 측정하고,
				구글 검색지수를 부수적으로 사용하였습니다.
				</p>
				
				<p style="font-size:0.5em; border:1px solid gray; border-radius:5px; padding:4px;">
				<span style="background:#e64a3c; padding:2px; border-radius:3px;">주의</span>
				&nbsp;관심지수는 해당 기업에 대한 관심도이므로 해당 주식의 좋고 나쁨을 절대적으로 판단할 수 없습니다.
				비교적 규모가 작은 기업에 대해 더욱 유의미한 결과를 가지는 경향이 있습니다.   
				</p>
				
				<p style="font-size:0.65em; color:rgb(218, 218, 218); line-height:1.6em; text-align:center">
				해당 기업의 관심도 변화를 기준으로 <span style="color:#e64a3c; font-weight:700;">관심도가 상승할수록</span> 관심지수를 높게 평가하였습니다
				</p>
			</div>	
        </li>
        
        <li><!-- 2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번2번 -->
        	
			<div id="desc" class="content">
			<h1 style="text-align:center;"><b>오락가락 관심지수는 <span id="score"></span>점 입니다</b></h1>
			<hr><br />

			<div style="margin:0 auto;">
				<table id="bigdatascoretable">
					<tr>
						<td><div style="width:200px;height:200px;background-color:#5F5151; color:white; border-radius:100px;float:left;margin:10px;"><br><br><br><span id=dayScore class="littleScore"></span>점</div></td>
						<td><div style="width:200px;height:200px;background-color:#5F5151; color:white; border-radius:100px;float:left;margin:10px;"><br><br><br><span id=weekScore class="littleScore"></span>점</div></td>
						<td><div style="width:200px;height:200px;background-color:#5F5151; color:white; border-radius:100px;float:left;margin:10px;"><br><br><br><span id=monthScore class="littleScore"></span>점</div></td>
					</tr>
					<tr>
						<td>오늘</td>
						<td>이번주</td>
						<td>이번달</td>
					</tr>
				</table>
			</div>
			
			<div style="display:none">
			오늘 하루의 언론관심지수 - <span id=dayScore class="littleScore"></span>/100<br/>
			이번주의 언론관심지수 -  <span id=weekScore class="littleScore"></span>/100<br/>
			이번달의 언론관심지수 -  <span id=monthScore class="littleScore"></span>/100<br/>
			</div>
			</div>
			
		</li>
		<li><!-- 1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번 -->
        	    <div id="charts" class="content">
        	 <h1><b>언론의 집중도</b></h1>
			<hr><br />   
			<div id="chart_div1"></div>
			<div id="chart_div2"></div>
			<div id="chart_div3"></div>
			</div>
        </li>
        <li ><!-- 1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번1번 -->
        	    <div id="charts" class="content">
        	     <h1><b>구글 검색지수</b></h1>
			<hr><br />   
			<div id="googleChart">
			    <script type="text/javascript" src="//www.google.co.kr/trends/embed.js?hl=ko&q=${name }&content=1&cid=TIMESERIES_GRAPH_0&export=5&w=700&h=325"></script>
			</div>
			</div>
        </li>
        
    </ul>
</div>





<div>

</div>
</body>
</html>