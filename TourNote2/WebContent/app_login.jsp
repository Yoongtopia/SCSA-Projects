<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="../../assets/ico/favicon.png">
<title>로그인</title>
    
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" />   

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/signin.css" rel="stylesheet">
<style>
	#password{
		margin-bottom: 25px;
	}
</style>
<script>
$(function(){
	$("#login").dialog({
		width: 300,
		modal: true,
        open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); }
	});	
})
</script>
  </head>

  <body>
    <div id="login" title="로그인" class="container">

      <form class="form-signin" method="post" 
      action="${pageContext.request.contextPath}/login3.do">
				${errorMessage }
        <input type="text" name="memberId" class="form-control" placeholder="ID" autofocus>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password">
        <button id="loginbtn" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
        <a href="${pageContext.request.contextPath}"><button id="backbtn" class="btn btn-lg btn-primary btn-block" type="button">돌아가기</button></a>
      </form>
    </div>
  </body>
  
</html>