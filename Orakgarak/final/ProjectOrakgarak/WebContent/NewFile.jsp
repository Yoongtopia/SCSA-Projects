
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- slider css -->
 <script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath }/js/report_slider/bjqs-1.3.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/bjqs.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/demo.css">

<!--   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> 
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
 -->
 
  <!-- Bootstrap core CSS -->
    <link href="css/dcf/bootstrap.css" rel="stylesheet">
    <link href="css/dcf/jquery.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dcf/main.css" rel="stylesheet">

 <!--  Fonts from Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Lato:300,400,900' rel='stylesheet' type='text/css'>
 		<script src="js/dcf/jquery.cookie.js"></script>
		<script src="js/dcf/bootstrap.min.js"></script>
		<link rel="shortcut icon" href="../favicon.ico">
		<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
		<link rel="stylesheet" type="text/css" href="css/dcf/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/component.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/content.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/orakgarak.css"/>
		<script src="js/dcf/modernizr.custom.js"></script>
		
		

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://r.office.microsoft.com/r/rlidExcelWLJS?v=1&kip=1"></script>
<script type="text/javascript">
	/*
	 * This code uses the Microsoft Office Excel Javascript object model to programmatically insert the
	 * Excel Web App into a div with id=myExcelDiv. The full API is documented at
	 * http://msdn.microsoft.com/en-US/library/hh315812.aspx. There you can find out how to programmatically get
	 * values from your Excel file and how to use the rest of the object model. 
	 */

	// Use this file token to reference FinancialModel_for_Newbie - 0524.xlsx in Excel's APIs
 var fileToken = "SDCA498C6AD0A21AB9!312/-3870408014353524039/t=0&s=0&v=!AFwz9An9_Aqe0JM";
	
