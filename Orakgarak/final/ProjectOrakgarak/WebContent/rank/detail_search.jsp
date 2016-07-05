<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<script src="./packaged/javascript/jquery-2.1.1.js"></script>

<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">

<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.common.min.css" rel="stylesheet" />
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.default.min.css" rel="stylesheet" />
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.min.css" rel="stylesheet" />
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.default.min.css" rel="stylesheet" />
<script src="http://cdn.kendostatic.com/2014.1.528/js/kendo.all.min.js"></script>

<!-- ----------------------------------------------------------------------------------- -->
<!-- script 시작 -->    
<script type="text/javascript">

$(document).ready(function() {
	
	$("input[type=range]").on("change",function() {
		$(this).parent().next().find("span").text($(this).val());
	});
	
	$(".checkCondition").on("change",function() {
		if($(this).is(":checked")){
			$("#limit_search").css("visibility","collapse").css("height","0px");
			$("#leastmost_search").css("visibility","visible").css("height","200px");
		}else{
			$("#leastmost_search").css("visibility","collapse").css("height","0px");
			$("#limit_search").css("visibility","visible").css("height","200px");
			
		}
		
	});
	
	//노말서치 눌렀을때는 다음과 같음.
	$("#btn_limit_search").on("click",function() {
		
		$('#search_table tbody tr:not(:first)').remove(); 
		
		$.getJSON("detail_search_limit.do",{"limitDcf" : $("#limitDcf").val(), "limitMultiple" : $("#limitMultiple").val(),
			"limitRisk" : $("#limitRisk").val(),"limitBigdata" : $("#limitBigdata").val(),"limitTrend" : $("#limitTrend").val()},function(jsonData){
				
				$(jsonData.limitSearchList).each(function(index,item){
					
					var td1=$("<td/>").append($("<a/>").attr("href","${pageContext.request.contextPath}/stock_detail.do?stockCode=" + item.stockCode).text(item.stockName + "("+ item.stockCode +")"));
					var td2=$("<td/>").text(item.scoreDcf);
					var td3=$("<td/>").text(item.scoreMultiple);
					var td4=$("<td/>").text(item.scoreRisk);
					var td5=$("<td/>").text(item.scoreBigData);
					var td6=$("<td/>").text(item.scoreTrend);
					var td7=$("<td/>").text(item.scoreDcf + item.scoreMultiple + item.scoreRisk + item.scoreBigData + item.scoreTrend);
					
					$("<tr/>").append(td1,td2,td3,td4,td5,td6,td7).appendTo("#search_table > tbody");
					
				});
				
			});//end function(jsonData)
	});//end click
	
	//고급검색눌렀을때고고
	$("#btn_leastmost_search").on("click",function() {
		
		$('#search_table tbody tr:not(:first)').remove(); 
		
		$.getJSON("detail_search_least_most.do",{"leastDcf" : $("#leastDcf").val(), "leastMultiple" : $("#leastMultiple").val(),
			"leastRisk" : $("#leastRisk").val(),"leastBigdata" : $("#leastBigdata").val(),"leastTrend" : $("#leastTrend").val(),
			"mostDcf" : $("#mostDcf").val(), "mostMultiple" : $("#mostMultiple").val(),
			"mostRisk" : $("#mostRisk").val(),"mostBigdata" : $("#mostBigdata").val(),"mostTrend" : $("#mostTrend").val()},function(jsonData){
				
				$(jsonData.leastAndMostSearchList).each(function(index,item){
					
					
					
					var td1=$("<td/>").append($("<a/>").attr("href","${pageContext.request.contextPath}/stock_detail.do?stockCode=" + item.stockCode).text(item.stockName + "("+ item.stockCode +")"));
					var td2=$("<td/>").text(item.scoreDcf);
					var td3=$("<td/>").text(item.scoreMultiple);
					var td4=$("<td/>").text(item.scoreRisk);
					var td5=$("<td/>").text(item.scoreBigData);
					var td6=$("<td/>").text(item.scoreTrend);
					var td7=$("<td/>").text(item.scoreDcf + item.scoreMultiple + item.scoreRisk + item.scoreBigData + item.scoreTrend);
					
					$("<tr/>").append(td1,td2,td3,td4,td5,td6,td7).appendTo("#search_table > tbody");
					
				});
				
			});//end function(jsonData)
	});//end click
	
});//end ready()

function createChart() {
	
	$.getJSON("rank_and_search_syn.do",function(jsonData){
	
		
	    $("#chart1_dcf").kendoChart({
	        title: {text: jsonData.dcfList[0].stockName},
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	            data: [jsonData.dcfList[0].scoreDcf, 
	                   jsonData.dcfList[0].scoreMultiple,
	                   jsonData.dcfList[0].scoreTrend, 
	                   jsonData.dcfList[0].scoreBigData, 
	                   jsonData.dcfList[0].scoreRisk]
	        }],
	        categoryAxis: {
	            categories: ["DCF", "Multiple", "Trend","BigData", "Risk"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	   
	});
	
}

$(document).ready(createChart);
$(document).bind("kendo:skinChange", createChart);

</script>
<!-- ----------------------------------------------------------------------------------- -->

<!-- style시작 -->
<style>

.category_wrapper {
	position	: relative;
	width : 930px;
	height : 400px;
	background-color : #white;
	padding : 20px;
	border-radius : 10px;
	margin : 20px auto;
	-moz-box-shadow: 7px 7px 5px #c7c7c7;
	-webkit-box-shadow: 7px 7px 5px #c7c7c7;
	box-shadow: 7px 7px 5px #c7c7c7;
	border-style:solid;
	border-color: #eaeaea;
	border-width: 3px;
	box-sizing :border-box;
}
#pentagon_search{
	width: 900px;
	margin: 0 auto;
}
#search_wrapper {
	position: relative;
	width : 930px;
	height:320px;
	background-color : #white;
	padding : 20px;
	border-radius : 10px;
	margin : 20px auto;
	-moz-box-shadow: 7px 7px 5px #c7c7c7;
	-webkit-box-shadow: 7px 7px 5px #c7c7c7;
	box-shadow: 7px 7px 5px #c7c7c7;
	border-style:solid;
	border-color: #eaeaea;
	border-width: 3px;
	box-sizing :border-box;
}

