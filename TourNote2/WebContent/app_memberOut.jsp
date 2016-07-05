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
	
  $("#dialog").dialog({
		width: 300,
		buttons: {
				'탈퇴': function(){
						var href="${pageContext.request.contextPath}/updateMemberStatus2.do";
						location.replace(href);
						
				},
				'돌아가기': function(){
					var href="${pageContext.request.contextPath}/goMyPage2.do";
					location.replace(href);
			},
		},
		modal: true,
		open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); }
	});

  });
  </script>
</head>
<body>
<div id="dialog" title="회원 탈퇴">
탈퇴는 시켜 드릴게<br/>
</div>

</body>
</html>
