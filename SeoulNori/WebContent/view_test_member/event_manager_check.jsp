<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#eventChoice").click(function(event){
		$("#event", opener.document).val($("#eventOpt").val());
		close();
	});
	
});
</script>
</head>
<body>
<form>
<label>행사코드번호</label>
<input type="text" id="eventId" name="eventId">
<button id="inputEventId">입력</button>
</form>
</body>
</html>