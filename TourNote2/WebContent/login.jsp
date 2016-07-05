<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="shortcut icon" href="../../assets/ico/favicon.png">
<link rel="stylesheet" type="text/css" href="./css/semantic.css" />
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
	.ui-widget-header {
		border: 1px solid skyblue;
		background: skyblue 50% 50% repeat-x;
		color: #ffffff;
		font-weight: bold;
		font-size: 20px;
	}
	input[type="submit"].btn-block,
	input[type="button"].btn-block {
		width: 140px;
	}
	.btn-block {
		width: 140px;
		padding-right: 0;
		padding-left: 0;
	}
	.form-control {
		display: block;
		width: 300px;
		height: 34px;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.428571429;
		color: #555555;
		vertical-align: middle;
		background-color: #ffffff;
		border: 1px solid #cccccc;
		border-radius: 4px;
		-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
		        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
		-webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
		        transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	}
	.form-signin {
		padding: 15px;
		margin: 0 auto;
	}	
</style>
<script>
$(function(){
	$("#login").dialog({
		width: 400,
		modal: true,
	    show: {effect: 'fade', duration: 1000},
        open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); }
	});	
	
	if ("${errorMessage != null}" == "true"){
		var msg="${errorMessage}";
		var idx=msg.indexOf(".", 0);
		$("#errorMsg1").text(msg.substring(0, idx+1));
		$("#errorMsg2").text(msg.substring(idx+1,msg.length));
	}
	
});

	function loginCheck(){
		if ($("#memberId").val()==null || $("#memberId").val()=="") {
		    alert("아이디를 입력해 주세요");
		    return false;
		}
		
		if ($("#password").val()==null || $("#password").val()=="") {
		    alert("패스워드를 입력해 주세요");
		    return false;
		}
		
		return true;
	};

</script>
  </head>

  <body bgcolor="white">
    <div id="login" title="LOGIN" class="container">
		
	
      <form class="form-signin" name="loginForm" method="post" onsubmit= "return loginCheck()"
      action="${pageContext.request.contextPath}/login.do">
	
		<c:if test="${errorMessage != null}">
		<h6 style="color: red; font-weight: bold;" id="errorMsg1"></h6>
		<h6 style="color: red; font-weight: bold;" id="errorMsg2"></h6>
		</c:if>
		
		<table style="width: 320px; "> 
		  <tr>
		  	<td width="40px"><i class="large user icon"></i></td>
		  	<td width="260px"><input type="text" name="memberId" id="memberId" class="form-control" placeholder="ID" autofocus style="width: 260px;"></td>
	      </tr>
	      <tr height="5px"></tr>
	      <tr>
	      	<td width="40px"><i class="large lock icon" style="margin-top: -20px; "></i></td>
	      	<td width="260px"><input type="password" name="password" id="password" class="form-control" placeholder="Password" style="width: 260px;"></td>
		  </tr>
		</table>
		
		<table style="width: 320px; ">
		  <tr>
		  	<td width="140px"><input type="submit" id="loginbtn" class="btn btn-lg btn-primary btn-block"  value="로그인"/></td>
	        <td width="20px"></td>
	        <td width="140px"><a href="${pageContext.request.contextPath}"><button id="backbtn" class="btn btn-lg btn-primary btn-block" type="button">돌아가기</button></a></td>
	      	<td width="20px"></td>
	      </tr>
      	</table>
      
      </form>
      
    </div>
  </body>
  
</html>