<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	setTimeout(function() {
		location.href = "ProjectSCSE.scse";
	}, 5000);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${requestScope.status}</h2>
	<h2>5초뒤에 슬기로운 코딩 페이지로 이동합니다.</h2>
</body>
</html>