<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/flick/jquery-ui-1.10.4.custom.min.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/assets/js/Mission/mode.js"></script>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/mission/mode.css" />

<link rel="stylesheet" href="assets/sui/css/semantic.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('.demo.menu .item').tab({
			history : false,
			/* context : "#tab1" */
		});
		$('#run').click(function() {
			/* if ($("#board").children().size() != 4) {
				alert("모든 블럭을 사용해주세요 ㅠㅠ");

				return;
			} */

			$('.left-sidebar').hide('slide', {
				direction : 'left'
			}, 700);
			$('.header').hide('slide', {
				direction : 'up'
			}, 700);
			$('.container').hide('slide', {
				direction : 'right'
			}, 700, missionResult());
		});
	});
</script>
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<title></title>
<link href="assets/css/page/LeaderFrame.css" rel="stylesheet">
</head>

<body>
	<aside class="left-sidebar" style="z-index: 999">
		
	</aside>

<!-- 	<header class="header">
		<h2>공지사항</h2>
	</header>
 -->
	<div class="container">
	<%-- 	<jsp:include page="pages/GroupManagement.jsp"></jsp:include> --%>
	</div>

<!-- 푸터제어가 제대로 안되서 임시로 막아놈. 시간나면 수정하자. -->
	<!-- <div class="footer">
		<jsp:include page="pages/HF/footer.jsp"></jsp:include>
	</div> -->



</body>
</html>