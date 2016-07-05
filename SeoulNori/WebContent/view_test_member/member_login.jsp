<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$(document).on('hidden.bs.modal', function (e) {
	    $(e.target).removeData('bs.modal');
	});

	$("#submitBtn").click(function(){	
		$.post("${pageContext.request.contextPath}/member_login.do", 
		   {"userId":$("#email").val(), "password":$("#password").val()},
		   function(jsonObj){
			   if(jsonObj.status){
				   	alert("로그인 성공!");	
				   	$('#myModalContainer').modal('hide');
				   	$("#myModalLink").hide();
				   	$("#index").text("로그아웃");
				   } else{
					  $("#email").val("");
					  $("#password").val("");
					  $("#email").focus();
					  $("#errorMsg").show();
					  return false;
				   }
		   }, "json");
	
	});
	
});


</script>

<style>
#logout, #errorMsg {
	display: none;
}
</style>
</head>
<body>
<!-- Button to trigger modal -->
<div id="index">
 <a id="myModalLink" href="#myModalContainer" role="button" class="btn" data-toggle="modal">로그인</a>
 <a id="logout" href="${pageContext.request.contextPath}/member_logout.do" role="button" class="btn" >로그아웃</a>
</div>
<!-- Modal -->
<div class="modal fade" id="myModalContainer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <span class="modal-title" id="myModalLabel" contenteditable="false">로그인</span>
        <span id="errorMsg">정확하게 입력하세요</span>
      </div>
   
      <div class="modal-body" contenteditable="false">
      	<span id="loginError"></span>
      	<div class="form-group">
			 <label for="email">Email address</label>
			 <input type="email" class="form-control" id="email" name="userId" />
		</div>
		<div class="form-group">
			 <label for="password" >Password</label>
			 <input type="password" class="form-control" id="password" name="password" />
		</div>
	  </div>	
      <div class="modal-footer">
         <button type="button" class="btn btn-primary" id="submitBtn" contenteditable="false">로그인</button>
         <button type="button" class="btn btn-default" id="resetBtn" data-dismiss="modal" contenteditable="false">취소</button>
      </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
</html>