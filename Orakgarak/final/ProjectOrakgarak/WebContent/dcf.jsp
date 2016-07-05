<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<h3 class="list-group-item list-group-item-success" style="color: black;"><span id="compName" style="color: red">숙련가</span> 에 대한 현금흐름 할인법(DCF) 가치평가 모델</h3>


<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet">
<div id="myExcelDiv" style="width: 100%; height: 900px"></div>
<script type="text/javascript" src="http://r.office.microsoft.com/r/rlidExcelWLJS?v=1&kip=1"></script>
<script type="text/javascript">
	/*
	 * This code uses the Microsoft Office Excel Javascript object model to programmatically insert the
	 * Excel Web App into a div with id=myExcelDiv. The full API is documented at
	 * http://msdn.microsoft.com/en-US/library/hh315812.aspx. There you can find out how to programmatically get
	 * values from your Excel file and how to use the rest of the object model. 
	 */

	// Use this file token to reference FinancialModel_for_Newbie - 0524.xlsx in Excel's APIs
	var fileToken = "SDCA498C6AD0A21AB9!301/-3870408014353524039/t=0&s=0&v=!AJHVxzHhQYtknDY";

	// run the Excel load handler on page load
	if (window.attachEvent) {
		window.attachEvent("onload", loadEwaOnPageLoad);
	} else {
		window.addEventListener("DOMContentLoaded", loadEwaOnPageLoad, false);
	}

	function loadEwaOnPageLoad() {
		//alert("전문가용 DCF모델 입니다. 회원님께서 직접 Customize하실 수 있습니다. 전문적 지식이 요구됩니다.")
		var props = {
			uiOptions: {
				showDownloadButton: false,
				showRowColumnHeaders: false,
				selectedCell: "'Valuation'!A1"
			},
			interactivityOptions: {
				
				allowTypingAndFormulaEntry: true,
				allowParameterModification: true,
				allowSorting: true,
				allowFiltering: true,
				allowPivotTableInteractivity: true
				
				
			}
		};

		Ewa.EwaControl.loadEwaAsync(fileToken, "myExcelDiv", props, onEwaLoaded);
	}

	function onEwaLoaded(result) {
		/*
		 * Add code here to interact with the embedded Excel web app.
		 * Find out more at http://msdn.microsoft.com/en-US/library/hh315812.aspx.
		 */
	}
</script>




</head>
<body>

</body>
</html>