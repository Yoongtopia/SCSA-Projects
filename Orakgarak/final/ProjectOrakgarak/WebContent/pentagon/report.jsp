<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">


<!-- 펜타곤을 이용하기위한 amchart를 불러옵니다. -->
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/radar.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>


<script type="text/javascript">

$(document).ready(function() {	
	

		$(".icon_news").on("click",function() {
			
			$('#news_table tbody tr:not(:first)').remove();
			$(".ui.modal.news").modal('show');
			
			$.getJSON("get_news.do",{"code" : "${code}"},function(jsonData){
					$(jsonData.newsList).each(function(index,item){
					
					/* var td1 = $("<td/>").text(item.crp_nm); */
					var td1 = $("<td/>").append($("<a/>").text(item.pubDate));
					var td2 = $("<td/>").append($("<a/>").attr("href",item.link).text(item.title));
					var td3 = $("<td/>").append($("<a/>").text(item.desc));
					
					$("<tr/>").append(td1, td2).appendTo("#news_table");
					
				});
				
			});
			
		});
				
			
	
	
	$.getJSON("get_stock_info.do",{"code" : "${code}"},function(jsonData) {
		

		$("#stock_info_priceVar").text(jsonData.stockInfo.priceVar+"원");
		$("#stock_info_percentage").text(jsonData.stockInfo.percentage+"%");
		
		
		if(jsonData.stockInfo.updown==1){
			$("#stock_info_updown").text("▲").css("color","red");
			$("#stock_info").css("color","red");
			$("#currentPrice").css("color","red");
		}else if(jsonData.stockInfo.updown==2){
			$("#stock_info_updown").text("▼").css("color","blue");
			$("#stock_info").css("color","blue");
			$("#currentPrice").css("color","blue");
		}else{
			$("#stock_info_updown").text("〓").css("color","black");
			$("#stock_info").css("color","black");
			$("#currentPrice").css("color","black");
		}
		
		
	});
	
	//favorite과 buy는 모두 user쪽 컨트롤러에 있음
	
	//이부분 모달띄우는 거임
	$(".icon_pay").click(function() {
		$('.modal.modal_buyStock').modal('show');
		$.getJSON("getRemainCash.do",{"userId":"${user.email}"},function(jsonData){
			
			$("#remainCash").attr("remainCash",jsonData.userAdvanced.remainCash);
			$("#remainCash").text(jsonData.userAdvanced.remainCash.toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
			$("#evaluatedAsset").text(jsonData.userAdvanced.evaluatedAsset.toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
		});
	}); 
	
	$("#volumeString").on("change",function() {
		var totalPrice = "${requestScope.price}"*$("#volumeString").val();
		var afterCash = $("#remainCash").attr("remainCash") - totalPrice;
		
		if(afterCash<=0){
			$("#afterCash").css("color","red");
		}else{
			$("#afterCash").css("color","black");
		}
		
		$("#totalPrice").text(totalPrice.toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
		$("#afterCash").text(afterCash.toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
	});
	
	
	//이부분이 모달 캔슬
	$(document).on("click",".button.btn_close",function() {
		$('.modal').modal('hide');
	});
	
	
	$(".moveSimulation").on("click",function() {
		location.href="${pageContext.request.contextPath}/simulation.do";
		
	});
	
	//이부분에서 실질적으로 주식을 구매하게됨
	 $(document).on("click",".button.btn_buy",function() {
		$.getJSON("buy.do",{"userId":"${user.email}","code":"${code}","volumeString" : $("#volumeString").val()},function(jsonData){
			//$('.modal_buyStock').modal('hide');
			if(jsonData.status==2){
				//alert("잔액이 모자랍니다."); //나중에 모달로 바꾸자
				$('.small.modal.balance').modal('show');

				return false;
			}else if(jsonData.status==1){
				//alert("주문이 체결되었습니다."); //나중에 모달로 바꾸자
				//$('.modal_buyStock').modal('hide');
				$('.small.modal.order').modal('show');

			}else if(jsonData.status==3){
				//alert("주문수량을 확인하세요."); //나중에 모달로 바꾸자
				//$('.modal_buyStock').modal('hide');
				$('.small.modal.orderCheck').modal('show');

				return false;
			}else if(jsonData.status==666){
				//alert("로그인을 해주세요"); //나중에 모달로 바꾸자
				//$('.modal_buyStock').modal('hide');
				$('.small.modal.gologin').modal('show');

				return false;
			}else if(jsonData.status==999){
				//alert("주문수량이 너무 많습니다"); //나중에 모달로 바꾸자
				//$('.modal_buyStock').modal('hide');
				$('.small.modal.tooMuchOrder').modal('show');

				return false;
			}else{
				//alert("주문에 이상이 생겼습니다. 네트워크상태를 확인하세요");
				//$('.modal_buyStock').modal('hide');
				$('.small.modal.orderError').modal('show');

				return false;
			}
			
		});
			
			
	});
	
	 $.getJSON("checkFavorite.do",{"userId" : "${sessionScope.user.email}" , "code" : "${code}"},function(jsonData){
			
			if(jsonData){
				
				$("#icon_after_add").hide();
				$("#icon_before_add").show();

			}else{
				
				$("#icon_after_add").show();
				$("#icon_before_add").hide();

			}
			
		
			});
	
	
	
	
	 $("#icon_before_add").click(function() {
		$.getJSON("addFavorite.do",{"userId" : "${sessionScope.user.email}" , "code" : "${code}"},function(jsonData){
		
			if(jsonData){
			
			}else{
			
			}
			
		
			});
		$(this).hide();
		$("#icon_after_add").show();
		
		
		});
	
	$("#icon_after_add").click(function() {
		$.getJSON("deleteFavReport.do",{"userId" : "${sessionScope.user.email}" , "codeForFav" : "${code}"},function(jsonData){
		
			if(jsonData){
				
			}else{
			
			}
			
		
			});
		$(this).hide();
		$("#icon_before_add").show();
		
		
		});
				
		//searchBtn
		
	$("#btnDcf").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/select_dcf.do?code=${code}&&date=201405");	
	});
	$("#btnMultiple").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/multiple.do?stockCode=${code}");
	});
	$("#btnRisk").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/risk.do?code=${code}");
	});
	$("#btnBigData").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/bigdata.do?code=${code}&name=${name}");
	});
	$("#btnTrend").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/trend.do?code=${code}");
	});
	$("#btnFS").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/info.do?code=${code}");
	});
	$("#btnAdv").on("click",function() {
		$("#contentIframe").attr("src","${pageContext.request.contextPath }/dcf.jsp");
		$('.small.modal.dcf').modal('show');
	});
	
	$.get("${pageContext.request.contextPath}/selectScores.do?stockCode=${code}",
			{"code" : "${code}"},
			function(jsonObj){
			$("#dcfScore").text(jsonObj.pentagon.scoreDcf);
			$("#multipleScore").text(jsonObj.pentagon.scoreMultiple);
			$("#riskScore").text(jsonObj.pentagon.scoreRisk);
			$("#bigDataScore").text(jsonObj.pentagon.scoreBigData);
			$("#trendScore").text(jsonObj.pentagon.scoreTrend);
			

			var chart = AmCharts.makeChart("chartdiv", {
			    "type": "radar",
			    "theme": "none",
			    "dataProvider": [{
			        "direction": "DCF",
			        "value": jsonObj.pentagon.scoreDcf
			    },  {
			        "direction": "Multiple",
			        "value": jsonObj.pentagon.scoreMultiple
			    }, {
			        "direction": "Trend",
			        "value": jsonObj.pentagon.scoreTrend
			    }, {
			        "direction": "Big Data",
			        "value": jsonObj.pentagon.scoreBigData
			    }, {
			        "direction": "Risk",
			        "value": jsonObj.pentagon.scoreRisk
			    }],
			    "valueAxes": [{
			        "gridType": "circles",
			        "maximum":100,
			        "minimum": 0,
			        "autoGridCount": false,
			        "axisAlpha": 0.2,
			        "fillAlpha": 0.05,
			        "fillColor": "#FFFFFF",
			        "gridAlpha": 0.08,
			        "guides": [{
			            "angle": 225,
			            "fillAlpha": 0.3,
			            "fillColor": "#0066CC",
			            "tickLength": 0,
			            "toAngle": 315,
			            "toValue": 14,
			            "value": 0,
						"lineAlpha": 0,

			        }, {
			            "angle": 45,
			            "fillAlpha": 0.3,
			            "fillColor": "#CC3333",
			            "tickLength": 0,
			            "toAngle": 135,
			            "toValue": 14,
			            "value": 0,
						"lineAlpha": 0,
			        }],
			        "position": "left"
			    }],
			    "startDuration": 1,
			    "graphs": [{
			        "balloonText": "[[category]]: [[value]]",
			        "bullet": "round",
			        "fillAlphas": 0.3,
			        "valueField": "value"
			    }],
			    "categoryField": "direction"   
			});
			
	});
	
	$("#btnMultiple").click();


});//end document(ready)

