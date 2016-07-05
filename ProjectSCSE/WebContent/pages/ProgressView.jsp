<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function() {
	      $( "#tabs" ).tabs({
	        select: function(event, ui) {
	        }
	      });
	    });
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>
<%
	int index = (Integer) request.getAttribute("size");
%>

<script>
	var numbering = <%=index %>;
	$(document).ready(function(){
		if(numbering <=6){
			$("#chapter1-2").empty();
			$("#chapter2").empty();
			$("#chapter3").empty();
			$("#chapter4").empty();
			return;
		} else if(numbering <= 12){
			$("#chapter2").empty();
			$("#chapter3").empty();
			$("#chapter4").empty();
			return;
		} else if(numbering <= 19){
			$("#chapter3").empty();
			$("#chapter4").empty();
			return;
		} else if(numbering <= 24){
			$("#chapter3-2").empty();
			$("#chapter4").empty();
		} else if(numbering <= 29){
			$("#chapter4").empty();
		} else if(numbering <=34){
			$("#chapter4-2").empty();
		}
	});
</script>

<!-- 챕터 1 1~6 -->
<script type="text/javascript">
var chart;
var chartData = [
<%int k=1;
int cycle = 0;
if(index < 6 && index !=0){
	cycle = index;	
} else if (index >=6){
	cycle = 6;
} else if (index == 0) {
	cycle = 0;
}
if(index!=0){

for(int i=1; i<=cycle; i++){ 
	
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{ 	
    "country": "<%=i%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#FF0F00"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#FF6600"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#FCD202"
    }, {"country":""},


<%} 
}else {
}%>

];
var chart = AmCharts.makeChart("chartdiv", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});
</script>

<!-- 챕터 1 7~ 12 -->
<script type="text/javascript">
var chart2;
var chartData2 = [
<%int cycle2 = 0;
if(index < 12 && index !=0){
	cycle2 = index;	
} else if (index >=12){
	cycle2 = 12;
} else if (index == 0) {
	cycle2 = 0;
}
for(int i=6; i<=cycle2; i++){ 
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{
    "country": "<%=i%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#F8FF01"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#B0DE09"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#04D215"
    }, {"country":""},

<%}%>
];
var chart2 = AmCharts.makeChart("chartdiv2", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData2,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});
</script>

<!-- 챕터 2 1~10 -->
<script type="text/javascript">
var chart3;
var chartData3 = [
<%int k3=1;
int cycle3 = 0;
int score = 1;
if(index < 19 && index !=0){
	cycle3 = index;	
} else if (index >=19){
	cycle3 = 19;
} else if (index == 0) {
	cycle3 = 0;
}
if(index!=0){

for(int i=13; i<=cycle3; i++){ 
	
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{ 	
    "country": "<%=score%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#87D3F8"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#48BCF4"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#0A77AB"
    }, {"country":""},


<% score++;} 
}else {
}%>

];
var chart3 = AmCharts.makeChart("chartdiv3", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData3,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});
</script>

<!-- 챕터 3 1 ~ 5 -->
<script type="text/javascript">
var chart4;
var chartData4 = [
<%int k4=1;
int cycle4 = 0;
int score1 = 1;
if(index < 24 && index !=0){
	cycle4 = index;	
} else if (index >=24){
	cycle4 = 24;
} else if (index == 0) {
	cycle4 = 0;
}
if(index!=0){

for(int i=20; i<=cycle4; i++){ 
	
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{ 	
    "country": "<%=score1%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#F9A8D2"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#9475F0"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#BE56F5"
    }, {"country":""},


<%score1++; } 
}else {
}%>

];
var chart4 = AmCharts.makeChart("chartdiv4", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData4,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});
</script>

