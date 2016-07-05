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
	
	
	//노말서치 눌렀을때는 다음과 같음.
	$("#btn_limit_search").on("click",function() {
		$.getJSON("detail_search_limit.do",{"limitDcf" : $("#limitDcf").val(), "limitMultiple" : $("#limitMultiple").val(),
			"limitRisk" : $("#limitRisk").val(),"limitBigdata" : $("#limitBigdata").val(),"limitTrend" : $("#limitTrend").val()},function(jsonData){
				
				
			});//end function(jsonData)
	});//end click
	
});//end ready()

function createChart() {
	
	$.getJSON("rank_and_search_syn.do",function(jsonData){
	
		$("#chart1_title_dcf").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.dcfList[0].stockCode).text( 
								jsonData.dcfList[0].stockName +
					"("+ jsonData.dcfList[0].stockCode +")"));
		$("#chart2_title_dcf").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.dcfList[1].stockCode).text( 
								jsonData.dcfList[1].stockName +
					"("+ jsonData.dcfList[1].stockCode +")"));
		$("#chart3_title_dcf").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.dcfList[2].stockCode).text( 
								jsonData.dcfList[2].stockName +
					"("+ jsonData.dcfList[2].stockCode +")"));
		$("#chart4_title_dcf").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.dcfList[3].stockCode).text( 
								jsonData.dcfList[3].stockName +
					"("+ jsonData.dcfList[3].stockCode +")"));
		$("#chart5_title_dcf").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.dcfList[4].stockCode).text( 
								jsonData.dcfList[4].stockName +
					"("+ jsonData.dcfList[4].stockCode +")"));
		$("#chart6_title_dcf").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.dcfList[5].stockCode).text( 
								jsonData.dcfList[5].stockName +
					"("+ jsonData.dcfList[5].stockCode +")"));
		
		
		$("#chart1_title_multiple").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.multipleList[0].stockCode).text( 
								jsonData.multipleList[0].stockName +
					"("+ jsonData.multipleList[0].stockCode +")"));
		$("#chart2_title_multiple").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.multipleList[1].stockCode).text( 
								jsonData.multipleList[1].stockName +
					"("+ jsonData.multipleList[1].stockCode +")"));
		$("#chart3_title_multiple").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.multipleList[2].stockCode).text( 
								jsonData.multipleList[2].stockName +
					"("+ jsonData.multipleList[2].stockCode +")"));
		$("#chart4_title_multiple").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.multipleList[3].stockCode).text( 
								jsonData.multipleList[3].stockName +
					"("+ jsonData.multipleList[3].stockCode +")"));
		$("#chart5_title_multiple").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.multipleList[4].stockCode).text( 
								jsonData.multipleList[4].stockName +
					"("+ jsonData.multipleList[4].stockCode +")"));
		$("#chart6_title_multiple").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.multipleList[5].stockCode).text( 
								jsonData.multipleList[5].stockName +
					"("+ jsonData.multipleList[5].stockCode +")"));
		
		
		
		$("#chart1_title_risk").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.riskList[0].stockCode).text( 
								jsonData.riskList[0].stockName +
					"("+ jsonData.riskList[0].stockCode +")"));
		$("#chart2_title_risk").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.riskList[1].stockCode).text( 
								jsonData.riskList[1].stockName +
					"("+ jsonData.riskList[1].stockCode +")"));
		$("#chart3_title_risk").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.riskList[2].stockCode).text( 
								jsonData.riskList[2].stockName +
					"("+ jsonData.riskList[2].stockCode +")"));
		$("#chart4_title_risk").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.riskList[3].stockCode).text( 
								jsonData.riskList[3].stockName +
					"("+ jsonData.riskList[3].stockCode +")"));
		$("#chart5_title_risk").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.riskList[4].stockCode).text( 
								jsonData.riskList[4].stockName +
					"("+ jsonData.riskList[4].stockCode +")"));
		$("#chart6_title_risk").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.riskList[5].stockCode).text( 
								jsonData.riskList[5].stockName +
					"("+ jsonData.riskList[5].stockCode +")"));
		
		
		
		$("#chart1_title_bigdata").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.bigdataList[0].stockCode).text( 
								jsonData.bigdataList[0].stockName +
					"("+ jsonData.bigdataList[0].stockCode +")"));
		$("#chart2_title_bigdata").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.bigdataList[1].stockCode).text( 
								jsonData.bigdataList[1].stockName +
					"("+ jsonData.bigdataList[1].stockCode +")"));
		$("#chart3_title_bigdata").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.bigdataList[2].stockCode).text( 
								jsonData.bigdataList[2].stockName +
					"("+ jsonData.bigdataList[2].stockCode +")"));
		$("#chart4_title_bigdata").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.bigdataList[3].stockCode).text( 
								jsonData.bigdataList[3].stockName +
					"("+ jsonData.bigdataList[3].stockCode +")"));
		$("#chart5_title_bigdata").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.bigdataList[4].stockCode).text( 
								jsonData.bigdataList[4].stockName +
					"("+ jsonData.bigdataList[4].stockCode +")"));
		$("#chart6_title_bigdata").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.bigdataList[5].stockCode).text( 
								jsonData.bigdataList[5].stockName +
					"("+ jsonData.bigdataList[5].stockCode +")"));
		
		
		
		$("#chart1_title_trend").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.trendList[0].stockCode).text( 
								jsonData.trendList[0].stockName +
					"("+ jsonData.trendList[0].stockCode +")"));
		$("#chart2_title_trend").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.trendList[1].stockCode).text( 
								jsonData.trendList[1].stockName +
					"("+ jsonData.trendList[1].stockCode +")"));
		$("#chart3_title_trend").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.trendList[2].stockCode).text( 
								jsonData.trendList[2].stockName +
					"("+ jsonData.trendList[2].stockCode +")"));
		$("#chart4_title_trend").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.trendList[3].stockCode).text( 
								jsonData.trendList[3].stockName +
					"("+ jsonData.trendList[3].stockCode +")"));
		$("#chart5_title_trend").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.trendList[4].stockCode).text( 
								jsonData.trendList[4].stockName +
					"("+ jsonData.trendList[4].stockCode +")"));
		$("#chart6_title_trend").append($("<a/>").attr("href",
				"${pageContext.request.contextPath}/stock_detail.do?stockCode="
						+ jsonData.trendList[5].stockCode).text( 
								jsonData.trendList[5].stockName +
					"("+ jsonData.trendList[5].stockCode +")"));
		
		
		
	    $("#chart1_dcf").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	            data: [jsonData.dcfList[0].scoreDcf, 
	                   jsonData.dcfList[0].scoreMultiple,
	                   jsonData.dcfList[0].scoreTrend, 
	                   jsonData.dcfList[0].scoreBigData, 
	                   jsonData.dcfList[0].scoreRisk],
	                   color: "red"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	   
	    $("#chart2_dcf").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.dcfList[1].scoreDcf, 
	                   jsonData.dcfList[1].scoreMultiple,
	                   jsonData.dcfList[1].scoreTrend, 
	                   jsonData.dcfList[1].scoreBigData, 
	                   jsonData.dcfList[1].scoreRisk],
	                   color: "red"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart3_dcf").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.dcfList[2].scoreDcf, 
	                   jsonData.dcfList[2].scoreMultiple,
	                   jsonData.dcfList[2].scoreTrend, 
	                   jsonData.dcfList[2].scoreBigData, 
	                   jsonData.dcfList[2].scoreRisk],
	                   color: "red"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart4_dcf").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.dcfList[3].scoreDcf, 
	                   jsonData.dcfList[3].scoreMultiple,
	                   jsonData.dcfList[3].scoreTrend, 
	                   jsonData.dcfList[3].scoreBigData, 
	                   jsonData.dcfList[3].scoreRisk],
	                   color: "red"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart5_dcf").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.dcfList[4].scoreDcf, 
	                   jsonData.dcfList[4].scoreMultiple,
	                   jsonData.dcfList[4].scoreTrend, 
	                   jsonData.dcfList[4].scoreBigData, 
	                   jsonData.dcfList[4].scoreRisk],
	                   color: "red"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart6_dcf").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.dcfList[5].scoreDcf, 
	                   jsonData.dcfList[5].scoreMultiple,
	                   jsonData.dcfList[5].scoreTrend, 
	                   jsonData.dcfList[5].scoreBigData, 
	                   jsonData.dcfList[5].scoreRisk],
	                   color: "red"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart1_multiple").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.multipleList[0].scoreDcf, 
	                   jsonData.multipleList[0].scoreMultiple,
	                   jsonData.multipleList[0].scoreTrend, 
	                   jsonData.multipleList[0].scoreBigData, 
	                   jsonData.multipleList[0].scoreRisk],
	                   color: "blue"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart2_multiple").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.multipleList[1].scoreDcf, 
	                   jsonData.multipleList[1].scoreMultiple,
	                   jsonData.multipleList[1].scoreTrend, 
	                   jsonData.multipleList[1].scoreBigData, 
	                   jsonData.multipleList[1].scoreRisk],
	                   color: "blue"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart3_multiple").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.multipleList[2].scoreDcf, 
	                   jsonData.multipleList[2].scoreMultiple,
	                   jsonData.multipleList[2].scoreTrend, 
	                   jsonData.multipleList[2].scoreBigData, 
	                   jsonData.multipleList[2].scoreRisk],
	                   color: "blue"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart4_multiple").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.multipleList[3].scoreDcf, 
	                   jsonData.multipleList[3].scoreMultiple,
	                   jsonData.multipleList[3].scoreTrend, 
	                   jsonData.multipleList[3].scoreBigData, 
	                   jsonData.multipleList[3].scoreRisk],
	                   color: "blue"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart5_multiple").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.multipleList[4].scoreDcf, 
	                   jsonData.multipleList[4].scoreMultiple,
	                   jsonData.multipleList[4].scoreTrend, 
	                   jsonData.multipleList[4].scoreBigData, 
	                   jsonData.multipleList[4].scoreRisk],
	                   color: "blue"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart6_multiple").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.multipleList[5].scoreDcf, 
	                   jsonData.multipleList[5].scoreMultiple,
	                   jsonData.multipleList[5].scoreTrend, 
	                   jsonData.multipleList[5].scoreBigData, 
	                   jsonData.multipleList[5].scoreRisk],
	                   color: "blue"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart1_risk").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.riskList[0].scoreDcf, 
	                   jsonData.riskList[0].scoreMultiple,
	                   jsonData.riskList[0].scoreTrend, 
	                   jsonData.riskList[0].scoreBigData, 
	                   jsonData.riskList[0].scoreRisk],
	                   color: "orange"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart2_risk").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.riskList[1].scoreDcf, 
	                   jsonData.riskList[1].scoreMultiple,
	                   jsonData.riskList[1].scoreTrend, 
	                   jsonData.riskList[1].scoreBigData, 
	                   jsonData.riskList[1].scoreRisk],
	                   color: "orange"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart3_risk").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.riskList[2].scoreDcf, 
	                   jsonData.riskList[2].scoreMultiple,
	                   jsonData.riskList[2].scoreTrend, 
	                   jsonData.riskList[2].scoreBigData, 
	                   jsonData.riskList[2].scoreRisk],
	                   color: "orange"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart4_risk").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.riskList[3].scoreDcf, 
	                   jsonData.riskList[3].scoreMultiple,
	                   jsonData.riskList[3].scoreTrend, 
	                   jsonData.riskList[3].scoreBigData, 
	                   jsonData.riskList[3].scoreRisk],
	                   color: "orange"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart5_risk").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.riskList[4].scoreDcf, 
	                   jsonData.riskList[4].scoreMultiple,
	                   jsonData.riskList[4].scoreTrend, 
	                   jsonData.riskList[4].scoreBigData, 
	                   jsonData.riskList[4].scoreRisk],
	                   color: "orange"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart6_risk").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.riskList[5].scoreDcf, 
	                   jsonData.riskList[5].scoreMultiple,
	                   jsonData.riskList[5].scoreTrend, 
	                   jsonData.riskList[5].scoreBigData, 
	                   jsonData.riskList[5].scoreRisk],
	                   color: "orange"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart1_bigdata").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.bigdataList[0].scoreDcf, 
	                   jsonData.bigdataList[0].scoreMultiple,
	                   jsonData.bigdataList[0].scoreTrend, 
	                   jsonData.bigdataList[0].scoreBigData, 
	                   jsonData.bigdataList[0].scoreRisk],
	                   color: "green"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart2_bigdata").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.bigdataList[1].scoreDcf, 
	                   jsonData.bigdataList[1].scoreMultiple,
	                   jsonData.bigdataList[1].scoreTrend, 
	                   jsonData.bigdataList[1].scoreBigData, 
	                   jsonData.bigdataList[1].scoreRisk],
	                   color: "green"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart3_bigdata").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.bigdataList[2].scoreDcf, 
	                   jsonData.bigdataList[2].scoreMultiple,
	                   jsonData.bigdataList[2].scoreTrend, 
	                   jsonData.bigdataList[2].scoreBigData, 
	                   jsonData.bigdataList[2].scoreRisk],
	                   color: "green"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart4_bigdata").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.bigdataList[3].scoreDcf, 
	                   jsonData.bigdataList[3].scoreMultiple,
	                   jsonData.bigdataList[3].scoreTrend, 
	                   jsonData.bigdataList[3].scoreBigData, 
	                   jsonData.bigdataList[3].scoreRisk],
	                   color: "green"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart5_bigdata").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.bigdataList[4].scoreDcf, 
	                   jsonData.bigdataList[4].scoreMultiple,
	                   jsonData.bigdataList[4].scoreTrend, 
	                   jsonData.bigdataList[4].scoreBigData, 
	                   jsonData.bigdataList[4].scoreRisk],
	                   color: "green"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart6_bigdata").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.bigdataList[5].scoreDcf, 
	                   jsonData.bigdataList[5].scoreMultiple,
	                   jsonData.bigdataList[5].scoreTrend, 
	                   jsonData.bigdataList[5].scoreBigData, 
	                   jsonData.bigdataList[5].scoreRisk],
	                   color: "green"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart1_trend").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.trendList[0].scoreDcf, 
	                   jsonData.trendList[0].scoreMultiple,
	                   jsonData.trendList[0].scoreTrend, 
	                   jsonData.trendList[0].scoreBigData, 
	                   jsonData.trendList[0].scoreRisk],
	                   color: "yellow"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart2_trend").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.trendList[1].scoreDcf, 
	                   jsonData.trendList[1].scoreMultiple,
	                   jsonData.trendList[1].scoreTrend, 
	                   jsonData.trendList[1].scoreBigData, 
	                   jsonData.trendList[1].scoreRisk],
	                   color: "yellow"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart3_trend").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.trendList[2].scoreDcf, 
	                   jsonData.trendList[2].scoreMultiple,
	                   jsonData.trendList[2].scoreTrend, 
	                   jsonData.trendList[2].scoreBigData, 
	                   jsonData.trendList[2].scoreRisk],
	                   color: "yellow"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart4_trend").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.trendList[3].scoreDcf, 
	                   jsonData.trendList[3].scoreMultiple,
	                   jsonData.trendList[3].scoreTrend, 
	                   jsonData.trendList[3].scoreBigData, 
	                   jsonData.trendList[3].scoreRisk],
	                   color: "yellow"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    });
	    
	    $("#chart5_trend").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.trendList[4].scoreDcf, 
	                   jsonData.trendList[4].scoreMultiple,
	                   jsonData.trendList[4].scoreTrend, 
	                   jsonData.trendList[4].scoreBigData, 
	                   jsonData.trendList[4].scoreRisk],
	                   color: "yellow"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
	            majorGridLines: {visible: false}
	        },
	        valueAxis: {
	            labels: {
	                format: "{0}"
	            },
	            line: {visible: false}
	        }
	    }); 
	    
	    $("#chart6_trend").kendoChart({
	        seriesDefaults: {type: "radarArea"},
	        series: [{
	        	data: [jsonData.trendList[5].scoreDcf, 
	                   jsonData.trendList[5].scoreMultiple,
	                   jsonData.trendList[5].scoreTrend, 
	                   jsonData.trendList[5].scoreBigData, 
	                   jsonData.trendList[5].scoreRisk],
	                   color: "yellow"
	        }],
	        categoryAxis: {
	            categories: ["기업가치", "수익성", "최근추세","관심지수", "안정성"],
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
	height : 780px;
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

.stock_wrapper{
	display: inline;
	
}
.chart {
	float:left;
	width:290px;
	height:290px;
}

h3{
	margin-left: 20px;
}
.ui.header{
	width: 900px;
	margin: 0 auto;
}
.ui.header:first-child {
	margin-top: 30px;
}

.stock_wrapper{
	height: 300px;
width: 290px;
float: left;
	text-align: center;
	margin-top : 20px;
}

</style>
<!-- ----------------------------------------------------------------------------------- -->


<!-- body div시작 -->
<div id="body_wrapper">


<div id="rank_wrapper">
<h2 style="width:900px; margin: 10px auto; padding:10px"><i class="trophy icon" style="color: gold"></i>펜타곤 종목별 상위</h2>
<hr style="width:900px">
<!-- <div class="ui header">
	<span style="padding: 10px;background-color: #575E61; color:white">
		<i class="trophy icon"></i> 펜타곤 종목별 상위
	</span>
</div> -->
<div class="category_wrapper">
<h2>기업가치(Discount Cash Flow Model) Top6</h2>
<hr>
<div class="stock_wrapper">
<div id="chart1_title_dcf"></div>
<div class="chart" id="chart1_dcf"></div>

</div>
<div class="stock_wrapper">
<div id="chart2_title_dcf"></div>
<div class="chart" id="chart2_dcf"></div>

</div>
<div class="stock_wrapper">
<div id="chart3_title_dcf"></div>
<div class="chart" id="chart3_dcf"></div>

</div>
<div class="stock_wrapper">
<div id="chart4_title_dcf"></div>
<div class="chart" id="chart4_dcf"></div>

</div>
<div class="stock_wrapper">
<div id="chart5_title_dcf"></div>
<div class="chart" id="chart5_dcf"></div>

</div>
<div class="stock_wrapper">
<div id="chart6_title_dcf"></div>
<div class="chart" id="chart6_dcf"></div>

</div>

</div>

<div class="category_wrapper">
<h2>수익성(Multiple Model) Top6</h2>
<hr>

<div class="stock_wrapper">
<div id="chart1_title_multiple"></div>
<div class="chart" id="chart1_multiple"></div>

</div>
<div class="stock_wrapper">
<div id="chart2_title_multiple"></div>
<div class="chart" id="chart2_multiple"></div>

</div>
<div class="stock_wrapper">
<div id="chart3_title_multiple"></div>
<div class="chart" id="chart3_multiple"></div>

</div>
<div class="stock_wrapper">
<div id="chart4_title_multiple"></div>
<div class="chart" id="chart4_multiple"></div>

</div>
<div class="stock_wrapper">
<div id="chart5_title_multiple"></div>
<div class="chart" id="chart5_multiple"></div>

</div>
<div class="stock_wrapper">
<div id="chart6_title_multiple"></div>
<div class="chart" id="chart6_multiple"></div>

</div>

</div>

<div class="category_wrapper">
<h2>안정성(Value At Risk) Top6</h2>
<hr>

<div class="stock_wrapper">
<div id="chart1_title_risk"></div>
<div class="chart" id="chart1_risk"></div>

</div>
<div class="stock_wrapper">
<div id="chart2_title_risk"></div>
<div class="chart" id="chart2_risk"></div>

</div>
<div class="stock_wrapper">
<div id="chart3_title_risk"></div>
<div class="chart" id="chart3_risk"></div>

</div>
<div class="stock_wrapper">
<div id="chart4_title_risk"></div>
<div class="chart" id="chart4_risk"></div>

</div>
<div class="stock_wrapper">
<div id="chart5_title_risk"></div>
<div class="chart" id="chart5_risk"></div>

</div>
<div class="stock_wrapper">
<div id="chart6_title_risk"></div>
<div class="chart" id="chart6_risk"></div>

</div>

</div>

<div class="category_wrapper">
<h2>언론 관심지수 Top6</h2>
<hr>

<div class="stock_wrapper">
<div id="chart1_title_bigdata"></div>
<div class="chart" id="chart1_bigdata"></div>

</div>
<div class="stock_wrapper">
<div id="chart2_title_bigdata"></div>
<div class="chart" id="chart2_bigdata"></div>

</div>
<div class="stock_wrapper">
<div id="chart3_title_bigdata"></div>
<div class="chart" id="chart3_bigdata"></div>

</div>
<div class="stock_wrapper">
<div id="chart4_title_bigdata"></div>
<div class="chart" id="chart4_bigdata"></div>

</div>
<div class="stock_wrapper">
<div id="chart5_title_bigdata"></div>
<div class="chart" id="chart5_bigdata"></div>

</div>
<div class="stock_wrapper">
<div id="chart6_title_bigdata"></div>
<div class="chart" id="chart6_bigdata"></div>

</div>

</div>

<div class="category_wrapper">
<h2>최근추세(Trend) Top6</h2>
<hr>

<div class="stock_wrapper">
<div id="chart1_title_trend"></div>
<div class="chart" id="chart1_trend"></div>

</div>
<div class="stock_wrapper">
<div id="chart2_title_trend"></div>
<div class="chart" id="chart2_trend"></div>

</div>
<div class="stock_wrapper">
<div id="chart3_title_trend"></div>
<div class="chart" id="chart3_trend"></div>

</div>
<div class="stock_wrapper">
<div id="chart4_title_trend"></div>
<div class="chart" id="chart4_trend"></div>

</div>
<div class="stock_wrapper">
<div id="chart5_title_trend"></div>
<div class="chart" id="chart5_trend"></div>

</div>
<div class="stock_wrapper">
<div id="chart6_title_trend"></div>
<div class="chart" id="chart6_trend"></div>

</div>

</div>
</div>

</div>
<!-- ----------------------------------------------------------------------------------- -->



















