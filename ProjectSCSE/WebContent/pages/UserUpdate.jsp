<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ajaxStart(function() {
		$("#loading").show();		
	});
	//학교검색 스크립트
	$(document).ready(function() {
		
		
		
		
		$("#loading").hide();
		$("#goSearch").on("click",function() {
			$(".formCheck").hide();
			$("#loading").show();
			$("#target").hide();
			$(".result").remove();
			$.post("search_School_ajax.scse", {
				"schoolName" : $("#search").val()
			}, function(jsonObj) {
				if (jsonObj.status) {
				$(jsonObj.list).each(function(index, item) {
						$("#target").show();
						$("#loading").hide();
						var td1 = $("<td/>").text(item.schoolNum);
						var a = $("<a/>").attr("href","javascript:void(0)").text(item.schoolName);
						var td2 = $("<td/>").attr("class","resultSchool").append(a);
						var td3 = $("<td/>").text(item.schoolAddress);
						var tr = $("<tr/>").attr("class", "result").append(td1, td2, td3);
						$("#target").append(tr);
						});
				} else if(!jsonObj.status) {
					$("#loading").hide();
					var td1 = $("<td/>").text("검색결과가 없습니다.");
					var tr = $("<tr/>").attr("class", "result").append(td1);
					$("#target").append(tr);
					}
			}, "json");
		});

		$(document).on("click", ".resultSchool", function() {
			$("#school").val($(this).text());
			$("#schoolNum").val($(this).prev().text());
			$('#searchSchoolForm').modal('hide');
			$(".result").remove();
		});

});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loading").hide();
		$("#target").hide();
		$('.ui.dropdown').dropdown();
		$('#updateuser').removeAttr("disabled");
		

		$("#t_email").on("blur", function() {
			var test = $("#t_email").val();
			console.log(test);

			if (test.indexOf('@') != -1) {
				alert("으아~!");
			}
		});

		//비밀번호 중복 체크
		/* $("#passwordChk").on("blur", function() {
			if ($("#passwordChk").val() != $("#password").val()) {
				$("#passwordChk").append("비밀번호가 일치 하지 않습니다.");
				 $("#submit").attr("disabled", "disabled"); 
			} else {
				$("#submit").removeAttr("disabled");
			}}
		); */
		//비밀번호 중복 체크 끝

		//학교검색용
		$("#school").on("click", function() {
			$('#searchSchoolForm').modal('setting', {
				closable : false,
				onDeny : function() {
					window.alert('Wait not yet!');
					return false;
				},
				onApprove : function() {
					$("#school").val($("#schoolResult").val());
				}
			}).modal('show');
		});
		//학교 검색끝

	});
