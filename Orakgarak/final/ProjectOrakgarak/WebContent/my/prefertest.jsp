<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>

<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.common.min.css" rel="stylesheet" />
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.default.min.css" rel="stylesheet" />
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.min.css" rel="stylesheet" />
<link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.default.min.css" rel="stylesheet" />

<script src="http://cdn.kendostatic.com/2014.1.528/js/kendo.all.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var scoreDcf = 0;
		var scoreMultiple = 0;
		var scoreRisk = 0;
		var scoreBigdata = 0;
		var scoreTrend = 0;
		
		
		$("#Q1").hide();
		$("#Q2").hide();
		$("#Q3").hide();
		$("#Q4").hide();
		$("#Q5").hide();
		$("#Q6").hide();
		$("#Q7").hide();
		$("#Q8").hide();
		$("#Q9").hide();
		$("#Q10").hide();
		$("#finally").hide();
		$(".resultWrapper").hide();

		
		$("#startBtn").click(function(){
			$("#Q1").show();
			$("#intro").hide();
		})
		$("#Q1yesBtn").click(function(){
			$("#Q2").show();
			$("#Q1").hide();
			scoreBigdata+=5; 
		});
		$("#Q1noBtn").click(function(){
			$("#Q2").show();
			$("#Q1").hide();

		});
		$("#Q2yesBtn").click(function(){
			$("#Q3").show();
			$("#Q2").hide();
			scoreBigdata+=5;
		});
		$("#Q2noBtn").click(function(){
			$("#Q3").show();
			$("#Q2").hide();
		});
		$("#Q3yesBtn").click(function(){
			$("#Q4").show();
			$("#Q3").hide();
		});
		$("#Q3noBtn").click(function(){
			$("#Q4").show();
			$("#Q3").hide();
			scoreTrend+=5;
		});
		$("#Q4yesBtn").click(function(){
			$("#Q5").show();
			$("#Q4").hide();
			scoreTrend+=5;
		});
		$("#Q4noBtn").click(function(){
			$("#Q5").show();
			$("#Q4").hide();
		});
		$("#Q5yesBtn").click(function(){
			$("#Q6").show();
			$("#Q5").hide();
			scoreDcf+=5;
		});
		$("#Q5noBtn").click(function(){
			$("#Q6").show();
			$("#Q5").hide();
		});
		$("#Q6yesBtn").click(function(){
			$("#Q7").show();
			$("#Q6").hide();
			scoreDcf+=5;
		});
		$("#Q6noBtn").click(function(){
			$("#Q7").show();
			$("#Q6").hide();
		});
		$("#Q7yesBtn").click(function(){
			$("#Q8").show();
			$("#Q7").hide();
			scoreMultiple+=5;

		});
		$("#Q7noBtn").click(function(){
			$("#Q8").show();
			$("#Q7").hide();
		});
		$("#Q8yesBtn").click(function(){
			$("#Q9").show();
			$("#Q8").hide();
		});
		$("#Q8noBtn").click(function(){
			$("#Q9").show();
			$("#Q8").hide();
			scoreMultiple+=5;
		});
		$("#Q9yesBtn").click(function(){
			$("#Q10").show();
			$("#Q9").hide();
			scoreRisk+=5;

		});
		$("#Q9noBtn").click(function(){
			$("#Q10").show();
			$("#Q9").hide();
		});
		$("#Q10yesBtn").click(function(){
			$('.ui.small.modal.preferTest').modal('show');
			$("#Q10").hide();
		});
		$("#Q10noBtn").click(function(){
			$('.ui.small.modal.preferTest')
			.modal('setting', 'closable', false)
			.modal('show');
			
			$("#Q10").hide();
			scoreRisk+=5;
			
		});
					
		
		$("#confirmTestResult").click(function(){
			/* location.href="${pageContext.request.contextPath}/preferTestResult.do?scoreDcf="
					+scoreDcf+"&scoreMultiple="+scoreMultiple+"&scoreRisk="+scoreRisk+
					"&scoreBigdata="+scoreBigdata+"&scoreTrend="+scoreTrend; */
			$(".wrapper").hide();
			$(".resultWrapper").show();
			createChart();
		});
		
		
		$(document).keydown(function(e){
			if(e.keyCode == 13){
				createChart();
			}
		});
		
		function createChart() {
			
			
			
			
			var highestRisk = "<span style='color : red;'>"+"${sessionScope.user.name}"+"</span>"+"님의 투자성향은"+"<span style='color : red;'>"+" 적극투자형"+"</span>"+"입니다."+"<br/>"+" 원금보전보다는 높은수준의 투자수익을 추구하며 위험자산에도 투자를 고려해볼만 합니다."+"<br/>"+"이런분들에게 오락가락에서는 다음과 같은 종목을 추천드리고 있습니다."+"<br/>";
			var middleRisk = "<span style='color : red;'>"+"${sessionScope.user.name}"+"</span>"+"님의 투자성향은"+"<span style='color : red;'>"+" 위험중립형"+"</span>"+"입니다."+"<br/>"+" 투자위험에 대한 인식을 가지고 계시며 예,적금보다는 높은 수익률을 기대하고 있다고 판단됩니다."+"<br/>"+"이런분들에게 오락가락에서는 다음과 같은 종목을 추천드리고 있습니다."+"<br/>";
			var lowestRisk = "<span style='color : red;'>"+"${sessionScope.user.name}"+"</span>"+"님의 투자성향은"+"<span style='color : red;'>"+" 안정추구형"+"</span>"+"입니다."+"<br/>"+" 예금이나 적금수준의 수익률을 기대하며 원금손실을 원하지 않는다고 판단되어집니다."+"<br/>"+"이런분들에게 오락가락에서는 다음과 같은 종목을 추천드리고 있습니다."+"<br/>";

			$.getJSON("${pageContext.request.contextPath}/preferTestResult.do",
					{"scoreDcf" : scoreDcf, "scoreMultiple" : scoreMultiple, 
					"scoreTrend" : scoreTrend, "scoreBigdata" : scoreBigdata, 
					"scoreRisk" :scoreRisk}, function(jsonData){
			if(scoreRisk == 10){
				$("#resultComment").html(lowestRisk);
			}else if(scoreRisk == 5){
				$("#resultComment").html(middleRisk);
			}else{
				$("#resultComment").html(highestRisk);

			}
					
			//제목다는놈들임
			$("#chart1_title").append($("<a/>").attr("href",
					"${pageContext.request.contextPath}/stock_detail.do?stockCode="
							+ jsonData.result[0].stockCode).text( 
									jsonData.result[0].stockName +
						"("+ jsonData.result[0].stockCode +")"));
			
			$("#chart2_title").append($("<a/>").attr("href",
					"${pageContext.request.contextPath}/stock_detail.do?stockCode="
							+ jsonData.result[1].stockCode).text( 
									jsonData.result[1].stockName +
						"("+ jsonData.result[1].stockCode +")"));
			
			$("#chart3_title").append($("<a/>").attr("href",
					"${pageContext.request.contextPath}/stock_detail.do?stockCode="
							+ jsonData.result[2].stockCode).text( 
									jsonData.result[2].stockName +
						"("+ jsonData.result[2].stockCode +")"));
			
			$("#chart4_title").append($("<a/>").attr("href",
					"${pageContext.request.contextPath}/stock_detail.do?stockCode="
							+ jsonData.result[3].stockCode).text( 
									jsonData.result[3].stockName +
						"("+ jsonData.result[3].stockCode +")"));
			
			$("#chart5_title").append($("<a/>").attr("href",
					"${pageContext.request.contextPath}/stock_detail.do?stockCode="
							+ jsonData.result[4].stockCode).text( 
									jsonData.result[4].stockName +
						"("+ jsonData.result[4].stockCode +")"));
				
			
			$("#chart6_title").append($("<a/>").attr("href",
					"${pageContext.request.contextPath}/stock_detail.do?stockCode="
							+ jsonData.result[5].stockCode).text( 
									jsonData.result[5].stockName +
						"("+ jsonData.result[5].stockCode +")"));
			
			
			    $("#chart1_dcf").kendoChart({
			        seriesDefaults: {type: "radarArea"},
			        series: [{
			            data: [jsonData.result[0].scoreDcf, 
			                   jsonData.result[0].scoreMultiple,
			                   jsonData.result[0].scoreTrend, 
			                   jsonData.result[0].scoreBigData, 
			                   jsonData.result[0].scoreRisk],
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
			        	data: [jsonData.result[1].scoreDcf, 
			                   jsonData.result[1].scoreMultiple,
			                   jsonData.result[1].scoreTrend, 
			                   jsonData.result[1].scoreBigData, 
			                   jsonData.result[1].scoreRisk],
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
			        	data: [jsonData.result[2].scoreDcf, 
			                   jsonData.result[2].scoreMultiple,
			                   jsonData.result[2].scoreTrend, 
			                   jsonData.result[2].scoreBigData, 
			                   jsonData.result[2].scoreRisk],
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
			        	data: [jsonData.result[3].scoreDcf, 
			                   jsonData.result[3].scoreMultiple,
			                   jsonData.result[3].scoreTrend, 
			                   jsonData.result[3].scoreBigData, 
			                   jsonData.result[3].scoreRisk],
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
			        	data: [jsonData.result[4].scoreDcf, 
			                   jsonData.result[4].scoreMultiple,
			                   jsonData.result[4].scoreTrend, 
			                   jsonData.result[4].scoreBigData, 
			                   jsonData.result[4].scoreRisk],
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
			        	data: [jsonData.result[5].scoreDcf, 
			                   jsonData.result[5].scoreMultiple,
			                   jsonData.result[5].scoreTrend, 
			                   jsonData.result[5].scoreBigData, 
			                   jsonData.result[5].scoreRisk],
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
							  
				
			}); //
			
			
			
		
			
		
				
			
		}	//
    
		
	}); //ready 
	
	

</script>
<style>



.testWrapper{
	margin:0 auto;
	width:760px;
	margin-top:25px;
	background-color: rgb(238, 235, 235);
	min-height: 450px;
	box-shadow: 2px 2px 2px #c7c7c7;
}

p{
	font-family: Nanum Gothic !important;
}

.question{
	color:white !important;
	margin-top:10px !important;
	margin-left: 19px !important;
}

.questions{
	text-align: center;
	font-weight: bold;
	padding:5px;
}

.imgContainer{
	width:430px;
	height:266px;
	margin:0 auto;
}

.yesorno{
	margin:0 auto;
	width:200px;
}

.yesBtn{
	margin-top:5px;
	position: relative;
	border: none;
	padding:7px;
	background-color: #009cd7;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 100%;
	height:36px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 80px;
	cursor: pointer;
}

.noBtn{
	margin-top:5px;
	position: relative;
	border: none;
	padding:7px;
	background-color: #e74c3c;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 100%;
	height:36px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 80px;
	cursor: pointer;
	text-align: center;
}
#startBtnParent{
	width: 80px;
	margin: 0 auto;
	
}
.startBtn{
	position: relative;
	border: none;
	padding:7px;
	background-color: #9cc787;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 80px;
	height:36px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 80px;
	cursor: pointer;
	border-radius: 3px;
	
}

#confirmTestResult{
	color: #e74c3c;
}

