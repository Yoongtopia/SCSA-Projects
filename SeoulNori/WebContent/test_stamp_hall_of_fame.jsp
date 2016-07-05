<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<script type="text/javascript">
$(function() {
	$.
});

</script>
</head>
<body>
	<div>
		<h1>stamp 관리</h1>&nbsp;<button id="addNoticeButt">NEW</button>
	</div>
	<div>
	<table style="border: 1px solid black; border-left: none; border-right: none;" cellspacing="0" cellpadding="0">
		<tr bordercolor="white">
			<th>글번호</th>
			<th>스탬프</th>
			<th>행사명</th>
			<th>회원아이디</th>
			<th>발급날짜</th>
		</tr>
		<c:choose>
		<c:when test="${stampList!=null&&stampList.size()>0 }">
			<c:forEach items="${stampList }" var="stamp">
				<tr bordercolor="white">
					<td>${stamp.stampNum }</td>
					<td><img src="./images/test/${stamp.stampImage}.png" width="50px"/></td>
					<td>${stamp.eventId }</td>
					<td>${stamp.userId }</td>
					<td>${stamp.stampGetDate }</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr bordercolor="white">
				<td colspan="5">스탬프 목록이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
	</table>
	</div>

</body>
</html>