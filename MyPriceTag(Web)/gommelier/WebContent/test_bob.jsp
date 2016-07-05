<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="analysis_test.do" enctype="multipart/form-data">
	상품 상세 정보 <br/>
	<textarea rows="15" cols="70" name="product_content"></textarea><br/>
	<input type="submit" value="형태소 분석"/>
	</form>
	
	<c:forEach items="${tags }" var="tag">
		${tag }
	</c:forEach>
	
	<a href="${pageContext.request.contextPath}/push_msg_send.do"><input type="button" value="푸쉬 보내기"></a>
	
	
</body>
</html>