</script>

<style>

#bigWrapper{
	margin-left:0px;
	transition: margin-left .25s;
}

#reportWrapper{
	margin : 0px auto;
}

#reportTitle {
	padding : 25px;
}

#reportUpper {
position	: relative;
	width : 930px;
	height : 270px;
	background-color : #white;
	padding : 20px;
	border-radius : 10px;
	margin : 0px auto;
	margin-bottom:20px;
	-moz-box-shadow: 7px 7px 5px #c7c7c7;
	-webkit-box-shadow: 7px 7px 5px #c7c7c7;
	box-shadow: 7px 7px 5px #c7c7c7;
	border-style:solid;
	border-color: #eaeaea;
	border-width: 3px;
	box-sizing :border-box;
	
}

.icon_pay {
position: absolute;
top: 120px;
right : 25px;
}

.icon_news {
position : absolute;
top : 160px;
right : 25px;
}

#icon_before_add {
position: absolute;
right: 40px;
top: 0px;	
}

#icon_after_add {
position: absolute;
right: 40px;
top: 0px;
display: none;
	
}



.tabMenu {
	width : 930px;
	background: #e64a3c;
	padding : 5px 0px 5px 0px;
	margin : 0px auto;
	border-radius: 10px 10px 0px 0px;
		-moz-box-shadow: 7px 0px 5px #c7c7c7;
	-webkit-box-shadow: 7px 0px 5px #c7c7c7;
	box-shadow: 7px 0px 5px #c7c7c7;
}