// run the Excel load handler on page load
	if (window.attachEvent) {
		window.attachEvent("onload", loadEwaOnPageLoad);
	} else {
		window.addEventListener("DOMContentLoaded", loadEwaOnPageLoad, false);
	}

	function loadEwaOnPageLoad() {
		var props = {
			uiOptions: {
				showDownloadButton: true,
				showGridlines: false,
				showRowColumnHeaders: false,
				selectedCell: "'Valuation'!D47",
				//selectedCell: "'Valuation'!D48",
				showParametersTaskPane: false
			},
			interactivityOptions: { 
				allowTypingAndFormulaEntry: false,
				allowParameterModification: false,
				allowSorting: false,
				allowFiltering: false,
				allowPivotTableInteractivity: false
				
			}
		};

		Ewa.EwaControl.loadEwaAsync(fileToken, "myExcelDiv", props, onEwaLoaded);
	}

	function onEwaLoaded() {
		ewa = Ewa.EwaControl.getInstances().getItem(0);
		
		insert();
    }
	
	//엑셀에서 값 빼오는거
	// This sample gets the value in the highlighted cell. 
	// Try clicking on different cells then running the sample.
	function execute()
	{
	    // Get unformatted range values (getValuesAsync(0,...) where 0 = Ewa.ValuesFormat.Unformatted)
	    ewa.getActiveWorkbook().getActiveCell().getValuesAsync(0,getRangeValues,null);
	
	
	
	}     
	
	
	 
 
	
	
	
	
	function getRangeValues(asyncResult)
	{
	    // Get the value from asyncResult if the asynchronous operation was successful.
	    if (asyncResult.getCode() == 0)
	    {
	        // Get the value in active cell (located at row 0, column 0 of the
	        // range which consists of a single cell (the "active cell")).
	        $(".list").remove();
	        var zz = $("<td/>").attr("class", "list").text(asyncResult.getReturnValue()[0][0]);
	        var tr = $("<tr/>").attr("class", "listTr").append(zz);    
	        $("#listTable").append(tr);
	        $("#listTable").hide();
	
	        	var valPrice = asyncResult.getReturnValue()[0][0];
	        	var currentPrice = "${requestScope.price}";
	        	var calculatedPrice = valPrice/currentPrice;
	        	var calculatedScore = calculatedPrice*100/1.8;
	        	var NoneStdev = 0.65;
	        	var NhalfStDev = 0.89;
	        	var PhalfStDev = 1.11;
	        	var PoneStDev = 1.65;
	        
	        	if((calculatedScore)>=90){
	        		$("#results").text("강력매수");
	        	}else if((calculatedScore)>=70){
	        		$("#results").text("매수");
	        	}else if((calculatedScore)>=50){
	        		$("#results").text("중립");
	        	}else if((calculatedScore)>=35){
	        		$("#results").text("매도");
	        	}else{
	        		$("#results").text("강력매도");
	        	}
	        	
	        	/* if(calculatedScore>=100){
	        		$("#score").text("100");
	        	}else if(calculatedScore<=0){
	        		$("#score").text("0");
	        	
	        	}else{
	        		$("#score").text(Math.round(calculatedScore));
	        	} */
	        	
	        	
	        	if(calculatedPrice>=7){
	        		$("#score").text("100");
	        	}else if(calculatedPrice>=6){
	        		$("#score").text("99");
	        	}else if(calculatedPrice>=5){
	        		$("#score").text("98");
	        	}else if(calculatedPrice>=4){
	        		$("#score").text("97");
	        	}else if(calculatedPrice>=3){
	        		$("#score").text("96");
	        	}else if(calculatedPrice>=2){
	        		$("#score").text("95");
	        	}else if(calculatedPrice<2 && calculatedScore>=100.1){
	        		$("#score").text("82");
	        	}else if(calculatedScore<2 && calculatedScore<101 && calculatedScore>=50){
	        		$("#score").text(Math.round(calculatedScore)-5);
	        	}else{
	        		$("#score").text(Math.round(calculatedScore));
	        	}
	        		
	        	
	        	
	        	
	        	var highestScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락닷컴에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>저평가</span> 되어 있는것으로써 앞으로 오를 가능성이 매우 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락닷컴에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
	    		var highScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락닷컴에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>저평가</span> 되어 있는것으로써 앞으로 오를 가능성이 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락닷컴에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
	    		var averageScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락닷컴에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>적절하게 </span> 반영 되어 있는것으로써 앞으로 주식가격 변화폭이 적을 가능성이 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락닷컴에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
	    		var lowScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락닷컴에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>높게</span> 반영 되어 있는것으로써 앞으로 주식가격이 내려갈 가능성이 있는 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락닷컴에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
	    		var lowestScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락닷컴에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>매우 높게</span> 반영 되어 있는것으로써 앞으로 주식가격이 내려갈 가능성이 매우 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락닷컴에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
	    		
	    		
	    		if(($("#score").text())>=90){
	    			$("#description").html(highestScore);
	    			$("#description2").html(highestScore);
	    		}else if(($("#score").text())>=80){
	    			$("#description").html(highScore);
	    			$("#description2").html(highScore);
	    		}else if(($("#score").text())>=60){
	    			$("#description").html(averageScore);
	    			$("#description2").html(averageScore);
	    		}else if(($("#score").text())>=40){
	    			$("#description").html(lowScore);
	    			$("#description2").html(lowScore);
	    		}else{
	    			$("#description").html(lowestScore);
	    			$("#description2").html(lowestScore);
	    		}
	        	
	        	
	        	
	        	
	        	
	        	
	    }
	    else 
	    {
	          alert("인터넷 연결 문제거나 서버에 일시적인 문제가 있습니다. 잠시후 다시 시도해 주시기 바랍니다. " + asyncResult.getDescription() + ".");
	    }    
	}

	
	
	
	
	
	
	
	//========================================================================
	//Excel에 값 입력
	function insert()
	{
	    //get the current sheet name and build the range address in A1 notation
		var currentSheet = ewa.getActiveWorkbook().getActiveSheet().getName();
		
		//Note: If the sheet name has spaces, you must surround it in single quotes
		
		var rev1 = currentSheet + "!" + "B4";
 		var rev2 = currentSheet + "!" + "C4";
 		var rev3 = currentSheet + "!" + "D4";
		var rev4 = currentSheet + "!" + "E4";
		var rev5 = currentSheet + "!" + "F4";
		
		var cogs1 = currentSheet + "!" + "B5"; 
		var cogs2 = currentSheet + "!" + "C5"; 
		var cogs3 = currentSheet + "!" + "D5"; 
		var cogs4 = currentSheet + "!" + "E5"; 
		var cogs5 = currentSheet + "!" + "F5"; 
		
		var sga1 = currentSheet + "!" + "B6"; 
		var sga2 = currentSheet + "!" + "C6"; 
		var sga3 = currentSheet + "!" + "D6"; 
		var sga4 = currentSheet + "!" + "E6"; 
		var sga5 = currentSheet + "!" + "F6"; 
		
		
		var tax1 = currentSheet + "!" + "B8"; 
		var tax2 = currentSheet + "!" + "C8"; 
		var tax3 = currentSheet + "!" + "D8"; 
		var tax4 = currentSheet + "!" + "E8"; 
		var tax5 = currentSheet + "!" + "F8"; 
		
		var cff1 = currentSheet + "!" + "B11"; 
		var cff2 = currentSheet + "!" + "C11"; 
		var cff3 = currentSheet + "!" + "D11"; 
		var cff4 = currentSheet + "!" + "E11"; 
		var cff5 = currentSheet + "!" + "F11"; 
		
		
		var rf = currentSheet + "!" + "D36"; 
		var growth = currentSheet + "!" + "D41"; 
		var debt = currentSheet + "!" + "D43"; 
		var equity = currentSheet + "!" + "D44"; 
		var asset = currentSheet + "!" + "D45"; 
		var kd = currentSheet + "!" + "G35"; 
		var beta = currentSheet + "!" + "G38"; 
		var outstanding = currentSheet + "!" + "B32"; 
		var price = currentSheet + "!" + "A52"; 
		
		

	 	var rev1Ins = ewa.getActiveWorkbook().getRangeA1Async(rev1, toRevenue1, null);
	    var rev2Ins = ewa.getActiveWorkbook().getRangeA1Async(rev2, toRevenue2, null);
	    var rev3Ins = ewa.getActiveWorkbook().getRangeA1Async(rev3, toRevenue3, null);
	    var rev4Ins = ewa.getActiveWorkbook().getRangeA1Async(rev4, toRevenue4, null);
	    var rev5Ins = ewa.getActiveWorkbook().getRangeA1Async(rev5, toRevenue5, null);
	
	    var cogs1Ins = ewa.getActiveWorkbook().getRangeA1Async(cogs1, toCOGS1, null);
	    var cogs2Ins = ewa.getActiveWorkbook().getRangeA1Async(cogs2, toCOGS2, null);
	    var cogs3Ins = ewa.getActiveWorkbook().getRangeA1Async(cogs3, toCOGS3, null);
	    var cogs4Ins = ewa.getActiveWorkbook().getRangeA1Async(cogs4, toCOGS4, null);
	    var cogs5Ins = ewa.getActiveWorkbook().getRangeA1Async(cogs5, toCOGS5, null); 
	    
	    var sga1Ins = ewa.getActiveWorkbook().getRangeA1Async(sga1, toSGA1, null);
	    var sga2Ins = ewa.getActiveWorkbook().getRangeA1Async(sga2, toSGA2, null);
	    var sga3Ins = ewa.getActiveWorkbook().getRangeA1Async(sga3, toSGA3, null);
	    var sga4Ins = ewa.getActiveWorkbook().getRangeA1Async(sga4, toSGA4, null);
	    var sga5Ins = ewa.getActiveWorkbook().getRangeA1Async(sga5, toSGA5, null); 

	    var tax1Ins = ewa.getActiveWorkbook().getRangeA1Async(tax1, toTax1, null);
	    var tax2Ins = ewa.getActiveWorkbook().getRangeA1Async(tax2, toTax2, null);
	    var tax3Ins = ewa.getActiveWorkbook().getRangeA1Async(tax3, toTax3, null);
	    var tax4Ins = ewa.getActiveWorkbook().getRangeA1Async(tax4, toTax4, null);
	    var tax5Ins = ewa.getActiveWorkbook().getRangeA1Async(tax5, toTax5, null); 
	    
	    var cff1Ins = ewa.getActiveWorkbook().getRangeA1Async(cff1, toCFF1, null);
	    var cff2Ins = ewa.getActiveWorkbook().getRangeA1Async(cff2, toCFF2, null);
	    var cff3Ins = ewa.getActiveWorkbook().getRangeA1Async(cff3, toCFF3, null);
	    var cff4Ins = ewa.getActiveWorkbook().getRangeA1Async(cff4, toCFF4, null);
	    var cff5Ins = ewa.getActiveWorkbook().getRangeA1Async(cff5, toCFF5, null);
	    
	    var rfIns = ewa.getActiveWorkbook().getRangeA1Async(rf, toRF, null);
	    var growthIns = ewa.getActiveWorkbook().getRangeA1Async(growth, toGrowth, null);
	    var debtIns = ewa.getActiveWorkbook().getRangeA1Async(debt, toDebt, null);
	    var equityIns = ewa.getActiveWorkbook().getRangeA1Async(equity, toEquity, null);
	    var assetIns = ewa.getActiveWorkbook().getRangeA1Async(asset, toAsset, null);
	    var kdIns = ewa.getActiveWorkbook().getRangeA1Async(kd, toKd, null);
	    var betaIns = ewa.getActiveWorkbook().getRangeA1Async(beta, toBeta, null);
	    var outstandingIns = ewa.getActiveWorkbook().getRangeA1Async(outstanding, toOutstanding, null);
	    var priceIns = ewa.getActiveWorkbook().getRangeA1Async(price, toPrice, null);
	    
	    
	  setTimeout("execute()",1000*7);
	/*   setTimeout("calculation()",1000*8); */
	   
	    
	}     
	
 	/* function calculation(){
		var valPrice = asyncResult.getReturnValue()[0][0];
		var currentPrice = 8000;
		var calculatedPrice = valPrice/currentPrice;
		var NoneStdev = 0.65;
		var NhalfStDev = 0.89;
		var PhalfStDev = 1.11;
		var PoneStDev = 1.65;
		alert(valPrice);
		if((valPrice/currentPrice)>PoneStDev){
			$("#results").val("강력매수");
		}else if((valPrice/currentPrice)>PhalfStDev){
			$("#results").val("매수");
		}else if((valPrice/currentPrice)>NhalfStDev){
			$("#results").val("중립");
		}else if((valPrice/currentPrice)>NoneStdev){
			$("#results").val("강력매도");
		}
		
		
	} 
	 */
	
	//Revenue
	function toRevenue1(asyncResult){
		 var rev1 = $("#2009_revenue").text();

		var rev1Ins = asyncResult.getReturnValue();
		rev1Ins.setValuesAsync([[rev1]],setRangeValues,null);
	}
	function toRevenue2(asyncResult){
		 var rev2 = $("#2010_revenue").text();
		var rev2Ins = asyncResult.getReturnValue();
		rev2Ins.setValuesAsync([[rev2]],setRangeValues,null);
	}
	function toRevenue3(asyncResult){
		 var rev3 = $("#2011_revenue").text();
		var rev3Ins = asyncResult.getReturnValue();
		rev3Ins.setValuesAsync([[rev3]],setRangeValues,null);
	}
	function toRevenue4(asyncResult){
		 var rev4 = $("#2012_revenue").text();
		var rev4Ins = asyncResult.getReturnValue();
		rev4Ins.setValuesAsync([[rev4]],setRangeValues,null);
	}
	function toRevenue5(asyncResult){
		 var rev5 = $("#2013_revenue").text();
		var rev5Ins = asyncResult.getReturnValue();
		rev5Ins.setValuesAsync([[rev5]],setRangeValues,null);
	}
	
	//COGS
	function toCOGS1(asyncResult){
		 var cogs1 = $("#2009_cogs").text();
		var cogs1Ins = asyncResult.getReturnValue();
		cogs1Ins.setValuesAsync([[cogs1]],setRangeValues,null);
	}
	function toCOGS2(asyncResult){
		 var cogs2 = $("#2010_cogs").text();
		var cogs2Ins = asyncResult.getReturnValue();
		cogs2Ins.setValuesAsync([[cogs2]],setRangeValues,null);
	}
	function toCOGS3(asyncResult){
		 var cogs3 = $("#2011_cogs").text();
		var cogs3Ins = asyncResult.getReturnValue();
		cogs3Ins.setValuesAsync([[cogs3]],setRangeValues,null);
	}
	function toCOGS4(asyncResult){
		 var cogs4 = $("#2012_cogs").text();
		var cogs4Ins = asyncResult.getReturnValue();
		cogs4Ins.setValuesAsync([[cogs4]],setRangeValues,null);
	}
	function toCOGS5(asyncResult){
		 var cogs5 = $("#2013_cogs").text();
		var cogs5Ins = asyncResult.getReturnValue();
		cogs5Ins.setValuesAsync([[cogs5]],setRangeValues,null);
	}
	 

	//SGA
	function toSGA1(asyncResult){
		 var sga1 = $("#2009_sga").text();
		var sga1Ins = asyncResult.getReturnValue();
		sga1Ins.setValuesAsync([[sga1]],setRangeValues,null);
	}
	function toSGA2(asyncResult){
		 var sga2 = $("#2010_sga").text();
		var sga2Ins = asyncResult.getReturnValue();
		sga2Ins.setValuesAsync([[sga2]],setRangeValues,null);
	}
	function toSGA3(asyncResult){
		 var sga3 = $("#2011_sga").text();
		var sga3Ins = asyncResult.getReturnValue();
		sga3Ins.setValuesAsync([[sga3]],setRangeValues,null);
	}
	function toSGA4(asyncResult){
		 var sga4 = $("#2012_sga").text();
		var sga4Ins = asyncResult.getReturnValue();
		sga4Ins.setValuesAsync([[sga4]],setRangeValues,null);
	}
	function toSGA5(asyncResult){
		 var sga5 = $("#2013_sga").text();
		var sga5Ins = asyncResult.getReturnValue();
		sga5Ins.setValuesAsync([[sga5]],setRangeValues,null);
	}

	//Tax
	function toTax1(asyncResult){
		 var tax1 = $("#2009_tax").text();
		var tax1Ins = asyncResult.getReturnValue();
		tax1Ins.setValuesAsync([[tax1]],setRangeValues,null);
	}
	function toTax2(asyncResult){
		 var tax2 = $("#2010_tax").text();
		var tax2Ins = asyncResult.getReturnValue();
		tax2Ins.setValuesAsync([[tax2]],setRangeValues,null);
	}
	function toTax3(asyncResult){
		 var tax3 = $("#2011_tax").text();
		var tax3Ins = asyncResult.getReturnValue();
		tax3Ins.setValuesAsync([[tax3]],setRangeValues,null);
	}
	function toTax4(asyncResult){
		 var tax4 = $("#2012_tax").text();
		var tax4Ins = asyncResult.getReturnValue();
		tax4Ins.setValuesAsync([[tax4]],setRangeValues,null);
	}
	function toTax5(asyncResult){
		 var tax5 = $("#2013_tax").text();
		var tax5Ins = asyncResult.getReturnValue();
		tax5Ins.setValuesAsync([[tax5]],setRangeValues,null);
	}
	
	//투자활동으로 인한 현금 유출액
	function toCFF1(asyncResult){
		var cff1 = $("#2009_capex").text();
		var cff1Ins = asyncResult.getReturnValue();
		cff1Ins.setValuesAsync([[cff1]],setRangeValues,null);
	}
	function toCFF2(asyncResult){
		var cff2 = $("#2010_capex").text();
		var cff2Ins = asyncResult.getReturnValue();
		cff2Ins.setValuesAsync([[cff2]],setRangeValues,null);
	}
	function toCFF3(asyncResult){
		var cff3 = $("#2011_capex").text();
		var cff3Ins = asyncResult.getReturnValue();
		cff3Ins.setValuesAsync([[cff3]],setRangeValues,null);
	}
	function toCFF4(asyncResult){
		var cff4 = $("#2012_capex").text();
		var cff4Ins = asyncResult.getReturnValue();
		cff4Ins.setValuesAsync([[cff4]],setRangeValues,null);
	}
	function toCFF5(asyncResult){
		var cff5 = $("#2013_capex").text();
		var cff5Ins = asyncResult.getReturnValue();
		cff5Ins.setValuesAsync([[cff5]],setRangeValues,null);
	}
	
	//나머지 plug들
	function toRF(asyncResult){
		var rf = $("#rf").text();
		var rfIns = asyncResult.getReturnValue();
		rfIns.setValuesAsync([[rf]],setRangeValues,null);
	}
	function toGrowth(asyncResult){
		
		var growth = $("#2013_growth").text();
		var growthIns = asyncResult.getReturnValue();
		growthIns.setValuesAsync([[growth]],setRangeValues,null);
	}
	function toDebt(asyncResult){
		var debt = $("#2013_debt").text();
		var debtIns = asyncResult.getReturnValue();
		debtIns.setValuesAsync([[debt]],setRangeValues,null);
	}
	function toEquity(asyncResult){
		var equity = $("#2013_equity").text();
		var equityIns = asyncResult.getReturnValue();
		equityIns.setValuesAsync([[equity]],setRangeValues,null);
	}
	function toAsset(asyncResult){
		var asset = $("#2013_asset").text();
		var assetIns = asyncResult.getReturnValue();
		assetIns.setValuesAsync([[asset]],setRangeValues,null);
	}
	function toKd(asyncResult){
		var kd = $("#2013_kd").text();
		var kdIns = asyncResult.getReturnValue();
		kdIns.setValuesAsync([[kd]],setRangeValues,null);
	}
	function toBeta(asyncResult){
		var beta = $("#2013_beta").text();
		var betaIns = asyncResult.getReturnValue();
		betaIns.setValuesAsync([[beta]],setRangeValues,null);
	}
	function toOutstanding(asyncResult){
		var outstanding = $("#2013_outstanding").text();
		var outstandingIns = asyncResult.getReturnValue();
		outstandingIns.setValuesAsync([[outstanding]],setRangeValues,null);
	}
	function toPrice(asyncResult){
		var price = $("#price").text();
		var priceIns = asyncResult.getReturnValue();
		priceIns.setValuesAsync([[price]],setRangeValues,null);
	}

   
	
	
	//===============================================================================
	 
	function setRangeValues(asyncResult)
	{
	    // Get the value from asyncResult if the asynchronous operation was successful.
	    if (asyncResult.getCode() == 0)
	    {
	        window.status = "Set values completed: " + asyncResult.getSucceeded();
	    }
	    else 
	    {
	          alert("인터넷 연결 문제거나 서버에 일시적인 문제가 있습니다. 잠시후 다시 시도해 주시기 바랍니다. " + asyncResult.getDescription() + ".");
	    }    
	}
	
	
	function hide(){
		
		$(".rft, .fst").hide();
	
	}

	function close(){
		$("#myModal").remove();
		$(".modal-backdrop").hide();
		

	}
	
	function updatePentagon(){
		var code = $("#2013_code").text();
		 $.post("${pageContext.request.contextPath}/dcfPentagon_update.do?stockCode="+code,
			
				
				 {"scoreDcf" : $("#score").text()});
	
		
		}
	
	function insertGrowth(){
		$.post("${pageContext.request.contextPath}/select_growth.do",
				{"indName": $("#2013_indName").text()}
				,
				function(jsonObj) {
				 if(jsonObj.status){
					$("#2013_growth").text(jsonObj.growth);
				 }else{
					 $("#2013_growth").text(0.012);
				 }
			 });
	
			
		
		}
	
	
	function insertCostOfDebt(){
		
		$.post("${pageContext.request.contextPath}/select_costofdebt.do",
				{"code": $("#2013_code").text(),
					"year": $("#2013_year").text()}
				,
				function(jsonObj) {
				 if(jsonObj.status){
					$("#2013_kd").text(jsonObj.kd);
				 }else{
					 $("#2013_kd").text(0);
				 }
			 });
	
			
		
		}
	

	
	function updateScore(){
		var code = $("#2013_code").text();
		var year = $("#2013_year").text();
		 $.post("${pageContext.request.contextPath}/dcf_update.do?code="+code+"&&year="+year,
		
			
			 {"score" : $("#score").text()});
	
	}
	
	function manual(){
		$('#yourModal').modal({show:true,
			keyboard: false,
			backdrop: 'static'
			
		});
	 	$("#yourModal").show();
		
	 	
	 	
	 	
		/* $(".modal-backdrop").show(); */
	}
	
	
	$(document).ready(function(){
	
		   hide();   
		 insertGrowth();
		 insertCostOfDebt();
		
		 
		  $("#score").hide();
		 $("#results").hide(); 
		 $("#price").hide(); 
			
		var corpName = $("#2013_name").text();
		$("#compName").append(corpName);
		 
		
		$('#myModal').modal({show:true,
			keyboard: false,
			backdrop: 'static'
			
		});
		
		
		var currentPrice = "${requestScope.price}";
    	$("#price").text(currentPrice);
    	
	 setTimeout("close()",1000*9); 
		setTimeout("updateScore()", 1000*13);
		setTimeout("updatePentagon()", 1000*14);
		
		
	/* 	$(".icon icon-close").click(function(){
			$(".morph-content").remove();
		}) */
		var regression = parseInt("${prove.regression}");
	
	
	$("#description3").html("과거 DCF와 실제 주식가격변동간의 회귀분석 결과 해당 종목의 DCF점수와 주가의 상관성은 <span style='color: #e64a3c; font-weight: bold'>"+regression+"% </span> 입니다. 100% 에 가까울수록 향후 주가의 방향성이 <span style='color: #e64a3c; font-weight: bold'>같을</span> 가능성이 높으며 -100%에 가까울수록 <span style='color: #e64a3c; font-weight: bold'>정반대</span>로 갈 확률이 높습니다.");
		
	
	
	$("#plz").click(function(){
		var ischecked = $("input[name='please']:checkbox:checked").length;
		/* var ischecked = $("#plz").attr("checked", "checked"); */
		
		if(ischecked ==1){
		
			  $.cookie('modal_dismiss', status, {
		             expires: 1,
		             path: '/'
		         });
		}
		
	});
	  //use modal hidden event for checking checkbox status
/* $('#yourModal').on('hidden', function () {
	 var status = $("input:checkbox[name='please']").is(":checked");
     if(status){
   	  $.cookie('modal_dismiss', status, {
             expires: 1,
             path: '/'
         });
     };

}); */
       
	 
	            if(!$.cookie('modal_dismiss')) {
	                //moved modal stuff in if case
	            	setTimeout("manual()",1000*10);
	            	
	            };
	   
	  
	});
	
	var dcf11 = parseInt("${prove.dcf2011}");
	var dcf12 = parseInt("${prove.dcf2012}");
	var dcf13 = parseInt("${prove.dcf2013}");
	var price11 = parseInt("${prove.price2012}");
	var price12 = parseInt("${prove.price2013}");
	var price13 = parseInt("${prove.price2014}");
	
	 google.load("visualization", "1", {packages:["corechart"]});
     google.setOnLoadCallback(drawChart);
     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['Year', 'DCF점수 (전기대비)', '과거주가 (전기대비)'],
         ['2011-12',  dcf11,      price11],
         ['2012-13',  dcf12,      price12],
         ['2013-14',  dcf13,       price13]
       ]);

       var options = {
         title: '과거 기업가치 점수와 주가의 변화'
       };

       var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
       chart.draw(data, options);
     }
	
	
