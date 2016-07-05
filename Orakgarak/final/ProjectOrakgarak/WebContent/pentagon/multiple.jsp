<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">
<script src="${pageContext.request.contextPath }/js/report_slider/bjqs-1.3.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/bjqs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/demo.css">
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css' />
<title>Insert title here</title>
<style type="text/css">
.nindustrycodes{
	margin:10px;
}

.content{
height: 470px;
margin: 0px auto;
padding : 10px 75px 10px 75px;
background-color: #f0f0f0;
	border-radius : 30px 30px 30px 30px;
	font-family: 'Nanum Gothic';
	font-size: 25px;
width:696px;
border: 2px solid #C7C4C4;
}

#chart_div1_multiple{
	left : -98px;
	top : -10px;
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

.content.detail p{
	 font-size:1.2em;
	 line-height:1.6em;
}

.content.detail td{
	padding:0 5px 0 5px;
}

#won{
	position: absolute;
	font-size:0.5em;
	font-weight:bold;
	left: 700px;
	top: 455px;
}

.caltitle{
	text-align: center;
	font-size:0.7em;
}

.caltitle.exclamation{
	cursor: help;
}

</style>
<script type="text/javascript">


	$(document).ready(function() {
		
		$('#banner-fade').bjqs({
		    height      : 500,
		    width       : 850,
		    responsive  : true
		  });
		
		$("button").click(function() {
			$('#nindustry').children().remove();
			$('#multipleList').children().remove();
			$.getJSON("${pageContext.request.contextPath}/category.do",
					{"kindustryCode" : $(this).attr("kindustryCode")
			}, function(jsonObj) {
				if (jsonObj.status) {
					$(jsonObj.categoryList).each(function(index, item) {
						var code=item.key;
						var name=item.value;
						
						$('<span/>').html(name).attr('nindustryCode',code).attr('class','nindustrycodes').appendTo('#nindustry');
					});
				} else {

				}
			});

		});
		
		$(document).on("click","#nindustry span",function() {
			$.getJSON("${pageContext.request.contextPath}/industry_multiple.do",
					{"nindustryCode" : $(this).attr("nindustryCode")},
				function(jsonObj){
						if(jsonObj.status){
							$(jsonObj.multipleList).each(function(index,item){
								var td1=$('<td/>').html(item.stockName);
								var td2=$('<td/>').html(item.multipleResult);
								var tr=$('<tr/>').append(td1,td2);
								
								tr.appendTo('#multipleList');
							});
						}else{
							
						};
					});
		});
		
		
		$(".red.exclamation.inverted.circular.icon.link.multiple")
			.popup({
				transition: value,
				inline: true
			});
		
		
	});
	
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	google.setOnLoadCallback(drawVisualization);
	
	function drawChart() {
		var options1 = {
					backgroundColor : '#f0f0f0',
				hAxis : {
					slantedText : true,
					slantedTextAngle : 30,
					textStyle : {
						fontSize : 15,
						fontName : 'Nanum Gothic',
						bold : true
					}
				},
				legend : {
					position : 'none',
				},
				width : 900,
				height : 350
					
		};
		var multipleArray=[['주식','Multiple',{role : 'style'}]];
		multipleArray.push(['현재기업',Math.round("${multiple.multipleResult}"),'color:red']);
		$(".stockName").each(function(index, item){
			multipleArray.push([$(this).text(),Math.round($(this).next().text()),'color:#76A7FA']);
		});
		
		var data1 = google.visualization.arrayToDataTable(multipleArray);
        var chart1 = new google.visualization.ColumnChart(document.getElementById('chart_div1_multiple'));
        chart1.draw(data1, options1);
        $(".loaderGif").hide();
		
	}//end drawChart()
	
	
	/* */
	
	function drawVisualization() {
		var options1 = {
				backgroundColor : '#f0f0f0',
			hAxis : {
				slantedText : true,
				slantedTextAngle :1,
				textStyle : {
					fontSize : 13,
					fontName : 'Nanum Gothic',
					bold : true
				}
			},
			legend : {
				position : 'none',
			},
			width : 900,
			height : 350
		};
	  // Create and populate the data table.
	  var data = google.visualization.arrayToDataTable([
	    ['Year', '산업평균', '해당기업'],
	    ['2014',  36, 25],
	    ['2015',  35, 30],
	    ['2016',  35, 28],
	    ['2017',  36, 29],
	    ['2018',  36, 33]
	  ]);

  // Create and draw the visualization.
  	var chart2=new google.visualization.ColumnChart(document.getElementById('chart_div2_multiple'));
  	chart2.draw(data, options1);
  	}
	
	
	