.tabMenu a{
	margin-left: 43px;
}

#spanName{
	color: black;
	font-size: 40px;
	font-weight: bold;	
}

#spanCode{
	color: gray;
	font-size: 15px;
}

#currentPrice{
	font-size:30px;
	color: black;
	font-weight: bold;	
}

#desc {
	float:left;
	margin-left:30px;
}

#desc_company_info{
	width:500px;
	overflow: hidden;
}

#stock_info{
	display : inline-block;
	font-size:13px;
	
}

#stock_info_updown{
	float:left;
}

#stock_info_priceVar{
	float:left;
}

#reportContent {
	width : 930px;
	background-color : #white;
	border-radius: 0px 0px 10px 10px ;
	margin : 0px auto;
	-moz-box-shadow: 7px 7px 5px #c7c7c7;
	-webkit-box-shadow: 7px 7px 5px #c7c7c7;
	box-shadow: 7px 7px 5px #c7c7c7;
		border-style:solid;
	border-color: #eaeaea;
	border-width: 3px;
}





/* 펜타곤관련 */
#chartdiv {
	width	: 250px;
	height	: 250px;
	float:left;
}	


/* 여기서부터 탭관련 */
*,*:after,*::before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	/* box-sizing: border-box;  */
}

body {
	font-family: 'Raleway', sans-serif;
}

