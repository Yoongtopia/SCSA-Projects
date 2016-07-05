<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<style type="text/css">

body{
	font-family: 맑은 고딕;
	background-color: #E6E6F0;
	font-size: 12px;
}
.page{
	width: 1100px;
}
.table{
	font-family: 맑은 고딕;
}
.title{
	padding-left: 15px;
}
#title1{
	text-align: left;
	font-size: 35px;
	font-family: 맑은 고딕;
	color: #003366;
}
#title2{
	text-align: left;
	font-size: 18px;
	font-family: 맑은 고딕;
	color: #003366;
}
.row{
	position:relative;
	top: 10px;
	width: 850px;
	background-color: white;
	border-radius: 10px;
	padding: 20px;
	margin: 5px;
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
	<c:choose>
		<c:when test="${not empty notice }">
			<form method="post" action="${pageContext.request.contextPath}/notice_modify.do" onsubmit="return formCheck()">
				<input type="hidden" name="notice_num" value="${notice.notice_num }"/>
				
					<div class="page">
						<div class="row">
							<div class='title' align="left">
								<span id="title1">NOTICE</span>&nbsp;
								<span id="title2">공지 사항</span>
							</div>
							<br>
							<table class="table table-striped">
								<tr>
									<td style="width: 11%"><b>&nbsp;제 &nbsp;&nbsp;목</b></td>
									<td><input type="text" size="103" class="form-control" name="notice_title" id="notice_title" value="${notice.notice_title}"></td>
								</tr>
								<tr>
									<td style="width: 11%"><b>상세내용</b></td>
									<td>
									<textarea rows="18" cols="105" class="form-control" name="notice_content" id="notice_content">${notice.notice_content}</textarea>
									</td>
								</tr>
							</table>
							<table align="center">
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-warning btn-sm" style="background-color: #FF6600"><i class="large pencil icon"></i>수정</button>&nbsp;&nbsp;
										<a href="${pageContext.request.contextPath}/notice_list.do"><button type="button" class="btn btn-warning btn-sm" style="background-color: #FF6600"><i class="large reply mail icon"></i>취소</button></a>
									</td>
								</tr>
							</table>
						</div>
					</div>
			</form>
		</c:when>
		<c:otherwise>
			<form method="post" action="${pageContext.request.contextPath}/notice_register.do" onsubmit="return formCheck()">
				
					<div class="form group">
						<div class="row">
							<div class='title' align="left">
								<span id="title1">NOTICE</span>&nbsp;
								<span id="title2">공지 사항</span>
							</div>
							<br>
							<table class="table table-striped">
								<tr>
									<td><b>제    목</b></td>
									<td><input type="text" size="70" class="form-control" name="notice_title" id="notice_title"></td>
								</tr>
								<tr>
									<td><b>내 용</b></td>
									<td>
									<textarea rows="10" cols="72" class="form-control" name="notice_content" id="notice_content" placeholder="상세내용을 입력해주세요."></textarea>
								</tr>
							</table>
							<table align="center">
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-warning btn-sm"><i class="large thumbs up outline icon"></i>등 록</button>&nbsp;&nbsp;
										<a href="${pageContext.request.contextPath}/notice_list.do"><button type="button" class="btn btn-warning btn-sm"><i class="large reply mail icon"></i>취 소</button></a>
									</td>
								</tr>
							</table>
						</div>
					</div>		
			</form>
		</c:otherwise>
	</c:choose>
	
	<script type="text/javascript">
	
		function formCheck(){
			var notice_title = document.getElementById("notice_title");
			var notice_content = document.getElementById("notice_content");
			
			if(notice_title.value == ""){
				alert("공지사항 제목을 정확히 입력해 주세요.");
				notice_title.focus();
				return false;
			}
			if(notice_content.value == ""){
				alert("내용을 정확히 입력해 주세요.");
				notice_content.focus();
				return false;
			}
			return true;
		}
	
	</script>
</body>
</html>