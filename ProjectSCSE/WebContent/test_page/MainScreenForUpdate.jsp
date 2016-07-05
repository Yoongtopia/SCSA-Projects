<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<link rel="stylesheet" href="assets/css/flick/jquery-ui-1.10.4.custom.min.css">
<script type="text/javascript" src="assets/sui/javascript/jquery.address.js"></script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', serif;
}
</style>
<link href="assets/css/page/mainFrame.css" rel="stylesheet">
<title>슬기로운 코딩, 시작합니다!</title>
</head>
<body>
	<aside class="left-sidebar">
		<jsp:include page="../${requestScope.Sidebar }"></jsp:include>
	</aside>
	<div class="container">
		<jsp:include page="../${requestScope.MainFrame }"></jsp:include>
	</div>
</body>
</html>