nav a {
	position: relative;
	display: inline-block;
	margin: 15px 25px;
	outline: none;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 400;
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.3);
	font-size: 1.35em;
}

nav a:hover,nav a:focus {
	outline: none;
}



/* Effect 13: three circles */
.cl-effect-13 a {
	-webkit-transition: color 0.3s;
	-moz-transition: color 0.3s;
	transition: color 0.3s, font-size 0.3s;
}

.cl-effect-13 a::before {
	position: absolute;
	top: 75%;
	left: 50%;
	color: transparent;
	content: '•';
	text-shadow: 0 0 transparent;
	font-size: 1.2em;
	-webkit-transition: text-shadow 0.3s, color 0.3s;
	-moz-transition: text-shadow 0.3s, color 0.3s;
	transition: text-shadow 0.3s, color 0.3s;
	-webkit-transform: translateX(-50%);
	-moz-transform: translateX(-50%);
	transform: translateX(-50%);
	pointer-events: none;
}

.cl-effect-13 a:hover::before,.cl-effect-13 a:focus::before {
	color: #fff;
	text-shadow: 10px 0 #fff, -10px 0 #fff;
}

.cl-effect-13 a:hover,.cl-effect-13 a:focus {
	color: black;
	font-size:1.2em;
	font-weight:800;
}



/******************************* 여기서부터는 테이블 css ****************************************/


#pricing-table {
    text-align: center;
    margin-top:15px;
}

#pricing-table .plan {
    font: 12px 'Lucida Sans', 'trebuchet MS', Arial, Helvetica;
    text-shadow: 0 1px rgba(255,255,255,.8);        
    background: #fff;      
    border: 1px solid #ddd;
    color: #333;
    padding: 20px;
    width: 100px; /* plan width = 120 + 20 + 20 + 1 + 1 = 162px */      
    float: left;
    position: relative;
    box-sizing :border-box;
}

#pricing-table #most-popular {
    z-index: 2;
    top: -13px;
    border-width: 3px;
    padding: 30px 20px;
    border-radius: 5px;
    box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);    
}

#pricing-table .plan:nth-child(1) {
    border-radius: 5px 0 0 5px;        
}

#pricing-table .plan:nth-child(5) {
    border-radius: 0 5px 5px 0;        
}

/* --------------- */   

#pricing-table h3 {
    font-size: 20px;
    font-weight: normal;
    padding: 10px;
    margin: -20px -20px 50px -20px;
    background-color: #eee;
    background-image: linear-gradient(#fff, #eee);
}

#pricing-table #most-popular h3 {
    background-color: #ddd;
    background-image: linear-gradient(#eee, #ddd);
    margin-top: -30px;
    padding-top: 30px;
    border-radius: 5px 5px 0 0;         
}

#pricing-table .plan:nth-child(1) h3 {
    border-radius: 5px 0 0 0;       
}

#pricing-table .plan:nth-child(5) h3 {
    border-radius: 0 5px 0 0;       
}   

#pricing-table h3 span {
    display: block;
    font: bold 25px/60px Georgia, Serif;
    color: #777;
    background: #fff;
    border: 5px solid #fff;
    height: 80px;
    width: 80px;
    margin: 10px auto -55px;
    border-radius: 100px;
    box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
    box-sizing :border-box;
}

/* --------------- */

#pricing-table ul {
    margin: 20px 0 0 0;
    padding: 0;
    list-style: none;
}

#pricing-table li {
    border-top: 1px solid #ddd;
    padding: 10px 0;
}


.clear:before, .clear:after {
  content:"";
  display:table
}

.clear:after {
  clear:both
}

