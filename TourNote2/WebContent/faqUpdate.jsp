<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<br/><br/><br/><br/><br/>
<form method="post" action="faq_update2.do">
<table>
<tr>
<td>번호</td><td>${board.boardNum }</td>
</tr>
<tr>
<td>제목</td><td><input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle }"/></td>
</tr>
<tr>
<td>내용</td><td><input type="text" id="boardCont" name="boardCont" value="${board.boardCont }"/></td>
</tr>
<tr><td>
<input type="submit" value="수정"/>
<input type="hidden" name="boardNum" value="${board.boardNum }">
</td></tr>
</table>
</form>
</body>
</html>