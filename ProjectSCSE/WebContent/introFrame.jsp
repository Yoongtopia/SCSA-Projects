<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en" data-useragent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)">
<head>
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.fullPage.js"></script>
<link rel="stylesheet" href="assets/css/page/introjs.css" />
<script type="text/javascript" src="assets/js/intro/intro.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">	
<title>슬기로운 컴퓨터, 슬기로운 코딩</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	margin: 0;
}

html,body,.wrapper {
	height: 100%;
	font-family: "Nanum Gothic", Calibri;
}

body>.wrapper {
	height: auto;
	min-height: 100%;
}

#container {
	padding-bottom: 3em;
}

footer {
	clear: both;
	/* 	position: relative; */
	z-index: 10;
	height: 5em;
	margin-top: -6em;
	padding-top: 1em;
	background-color: transparent; /* #45ADA8; */
	/*#2057BD(파랑) #8A715D(연한고동색) #FF45A0(분홍) #98CC23 #996267 #98CC23 #994B3D*/;
	color: black;
	text-align: center;
	width: 100%;
	position: fixed;
	bottom: 0;
	display: block;
	width: 100%;
	z-index: 9;
}

.intro1,.intro2 {
	text-align: center;
}

.section,.section2 {
	text-align: center;
}

nav {
	position: fixed;
	height: 50px;
	display: block;
	width: 100%;
	z-index: 9;

}

nav {
	top: 0px;
}

footer {
	bottom: 0px;
}
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<body>
	<div class="wrapper">
		<nav>
			<c:choose>
				<c:when test="${not empty requestScope.header }">
					<jsp:include page="${requestScope.header }"></jsp:include>
				</c:when>
				<c:otherwise>
					<jsp:include page="pages/HF/header.jsp"></jsp:include>
				</c:otherwise>
			</c:choose>
		</nav>

		<div id="container">
			<c:choose>
				<c:when test="${not empty requestScope.page }">
					<jsp:include page="${requestScope.page }"></jsp:include>
		</div>
	</div>
				</c:when>
				<c:otherwise>
					<jsp:include page="pages/IndexLogin.jsp"></jsp:include>
		</div>
	</div>
	<footer id="footer">
		<c:import url="pages/HF/footer.jsp"></c:import>
	</footer>
				</c:otherwise>
			</c:choose>


</body>
</html>