#confirmTestResult:hover{
	background-color: #e74c3c;
	color: #f9f6e5;
}

.resultWrapper {
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
	height: 300px;
width: 290px;
float: left;
	text-align: center;
}
.chart {
	float: left;
	width: 290px;
	height: 270px;
}
.ui.header:first-child {
	margin-top: 30px;
	
}

#resultComment {
	margin-bottom : 30px;
}
</style>

<div class="wrapper" style="min-height: 650px; width:930px; margin: 0 auto;">
<h2 style="width:900px; margin: 0 auto; padding: 10px">
	<i class="green checkmark icon" style="color: gold">
	</i> 투자성향 테스트
</h2>
<hr>

<!-- <div class="ui header">
	<span style="padding: 10px;background-color:#575E61; color:white">
		<i class="checkmark icon"></i> 투자성향 테스트
	</span>
</div> -->
<div class="testWrapper" id="intro">

<div class="testquestion">
	
<!-- 	<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q1</div>
 --><div class="questions">
		<p style="margin-top: 100px;"><h1>투자성향 테스트</h1></p>
		<p><h5 style="color:#009cd7;">By Orakgarak</h5></p>
	</div>
		<div id="startBtnParent">
  		<button id="startBtn"class="startBtn" style="margin-top: 120px;">Start</button>
  		</div>
	</div>
