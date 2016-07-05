<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.btn btn-danger{
		line-height: 12px;
		font-size: 12px;
		font-family: 맑은 고딕;
	}

</style>
</head>
<body>
	<table class="table">
		<tr>
			<td class="danger">아이디와 비밀번호가 일치하지 않습니다. 정확히 입력해 주세요.</td>
		</tr>
		<tr>
			<td>
				<input class="btn btn-danger" type="button" id="signup_button" value="회원가입">
				<input class="btn btn-danger" type="button" id="move_main_button" value="메인으로가기">
			</td>
		</tr>
	</table>
	
<script type="text/javascript">

	$(function(){
		$("#signup_button").on("click", function(){
			location.href="${pageContext.request.contextPath}/univ_list.do";
		});
		
		$("#move_main_button").on("click", function(){
			location.href="./index.jsp";
		});
	});

</script>
</body>
</html>