<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jQCloud/jqcloud-1.0.4.min.js"></script>
<link href="css/jQCloud/jqcloud.css" rel="stylesheet">
<title>SquareInfo</title>
<style type="text/css">
	div.jqcloud { color: #FF0000; }
	div.jqcloud a { color: inherit; }
	div.jqcloud a:hover { color: #0df; }
	div.jqcloud a:hover { color: #0cf; }
	div.jqcloud span.w10 { color: #FF0000; font-size: 30px; }
	div.jqcloud span.w9 { color: #FF0000; font-size: 26px; }
	div.jqcloud span.w8 { color: #9933FF; font-size: 24px; }
	div.jqcloud span.w7 { color: #9933FF; font-size: 21px;}
	div.jqcloud span.w6 { color: #9933FF; font-size: 19px;}
	div.jqcloud span.w5 { color: #009933; font-size: 17px;}
	div.jqcloud span.w4 { color: #009933; font-size: 15px;}
	div.jqcloud span.w3 { color: #009933; font-size: 13px; }
	div.jqcloud span.w2 { color: #B2B2FF; font-size: 11px;}
	div.jqcloud span.w1 { color: #B2B2FF; font-size: 10px;}
	
	div.jqcloud{
		font-family: 맑은 고딕;
		margin: 20px;
		cursor: pointer;
	}
	
	#map-output{
		width: 350px;
		margin: 5px;
		padding: 5px;
	}
	
	#wordcloud{
		margin-top:10px;
		padding-top: 10px;
		position: relative;
		height: 300px;
	}
	
	.gangjo{
		color: #FF0066;
		font-weight: bold;
		font-size: 15px;
	}
	
</style>
</head>
<body style="font-family: 맑은 고딕;">
	<table id="map-output" align="left">
		<tr>
			<td width="100px">${square_num }스퀘어??;</td>
			<td width="250px" rowspan="2">
				<c:forEach items="${univList}" var="univ">
					<img width="25px" height="25px" src="${pageContext.request.contextPath}/images/univ_logo/${univ.univ_img}">
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td style="font-family: 맑은 고딕; font-size: 12px">
				<span class="gangjo">${productQuantity}</span>개 거래中
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div id="wordcloud"></div>
			</td>
		</tr>
	</table>
	
<script type="text/javascript">

	$(function() {
		$.post("tag_list_by_square_num.do", {"square_num": 1}, function(data) {
			$("#wordcloud").jQCloud(data);
		},"json");
	});
	
</script>
</body>
</html>