<!-- 챕터 3 6 ~ 10 -->
<script type="text/javascript">
var chart5;
var chartData5 = [
<%int k5=1;
int cycle5 = 0;
int score2 = 6;
if(index < 29 && index !=0){
	cycle5 = index;	
} else if (index >=29){
	cycle5 = 29;
} else if (index == 0) {
	cycle5 = 0;
}
if(index!=0){

for(int i=25; i<=cycle5; i++){ 
	
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{ 	
    "country": "<%=score2%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#FF5E55"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#FF8635"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#FEC461"
    }, {"country":""},


<% score2++;} 
}else {
}%>

];
var chart5 = AmCharts.makeChart("chartdiv5", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData5,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});
</script>

<!-- 챕터 4 1 ~ 5 -->
<script type="text/javascript">
var chart6;
var chartData6 = [
<%int k6=1;
int socre3 = 1;
int cycle6 = 0;
if(index < 34 && index !=0){
	cycle6 = index;	
} else if (index >=34){
	cycle6 = 34;
} else if (index == 0) {
	cycle6 = 0;
}
if(index!=0){

for(int i=30; i<=cycle6; i++){ 
	
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{ 	
    "country": "<%=socre3%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#FAFE56"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#CCF737"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#3FFC4D"
    }, {"country":""},


<%socre3++;} 
}else {
}%>

];
var chart6 = AmCharts.makeChart("chartdiv6", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData6,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});
</script>

<!-- 챕터 4 6 ~ 10 -->
<script type="text/javascript">
var chart7;
var chartData7 = [
<%int k7=1;
int score4 = 6;
int cycle7 = 0;
if(index < 39 && index !=0){
	cycle7 = index;	
} else if (index >=39){
	cycle7 = 39;
} else if (index == 0) {
	cycle7 = 0;
}
if(index!=0){

for(int i=35; i<=cycle7; i++){ 
	
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute(String.valueOf(i));%>             
{ 	
    "country": "<%=score4%>번.학생",
    "visits": <%=map.get("viewTryNum")%>,
    "color": "#FE4365"
}, {
    "country": "반",
    "visits":  <%=map.get("viewClassTryNum")%>,
    "color": "#F9CDAD"
}, {
    "country": "학교",
    "visits":  <%=map.get("viewSchoolTryNum")%>,
    "color": "#ABC9BB"
    }, {"country":""},


<%score4++;} 
}else {
}%>

];
var chart7 = AmCharts.makeChart("chartdiv7", {
	"theme": "chalk",
    type: "serial",
    dataProvider: chartData7,
    categoryField: "country",
    depth3D: 20,
    angle: 30,

    categoryAxis: {
        labelRotation: 0,
        gridPosition: "start"
    },

    valueAxes: [{
        title: "평균시도횟수",
          labelRotation: 0
    }],

    graphs: [{
        valueField: "visits",
        colorField: "color",
        type: "column",
        lineAlpha: 0.1,
        fillAlphas: 1
    }],

    chartCursor: {
        cursorAlpha: 0,
        zoomable: false,
        categoryBalloonEnabled: false
    },
    pathToImages:"http://www.amcharts.com/lib/3/images/",
    amExport:{
     top:21,
      right:20,
      exportJPG:true,
      exportPNG:true,
      exportSVG:true
    }
});


$(window).load(function() {
	$("#loader").fadeOut("slow");
});
</script>

<style>
#chartdiv,#chartdiv2,#chartdiv3,#chartdiv4,#chartdiv5,#chartdiv6,#chartdiv7
	{
	width: 100%;
	height: 500px;
	font-size: 11px;
}
#loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('/assets/images/page-loader.gif') 50% 50% no-repeat rgb(249,249,249);
}
</style>
</head>
<body>


