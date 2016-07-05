<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/jQCloud/jqcloud.css" rel="stylesheet">
<style type="text/css">
	#wordcloud{
		 font-family: '맑은 고딕';
	}
</style>


</head>

<body>
	
<div id="wordcloud" style="width: 550px; height: 350px; position: relative; background-color: black;"></div>


<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jQCloud/jqcloud-1.0.4.min.js"></script>
<script type="text/javascript">

	$(function() {
		var word_list = '${tagList}';
		$(document).ready(function() {
			$("#wordcloud").jQCloud(word_list);
		});
	})
	
</script>
</body>
</html>