</div>

<div class="testWrapper" id="Q1">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q1</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/smartphoneSearch.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 실시간검색 확인을 자주하는 편이다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q1yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q1noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>



<div class="testWrapper" id="Q2">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q2</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/donotbuy.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 물건을 구매하기 전에 다른 구매고객의 후기를 꼼꼼히 살펴보는 편이다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q2yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q2noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<div class="testWrapper" id="Q3">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q3</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/shopping.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 쇼핑을 할때 유행하는 옷보다 오래 입을 수 있는 옷을 선호하는 편이다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q3yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q3noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<div class="testWrapper" id="Q4">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q4</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/economy.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 경제신문을 자주 읽는다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q4yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q4noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<div class="testWrapper" id="Q5">

	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q5</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/travel.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 여행갈 때 미리 계획을 짜는 편이다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q5yesBtn"class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q5noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<div class="testWrapper" id="Q6">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q6</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/goodbye.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>헤어졌던 커플, 같은 이유로 또 헤어진다고 생각한다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q6yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q6noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<div class="testWrapper" id="Q7">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q7</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/mortgage.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 조금 늦더라도 종자돈을 모은 후 집을 구입하여 대출을 최소화하겠다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q7yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q7noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>



<div class="testWrapper" id="Q8">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q8</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/creaditcard.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 카드값 연체를 해 본 경험이 있다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q8yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q8noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>



