<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="palet" style="width: 100%; overflow: hidden;">
	<c:forEach begin="1" end="10">
		<div class="out" style="float: left; position: relative; height: 150px; width: 150px; border: 1px solid black; margin: 2px; border-radius: 4px; padding: 2px; background-color: gray;">
			<div class="cont" style="position: relative;">
				<img src="test">
				<div class="wish_btn"></div>
			</div>	
			<div class="content" style="position: absolute; bottom: 30px;">내용 show</div>
			<div class="tags"  style="position: absolute; bottom: 0px;">tags</div>
		</div>
	</c:forEach>
	</div>
	
</body>
</html>