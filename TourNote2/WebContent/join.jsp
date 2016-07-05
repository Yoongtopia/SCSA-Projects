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
		//아이디를 수정할 경우 중복 체크 확인을 false로 고쳐서 다시 중복체크를 유도
		$("#memberId").change(function(){
			$("#idCheckCheck").val("false");
		});
		
		//이메일을 수정할 경우 중복 체크 확인을 false로 고쳐서 다시 중복체크를 유도
		$("#memberEmail").change(function(){
			$("#emailCheckCheck").val("false");
		});
	});
	
	//아이디가 중복 되었는지 체크
	var idCheck= function(){
		
		if($("#memberId").val()==""||$("#memberId").val()==null){
			alert("아이디를 입력해 주세요");
			$("#memberId").focus();
			return false;
		}
		
		$.getJSON("${pageContext.request.contextPath}/idCheck.do",{
			"memberId":$("#memberId").val()
		}, function(jsonObj){
			if(jsonObj.status){
				alert("사용할 수 없는 아이디 입니다");
				$("#memberId").val("");
			} else{
				alert("사용 가능 아이디 입니다");
				$("#idCheckCheck").val("true");
			}
		});
	};
	
	//이메일이 중복되었는지 체크
	var emailCheck = function(){
		
		//이메일 형식이 일치하는지 체크
		var email = $("#memberEmail").val();
	    var atpos = email.indexOf("@");
	    var dotpos = email.lastIndexOf(".");
	    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=email.length) {
	        alert("이메일 주소가 유효하지 않습니다");
	        return false;
	    }
		
		$.getJSON("${pageContext.request.contextPath}/emailCheck.do",{
			"memberEmail":$("#memberEmail").val()
		}, function(jsonObj){
			if(jsonObj.status){
				alert("사용할 수 없는 메일 주소 입니다");
				$("#memberEmail").val("");
				
			} else{
				alert("사용 가능 메일주소 입니다");
				$("#emailCheckCheck").val("true");
				
			}
		});
	};
	
	function formCheck(){
		//아이디 입력했는지 체크
		if($("#memberId").val()==""||$("#memberId").val()==null){
			alert("아이디를 입력해 주세요");
			$("#memberId").focus();
			return false;
		}
		
		//아이디 중복 체크했는지 체크
		if($("#idCheckCheck").val()=="false"){
			alert("아이디 중복 체크를 해주세요");
			$("#memberId").focus();
			return false;
		}
		
		// 비밀번호 입력했는지 체크
		if($("#password").val()==""||$("#password").val()==null){
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		
		//비밀번호 길이가 충분한지 체크
		if($("#password").val().length <5 || $("#password").val().length >15){
			alert("비밀번호의 길이는 6자 이상 14자 이하입니다");
			$("#password").focus();
			return false;
		}
		
		//비밀번호 확인창 입력했는지 체크
		if($("#password2").val()==""||$("#password2").val()==null){
			alert("비밀번호 확인 창을 입력해 주세요");
			$("#password2").focus();
			return false;
		}
		
		//비밀번호창과 확인창 일치하는지 체크
		if($("#password").val()!=$("#password2").val()){
			alert("비밀번호가 일치 하지 않습니다.");
			$("#password2").val("");
			$("#password2").focus();
			return false;
		}
		
		//이름 입력했는지 체크
		if($("#memberName").val()==""||$("#memberName").val()==null){
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		
		//이메일 입력했는지 체크
		if($("#memberEmail").val()==""||$("#memberEmail").val()==null){
			alert("메일 주소를 입력해 주세요");
			$("#memberEmail").focus();
			return false;
		}
		
		//이메일 중복 체크했는지 체크
		if($("#emailCheckCheck").val()=="false"){
			alert("이메일 중복 체크를 해주세요");
			$("#memberEmail").focus();
			return false;
		}
		
		 //전화번호 입력했는지 체크
		if($("#memberPhone").val()==""||$("#memberPhone").val()==null){
			alert("전화번호를 입력해 주세요");
			$("#memberPhone").focus();
			return false;
		}
		 
		//전화번호 숫자로만 입력했는지 체크
		if(isNaN($("#memberPhone").val())){
			alert("전화번호는 숫자로만 입력해 주세요");
			$("#memberPhone").focus();
			return false;
		}
		
		//전화번호 길이가 적합한지 체크
		if($("#memberPhone").val().length >12 || $("#memberPhone").val().length <9){
			alert("전화번호를 확인해 주세요. 너무 길거나 짧습니다.");
			$("#memberPhone").focus();
			return false;
		}
		
		return true;
	}
</script>
<<style>
input{
	width:200px;
}
</style>
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


<table align="center" width="539" height="380" background="./images/join/join_bg.png" 
data-wow-delay="0.4s"
class="wow slideInDown animated"
style="visibility: visible; -webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;"><br/>
<tr>
<td><table height="20"></table></td>
</tr>
<tr><td>
<form method="post" id="joinForm" action="${pageContext.request.contextPath}/regist.do"
	onsubmit="return formCheck()">
<table>
<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_id.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="ID" name="memberId" id="memberId">&nbsp;</td>
<td><a href="#" onclick="idCheck();"><img src="./images/join/Btn_join_check.png" ></a></td>
<td><input type="hidden" name="idCheckCheck" id="idCheckCheck" value="false"/></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_password.png">&nbsp;&nbsp;</td>
<td><input type="password" placeholder="6자 이상 14자 이하" name="password" id="password"></td>
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
<td><input type="text" placeholder="NAME" name="memberName" id="memberName"></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_email.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="EMAIL ADDRESS" name="memberEmail" id="memberEmail">&nbsp;</td>
<td><a href="#" onclick="emailCheck();"><img src="./images/join/Btn_join_check.png"></a></td>
<td><input type="hidden" name="emailCheckCheck" id="emailCheckCheck" value="false"/></td>
</tr>

<tr height="6"></tr>

<tr>
<td width="50"></td>
<td align="right"><img src="./images/join/Btn_join_phone.png">&nbsp;&nbsp;</td>
<td><input type="text" placeholder="숫자로만 입력" name="memberPhone" id="memberPhone"></td>
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