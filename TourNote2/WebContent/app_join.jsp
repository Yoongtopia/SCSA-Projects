<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,400italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/animate.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#password2").blur(function(){
			if($("#password").val()==$("#password2").val()){
				
			}else{
				alert("패스워드가 일치 하지 않습니다");
				$("#password2").val("");
			}
		});
	});
	
	
	var idCheck= function(){
		$.getJSON("${pageContext.request.contextPath}/idCheck.do",{
			"memberId":$("#memberId").val()
		}, function(jsonObj){
			if(jsonObj.status){
				alert("사용할 수 없는 아이디 입니다");
				$("#memberId").val("");
			} else{
				alert("사용 가능 아이디 입니다");
			}
		});
	};
	
	var emailCheck = function(){
		$.getJSON("${pageContext.request.contextPath}/emailCheck.do",{
			"memberEmail":$("#memberEmail").val()
		}, function(jsonObj){
			if(jsonObj.status){
				alert("사용할 수 없는 메일 주소 입니다");
				$("#memberEmail").val("");
			} else{
				alert("사용 가능 메일주소 입니다");
				
			}
		});
	};
</script>

<body bgcolor="#52DBEB">
<table>
<tr>
<td width="250px">
</td>
<td>

<table>
<tr>

<td>
<table class="wow slideInDown animated ">
<tr>
<td><img src="./images/join/baloon.png"/>
</td>
</tr>
</table>
</td>


<td>
<table height="170"></table>

<form method="post" action="${pageContext.request.contextPath}/regist.do">
<table align="center" width="539" height="380" background="./images/join/join_bg.png" 
data-wow-delay="0.4s"
class="wow slideInDown animated"
style="visibility: visible; -webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;"><br/>
<tr>
<td><table height="20"></table></td>
</tr>
<tr><td>
<table>
<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_id.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="ID" name="memberId" id="memberId">&nbsp;</td>
<td><a href="#" onclick="idCheck();"><img src="./images/join/Btn_join_check.png" ></a></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_password.png">&nbsp;&nbsp;</td>
<td><input type="password" placeholder="PASSWORD" name="password" id="password"></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_passwordchk.png">&nbsp;&nbsp;</td>
<td><input type="password" placeholder="PASSWORD CHECK" name="password2" id="password2"></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_name.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="NAME" name="memberName"></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_email.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="EMAIL ADDRESS" name="memberEmail" id="memberEmail">&nbsp;</td>
<td><a href="#" onclick="emailCheck();"><img src="./images/join/Btn_join_check.png"></a></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_phone.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="PHONE NUM" name="memberPhone"></td>
</tr>

<tr height="6"></tr>

</table>
</td></tr>

<tr>
<td>
<table>
<tr align="right">
<td width="370"></td>
<td align="right">
<!-- <a href="#"><img src="./images/btn/Btn_join_signup.png"></a> -->
<input type="image" src="./images/join/Btn_join_signup.png"/>
</td>
<td width="10"></td>
<td align="right">
<a href="${pageContext.request.contextPath}"><img src="./images/join/Btn_join_cancel.png"></a></td>
</tr>
</table>
</form>
</td>
</tr>
</table>
</td>


</tr>
</table>

</td>
</table>

</body>