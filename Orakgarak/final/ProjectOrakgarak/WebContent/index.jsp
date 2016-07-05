<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />

<style type="text/css">
body{
	margin:0;
}

#footer{
	position:relative;
	width:940px;
	margin:0 auto;
}

#sidebar{
	position:fixed;
	margin-left:0px !important;
	z-index:5000;
}

#menuContentPage{
	margin-left:0;
	transition:margin-left .3s;
	min-height: 810px;
}

#menubar{
width: 930px;
margin: 0px auto;
margin-bottom: 10px;
transition: margin-left .3s;
}

/* #menubar{
	position:absolute;
	width:1024px;
	margin:0 auto;
} */
</style>
</head>
<body>
<div>

<div id="sidebar">

<c:if test="${not empty sessionScope.user}">
<jsp:include page="sidebar.jsp" />
</c:if>

		</div>
	
	<div id="menuContentPage">
	<div id="menubar">
	<c:if test="${not empty sessionScope.user}">
	<jsp:include page="menu.jsp" />
	</c:if>
	</div>
	
	<!-- &&   -->
	<c:choose>
		<c:when test="${not empty contentPage && not empty sessionScope.user}">
			<jsp:include page="${requestScope.contentPage }" />
		</c:when>
		<c:otherwise>
		<jsp:include page="welcome.jsp" />
		</c:otherwise>
	</c:choose>
	
	
	<div id="footer">
	<jsp:include page="footer.jsp" />
	</div>
	</div>
	</div>
</body>
</html>