</script>
<style type="text/css">
.content.cover p{
	 font-size:0.65em;
	 color:rgb(218, 218, 218);
	 line-height:1.6em;
}
</style>

</head>
<body>



<h3 style="color: black; padding:10px 15px; display: block; position:relative"><span id="compName" style="color: red"></span> 에 대한 현금흐름 할인법(DCF) 가치평가 모델 결과                  <button class="btn btn-primary btn-lg" style="margin: 0 auto; margin-left:100" data-toggle="modal" data-target="#myModal" onclick="manual()">DCF 설명보기</button></h3>
<div id="myExcelDiv" style="width: 100%; height: 600px; position:relative;"></div>

<table id="listTable">


</table>
<br/><br/><br/>

<table>
<tr>
<td id="score"></td>
<td id="results"></td>
<td id="price"></td>

</tr>

</table>

<%-- <table>
<tr><td>${prove.dcf2011 }</td></tr>
</table> --%>
<!-- More info box -->
<section>


				<p style="font-size: 15px; color: black;"> 자세한 리포트를 보시려면 아래 버튼을 클릭해 주세요.</p>
				<div class="morph-button morph-button-overlay morph-button-fixed" style="background-color: #464040;">
					<button type="button" style="font-size: 12px; background-color: #464040;">More Info</button>
					<div class="morph-content" style="background-color: #464040;">
						<div style="background-color: #464040;">
							<div class="content-style-overlay" style="background-color: #464040">
								<span class="icon icon-close" style="background-color: #464040;">Close the overlay</span>
								<h3 style="font-weight: bold;">DCF분석 결과에 대한 의견</h3>
								<p id="description2" style="font-size: 20px;">
								
								<h3 style="font-weight: bold;">DCF와 주가의 상관관계 분석 결과</h3>
								<div id="chart_div" style="width: 550px; height: 400px; margin: 0 auto;"></div></p>
								  <p id="description3" style="font-size: 20px"></p>
								</div>
						</div>
					</div>
				</div><!-- morph-button -->
				<p style="color: black;"> 투자 판단에서는 자신의 이해가 가능한 것을 선택하라. <br/> -Warren E. Buffet- </p>
			</section>








