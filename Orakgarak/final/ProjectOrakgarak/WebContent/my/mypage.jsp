<%@page import="com.orakgarak.util.ParseUtil"%>
<%@page import="com.orakgarak.vo.UserAdvanced"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>

<script src="js/jquery.tablesort.js"></script>
<!-- dd -->

<link rel="stylesheet" href="packaged/css/semantic.min.css">
<style type="text/css">
body {
	font-family: 'Nanum Gothic';
}

#updatebox {
	width: 60%;
	margin: 40px auto;
}

a {
	text-decoration: none;
}

#out {
	float: right;
	margin-top: 10px;
	font-weight: 700;
	background-color: #D95C5C;
	color: #FFF;
	width: 82px;
	height: 42px;
}
#out:hover{
	color: #D95C5C;
	background-color: #FFF;
}
th{
	text-align:center !important;
}
td{
	text-align: center;
}

table{
	margin:20px auto !important;
}

.small.ui.button{
	color: #e74c3c;
	margin: 20px 0 0 50px;
}

.small.ui.button:hover{
	background: #e74c3c;
	color: #FFF;
}

.contentstyle{
	width:930px;
	margin:0 auto;
}

.ui.sortable.table.segment{
	width:900px;
}

</style>


<script type="text/javascript">
	$(document).ready(function() {
		
		$('table').tablesort();
		
		$('.ui.form').form({
			password : {
				identifier : 'password',
				rules : [ {
					type : 'empty',
					prompt : '비밀번호를 입력해주세요'
				}, {
					type : 'match[password2]',
					prompt : '비밀번호체크를 확인해주세요'
				} ]
			},

			name : {
				identifier : 'name',
				rules : [ {
					type : 'empty',
					prompt : '이름을 입력해주세요'
				} ]
			}

		});

		$("#out").click(function() {
			$('.small.modal.withdraw').modal('show');
		});

	});

</script>


	




	<div id="change_myinfo" class="contentstyle">

		<h2 class="ui header"
			style="padding: 10px;">
			<i class="settings icon"></i> 계정관리
		</h2>

		
			<!-- <li class="active"><a href="#">마이페이지 수정</a></li> -->
			<c:if test="${sessionScope.user.email == 'admin@orakgarak.com' }">
				<a class="small ui button" href="${pageContext.request.contextPath }/user_management.do">회원관리</a>
			</c:if>
		


		<div class="ui form segment" id="updatebox">
			<form method="post"
				action="${pageContext.request.contextPath}/user_update.do">
				<div class="field">
					<label>Email(수정불가)</label> <input type="text" name="email"
						id="email" readonly="readonly"
						placeholder="${sessionScope.user.email }" />
				</div>
				<div class="field">
					<label>Name</label> <input type="text" name="name" id="name"
						placeholder="${sessionScope.user.name }">
				</div>
				<div class="field">
					<label>Password</label> <input type="password" name="password"
						id="password">
				</div>
				<div class="field">
					<label>Password Check</label> <input type="password"
						name="password2" id="password2">
				</div>

				<div class="field">
					<label>Age</label> <input type="text" name="age" id="age"
						value="${sessionScope.user.age }" />
				</div>
				<div class="field">
					<label>Phone</label> <input type="text" name="phone" id="phone"
						value="${sessionScope.user.phone }" />
				</div>

				<div class="btn">
					<input type="submit" value="수정" id="updateBtn"
						class="ui red submit button" style="margin-top:10px" />
						<a class="small ui button" id="out">탈퇴</a>
				</div>
			</form>

			<div class="ui error message"></div>
		</div>


		<!-- 탈퇴 승인처리 메세지 -->
		<div class="ui small modal withdraw">
			<i class="close icon"></i>
			<div class="header">탈퇴 신청 승인</div>
			<div class="content">
				<div class="left">정말 탈퇴 신청 하시겠습니까?</div>
			</div>
			<div class="actions">
				<div class="ui button">
					<a id="confirmOut"
						href="${pageContext.request.contextPath }/user_delete.do?email=${user.email}">
						확인</a>
				</div>
				<div class="ui button">
					<a
						href="${pageContext.request.contextPath }/mypage.do?email=${sessionScope.user.email}">취소</a>
				</div>
			</div>
		</div>

	</div>