<div class="testWrapper" id="Q9">

	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q9</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/popular.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는인기남/인기녀보다 나를 좋아해주는사람이 좋다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q9yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q9noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<div class="testWrapper" id="Q10">
	<div class="testquestion">
	
		<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q10</div>
		<div class="imgContainer">
			<img src="${pageContext.request.contextPath }/img/quality_vs_quantity.jpg" width="430px" height="266px" style="border-radius:5px"/>
		</div>
		<div class="questions">
			<p>나는 양보다는 질이 중요하다</p>
		</div>
		<div class="yesorno">
			
	  		<button id="Q10yesBtn" class="yesBtn">yes</button>
	  		<span>or</span>
	  		<button id="Q10noBtn" class="noBtn">no</button>
		</div>
	</div>
</div>


<!-- <div class="testWrapper" id="finally">
<div class="testquestion">
	
	<div class="ui large red ribbon label question" style="background-color: #e74c3c !important; font-weight:bold;">Q10</div>
	<div class="imgContainer">
	</div>
	<div class="questions">
		<p></p>
	</div>
	<div class="yesorno">
		
  		<button id="Q10yesBtn" class="yesBtn">yes</button>
  		<span>or</span>
  		<button id="Q10noBtn" class="noBtn">no</button>
	</div>
	</div>
</div> -->

<!-- 성향 테스트 모달 -->
<div class="ui small modal preferTest" >
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<div class="left">테스트 결과를 분석중입니다. 확인버튼을 누르시면 추천종목 페이지로 이동합니다.</div>
		</div>
		<div class="actions">
		
			<a class="small ui button" id="confirmTestResult" href="javascript:void(0)">확인</a>
	
		</div>
</div>
</div>


<!-- 테스트 결과 페이지 -->
<div class="resultWrapper">
<h3>추천종목</h3>
	<div id="resultComment"></div>
	<div class="stock_wrapper">
	<div id="chart1_title"></div>
	<div class="chart" id="chart1_dcf"></div>
	
	</div>
	<div class="stock_wrapper">
	<div id="chart2_title"></div>
	<div class="chart" id="chart2_dcf"></div>
	
	</div>
	<div class="stock_wrapper">
	<div id="chart3_title"></div>
	<div class="chart" id="chart3_dcf"></div>
	
	</div>
	<div class="stock_wrapper">
	<div id="chart4_title"></div>
	<div class="chart" id="chart4_dcf"></div>
	
	</div>
	<div class="stock_wrapper">
	<div id="chart5_title"></div>
	<div class="chart" id="chart5_dcf"></div>
	
	</div>
	<div class="stock_wrapper">
	<div id="chart6_title"></div>
	<div class="chart" id="chart6_dcf"></div>
	
	</div>


</div>