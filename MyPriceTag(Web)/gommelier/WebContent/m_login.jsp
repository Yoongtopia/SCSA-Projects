<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<script type="text/javascript">
 	$(function(){
		$("#btn").click(function(){
			$.post("m_login.do",{
				"user_id" : $("#id").val(),
				"user_password" : $("#password").val()
			}, function(jsonObj){
				if (jsonObj.status == 1) {
					alert("인증을 완료한 사용자만 로그인할 수 있습니다");
					$("#id").val("");
					$("#password").val("");
				} else if (jsonObj.status == 2){
					alert("로그인 완료");
					window.location.href = "m_push_list.do";
				} else {
					alert("로그인 실패");
					$("#id").val("");
					$("#password").val("");
				}
			});
		});
	}); 

</script>
<style type="text/css">
.table{
	width: 60%;
}

img{
	margin-left: 15px;
}

.table1{
	margin-left: 78px;
}

.bottom{
	margin-left: 35px;
}

#td1{
	padding-bottom: 4px;
}
</style>


</head>
<body style="background-image:url('./images/m_background.png'); width: 90%;">
		<div style="width: 100%; padding-top: 50%;">
			
			<div align="center">
				<img src="./images/main_logo3.png" width="100%"><br/><br/>
			</div>
		</div>	
		
		<table class="table1" align="center">
			<tr>
				<td id="td1"><input type="text" class="form-control" name="user_id" id="id" placeholder="id"></td>
			</tr>
			<tr>
				<td>  </td>
			</tr>
			<tr>
				<td><input type="password" class="form-control" name="user_password" id="password" placeholder="password"></td>
			</tr>
			
		</table>
		<br/>
		<br/>
		 
			<div class="bottom" align="center">
				<button type="button" class="btn btn-warning" id="btn" style="background-color: #FF6600;"><i class="large user icon"></i>login</button>
			</div>
			
			
		<!-- <div class="row" align="center">
			<div class="col-md-6"></div>
			<div class="col-md-1" align="center">
			<input type="text" class="form-control" name="user_id" id="id" placeholder="id">
			<input type="password" class="form-control" name="user_password" id="password" placeholder="password"><br/><br/>
			</div>
			<div class="col-md-5"></div>
		</div>	
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-1" align="center">
			<button type="button" class="btn btn-warning" id="btn" style="background-color: #FF6600;"><i class="large user icon"></i>login</button>
			</div>
			<div class="col-md-5"></div>
		</div> -->
		
</body>
</html>