<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 게임을 만들어보아요!</title>
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.fullPage.js"></script>
<link rel="stylesheet" href="ssets/css/page/introjs.css" />
<script type="text/javascript" src="assets/js/intro/intro.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<link href="assets/css/page/mainFrame.css" rel="stylesheet">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', serif;
}
</style>
</head>
<body>
	<nav style="z-index: 2">
		<jsp:include page="pages/HF/header.jsp"></jsp:include>
	</nav>
	<aside class="left-sidebar">
		<jsp:include page="${requestScope.Sidebar }"></jsp:include>
	</aside>
	<div class="container" style="z-index: 1">
		<jsp:include page="${requestScope.MainFrame }"></jsp:include>
	</div>
</body>
</html>