<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.min.css">

<script type="text/javascript">
$(document).ready(function() {	
	
	$("#searchBtn").click(function() {
		//alert(document.getElementById("searchStock").value);
		
		$.post("${pageContext.request.contextPath}/search.do",
		{"searchStock" : document.getElementById("searchStock").value},
		function(jsonObj) {
			if (jsonObj.status) {
				$(jsonObj.companyList).each(function(index, item) {
										
					var code = item.stockCode;
					var name = item.stockName;
									
					var td1=$('<td/>').html(code);
					var td2=$('<td/>').html(name);
					var a=$('<a/>').attr("href","${pageContext.request.contextPath}/stock_detail.do?stockCode="+code).append(td2);
					var tr=$('<tr/>').append(td1,a);
					
					tr.appendTo('#companyList');
											
					el = document.getElementById("overlay");
					el.style.visibility = "visible";

												
				});
			} else {
				alert("에러");
			}  
			
		});
		
	
					
	});
	
});

</script>
<style>
input[type=text]{
	border: 0;
	width: 350px;
	height: 26px;
	padding: 10px;
	font: normal 16px "Ruda", Arial, sans-serif;
	color: #b3b3b3;
	border: solid 3px #e74c3c;
	float: left;
	-webkit-border-radius: 0!important;
	-moz-border-radius: 0!important;
	border-radius: 0!important;
}

#searchBtn{
	
	position: relative;
	border: none;
	background-color: #e74c3c;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 100%;
	height:52px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 80px;
}

#searchWrapper{
	
	background-color: #fafafa;
	border-top: solid 1px #e1e1e1;
	border-bottom: solid 1px #e1e1e1;
	width: 100%;
	height: 94px;
	position:relative;
	margin-top: 200px;
	margin-bottom: 200px;
}

#searchbox{
	margin-top:20px;
	margin-left: 35%;
}

#overlay {
	visibility: hidden;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	text-align: center;
	z-index: 1000;
	background-image:url(img/background-trans.png)
}

#overlay div {
	width: 300px;
	margin: 100px auto;
	background-color: #fff;
	border: 1px solid #000;
	padding: 15px;
	text-align: center;
}

</style>
<div id="searchWrapper">
	<div id="searchbox">
    <input type="text" id="searchStock" name="searchStock" placeholder="검색할 종목을 입력하세요.."/>
    <input type="submit" value="검색" id="searchBtn"/>
    </div>
</div>

<div id="overlay">
	<div>
		<h3>검색결과</h3>
		<table id="companyList">
		</table>
		
	</div>
</div>