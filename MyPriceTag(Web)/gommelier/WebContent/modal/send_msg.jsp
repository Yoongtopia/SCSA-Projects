<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<title>쪽지보내기</title>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<style type="text/css">


.title{
	font-family: 'Josefin Sans', sans-serif;
	font: bold;	
	color: #003366;	
}

.msg{
	border-top: 2px;
}

.table{
	margin-bottom: 5px;
}

</style>
</head>
<body>

 <div class="panel-body" id="SendMsgModal" style="background-image: url('./images/msg_background.jpg');">
	
	 <div class="col-md-12">
		
		<table align="center">
			<tr>
				<td>
					<h4 class="title"><strong>쪽지보내기</strong></h4>
				</td>
			</tr>
		</table>
		
		<br>
		
		<table id="send_msg_form">
		 <table class="table table-striped">
			<tr>
				<th>받는사람</th>
				<td>
				<input type="text" size="20" class="form-control" name="user_id_receiver" id="user_id_receiver" value="${user_id_receiver}" placeholder=".input-sm" readonly="readonly">
				<input type="hidden" size="20" class="form-control" name="user_id_receiver" id="user_id_receiver" value="${user_id_sender}" placeholder=".input-sm" readonly="readonly">
				</td>
			</tr>
			
			<tr class="msg">
				<th>내용</th>
				<td><textarea name="msg_content" class="form-control" placeholder="내용을 입력해 주세요" id="msg_content"
				cols="22" rows="5"></textarea></td>
			</tr>
		 </table>	
		</table>
		
		<table align="center">
			<tr>
				<td>
					<button id="SendMessage" class="btn btn-warning btn-xs" style="background-color: #FF6600"><i class="large pencil icon"></i>전 송</button>&nbsp;&nbsp;
					<button id="endSendMsg" class="btn btn-warning btn-xs" style="background-color: #FF6600"><i class="large remove sign icon"></i>닫 기</button>
				</td>
			</tr>
		</table>
		
	  </div>
	 
 </div>	
<script type="text/javascript">
	$(function() {
		$("body").on('click', '#SendMessage', function(){
			$.post("send_msg_modal.do",		
					{"user_id_receiver":$("#user_id_receiver").val(), "msg_content":$("#msg_content").val()},
					function(jsonOBJ){
						if(jsonOBJ.status){	
							alert("쪽지발송 성공");
							 window.close()
						}else{
							alert("쪽지발송 실패");
						}
					},"json");
		});
		
		$("body").on('click', "#endSendMsg", function(){
			 window.close();
		});
	})
</script>		
		

</body>
</html>