<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOUR NOTE</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	
	<div>
		<c:choose>
			<c:when test="${contentPage != null }">
				<jsp:include page="${contentPage }" />
			</c:when>
			<c:otherwise>
				<jsp:include page="mainPage.jsp" />
			</c:otherwise>
		</c:choose>
	</div>

	<script type="text/javascript">
	
	if ('${target}' == 'n2') {
			$("#n2").trigger("click");
		}
	
	</script>

</body>
</html>