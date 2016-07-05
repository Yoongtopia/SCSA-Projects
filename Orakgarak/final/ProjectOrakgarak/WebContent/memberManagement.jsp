<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>
<script src="./js/modernizr.custom.js"></script>

<link rel="stylesheet" href="packaged/css/semantic.min.css">
<script type="text/javascript">
	function deleteConfirm() {
		return confirm("정말 탈퇴처리하시겠습니까?");
	}
</script>
</head>
<body>
<table class="ui collapsing table segmen" align="center" style="margin-top: 50px;">
  <thead>
    <tr>
   	    <th>E-mail주소</th>
		<th>이름</th>
		<th>나이</th>
		<th>연락처</th>
		<!-- <th>거주지</th> -->
		<th>탈퇴처리</th>
   </tr>
 </thead>
  <tbody>
    <c:choose>
	<c:when test="${not empty userList }">
	<c:forEach items="${userList }" var="list">
	
	<tr>
		<td>${list.email }</td>
		<td>${list.name }</td>
		<td>${list.age }</td>
		<td>${list.phone }</td>
		<%-- <td>${list.address }</td> --%>
		<td><a href="${pageContext.request.contextPath }/user_deleteByAdmin.do?email=${list.email}" onclick="return deleteConfirm();">강제퇴장</a></td>
	</tr>
	</c:forEach>
	</c:when>
	</c:choose>
</tbody>
</table>


<%-- <table border="1">
	<tr>
		<th>E-mail주소</th>
		<th>이름</th>
		<th>나이</th>
		<th>연락처</th>
		<th>거주지</th>
	</tr>
	<c:choose>
	<c:when test="${not empty userList }">
	<c:forEach items="${userList }" var="list">
	
	<tr>
		<td>${list.email }</td>
		<td>${list.name }</td>
		<td>${list.age }</td>
		<td>${list.phone }</td>
		<td>${list.address }</td>
		<td><a href="${pageContext.request.contextPath }/user_deleteByAdmin.do?email=${list.email}" onclick="return deleteConfirm();">강제퇴장</a></td>
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<tr>
		<td colspan="5">회원 목록 조회가 불가합니다.</td>
	</tr>
	</c:otherwise>
	</c:choose>
</table> --%>
</body>
</html>