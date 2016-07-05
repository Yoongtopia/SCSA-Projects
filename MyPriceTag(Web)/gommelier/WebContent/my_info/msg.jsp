<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>쪽지</title>
<style type="text/css">
body{
	font-family: 맑은 고딕;
	font-size12: 12px;
}

.title{
	font: bold;	
	color: #003366;	
}

.msg{
	border-top: 2px;
}

.table{
	margin-bottom: 5px;
}
.btn-warning{
	background-color: #FF6600;
	border: 1px solid #FF6600;
}

</style>
</head>
<body>
 <div class="panel-body" id="SendMsgModal">
	
	 <div class="col-md-12">
		<table align="center">
			<tr><td>
					<h4 class="title"><strong><i class="home mail icon"></i>${user.user_id ne msg.user_id_sender? '받은쪽지':'보낸쪽지'}</strong></h4>
				</td>
			</tr>
		</table>
		<br>
		 <table class="table">
			<tr>
				<th width="25%">${user.user_id ne msg.user_id_sender? '보낸사람':'받은사람'}</th>
				<td id="sender">${user.user_id ne msg.user_id_sender? msg.user_id_sender:msg.user_id_receiver}
				</td>
			</tr>
			<tr>
				<th width="25%">${user.user_id ne msg.user_id_sender? '보낸날짜':'받은날짜'}</th>
				<td><fmt:parseDate value="${msg.msg_date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
					<fmt:formatDate value="${date}" pattern="MM월 dd일 HH시 mm분"/></td>
			</tr>
			<tr class="msg">
				<th>내용</th>
				<td>${msg.msg_content}</td>
			</tr>
		 </table>	
		<br/>
		<table align="center">
			<tr>
				<td>
					<c:if test="${user.user_id ne msg.user_id_sender}">
						<a class="btn btn-warning btn-xs" href="send_msg_page.do?user_id=${msg.user_id_sender}"><i class="large pencil icon"></i>답장하기</a>&nbsp;&nbsp;
					</c:if>					
					<button id="endSendMsg" class="btn btn-warning btn-xs"><i class="large remove sign icon"></i>닫 기</button>
				</td>
			</tr>
		</table>
		
	  </div>
	 
 </div>	
<script type="text/javascript">
	$(function() {		
		$("body").on('click', "#endSendMsg", function(){
			 window.close();
		});
	})
</script>		
</body>
</html>