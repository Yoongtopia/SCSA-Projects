<%@page import="java.util.List"%>
<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="com.scsa.wapl.entity.TravelSpot"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/bootstrap4.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&language=ko"></script>

<title>Insert title here</title>
</head>

<body>

	<div>
		<jsp:include page="app_menu.jsp"></jsp:include>
	</div>	

<div style="width:90%; height:100%; margin: 0 auto" id="media">
	
<div style="height:50px;"></div>

<div style="text-align: center; color: white;"><h3>TRAVEL BOARD</h3></div>

<div style="text-align: center;">
<c:import url="travelRecordList.jsp"></c:import>

</div>




</div>

</body>
</html>