<table border="1" class="fst">

<tr>
<td>년도</td>
<td>매출</td>
<td>매출원가</td>
<td>판관비</td>
<td>법인세비용</td>
<td>순유출(capex)</td>
<td>타인자본비용</td>
<td>베타</td>
<td>발행주수</td>
<td>영구성장률</td>
<td>부채</td>
<td>자본</td>
<td>자산</td>
<td>회사명</td>
<td>종목코드</td>
<td>산업명</td>



</tr>


<c:forEach  items="${dcfList}" var="dcf">
<tr>

<td id="${dcf.year }_year">${dcf.year }</td>
<td id="${dcf.year }_revenue">${dcf.revenue }</td>
<td id="${dcf.year }_cogs">${dcf.cogs }</td>
<td id="${dcf.year }_sga">${dcf.sga }</td>
<td id="${dcf.year }_tax">${dcf.tax }</td>
<td id="${dcf.year }_capex">${dcf.capex }</td>
<td id="${dcf.year }_kd">${dcf.kd }</td>
<td id="${dcf.year }_beta">${dcf.beta }</td>
<td id="${dcf.year }_outstanding">${dcf.outstanding }</td>
<td id="${dcf.year }_growth"></td>
<td id="${dcf.year }_debt">${dcf.debt }</td>
<td id="${dcf.year }_equity">${dcf.equity }</td>
<td id="${dcf.year }_asset">${dcf.asset }</td>
<td id="${dcf.year }_name">${dcf.name }</td>
<td id="${dcf.year }_code">${dcf.code }</td>
<td id="${dcf.year }_indName">${dcf.indName }</td>

