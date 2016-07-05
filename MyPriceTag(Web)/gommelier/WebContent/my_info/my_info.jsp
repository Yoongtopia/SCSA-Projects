<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<style type="text/css">
	body{
		font-family: 맑은 고딕;
		font-size: 12px;
		font: bold;
		background-color: #E6E6F0;
	}
	.page{
		width: 1100px;
	}
	.allList{
		position: relative;
		top: 10px;
		width: 750px;
		background-color: white;
		border-radius: 10px;
		padding: 20px;
		margin: 5px;
	}
	#tabDiv{
		position: relative;
	}
	.nav-tabs > li.active > a,
	.nav-tabs > li.active > a:hover,
	.nav-tabs > li.active > a:focus{
		border-bottom: 2px solid #FF6600;
	}	
	#myinfoUpdateForm{
		margin: auto auto;
	}
	#certificateForm{
		/* position:absolute; */
		top: 10px;
		right: 315px;
	}
	.input-group{
		width: 400px;
		margin-top: 20px;
	}
	.input-group-addon{
		width: 150px;
	}
	.form-control{
		width: 250px;
	}
	#buttonDiv{
		position: relative;
	}
	#secessionBtn{
		position: absolute;
		right: 145px;
	}
	
	.table-responsive{
		width: 500px;
	}
	
	.form-control input-sm{
		width: 450px;
	}
	
	.guide_comment{
		font-size: 10px;
	}
	
	#myTab{
		width: 600px;
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
<div class="allList">
<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#myinfoUpdateForm" data-toggle="tab" id="myinfoUpdateBtn" >회원정보수정</a></li>
  <li><a href="#certificateForm" data-toggle="tab" id="certificateFormBtn">대학교 인증</a></li>