</script>
</head>
<body>

<div id="banner-fade">
    <ul class="bjqs">
        
        <li>
			<div class="content cover" style="background-color:#464040; color:white;">
	     		<h1 style="text-align:center">수익성</h1>
	     		
				<p style="text-align:center; font-size:0.8em; color:rgb(218, 218, 218);">오락가락의 수익성은 금융 공학 모델 <span style="color:#009cd7; font-weight:bold">Multiple</span>을 기준으로 평가하였습니다</p>
				
				<span style="font-size:0.7em;font-weight:500;">Multiple:</span>
				
				<p>&nbsp;&nbsp;&nbsp;최근의 주가를 기준으로 EBIT, EBITDA, EAT, EBT 등과 비교하여 구한 시가 배수(market multiple)를
				평가대상회사의 재무 수치에 적용시켜 가치를 산출하는 방법입니다.
				한 해에 벌어들이는 현금으로 타인에게 빌린 자본규모를 나눈것으로,
				쉽게 해석을 하면 '빌린자본을 100% 갚는데 걸리는 년도 수'라고 볼 수 있습니다.
				동일한 산업의 다른 기업보다 값이 <span style="color:white; font-weight:700;">낮은경우</span>, 수익창출력이 <span style="color:white; font-weight:700;">뛰어나다</span>고 해석할 수 있습니다.
				</p>
				<p style="font-size:0.5em; border:1px solid gray; border-radius:5px; padding:4px;">
				<span style="background:#e64a3c; padding:2px; border-radius:3px;">주의</span>&nbsp;Multiple 모델은 기업이 적자상태에 있는 경우 값을 정확하게 분석할 수 없다는 한계를 가지고 있습니다. 따라서 값이 낮을수록 좋은 수익성을 가지고 있다고 할 수 있지만 Multiple값이 마이너스인 경우 해당 기업이 적자 상태에 있으며 수익성을 정확하게 평가할 수 없습니다.
				</p>
				<p style="font-size:0.65em; color:rgb(218, 218, 218); line-height:1.6em; text-align:center">
				오락가락에서는 동종 산업 대비 <span style="color:#e64a3c; font-weight:700;">Multiple값이 낮을 수록</span> 수익성 점수를 높게 평가하였습니다
				</p>
				
			</div>	
        </li>
        
        <li>
			<div class="content detail">
 				<h1 style="text-align:center">수익성 점수는 <span id="score">${multiple.score }</span>점 입니다</h1>
				<hr>
				<p>Multiple값 : <span id = "score">${multiple.multipleResult }</span></p>
				<h3 style="margin-bottom:0;">산업평균 : <fmt:formatNumber>${industry.multiple }</fmt:formatNumber></h3>
				<span style="font-size:0.6em; font-weight:bold">(${industry.wicsname })</span>
				
				<table style="width:381px;background-color:#A39B9B; padding:15px; color:rgb(80, 73, 73);border-radius:10px; text-align:right; margin-left:300px; position:absolute; margin-top:-161px">
				<tr>
					<td class="caltitle"><b>부채</b></td>
					<td><fmt:formatNumber>${multiple.debt }</fmt:formatNumber></td>
				</tr>
				<tr>
					<td class="caltitle"><b>현금</b></td>
					<td><fmt:formatNumber>${multiple.cash }</fmt:formatNumber></td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td class="caltitle exclamation" title="총부채에서 현금 및 현금성자산을 뺀 금액입니다" data-variation="large"><b>순부채</b></td>
					<td><fmt:formatNumber>${multiple.netDebt }</fmt:formatNumber></td>
				</tr>
				<tr>
					<td class="caltitle exclamation" title="시가총액은 실시간으로 업데이트 됩니다" data-variation="large"><b>시가총액</b></td>
					<td><fmt:formatNumber>${multiple.marketValue }</fmt:formatNumber></td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td class="caltitle exclamation" title="순부채에 시가총액을 더한 금액입니다" data-variation="large"><b>EV</b></td>
					<td><fmt:formatNumber>${multiple.ev }</fmt:formatNumber></td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td class="caltitle exclamation" title="법인세 차감 전 순이익으로 EV를 이 값으로 나눠 Multiple값을 구합니다" data-variation="large"><b>EBITDA</b></td>
					<td><fmt:formatNumber>${multiple.ebitda }</fmt:formatNumber></td>
				</tr>
			</table>
			<span id="won">(단위:원)</span>
			<div style="visibility: collapse;">
			    <table>
					<tr>
						<th>Company</th>
						<th>Multiple</th>
					</tr>
					<c:choose>
						<c:when test="${not empty multipleList }">
							<c:forEach items="${multipleList}" var="list">
								<tr>
									<td class="stockName">${list.stockName }</td>
									<td class="stockMultiple">${list.multipleResult }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2">없음</td>
							</tr>
						</c:otherwise>
					</c:choose>
			
				</table>
		   	</div>
				
			</div>
        </li>
 <%--        <li>
	        <div class="content detail" >
	        <h1>Multiple 계산식</h1>
					<hr>
			<div style="float:left; margin:90px;">
				<b>Multiple</b>
				<h1 style="margin-top:5px">${multiple.multipleResult }</h1>
			</div>		
			<div>		
		        <table style="text-align:right; margin-left:300px;">
				<tr>
					<td><b>부채</b></td>
					<td><fmt:formatNumber>${multiple.debt }</fmt:formatNumber>원</td>
				</tr>
				<tr>
					<td><b>현금</b></td>
					<td><fmt:formatNumber>${multiple.cash }</fmt:formatNumber>원</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td><b>순부채</b></td>
					<td><fmt:formatNumber>${multiple.netDebt }</fmt:formatNumber>원</td>
				</tr>
				<tr>
					<td><b>시가총액</b></td>
					<td><fmt:formatNumber>${multiple.marketValue }</fmt:formatNumber>원</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td><b>EV</b></td>
					<td><fmt:formatNumber>${multiple.ev }</fmt:formatNumber>원</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td><b>EBITDA</b></td>
					<td><fmt:formatNumber>${multiple.ebitda }</fmt:formatNumber>원</td>
				</tr>
			</table>
		
			 <div style="visibility: collapse;">
			    <table>
					<tr>
						<th>Company</th>
						<th>Multiple</th>
					</tr>
					<c:choose>
						<c:when test="${not empty multipleList }">
							<c:forEach items="${multipleList}" var="list">
								<tr>
									<td class="stockName">${list.stockName }</td>
									<td class="stockMultiple">${list.multipleResult }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2">없음</td>
							</tr>
						</c:otherwise>
					</c:choose>
			
				</table>
		   	</div>
			</div>
		</div>
	</li> --%>
    <li>
	    <div class="content">
		    <h1>동일산업 Multiple 비교&nbsp;&nbsp;</h1>
		    <!-- <a href="#" name="MicrosoftExcelButton" data-xl-tableTitle="Multiples" data-xl-buttonStyle="Small" data-xl-fileName="Book1" data-xl-attribution="Data provided by Orakgarak.com" ></a> -->
		    <hr>
	    <div id="chart_div1_multiple">
	    </div>
	    
	  	</div>
    </li>    
