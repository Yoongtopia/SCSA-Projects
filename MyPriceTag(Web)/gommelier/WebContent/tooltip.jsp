<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Tooltip examples for anchors</h4>
This is a <a href="#" class="tooltip-test" data-toggle="tooltip" 
   title="Tooltip on left">
   Default Tooltip
</a>.
This is a <a href="#" class="tooltip-test" data-toggle="tooltip" 
   data-placement="left" title="Tooltip on left">
   Tooltip on Left
</a>.
This is a <a href="#" data-toggle="tooltip" data-placement="top" 
   title="Tooltip on top">
   Tooltip on Top
</a>.
This is a <a href="#" data-toggle="tooltip" data-placement="bottom" 
   title="Tooltip on bottom">
   Tooltip on Bottom
</a>.
This is a <a href="#" data-toggle="tooltip" data-placement="right" 
   title="Tooltip on right">
   Tooltip on Right
</a>

<br>

<h4>Tooltip examples for buttons</h4>
<button type="button" class="btn btn-default" data-toggle="tooltip" 
   title="Tooltip on left">
   Default Tooltip
</button>
<button type="button" class="btn btn-default" data-toggle="tooltip" 
   data-placement="left" title="Tooltip on left">
   Tooltip on left
</button>
<button type="button" class="btn btn-default" data-toggle="tooltip" 
   data-placement="top" title="Tooltip on top">
   Tooltip on top
</button>
<button type="button" class="btn btn-default" data-toggle="tooltip" 
   data-placement="bottom" title="Tooltip on bottom">
   Tooltip on bottom
</button>
<button type="button" class="btn btn-default" data-toggle="tooltip" 
   data-placement="right" title="Tooltip on right">
   Tooltip on right
</button>


	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	$(function () { 
	   $("[data-toggle='tooltip']").tooltip(); 
	});
	</script>
</body>
</html>