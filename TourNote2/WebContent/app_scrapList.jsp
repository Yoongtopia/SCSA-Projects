<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.scsa.wapl.entity.TravelRecord"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/bootstrap4.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>

</head>
<body>

<div style="height:70px"></div>

<div style="color: white; text-align: center; font-size: 30px;">SCRAP LIST</div>

<div style="height:10px"></div>

<div style="width:90%; height:100%; margin: 0 auto; background-color: white;" id="media" >

	<table>
		<tr bgcolor="orange">
			<td align="center" width="130px">작성자</td>
			<td align="center" width="300px">제목</td>
			<td></td>			
		</tr>
		<c:choose>
			<c:when test="${not empty scrap}">
				<c:forEach items="${scrap}" var="scrap">
					<tr>
						<td align="center">${scrap.recordWriter}</td>
						<td align="center">${scrap.recordTitle}</td>
						<td><a href="delete_scrap2.do?&recordNum=${scrap.recordNum}">
 						<img src="./images/app_etc/app_del.png"/></a></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>	
</div>

<div style="height:10px"></div>

<div style="width:100%; text-align: center;">
<a href="./app_myPage.jsp">
<img width="70px" src="./images/app_etc/app_back.png"/></a></div>

</body>
</html>