.clear {
  zoom:1
}

#confirm{
	text-decoration: none;
	color: #e74c3c;
	font-size: 15px;
	font-weight: 700;
}

#simulConfirmBtn, #simulCancelBtn, #confirm{
	color: #e74c3c;
	text-decoration: none;
	
}

#simulConfirmBtn:hover, #simulCancelBtn:hover, #confirm:hover{
	background-color: #e74c3c; 
	color: #FFF;
}

#pricing-table h3{
	 font-family:'Nanum Gothic'; font-weight:bold; font-size:1.4em;
}

#registBtn{
	margin-top:5px;
	border-radius:3px;
	position: relative;
	border: none;
	padding:7px;
	background-color: #2ca34f;
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
	width: 50px;
	cursor: pointer;
}

#news_table{
	white-space: nowrap;
}

#news_table td a{
	text-decoration:none;
}

.ui.modal.news{
	top : 150px;
}



</style>

<div id="bigWrapper">
<div id="reportWrapper">



<div id="reportUpper">

<div id="registBtnWrapper" class="icon_pay">
<a id="registBtn"><i class="won icon"></i>투자</a>
</div>

<div id="registBtnWrapper" class="icon_news">
<a id="registBtn"><i class="bell outline icon"></i>뉴스</a>
</div>


<img style="cursor: pointer" id = "icon_before_add" src="${pageContext.request.contextPath }/img/add_before4.png" >
<img style="cursor: pointer" id = "icon_after_add" src="${pageContext.request.contextPath }/img/redadd_05.png" >

<div id="chartdiv"></div>	


<div id="desc">
<div id="desc_company_info"><span id="spanName">${requestScope.name }</span>
<span id="spanCode">${requestScope.code }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="currentPrice"><fmt:formatNumber>${requestScope.price }</fmt:formatNumber>원</span>
  <div id="stock_info">
  <div id="stock_info_updown">-</div>
  <div id="stock_info_priceVar">0</div>
  <div id="stock_info_percentage">0</div>
  </div>

</div>


<!----------------------------------- 모달 --------------------------------------->
<div class="ui modal modal_buyStock">
  <i class="close icon"></i>
  <div class="header">
    <div id="desc_company_info"><span id="spanName">${requestScope.name }</span>
<span id="spanCode">${requestScope.code }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="currentPrice"><fmt:formatNumber>${requestScope.price }</fmt:formatNumber>원</span></div>

  
  </div>
  <div class="content">
   <span style="color: #e74c3c">${sessionScope.user.name }</span>님의 평가자산  : <span  id="evaluatedAsset"><fmt:formatNumber>0</fmt:formatNumber></span>원<br/>
   <br/>
   현재 남은 현금 : <span id="remainCash"><fmt:formatNumber>0</fmt:formatNumber> 원</span> - <span id="totalPrice"><fmt:formatNumber>0</fmt:formatNumber></span> = <span id="afterCash"><fmt:formatNumber>0</fmt:formatNumber> 원</span>
   <hr>
   <span style="color: #e74c3c">${requestScope.name }</span> 주식을 <input type="text" placeholder="0" style="text-align: right" id="volumeString" value="0">주 매수합니다.(현재 시장가로 바로 체결됩니다.)
   
   
  </div>
  <div class="actions">
  	<div class="ui button btn_buy" id="simulConfirmBtn">
      	확인
    </div>
    <div class="ui button btn_close" id="simulCancelBtn">
      	취소
    </div>
    
  </div>
</div>
<!----------------------------------- 모달 --------------------------------------->



<!-- css테이블 적용되늑ㄱ------------------------------------------------ -->
<div id="pricing-table" class="clear">
    <div class="plan">
        <h3>기업가치<span id="dcfScore">100</span></h3>       
        
    </div>
	<div class="plan">

        <h3>수익성<span id="multipleScore">100</span></h3>       
       
    </div>
    <div class="plan">
        <h3>안정성<span id="riskScore">100</span></h3>       
       
    </div>
    <div class="plan">
        <h3>관심지수<span id="bigDataScore">100</span></h3>       
        
    </div>
    <div class="plan">
        <h3>최근추세<span id="trendScore">100</span></h3>       
        
    </div>
    
