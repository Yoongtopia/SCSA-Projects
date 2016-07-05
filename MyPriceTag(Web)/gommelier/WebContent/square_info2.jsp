<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.awesomeCloud-0.2.min.js"></script>
<title>SquareInfo</title>
<style type="text/css">
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
	.wordcloud {
				border: 1px solid #036;
				height: 7in;
				margin: 0.5in auto;
				padding: 0;
				page-break-after: always;
				page-break-inside: avoid;
				width: 7in;
			}
	.wordcloud span{
		font-family: 맑은 고딕;
	}
	
</style>
</head>
<body>
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
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div id="wordcloud1" class="wordcloud"></div>
			</td>
		</tr>
	</table>
	
<script type="text/javascript">

	$(function() {
		
		$.post("tag_list_by_square_num.do?square_num=${square_num}", function(data) {
			$(data).each(function(index, item) {
				$("#wordcloud1").append($("<span/>").attr("data-weight",item.weight).text(item.text));
			});
			
			$("#wordcloud1").awesomeCloud({
				"size" : {
					"grid" : 10,
					"normalize" : false
				},
				"options" : {
					"color" : "random-dark",
					"rotationRatio" : 0,
					"printMultiplier" : 3,
					"sort" : "highest"
				},
				"shape" : "square"
			});
			
		},"json");
	});
	
</script>
</body>
</html>