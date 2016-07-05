<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	body{
		background-color: #E6E6F0;
	}
	.guide_comment{
		font-size: 10px;
	}
	.input-sm{
		size: 200px;
		width: 200px;
	}
	#page{
		position: absolute;
		width: 1000px;
		left: 270px;
	}
	#signup-form{
		position: relative;
		float: left;
		background-color: white;
		border-radius: 10px;
		padding: 5px;
		margin: 5px;
		width: 550px;
	}
	#signup-guide{
		position: relative;
		float: left;
		background-color: white;
		border-radius: 10px;
		padding: 5px;
		margin: 5px;
		width: 400px;
	}
	.table-responsive{
		width: 490px;
		font-family: 맑은 고딕;
		font-size: 12px;
	}
	.gangjo{
		color: #ff6600;
		font-weight: bold;
	}
	.gangjo-blue{
		color: #3399ff;
		font-weight: bold;
	}
	.guide-title{
		font-size: 14px;
		font-weight: bold;
	}
	.btn-warning{
		border: #FF6600 1px solid; 
		background-color: #FF6600;
	}
	.btn-warning:HOVER{
		background-color: #EE9A00;
	}
	
</style>
</head>
<body>
	<div id="page">
		<form method="post" action="user_register.do" onsubmit="return checkForm()">
			<div id="signup-form">
				<div class="table-responsive" align="center">
					<h3 align="left">&nbsp;&nbsp;&nbsp;회원가입</h3>
					<h6 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간단한 MyPriceTag 회원 가입을 통해 <span class="gangjo">100% 무료서비스</span>를 즐겨보세요!</h6>
					<br/>
					<table class="table table-condensed">
						<tr>
							<td width="150px">아이디</td>
							<td width="250px"><input class="form-control input-sm" type="text" name="user_id" id="user_id"></td>
							<td width="100px" id="id_checking_result"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td colspan="2"><input class="form-control input-sm" type="password" name="user_password" id="user_password"></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td colspan="2"><input class="form-control input-sm" type="password" name="check_password" id="check_password"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td colspan="2"><input class="form-control input-sm" type="text" name="user_name" id="user_name"></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td colspan="2"><input class="form-control input-sm" type="text" name="user_phone" id="user_phone"></td>
						</tr>
						<tr>
							<td>자주 사용하는 이메일</td>
							<td colspan="2"><input class="form-control input-sm" type="text" name="user_email" id="user_email"></td>
						</tr>
						<tr>
							<td>출신대학교</td>
							<td colspan="2">
								<select name="univ_code" id="univ_code" class="form-control input-sm">
									<option value="@samsung.com">선택하세요.</option>
									<c:if test="${not empty univList }">
										<c:forEach items="${univList }" var="univ">
											<option value="${univ.univ_code }">${univ.univ_name }</option>
										</c:forEach>
									</c:if>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
	  							<input type="checkbox" id="inlineCheckbox1" value="option1"> 이용약관에 동의
	  							&nbsp;&nbsp;&nbsp;&nbsp;
	  							<input type="checkbox" id="inlineCheckbox2" value="option2"> 개인정보취급방침에 동의
							</td>
						</tr>
						<tr>
							<td colspan="3" align="right">
								<input class="btn btn-warning btn-sm" type="submit" value="회원가입" id="button_control"/>
								<input id="back-button" class="btn btn-default btn-sm" type="reset" value="취소"/>
							</td>
						</tr>
					</table>
				</div>
			</div>
		
			<div id="signup-guide">
				<div class="table-responsive" align="left" style="width: 380px;">
					<br/>
					<table class="table table-condensed" style="width: 360px;">
						<tr>
							<td width="80px" rowspan="2" align="center">
								<img alt="question-mark" width="40px" height="60px" src="./images/contents/item5.png">
							</td>
							<td width="280px" class="guide-title"><span class="gangjo">MyPriceTag</span>는 어떤 곳인가요?<br/></td>
						</tr>
						<tr>
							<td>
								MyPriceTag는 '제대로 된' 대학생을 위한 중고시장 입니다.
								쇼핑몰도 아닌, 오픈마켓도 아닌, 그 어느 누구라도 자기 물건을 쉽게 팔고 살 수 있는
								열린 공간입니다.<br/>
								쓰지않는 물건을 팔아보세요. 또한 필요한 물건을 사세요.
								당장 컴퓨터가 앞에 없다면 모바일 앱을 사용해 보세요.<br/>
								MyPriceTag의 모든 기능과 서비스는 100% 무료입니다.
								당신을 위한 공간이니 마음껏 사용하세요.
								MyPriceTag는 좋은 대학생들이 만들어가는 좋은 시장입니다.
								진심으로 환영합니다.
							</td>
						</tr>
						<tr>
							<td width="80px" rowspan="2" align="center">
								<img alt="culture-mark" width="60px" height="60px" src="./images/contents/item9.png">
							</td>
							<td class="guide-title"><span class="gangjo">MyPriceTag</span>가 추구하는 방향은?</td>
						</tr>
						<tr>
						
							<td>
								MyPriceTag는 '쿨'한 중고문화를 꿈 꿉니다.
								내가 사용하지 않는 것들은 필요한 이웃에게 제공하고, 내가 필요한 것들은 가진 이웃들에서부터
								구할 수 있다면 여러모로 좋습니다.<br/>
								<span class="gangjo-blue">1) 쌉니다.</span> 거품을 빼고 물건을 최대한 저렴하게 구할 수 있는 제일 좋은 방법은 결국 '중간상'을 최소화 한
								'개인간 거래'입니다.<br/>
								<span class="gangjo-blue">2) 인간적입니다.</span> 모르는 사람을 점점 의심하고 멀리하는 요즘 세상은 외로움을 부릅니다.
								실제로 모르는 사람들을 만날 이유들이 점점 없어지겠죠. 하지만 모르는 사람들끼리 거래도 하고,
								그 목적으로 소통도 하고, 우리 모두가 같이 살고 있다는 느낌을 받으면 세상 살 맛이 난다고 생각합니다.<br/>
								<span class="gangjo-blue">3) 친환경적입니다.</span> 우리는 시간이 가면 갈수록 충분히 쓸만한 것들을 버리고, 낭비하고, 쓰레기가 아닌
								쓰레기들을 만들고 있습니다. 낭비를 최소화하는 효율적이고 지속 가능한 삶은 결국 지속 가능한 지구를 만든다고
								생각합니다.<br/>
								좋은 마켓은 좋은 사람을 부르고, 좋은 사람은 좋은 세상을 부릅니다.
							</td>
						</tr>
						<tr>
							<td rowspan="2"></td>
							<td></td>
						</tr>
						<tr>
						
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	
<script type="text/javascript">

	$(function(){
		$("#user_id").on("blur",function(){
			$.post("${pageContext.request.contextPath }/id_check.do",
					{"user_id" : $("#user_id").val()},
					function(jsonObj){
						if(jsonObj.status){
							$("#id_checking_result").text("사용 불가").attr("style", "color: red");
							$("#button_control").attr('disabled', 'disabled');
						}else{
							$("#id_checking_result").text("사용 가능").attr("style", "color: blue");
							$("#button_control").removeAttr('disabled');
						}
			},"JSON");
		});
		
		$("#back-button").on("click",function(){
			location.href="./index.jsp";
		});
	});
	
	function checkForm(){
		var user_id = document.getElementById("user_id");
		var password = document.getElementById("user_password");
		var check_password = document.getElementById("check_password");
		var user_name = document.getElementById("user_name");
		var user_email = document.getElementById("user_email");
		var univ_code = document.getElementById("univ_code");
		var user_phone = document.getElementById("user_phone");
		
		if(user_id.value == ""){
			alert("id를 정확히 입력해 주세요.");
			user_id.focus();
			return false;
		}
		if(password.value == ""){
			alert("비밀번호를 입력해 주세요.");
			password.focus();
			return false;
		}
		if(password.value != "" && check_password.value != password.value){
			alert("비밀번호가 일치하지 않습니다.");
			password.focus();
			return false;
		}
		if(user_name.value == ""){
			alert("이름을 정확히 입력해 주세요.");
			user_name.focus();
			return false;
		}
		if(user_phone.value == ""){
			alert("연락처를 정확히 입력해 주세요.");
			user_phone.focus();
			return false;
		}
		if(user_email.value == ""){
			alert("이메일을 정확히 입력해 주세요.");
			user_email.focus();
			return false;
		}
		if(univ_code.value == "@samsung.com"){
			alert("출신대학을 선택해 주세요.");
			univ_code.focus();
			return false;
		}
		
		if(!($("input:checkbox[id='inlineCheckbox1']").is(":checked"))){
			alert("이용약관에 동의해 주세요");
			return false;
		}
		
		if(!($("input:checkbox[id='inlineCheckbox2']").is(":checked"))){
			alert("개인정보 취급방침에 동의해 주세요");
			return false;
		}

		return true;
	}

</script>

</body>
</html>