</ul>
<br/>
<div id="tabDiv">
  <div id="myinfoUpdateForm" class="tab-pane active">	
 	<form method="post" action="${pageContext.request.contextPath}/user_modify.do" id="userModify">
 		<div class="table-responsive" align="center">
			<h4 align="center"><b>회원정보수정</b></h4>
			<br/>
			
			<table class="table table-striped table-hover">
				<tr>
					<td><b>아이디</b></td>
					<td><input type="text" class="form-control input-sm" value="${modify_user.user_id }" readonly="readonly" name="user_id"></td>
				</tr>
				<tr>
					<td><b>비밀번호</b></td>
					<td><input type="text" id="password1" class="form-control input-sm" value="${modify_user.user_password }" name="user_password"></td>
				</tr>
				<tr>
					<td><b>비밀번호확인</b></td>
					<td><input type="text" id="password2" class="form-control input-sm" placeholder="다시 한번 입력해주세요" name="user_password2"></td>
				</tr>
				<tr>
					<td><b>이름</b></td>
					<td><input type="text" id="userName" class="form-control input-sm" value="${modify_user.user_name }" name="user_name"></td>
				</tr>
				<tr>
					<td><b>전화번호</b></td>
					<td><input type="text" id="userPhone" class="form-control input-sm" value="${modify_user.user_phone }" name="user_phone"></td>
				</tr>
				<tr>
					<td><b>이메일</b></td>
					<td><input type="text" id="userEmail" class="form-control input-sm" value="${modify_user.user_email }" name="user_email"></td>
				</tr>
				<tr>
					<td><b>대학교</b></td>
					<td>
						<select class="form-control input-sm" name="univ_code" id="univ_target">
							<c:if test="${not empty univList }">
					     		<option value="noValue">선택하세요</option>
								<c:forEach items="${univList }" var="univ">
									<c:choose>
										<c:when test="${univ.univ_code == modify_user.univ_code }">
											<option value="${univ.univ_code }" selected="selected">${univ.univ_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${univ.univ_code }">${univ.univ_name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</select>
					</td>
				</tr>
			</table>
			
			<table align="center">
				<tr>
					<td>
						<button type="submit" class="btn btn-warning btn-sm" id="updateBtn"><i class="large edit icon"></i>수 정</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-warning btn-sm" id="deleteBtn"><i class="large cancel basic icon"></i>탈 퇴</button>	
					</td>
				</tr>
			</table>
		</div>
   	</form>
</div>
	
	
	
<div id="certificateForm" class="tab-pane">
		<div class="table-responsive" align="center">
			<h4 align="center"><b>Certificate University</b></h4>
			<br/>
			<table class="table table-striped table-hover" align="center">
				<tr>
					<td colspan="3">
						<textarea class="form-control input-sm" rows="5" style="width: 100%">학교 메일 계정을 통해 재학생 인증을 받으실 수 있습니다. 인증이 완료되시면 권한이 상향조정되며 다양한 시스템을 이용하실 수 있습니다. 에러메시지가 뜨는 경우에는 브라우저를 모두 닫고 다시 시도해보시길 바랍니다. 메일주소를 입력 후 [보내기]버튼을 누르면 입력된 주소로 인증 번호가 보내집니다. 인증 번호를 확인하고 입력하면 인증이 완료됩니다.</textarea>
					</td>
				</tr>
				<tr>
					<td><b>학교</b></td>
					<td colspan="2"><input class="form-control input-sm" type="text" name="univ_name" value="${univInfo.univ_name }"></td>
				</tr>
				<tr>
					<td><b>학교이메일</b></td>
					<td>
						<input id="univ_email" class="form-control input-sm" type="email" name="univ_email" value="${univInfo.univ_email}">
					</td>
					<td><button class="btn btn-warning btn-sm" id="get_key">
						<i class="large lock icon"></i>인증코드받기</button></td>
				</tr>
				<tr>
					<td><b>인증코드</b></td>
					<td><input id="certificate_code" class="form-control input-sm" type="text" name="certificate_code"></td>
					<td><button class="btn btn-warning btn-sm" id="certificate"><i class="large ok sign icon"></i>인 증 하 기</button></td>
				</tr>
			</table>
		</div>
</div>
</div>
</div>
<script type="text/javascript">
	$(function(){
	
		$("#userModify").submit(function(){
			
				
			if(!($("#password1").val()==null || $("#password1").val()==$("#password2").val())){
				alert("비밀번호를 확인하세요");
				return false;
			}
			if(!($("#userName").val()!="")){
				alert("이름을 입력하세요.");
				return false;
			}
			if(!($("#userPhone").val()!="")){
				alert("전화번호를 입력하세요.");
				return false;
			}
			if(!($("#userEmail").val()!="")){
				alert("이메일을 입력하세요.");
				return false;
			}
			alert("수정되었습니다.");	
			
			
			});
		
		$("#certificateForm").hide();	
			
		$('#myTab a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show');
			});
			
		$("#myinfoUpdateBtn").click(function(){
			$(this).parent().addClass("active");
			$("#certificateFormBtn").parent().removeClass("active");
			$("#myinfoUpdateForm").show();
			$("#certificateForm").hide();
		});
		
		$("#certificateFormBtn").click(function(){
			$(this).parent().addClass("active");
			$("#myinfoUpdateBtn").parent().removeClass("active");
			$("#certificateForm").show();
			$("#myinfoUpdateForm").hide();
		});
		
		$("#deleteBtn").click(function(){
			comfirm("정말로 탈퇴하시겠습니까?");		
		});
		
		$("body").on("click", "#get_key", function(e) {
			alert($("#univ_email").val());
			$.get("key_create.do", {
				"univ_email" : $("#univ_email").val()
			}, function() {
				alert("메일이 발송되었습니다 인증키를 입력해주세요~");
			}, "json");
		});

		$("body").on("click", "#certificate", function(e) {
			$.post("key_certificate.do", {
				"certificate_code" : $("#certificate_code").val()
			}, function(jsonObj) {
				if (jsonObj.status) {
					alert("인증이 완료되었습니다.");
					window.location.href = 'index.jsp';
				} else {
					alert("인증 실패~ 다시 시도해주세요");
				}
			}, "json");
		});
	
	});
</script>
</body>
</html>