</tr>



</c:forEach>




</table>

<table class="rft">

<tr>

<td>무위험 이자율</td>
<td id="rf">${rfList.rf }</td>


</tr>


</table>

 <table>
<tr>
<td id="description" style="width: 500px; display: none;"></td>
</tr>

</table> 





<!-- 팝업창 -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">

          <h4 class="list-group-item list-group-item-success" style="text-align: center">로딩중 입니다! 잠시 기다려 주세요.</h4>
        </div>
        <div class="modal-body">
          
        <!--   progress bar -->
          <div class="progress progress-striped active">
  			  <div class="progress-bar"  role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
  			     <span class="sr-only"></span>
  			  </div>
		  </div>
		  <img src="image/sds.gif" width="100%" height="300px">
		  
        </div>
        <div class="modal-footer">

        </div>
      </div>
    </div>
</div>


 <div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 100%">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color:#464040; color:white;">
      <div class="modal-header" style="background-color:#464040; color:white;">
        <button type="button" class="close" data-dismiss="modal" style="color: white;" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel" style="color: white;">현금흐름할인법(DCF) 이란?</h4>
      </div>
      <div class="modal-body" style="background-color:#464040; color:white;">
      
      
      
			<div id="modalText" class="content cover" style="background-color:#464040; color:white;">
	     		<h1 style="text-align:center; color: white; font-size:25px">Discounted Cash Flow</h1>
	     		
				<p style="text-align:center; font-size:15px; color:rgb(218, 218, 218);">오락가락의 기업가치 산출은 <span style="color:#009cd7; font-weight:bold">현금흐름할인모형</span>을 기반으로 평가하였습니다</p>
				
				<span style="font-size:15px;font-weight:500;">현금흐름할인모형:</span>
				
				<p style="font-size: 12px;">&nbsp;&nbsp;&nbsp;
				현금흐름을 적정한 할인율로 할인하여 구한 현재가치로 기업가치를 측정하는 방법이다.<br/>
				산출된 이론상의 주식가격 및 기업가치 점수가 <span style="color:white; font-weight:700;">높은경우</span>, 향후 주가가 <span style="color:white; font-weight:700;">상승</span>한다고 해석할 수 있습니다.
				</p>
				<p style="font-size:12px; border:1px solid gray; border-radius:5px; padding:4px;">
				<span style="background:#e64a3c; font-size: 12px; padding:2px; border-radius:3px;">주의</span>&nbsp;DCF모델은 전문가가 아닌 일반 개인 투자자 입장에서 직접 이해하기에는 어려움이 있을수 있습니다.
				</p>
				<p style="font-size:13px; color:rgb(218, 218, 218); line-height:1.6em; text-align:center">
				오락가락에서는 <span style="color:#e64a3c; font-weight:700;">이론산출 가격이 현재가 대비 높을 수록</span> 기업가치 점수를 높게 평가하였습니다
				</p>
			</div>	
     </div>
    
      <div class="modal-footer" style="background-color:#464040; color:white;">
       
         <label><input id="plz" type="checkbox" value="1" name="please" style="font-size: 13px;">오늘은 다시 보지 않기</label>&nbsp;&nbsp;
   
        <button id="blueBox" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div> 


