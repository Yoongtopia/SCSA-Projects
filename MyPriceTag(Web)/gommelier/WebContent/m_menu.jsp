<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<link rel="shortcut icon" href="./images/background/title_logo.png">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.ratate.js"></script>
<script type="text/javascript">
 	$(function(){
		$("#btn").click(function(){
			$("form").submit(handler);
		});
	}); 
</script>
</head>
<body>
	<div style="background-color: #003366;">
  	 	<div style="padding: 5px;">
	    	<img width="30%" src="./images/background/logo3.png">
	   		<div align="right" style="position: relative; float: right;">
	   			<form method="post" action="m_product_list_by_tag.do">
	   				<input type="text" id="search" name="tag" value="${param.tag }"/><span id="btn"><font color="white"><i class="large search icon"></i></font></span>
	   			</form>
	   			<div style="padding: 10px;"><font color="white">${sessionScope.user.user_name}</font></div>
	   		</div>
	   	</div>
	   	<div align="center" style="border-top: #FF6600 1px solid; padding: 5px;" >
	   		<a href="${pageContext.request.contextPath}/m_push_list.do"><font color="white"><i class="large flag icon"></i>MY PUSH</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   		<a href="${pageContext.request.contextPath}/m_product_list.do"><font color="white"><i class="large list icon"></i>PRODUCT</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<a href="${pageContext.request.contextPath}/m_logout.do"><font color="white"><i class="large off icon"></i>LOGOUT</font></a>
	  	</div>
  	</div>
  	
</body>
</html>