$(document).ready(function(){
	$("#temail2").on("blur", function(){
		emailSum();
		alert($("#temail").val());
	});
});
function emailSum() {
	var temail1 = $("#temail1").val();
	var temail2 = $("#temail2").val();
	$("#temail").val(temail1 + temail2);
};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	

	<div id="registerForm" style="width: 700px;  margin-left: 130px; margin-right:130px; margin-top: 50px; ">
	 <form method="post" action="${pageContext.request.contextPath }/updateUser.scse"> 
		<div class="ui form segment">
			<div class="field" style="font-family: 'Nanum Gothic'; font-size: large; font-weight: bold;">
			<i class="edit icon"></i>기본 정보 수정			
			</div>
			
			<div class="field">
				<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 50px; ">비밀번호</label>
				<div class="ui left labeled icon input">
					<input type="password" id='password' name='password' value="${user.password }" placeholder="비밀번호를 입력해주세요">
					<i class="lock icon"></i>
					<div class="ui corner label">
						<i class="icon asterisk"></i>
					</div>
				</div>
			</div>
			<div class="field">
				<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 20px; ">비밀번호확인</label>
				<div class="ui left labeled icon input">
					<input type="password" id='passwordChk' name='passwordChk' value="${user.password }" placeholder="다시 한 번 입력해주세요.">
					<i class="lock icon"></i>
					<div class="ui corner label">
						<i class="icon asterisk"></i>
					</div>
				</div>
			</div>
			<div class="field">
				<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 20px; ">이름</label>
				<div class="ui left labeled icon input">
					<input type='text' id='sname' name='sname' value="${user.sName }" placeholder="이름을 입력해주세요.">
					<i class="terminal icon"></i>
					<div class="ui corner label">
						<i class="icon asterisk"></i>
					</div>
				</div>
			</div>
			<div class="two fields">
				<c:if test="${user.uType != 'p'.charAt(0)}">
					<div class="field">
						<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 15px; ">학교</label>
						<div class="ui left labeled icon input">
							<!-- 실제 컨트롤러에서 쓰이는 학교번호가 입력되는 곳 -->
							<input type="hidden" id='schoolNum' name='schoolNum' value="${user.userSchool.schoolNum}">
							<input type='text' id='school' name='school' value="${user.userSchool.schoolName}" readonly="readonly" placeholder='학교를 입력해주세요.'>
							<i class="briefcase icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${user.uType =='s'.charAt(0) }">
						<div class="field">
						<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 15px; ">학년</label>
						<div class="ui left labeled icon input">
							<input type='text' min='1' max='6' step="'1" id='grade' value='${sessionScope.user.userStudent.grade}' name='grade' placeholder='학년을 입력해주세요.'>
							<i class="briefcase icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
					</c:when>
					<c:otherwise>
						<input type='hidden' name='grade' value="0">
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${user.uType == 'p'.charAt(0) }">
				<div class="field">
					<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 20px; ">학부모용 이메일</label>
					<div class="ui left labeled icon input">
						<input type='text' id='email' name='email' placeholder='이메일을 입력해주세요.' value='${sessionScope.user.userLeader.email }'>
						<i class="mail outline icon"></i>
						<div class="ui corner label">
							<i class="icon asterisk"></i>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${user.uType == 't'.charAt(0) }">
				<!-- 이메일 여기서 합쳐짐 -->
				<input type="hidden" id='temail' name='temail' value='${sessionScope.user.userLeader.email }'>
				<div class="field">
					<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 20px; ">교사용 이메일</label>
					<div class="ui left labeled icon input">
						<%-- <Table>
							<tr>
								<td width="76%"><input type='text' id='temail1' size="10" value='${requestScope.domain}' placeholder='교육청 이메일 아이디를 입력해주세요.'></td>
								<td><div class="ui dropdown selection error select-school">
										<input type="hidden" name="temail2" id="temail2">
										<div class="default text">교육청 이메일 선택</div>
										<i class="dropdown icon"></i>
										<div class="menu">
											<div class="item" data-value="@sen.go.kr">@sen.go.kr</div>
											<div class="item" data-value="@goe.go.kr">@goe.go.kr</div>
											<div class="item" data-value="@gne.go.kr">@gne.go.kr</div>
											<div class="item" data-value="@pen.go.kr">@pen.go.kr</div>
											<div class="item" data-value="@cne.go.kr">@cne.go.kr</div>
											<div class="item" data-value="@dge.go.kr">@dge.go.kr</div>
											<div class="item" data-value="@gen.go.kr">@gen.go.kr</div>
											<div class="item" data-value="@jbe.go.kr">@jbe.go.kr</div>
											<div class="item" data-value="@gwe.go.kr">@gwe.go.kr</div>
											<div class="item" data-value="@dje.go.kr">@dje.go.kr</div>
											<div class="item" data-value="@ice.go.kr">@ice.go.kr</div>
											<div class="item" data-value="@use.go.kr">@use.go.kr</div>
											<div class="item" data-value="@jje.go.kr">@jje.go.kr</div>
											<div class="item" data-value="@gbe.go.kr">@gbe.go.kr</div>
											<div class="item" data-value="@cbe.go.kr">@cbe.go.kr</div>
											<div class="item" data-value="@jne.go.kr">@jne.go.kr</div>
											<div class="item" data-value="@sje.go.kr">@sje.go.kr</div>
										</div>
									</div></td>
						</Table> --%>
						<!-- 	 <i class="mail icon"></i> -->
						
						<input type='text' id='email' name='email' placeholder='이메일을 입력해주세요.' value='${sessionScope.user.userLeader.email }'>
						<i class="mail outline icon"></i>
						<div class="ui corner label">
							<i class="icon asterisk"></i>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${user.uType != 's'.charAt(0) }">
				<div class="field">
					<label style="font-family:'Nanum Gothic'; font-size: medium; margin-top: 20px; ">연락처 </label>
					<div class="ui left labeled icon input">
						<input type='tel' id='phone' name='phone' value='${sessionScope.user.userLeader.phone }'  placeholder='연락처 입력해주세요.'>
						<i class="phone icon"></i>
						<div class="ui corner label">
							<i class="icon asterisk"></i>
						</div>
					</div>
				</div>
			</c:if>
		<div  style="height: 50px"></div>
		<div class="three fields">		
		<div class="three fluid ui buttons">			
			<input type="hidden" name="userId" value="${user.userId }"> 
			<input type="submit" value="수정하기" id="updateuser" class="ui blue button" style="margin-left: 20px;  width: 200px;"
			onclick="alert('개인정보 보호를 위해 다시 로그인해주시기 바랍니다')">
			
		<input type="button" class="ui red cancel button" style="margin-left: 20px; width: 200px;" value="취소하기">
		<div class="ui button" style="width: 200px; margin-left: 20px;">
		<a href="${pageContext.request.contextPath }/removeUser.scse?userId=${user.userId}" style="text-decoration: none; color: #9d9d9d;">탈퇴하기</a>
		</div>		
		</div>		
		</div>			
		</div>
		</form> 
		</div>		
		</div>	
 		


	<!-- 학교검색 -->
			<div class="ui small modal" id="searchSchoolForm">
			<i class="close icon"></i>
			<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic'; padding: 1em 2em">학교 검색</div>
			<div class="content" style="padding: 0.5em; width: 100%">
				<div class="ui form segment">
					<div class="two fields">
						<div class="field" style="width: 80%">
							<div class="ui icon fluid input">
								<input type="text" placeholder="검색을 원하는 학교명을 입력해주세요." id="search">
								<i class="search link icon"></i>
							</div>
						</div>
						<div class="field" style="width: 20%">
							<input type="submit" class="ui button" value="검색" id="goSearch">
						</div>
					</div>
				</div>
				<div style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
					<div id="loading" align="center" style="width: 100%; height: 100%; vertical-align: middle">
						<img src="img/ajaxLoading.gif">
					</div>
					<table class="ui table segment" id="target">
						<thead id="tableahead">
							<tr>
								<th>학교코드</th>
								<th>학교명</th>
								<th>학교위치</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>

</body>
</html>