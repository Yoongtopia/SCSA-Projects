<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
#btn{
	background-color: #D95C5C;
	color: #FFFFFF;
	border: none;
	border-radius: 3px;
	font-weight: 700;
	font-size: 17px;
	width: 100px;
	height: 50px;
}
th{
	width: 80px !important;
}
</style>
<form method="post" action="${pageContext.request.contextPath }/board_update.do?boardNo=${board.boardNo}">
<table align="center" style="text-align: center;">
	<tr>
		<th>카테고리</th>
		<td width="80px">
			<select name="boardCategory">
				<c:if test="${sessionScope.user.email == 'admin@orakgarak.com'}">
				<option value="1">공지</option>
				</c:if>
				<option value="2">잡담</option>
			</select>
		</td>
		
		<th>등록일</th>
		<td width="120px">${board.boardDate }</td>
		
	</tr>
	<tr>
		<th height="70px" width="80px">제 목</th>
		<td colspan="5"><input type="text" name="boardTitle" size="70" value="${board.boardTitle }" style="border:none;"/></td>
	</tr>	
	<tr>
		<td>내 용</td>
		<td colspan="3">
		<textarea rows="15" cols="70" name="boardContent">${board.boardContent }</textarea>
		</td>
	</tr>
</table>
<div id="updateBtn" style="width: 210px; margin: 10px auto;">
<input id="btn" type="submit" value="수정"/>
<input id="btn" type="reset" value="취소"/>
</div>
</form>
