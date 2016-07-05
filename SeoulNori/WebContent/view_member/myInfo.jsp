<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		
		$("#inputPassword").blur(function(){
			if($("#inputPassword").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
		});
		
		
	});
	
	
	function passwordChk(){
		$.post("${pageContext.request.contextPath}/member_password_check.do",
			{"userId":$("#sessionUserId").val(), "password":$("#inputPassword").val()},
				function(jsonObj){
					if(!jsonObj.status){
						alert("다시 입력하세요");
						return false;
					} else{
						$("#form").submit();
						}
			},"json");
	}

</script>
</head>
<body>

			<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
				MY INFO<font size="4em"><strong>&nbsp;내 정보 수정</strong></font>
			</h2>
			<br/>
<div style="margin: 0 30px; border: 1px solid #ddd; padding: 40px;">			

			<div style="width: 400px;  margin-left: 150px;
									color: #6dbd96; font-weight: bold; text-align: center; margin-bottom: 30px;">
				<span class="glyphicon glyphicon-warning-sign"></span>
				보안을 위해 비밀번호를 다시 한 번 입력해 주세요
			</div>
			
			<form id="form" method="post"
				action="${pageContext.request.contextPath}/member_view.do?myInfo=yes">
				<div style="margin-left: 150px;">
				<label for="password" >아이디(이메일)</label><br/>
	      	<div class="input-group-nori" style="height: 40px">
	      		<span class="input-group-nori-addon"><span class="ui-icon ui-icon-person"></span></span>
			  	<input type="email" class="form-control-login-nori"  style="height: 40px; width:350px; background-color: #f9f9f9; color: gray;" id="email" value="${sessionScope.member.userId }" readonly="readonly">
			</div>
			<label for="password" >비밀번호</label><br/>
			<div class="input-group-nori" style="height: 40px">
				<span class="input-group-nori-addon"><span class="ui-icon ui-icon-locked"></span></span>
			  	<input type="password" class="form-control-login-nori"  style="height: 40px;width:350px;" id="inputPassword" value="" name="password"  placeholder="*********">
			</div>
				
				<br/>
					<table style="width: 400px; text-align: center;">
						<tr>
							<td>
								<input type="hidden" id="sessionUserId" name="userId"
												value="${sessionScope.member.userId }" />
								<input type="button" onclick="passwordChk()" class="btn btn-default" value="확인" />&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/seoulnori.do">
									<input type="button" class="btn btn-default" value="취소">
								</a>
							</td>
						</tr>
					</table>
					
				</div>
			
			</form>
	
</div>	
</body>
</html>