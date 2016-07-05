<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="textext/src/css/textext.plugin.autocomplete.css">
<title>쪽지</title>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<script src="textext/src/js/textext.core.js"></script>
<script src="textext/src/js/textext.plugin.autocomplete.js"></script>
<script src="textext/src/js/textext.plugin.ajax.js"></script>
<style type="text/css">
body{
	font-family: 맑은 고딕;
	font-size: 12px;
}
.title{
	font-family: 맑은 고딕;
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
	
	 <div class="col-md-12" >
		<table align="center">
			<tr><td>
					<h4 class="title"><strong><i class="home mail icon"></i>쪽지보내기</strong></h4>
				</td>
			</tr>
		</table>
		<br>
		 <table class="table table-striped">
			<tr style="padding-top: #FF6600">
				<th>받는사람</th>
				<td><input type="text" size="20" class="form-control" name="receiver" id="receiver" value="${receiver}">
				</td>
			</tr>
			<tr class="msg">
				<th>내 용</th>
				<td><textarea name="msg_content" class="form-control" placeholder="내용을 입력해 주세요" id="msg_content"
				cols="22" rows="5"></textarea></td>
			</tr>
		 </table>	

		<table align="center">
			<tr>
				<td>
					<button id="SendMessage" class="btn btn-warning btn-xs"><i class="large pencil icon"></i>전 송</button>&nbsp;&nbsp;
					<button id="endSendMsg" class="btn btn-warning btn-xs" ><i class="large remove sign icon"></i>닫 기</button>
				</td>
			</tr>
		</table>
		
	  </div>
	 
 </div>	
<script type="text/javascript">
	$(function() {
		$("body").on('click', '#SendMessage', function(){
			
			$.ajax({
				 type: "post",
				 url: "send_msg_modal.do",
				 dataType: 'json',
				 data: {"receiver":$("#receiver").val(), 
						"msg_content":$("#msg_content").val()},
				 error: function(){
				        alert("...에러다 에러!!! 똑바로 입력바람..");
				        $("#receiver").val("");
				 },
				 success: function(jsonOBJ){
						if(jsonOBJ.status){	
							alert("쪽지발송 성공");
							window.close();
						}
					}
			});
			
		/* 	$.post("send_msg_modal.do",		
					{"receiver":$("#receiver").val(), 
					"msg_content":$("#msg_content").val()},
					function(jsonOBJ){
						if(jsonOBJ.status){	
							alert("쪽지발송 성공");
							window.close();
						}
					},"json").ajaxError(function() {
						alert("쪽지 실패");
					}); */
		});
		
		$("body").on('click', "#endSendMsg", function(){
			 window.close();
		});
		
	    $('#receiver').textext({
            plugins : 'autocomplete ajax',
            ajax : {
                url : 'get_user_ids.do',
                dataType : 'json',
                cacheResults : true
            }
        })
    ;
	})
</script>		
</body>
</html>