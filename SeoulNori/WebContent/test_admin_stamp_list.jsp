<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2 style="margin-bottom: -20px;">
		STAMP <font size="4em"><strong>스탬프</strong></font> 
		<c:if test="${sessionScope.member.memberType=='admin' }">
			<button onclick="location.href='${pageContext.request.contextPath}/notice_add_form.do'">NEW</button>
		</c:if>
	</h2>
	<div class="row" style="padding: 20px 0 20px 0; " >
		<table style="border:1px solid black; border-right-color:white; border-left-color: white; width: 800px;"  cellspacing="0">
			<tr >
					<th>스탬프번호</th>
					<th>스탬프</th>
					<th>행사명</th>
					<th>회원아이디</th>
					<th>발급날짜</th>
					<th>스탬프상태</th>
					<th>상태바꾸기</th>
			</tr>
			<c:choose>
				<c:when test="${ stampList!=null&&stampList.size()>0 }">					
					<c:forEach items="${stampList }" var="stamp">
						<tr>
							<td>${stamp.stampNum}</td>
						
							<td><img width='45px' height='45px'  src="${pageContext.request.contextPath}/images/test/${stamp.stampImage}"/></td>
						
							<td>${stamp.event.eventTitle }</td>
							<td>${stamp.userId }</td>
							<td>${stamp.stampGetDate }</td>
							<td>
							<c:choose>
							<c:when test="${stamp.stampStatus==1 }">보이기 상태</c:when>
							<c:otherwise>감추기 상태</c:otherwise>
							</c:choose>
							</td>
							<td><button href="${pageContext.request.contextPath}/stamp_changeStamp.do?userId=${stamp.userId }&eventId=${stamp.eventId}&stampNum=${stamp.stampNum }">바꾸기</button></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="5" align="center">스탬프 목록이 존재하지 않습니다.</td>
				</c:otherwise>
			</c:choose>
		</table>
		
	</div>


</body>
</html>