#search_wrapper > #search_content {
	width: 651px;
margin: 0px auto;
}

#search_table {
	position: relative;
	width : 880px;
	background-color : #white;
	padding : 20px;
	border-radius : 10px;
	margin : 20px auto;
	-moz-box-shadow: 7px 7px 5px #c7c7c7;
	-webkit-box-shadow: 7px 7px 5px #c7c7c7;
	box-shadow: 7px 7px 5px #c7c7c7;
	border-style:solid;
	border-color: #eaeaea;
	border-width: 3px;
	box-sizing :border-box;
	text-align: center;
}
.chart {
	float:left;
	width:200px;
	height:200px;
}

#btn_leastmost_search, #btn_limit_search{
	background: #e74c3c;
	border: none;
	border-radius: 3px;
	color: white;
	font-size: 15px;
	font-weight: 700;
	width: 80px;
	height: 35px;
	margin-top: 15px;
	cursor: pointer;
}
.ui.header{
	width: 900px;
	margin: 0 auto;
}
.ui.header:first-child {
	margin-top: 30px;
}



input[type=range]{
width : 500px;
}

.search{
width : 651px;
margin : 0px auto;
position:relative;
}

.search input[type=button]{
position : absolute;
right : 2px;
}



</style>
<!-- ----------------------------------------------------------------------------------- -->


<!-- body div시작 -->
<div style="min-height: 620px">

<div id="body_wrapper">
<div id="pentagon_search">
<h2><i class="purple search icon"></i> 펜타곤 맞춤검색</h2>
<hr>
<!-- <div class="ui header">
	<span style="padding:10px;background-color: #575E61; color:white">
		<i class="search icon"></i> 펜타곤 맞춤검색
	</span>
</div> -->
</div>


<div id="search_wrapper">
<div id="search_content">
<input type="checkbox" class="checkCondition">상세조건(상한선지정)<br/>
<br/>
<div id="limit_search" style="visibility: visible;" class="search">

<table>
<tr>
<th>펜타곤 꼭지</th>
<th colspan="2">기준</th>
</tr>

<tr>
<td>DCF</td><td><input type="range" id="limitDcf" max="100" min="0"></td><td><span id="spanDcf">50</span> 이상</td>
</tr>
<tr>
<td>Multiple</td><td><input type="range" id="limitMultiple" max="100" min="0"></td><td><span id="spanMultiple">50</span> 이상</td>
</tr>
<tr>
<td>Risk</td><td><input type="range" id="limitRisk" max="100" min="0"></td><td><span id="spanRisk">50</span> 이상</td>
</tr>
<tr>
<td>BigData</td><td><input type="range" id="limitBigdata" max="100" min="0"></td><td><span id="spanBigdata">50</span> 이상</td>
</tr>
<tr>
<td>Trend</td><td><input type="range" id="limitTrend" max="100" min="0"></td><td><span id="spanTrend">50</span> 이상</td>
</tr>

</table>

<input type="button" id="btn_limit_search" value="상세검색">
</div>

<div id="leastmost_search" style="visibility: collapse; height:0px;" class="search">
<table>
<tr>
<th>펜타곤 꼭지</th>
<th colspan="2">기준</th>
</tr>
<tr>
<td>DCF</td><td><input type="number" id="leastDcf"> 이상</td> <td><input type="number" id="mostDcf">이하</td> 
</tr>
<tr>
<td>Multiple</td><td><input type="number" id="leastMultiple"> 이상</td> <td><input type="number" id="mostMultiple">이하</td> 
</tr>
<tr>
<td>Risk</td><td><input type="number" id="leastRisk"> 이상</td> <td><input type="number" id="mostRisk">이하</td> 
</tr>
<tr>
<td>BigData</td><td><input type="number" id="leastBigdata"> 이상</td> <td><input type="number" id="mostBigdata">이하</td> 
</tr>
<tr>
<td>Trend</td><td><input type="number" id="leastTrend"> 이상</td> <td><input type="number" id="mostTrend">이하</td> 
</tr>

</table>
<input type="button" id="btn_leastmost_search" value="상세검색">
</div>
</div>
</div>

<div>
<table id="search_table" class="ui collapsing table segment">
<tr>
<th>종목명</th>
<th>DCF</th>
<th>Multiple</th>
<th>Risk</th>
<th>BigData</th>
<th>Trend</th>
<th>합계</th>
</tr>
</table>
</div>


</div>
<!-- 차트넣게되면 여기다 추가할거임
<div class="category_wrapper">
<div class="chart" id="chart5_trend"></div>
</div> 
-->

</div>
<!-- ----------------------------------------------------------------------------------- -->



















