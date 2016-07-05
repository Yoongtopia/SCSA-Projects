<!doctype html>
<%@page import="com.scsa.wapl.entity.TravelRecord"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>내 여행기 리스트</title>
 	 <link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" />   
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <script>
  $(function(){
	<% List<TravelRecord> list=(List<TravelRecord>)request.getAttribute("list");
	String msg=(String) request.getAttribute("errorMessage");
	if(list == null || msg != null){
%>
	$("#fail").dialog({
			width: 400,
			buttons: {
					'돌아가기': function(){
							var href="${pageContext.request.contextPath}/index.jsp";
							location.replace(href);
					},
				},
			modal: true,
			open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); }
		});
  <%} else { %>
  $("#dialog").dialog({
		width: 400,
		buttons: {
				'선택': function(){
						var num=$('#rlist').val();
						var href="${pageContext.request.contextPath}/editRecordForm.do?recordNum="+num;
						location.replace(href);
						
				},
				'돌아가기': function(){
					var href="${pageContext.request.contextPath}/index.jsp";
					location.replace(href);
			},
		},
		modal: true,
		open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); }
	});

  <%}%>
  });
  </script>
</head>
<body>
<div id="dialog" title="내 여행기 리스트">
<select id="rlist">
 <c:forEach items="${list }" var="list" >
    <option value="${list.recordNum}">${list.recordNum}. ${list.recordTitle }</option>
</c:forEach>
</select>
</div>
<div id="fail">
${errorMessage }
</div>
</body>
</html>
