<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>종목코드</th>
		<th>회사명</th>
		<th>업종명</th>
	</tr>
	<c:choose>
	<c:when test="${not empty multipleList }">
	<c:forEach items="${multipleList }" var="list">
	<tr>
		<td>${list.stockCode }</td>
		<td><a href="javascript:opener.location.replace(
		'${pageContext.request.contextPath }/stock_detail.do?stockCode=${list.stockCode}'
		);window.close();">${list.stockName }</a></td>
		<td>${list.industryName }</td>
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="3">검색 결과를 찾을 수 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>
</table>
</body>
</html>