<div id="loader"></div>
	<table class="ui table segment">
		<tr>
			<th style="text-align: center; font-size: x-large;">${requestScope.name } 학생의 학습 이력</th>
		</tr>
		<tr>
			<td style="text-align: center; font-size: large;">총 학습 시간 <format:formatNumber value="${requestScope.time/60}" pattern="0" />분
			</td>
		</tr>
	</table>
	

	
	<!-- 탭1 -->
	<div class="ui piled segment">
	<div id="tabs-1">
		<div class="ui header red label" style="padding-left: 2%;">Chapter1 결과</div>
		<table class="ui table segment">
			<thead>
				<tr>
					<th>문항</th>
					<th>체류시간</th>
					<th>시도횟수</th>
					<th>난이도</th>
					<th>유형분석</th>
					<th>학습일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.tableOne }" var="pg">
					<c:choose>
					<c:when test="${pg.failNum < 3 }">
					<tr class="positive">
					</c:when>
					<c:when test="${pg.failNum ==3 || pg.failNum ==4 ||pg.failNum ==5}">
					<tr class="warning">
					</c:when>
					<c:otherwise>
					<tr class="error">
					</c:otherwise>
					</c:choose>
						<td>${pg.chapNum }-${pg.quizNum }</td>
						<td>${pg.time}초</td>
						<td>총 ${pg.tryNum} 회 시도: ${pg.tryNum-pg.failNum }회 성공/${pg.failNum }회 실패</td>
						<td>${pg.progressMission.quizLevel }</td>
						<td>${pg.progressMission.quizType }</td>
						<td>${pg.studyDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui header red label" style="padding-left: 2%;">Chapter1) 1~6번</div>
		<!-- <h2 class="ui header">Chapert1) 1~6번</h2> -->
		<div id="chartdiv"></div>
		<div id="chapter1-2">
			<div class="ui header red label" style="padding-left: 2%;">Chapert1) 7~12번</div>
			<div id="chartdiv2"></div>
		</div>
		<div class="ui divider"></div>
		<div id="needToStudy">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">보충이 필요한 문제의 번호</th>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty requestScope.addStudyOne }">
							<td>
							<c:forEach items="${requestScope.addStudyOne }" var="n">
	
								${n.chapNum } - ${n.quizNum },&nbsp;
	
							</c:forEach>
							</td>
						</c:when>
						<c:otherwise>
							<td>보충이 필요한 문제가 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	</div>
	</div>
	
	<!-- 탭2 -->
	<div class="ui piled segment">
	<div id="tabs-2">
		<div class="ui header blue label" style="padding-left: 2%;">Chapter2 결과</div>
		<table class="ui table segment">
			<thead>
				<tr>
					<th>문항</th>
					<th>체류시간</th>
					<th>시도횟수</th>
					<th>난이도</th>
					<th>유형분석</th>
					<th>학습일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.tableTwo }" var="pg">
					<c:choose>
					<c:when test="${pg.failNum < 3 }">
					<tr class="positive">
					</c:when>
					<c:when test="${pg.failNum ==3 || pg.failNum ==4 ||pg.failNum ==5}">
					<tr class="warning">
					</c:when>
					<c:otherwise>
					<tr class="error">
					</c:otherwise>
					</c:choose>
						<td>${pg.chapNum }-${pg.quizNum }</td>
						<td>${pg.time}초</td>
						<td>총 ${pg.tryNum} 회 시도: ${pg.tryNum-pg.failNum }회 성공/${pg.failNum }회 실패</td>
						<td>${pg.progressMission.quizLevel }</td>
						<td>${pg.progressMission.quizType }</td>
						<td>${pg.studyDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui divider"></div>
		<div class="ui header blue label" style="padding-left: 2%;">Chapert2) 1~7번</div>
		<div id="chartdiv3"></div>
		<div id="needToStudy">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">보충이 필요한 문제의 번호</th>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty requestScope.addStudyTwo }">
							<td>
							<c:forEach items="${requestScope.addStudyTwo }" var="n">
	
								${n.chapNum } - ${n.quizNum },&nbsp;
	
							</c:forEach>
							</td>
						</c:when>
						<c:otherwise>
							<td>보충이 필요한 문제가 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	</div>
	</div>
	
	<!-- 탭3 -->
	<div class="ui piled segment">
	<div id="tabs-3">
		<div class="ui header purple label" style="padding-left: 2%;">Chapter3 결과</div>
		<table class="ui table segment">
			<thead>
				<tr>
					<th>문항</th>
					<th>체류시간</th>
					<th>시도횟수</th>
					<th>난이도</th>
					<th>유형분석</th>
					<th>학습일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.tableThree }" var="pg">
					<c:choose>
					<c:when test="${pg.failNum < 3 }">
					<tr class="positive">
					</c:when>
					<c:when test="${pg.failNum ==3 || pg.failNum ==4 ||pg.failNum ==5}">
					<tr class="warning">
					</c:when>
					<c:otherwise>
					<tr class="error">
					</c:otherwise>
					</c:choose>
						<td>${pg.chapNum }-${pg.quizNum }</td>
						<td>${pg.time}초</td>
						<td>총 ${pg.tryNum} 회 시도: ${pg.tryNum-pg.failNum }회 성공/${pg.failNum }회 실패</td>
						<td>${pg.progressMission.quizLevel }</td>
						<td>${pg.progressMission.quizType }</td>
						<td>${pg.studyDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui header purple label" style="padding-left: 2%;">Chapter3)1~5번</div>
		<div id="chartdiv4"></div>
		<div id="chpater3-2">
		<div class="ui header purple label" style="padding-left: 2%;">Chapter3)6~10번</div>
		<div id="chartdiv5"></div>
		</div>
		<div id="needToStudy">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">보충이 필요한 문제의 번호</th>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty requestScope.addStudyThree }">
							<td>
							<c:forEach items="${requestScope.addStudyThree }" var="n">
	
								${n.chapNum } - ${n.quizNum },&nbsp;
	
							</c:forEach>
							</td>
						</c:when>
						<c:otherwise>
							<td>보충이 필요한 문제가 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<!-- 챕터4 -->
	
	<div class="ui piled segment">
	<div id="tabs-4">
		<div class="ui header orange label" style="padding-left: 2%;">Chapter4 결과</div>
		<table class="ui table segment">
			<thead>
				<tr>
					<th>문항</th>
					<th>체류시간</th>
					<th>시도횟수</th>
					<th>난이도</th>
					<th>유형분석</th>
					<th>학습일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.tableFour }" var="pg">
					<c:choose>
					<c:when test="${pg.failNum < 3 }">
					<tr class="positive">
					</c:when>
					<c:when test="${pg.failNum ==3 || pg.failNum ==4 ||pg.failNum ==5}">
					<tr class="warning">
					</c:when>
					<c:otherwise>
					<tr class="error">
					</c:otherwise>
					</c:choose>
						<td>${pg.chapNum }-${pg.quizNum }</td>
						<td>${pg.time}초</td>
						<td>총 ${pg.tryNum} 회 시도: ${pg.tryNum-pg.failNum }회 성공/${pg.failNum }회 실패</td>
						<td>${pg.progressMission.quizLevel }</td>
						<td>${pg.progressMission.quizType }</td>
						<td>${pg.studyDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui header orange label" style="padding-left: 2%;">Chapter4)1~5번</div>
		<div id="chartdiv6"></div>
		<div id="chapter4-2">
		<div class="ui header orange label" style="padding-left: 2%;">Chapter4)6~10번</div>
		<div id="chartdiv7"></div>
		</div>
		<div id="needToStudy">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">보충이 필요한 문제의 번호</th>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty requestScope.addStudyFour }">
							<td>
							<c:forEach items="${requestScope.addStudyFour }" var="n">
	
								${n.chapNum } - ${n.quizNum },&nbsp;
	
							</c:forEach>
							</td>
						</c:when>
						<c:otherwise>
							<td>보충이 필요한 문제가 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	</div>
	</div>
	

</body>
</html>