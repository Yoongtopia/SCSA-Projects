<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#dbdb").on("click", function() {
			location.href="${pageContext.request.contextPath}/parsing.do";
		});
		
		$("#imageimage").on("click", function() {
			location.href="${pageContext.request.contextPath}/event_issut_update.do";
		});
		
		
	});

</script>
</head>
<body>



<button id="dbdb">DB파싱저장</button>
<button id="imageimage">IssuePoint 업데이트</button>

</body>
</html>