<%-- 		<% double price = 4700; price=i+1; %>
		<%=i %> --%>

<%-- <%getMarketValue value = new getMarketValu(); %>
<%value.marketdalfijfe %>  --%>


<script src="js/dcf/classie.js"></script>
		<script src="js/dcf/uiMorphingButton_fixed.js"></script>
		<script>
			(function() {	
				var docElem = window.document.documentElement, didScroll, scrollPosition;

				// trick to prevent scrolling when opening/closing button
				function noScrollFn() {
					window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
				}

				function noScroll() {
					window.removeEventListener( 'scroll', scrollHandler );
					window.addEventListener( 'scroll', noScrollFn );
				}

				function scrollFn() {
					window.addEventListener( 'scroll', scrollHandler );
				}

				function canScroll() {
					window.removeEventListener( 'scroll', noScrollFn );
					scrollFn();
				}

				function scrollHandler() {
					if( !didScroll ) {
						didScroll = true;
						setTimeout( function() { scrollPage(); }, 60 );
					}
				};

				function scrollPage() {
					scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
					didScroll = false;
				};

				scrollFn();
				
				var el = document.querySelector( '.morph-button' );
				
				new UIMorphingButton( el, {
					closeEl : '.icon-close',
					onBeforeOpen : function() {
						// don't allow to scroll
						noScroll();
					},
					onAfterOpen : function() {
						// can scroll again
						canScroll();
						// add class "noscroll" to body
						classie.addClass( document.body, 'noscroll' );
						// add scroll class to main el
						classie.addClass( el, 'scroll' );
					},
					onBeforeClose : function() {
						// remove class "noscroll" to body
						classie.removeClass( document.body, 'noscroll' );
						// remove scroll class from main el
						classie.removeClass( el, 'scroll' );
						// don't allow to scroll
						noScroll();
					},
					onAfterClose : function() {
						// can scroll again //
						canScroll();
					}
				} );
			})();
		</script>
