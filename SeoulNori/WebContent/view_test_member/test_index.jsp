<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
</head>
<body>

	<div class="row" style="overflow: hidden; margin: 0; width: 1280px;">
	
		<div style="position: absolute; width: 100%;">
				<jsp:include page="test_menu.jsp"/>
		</div>
		
	</div>
	
	<div class="row" style="margin: 105px 0 0 0; overflow: hidden;">
	<c:choose>
	<c:when test="${requestScope.contentPage != null }">
		<jsp:include page="${requestScope.contentPage }"/>
	</c:when>
	<c:otherwise>
		<jsp:include page="member_list.jsp"/>
	</c:otherwise>
	</c:choose>
	</div>


</body>
</html>