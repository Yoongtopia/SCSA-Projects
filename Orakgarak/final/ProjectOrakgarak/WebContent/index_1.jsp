<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" type="text/css" href="css/jquery.css"> -->
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css' />


<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">

	$(document).ready(function(){		
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
		});	//searchBtn
		 
	}); //ready
	
</script>
<style type="text/css">
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
</head>
<body>
	<jsp:include page="menu.jsp" />


	<c:if test="${not empty contentPage }">
		<jsp:include page="${requestScope.contentPage }" />
	</c:if>
	
	
	<div id="overlay">
		<div>
			<h3>검색결과</h3>
			<table id="companyList">
		
			</table>
		</div>
	</div>
	

	<jsp:include page="footer.jsp" />

</body>
</html>