</ul> 
    
</div>

<script type="text/javascript" src="http://r.office.microsoft.com/r/rlidExcelButton?v=1&kip=2"></script> 
<div style="visibility: collapse;">
	

	<div id="kindustry">
		<button kindustryCode="8001">음식료품</button>
		<button kindustryCode="8002">운수장비</button>
		<button kindustryCode="8003">전기전자</button>
		<button kindustryCode="8004">화학</button>
		<button kindustryCode="8005">섬유의복</button>
		<button kindustryCode="8006">서비스업</button>
		<button kindustryCode="8007">전기가스업</button>
		<button kindustryCode="8008">비금속광물</button>
		<button kindustryCode="8009">유통업</button>
		<button kindustryCode="8010">의료정밀</button>
		<button kindustryCode="8011">의약품</button>
		<button kindustryCode="8012">종이목재</button>
		<button kindustryCode="8013">통신업</button>
		<button kindustryCode="8014">금융업</button>
		<button kindustryCode="8015">철강금속</button>
		<button kindustryCode="8016">운수창고업</button>
		<button kindustryCode="8017">기계</button>
		<button kindustryCode="8018">건설업</button>
		<button kindustryCode="8019">기타</button>
	</div>

	<div id="nindustry">
		
	</div>
	
	<div id="multipleList">
		
	</div>
	</div>
</body>
</html>