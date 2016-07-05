<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		
		$("body").on("click", "#certificate_button", function(e) {
			$.post("${pageContext.request.contextPath}/key_create.do", {
				"univ_email" : $("#univ_email").val()
			}, function() {
				alert("메일이 발송되었습니다 인증키를 입력해주세요~");
			}, "json");
		});

		
		$("body").on("click", "#certificate_button", function(e) {
			$.post("${pageContext.request.contextPath}/certificate.do", {
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
<title>인증화면</title>
</head>
<body>
	<div>Certificate University</div>
		<table>
			<tr>
				<td colspan="3">
					<textarea rows="10" cols="60">학교 메일 계정을 통해 재학생 인증을 받으실 수 있습니다. 인증이 완료되시면 권한이 상향조정되며 다양한 시스템을 이용하실 수 있습니다. 에러메시지가 뜨는 경우에는 브라우저를 모두 닫고 다시 시도해보시길 바랍니다. 메일주소를 입력 후 [보내기]버튼을 누르면 입력된 주소로 인증 번호가 보내집니다. 인증 번호를 확인하고 입력하면 인증이 완료됩니다.</textarea>
				</td>
			</tr>
			<tr>
				<td>학교</td>
				<td colspan="2"><input type="text" name="univ_name" value="${univInfo.univ_name}"></td>
			</tr>
			<tr>
				<td>학교이메일</td>
				<td>
					
					<input type="text" name="univ_num">
					<input type="text" id="univ_email" name="univ_email" value="${univInfo.univ_email}">
				</td>
				<td><input type="button" value="인증코드받기" id="certificate_button"></td>
			</tr>
			<tr>
				<td>인증코드</td>
				<td><input id="certificate_code" type="text" name="certificate_code"></td>
				<td><input id="certificate" type="submit" value="인증하기"></td>
			</tr>
			<tr>
				<td colspan="3"><a href="${pageContext.request.contextPath}/main.jsp">메인페이지 이동</a></td>
			</tr>
		</table>
</body>
</html>