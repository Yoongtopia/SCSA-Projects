<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form method="post" action="${ pageContext.request.contextPath }/find_mission.scse">
			챕터 번호 : <input type="text" name="chapNum">
			퀴즈 번호 : <input type="text" name="quizNum">
			<input type="submit" value="문제 찾아오기">
		</form>
	</body>
</html>