<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script type="text/javascript" >
function pagelist(cpage){
	//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
	document.getElementById("pageNo").value=cpage;
	var frm = document.getElementById("frm");
	frm.action="transportationManage.do";
	frm.submit();
}
</script>
<style type="text/css">
body{
	color: white;
}
a{
 color: white;
}
input{
	width:200px;
}
</style>
<table>
	<tr>
		<td><a href="${pageContext.request.contextPath}/memberList.do">회원목록</a></td>
		<td><a href="${pageContext.request.contextPath}/goRegistTransportation.do">교통정보 등록</a></td>
		<td></td>
	</tr>
</table>

<table>
	<tr>
		<th>종류</th>
		<th>이름</th>
		<th>국가명</th>
		<th>도시명</th>
		<th>링크</th>
	</tr>
	<c:forEach items="${transportationList}" var="list">
		<form method="post" action="#">
		<tr>
			<td>${list.transportationName}</td>
			<td>${list.transportationType}</td>
			<td>${list.countryName}</td>
			<td>${list.cityName}</td>
			<c:choose>
				<c:when test="${not empty list.link}">
					<td>${list.link}&nbsp;&nbsp; <a>삭제</a></td>
				</c:when>
				<c:otherwise>
					<td>
						<input type="text"/>&nbsp;&nbsp;
						<input type="submit" value="수정"/>&nbsp;&nbsp;
						<a href="${contextPage.request.contextPath}/removeTransportaion.do
						?transportaionType=${list.transportationType}
						&transportationName=${list.transportationName}
						&countryName=${list.countryName}">삭제</a>
					</td>
				</c:otherwise>
			</c:choose>
		<tr>
		</form>
	</c:forEach>
	
	<tr><td><br/></td></tr>
				<tr>
					<td align="center">${pageLink }
					<form id="frm" method="post">
					<input type="hidden" name="pageNo" id="pageNo"/>
					</form>
					</td>
				</tr>
	
</table>