</div>
<!--  ------------------------------------------------------------------>

<span style="font-size:0.7em; font-weight:bold;">*100점 만점 기준으로 평가한 점수입니다</span>

</div>

<!-- ddd -->
</div>

<div id="reportLower">

			<div class="tabMenu">
				<nav class="cl-effect-13" id="cl-effect-13">

					<a id="btnDcf" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">기업가치</a>
					<a id="btnMultiple" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">수익성</a>
					<a id="btnRisk" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">안정성</a>
					<a id="btnBigData" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">관심지수</a>
					<a id="btnTrend" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">최근추세</a>
					<a id="btnFS" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">재무제표</a>
					<a id="btnAdv" onmouseover="" style="cursor: pointer; font-size:0.94em; font-weight:700;">DCF(Adv)</a>

				</nav>
			</div>
			
			
<div id="reportContent">			
	<c:if test="${not empty requestScope.reportContent }">
		<jsp:include page="${requestScope.reportContent }" />
	</c:if>
	<iframe id="contentIframe" seamless="seamless" width="930px" height="1000px" src="" frameborder='0'></iframe>
		
</div>

</div>

</div>
</div>

<!-- dcf adv 모달 -->
<div class="ui small modal dcf" >
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<div class="left">전문가용 DCF모델 입니다. 회원님께서 직접 Customize하실 수 있습니다.<br/><br/>
								전문적 지식이 요구됩니다.
			</div>
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
		
	</div>
</div>


<!-- 즐겨찾기 등록 -->
<div class="ui small modal beforeAdd" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span style="color: #e74c3c">${requestScope.name}</span>가 즐겨찾기에 등록되었습니다.
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
		
	</div>
</div>


<!-- 즐겨찾기 해제 -->
<div class="ui small modal afterAdd" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span style="color: #e74c3c">${requestScope.name}</span>가 즐겨찾기에서 해제되었습니다.
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>


<!-- 잔액 부족 -->
<div class="ui small modal balance" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span>잔액이 모자랍니다.</span>
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>


<!-- 주문체결 -->
<div class="ui small modal order" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span>주문이 체결되었습니다.</span>
		</div>
			<div class="actions">
			
			<a class="small ui button moveSimulation" id="confirm" href="#">확인</a>
			</div>
</div>


<!-- 주문수량 확인 -->
<div class="ui small modal orderCheck" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span>주문수량을 확인하세요.</span>
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>


<!-- 로그인 확인(비정상적 접근 체크) -->
<div class="ui small modal gologin" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span>로그인을 해주세요.</span>
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>


<!-- 주문수량 많음 -->
<div class="ui small modal tooMuchOrder" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span>주문수량이 너무 많습니다.</span>
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>


<!-- 주문 이상. 네트워크상태 체크 -->
<div class="ui small modal orderError" style="width: 400px; margin-left:5px">
	<i class="close icon"></i>
	<div class="header">알림</div>
		<div class="content">
			<span>주문에 이상이 생겼습니다. 네트워크상태를 확인하세요</span>
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>

<!-- 여기서는 뉴스파싱을 해올 놈을 지정함 -->
<div class="ui modal news">
	<i class="close icon"></i>
	<div class="header"><i class="bell outline icon"></i>뉴스</div>
		<div class="content">
			
			<table id="news_table" class="ui collapsing table segment" style="margin:0px auto">
			<tr>
			<th>시각</th>
			<th>뉴스기사</th>
			</tr>
			
			
			</table>
			
		</div>
			<div class="actions">
			
			<a class="small ui button" id="confirm" href="#">확인</a>
			</div>
</div>
