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

<div style="height:110px;"></div>

<div style="color: white; text-align: center; font-size: 30px;">MY PAGE</div>

<div style="height:30px;"></div>

<!-- 내 정보 수정 -->
<div style="text-align: center;">
<a href="${pageContext.request.contextPath}/goMyInfoUpdate2.do">
<img class="myPageBtn" src="./images/app_etc/app_myInfo.png"/>
</a>
</div>

<div style="height:12px;"></div>

<!-- 내 여행기 관리 -->
<div style="text-align: center;">
<a href="${pageContext.request.contextPath}/findRecordListById2.do">
<img class="myPageBtn"  src="./images/app_etc/app_myTravel.png"/></a>
</div>

<div style="height:12px;"></div>

<!-- 스크랩 관리 -->
<div style="text-align: center;">
<a href="${pageContext.request.contextPath}/scrap_list2.do?memberId=${sessionScope.member.memberId }">
<img class="myPageBtn"  src="./images/app_etc/app_scrap.png"/>
</a>

<div style="height:12px;"></div>

<!-- 회원탈퇴 -->
<div style="text-align: center;">
<a href="${pageContext.request.contextPath}/checkMemberStatusUpdate2.do">
<img class="myPageBtn"  src="./images/app_etc/app_resign.png"/></a>
</div>

<div style="height:50px;"></div>

<div>
<img src="./images/app_etc/app_CharacterDeparture.png"/>
</div>

</div>




</div>

</body>
</html>