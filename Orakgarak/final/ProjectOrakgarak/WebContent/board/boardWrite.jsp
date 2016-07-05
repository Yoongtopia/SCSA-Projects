<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form method="post" action="${pageContext.request.contextPath }/board_write.do?userId=${sessionScope.user.email}">
	<table align="center" border="0" width="500px">
			<tr>
				<td colspan="2">
					<p>
						<b>
							<h3>&nbsp; 게시판 등록</h3>
						</b>
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr size="5" color="black">
				</td>
			</tr>
			<tr>
				<th width="100px">
					<p>카 테 고 리</p>
				</th>
				<td>
					<p>&nbsp;
						<select name="boardCategory">
						<c:if test="${sessionScope.user.userId == 'admin@orakgarak.com'}">
							<option value="[공지사항]">공지사항</option>
							</c:if>
							<option value="[잡담]">잡담</option>
						</select>
					</p>
				</td>
				<th>작성자</th>
				<td>${sessionScope.user.name }</td>
			</tr>
			
			<tr>
				<th width="100px">
					<p>제&nbsp;&nbsp;&nbsp;목</p>
				</th>
				<td>
					<p>&nbsp;
						<input type="text" id="boardTitle" name="boardTitle" size="60">
					</p>
				</td>
			</tr>
			<tr>
				<th>
					<p>내&nbsp;&nbsp;&nbsp;용</p>
				</th>
				<td>
					<p>&nbsp;
						<textarea cols="60" rows="10" name="boardContent"></textarea>
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-primary">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-default">취소</button>
				</td>
			</tr>	
	</table>
</form>
