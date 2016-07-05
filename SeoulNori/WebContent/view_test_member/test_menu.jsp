<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		
		loginCheck();
		
		//$(".dropdown-toggle").dropdown();
	
		//dialog
		$(document).on('hidden.bs.modal', function (e) {
		    $(e.target).removeData('bs.modal');
		});
		
		//login
		$("#submitBtn").click(function(){
			$.post("${pageContext.request.contextPath}/member_login.do", 
			   {"userId":$("#loginUserId").val(), "password":$("#loginPassword").val()},
			   function(jsonObj){
				   if(jsonObj.status){	
						alert("로그인 성공!");
					  	$("#myModal").modal('hide');
					  	$(".modal-backdrop").remove();
					   	$(".nonMember").hide();
					   	menuChange(jsonObj);
							
				   } else{
						$("#loginUserId").val("");
						$("#loginPassword").val("");
						$("#loginUserId").focus();
						$("#errorMsg").show();
						return false;
					   }
			   }, "json");
		
		});
		
		
		
	});
	
	function menuChange(a){
		var text = $("<span/>").attr("id","loginMsg").text("환영합니다  ");
		var span = $("<span/>").attr("style","font-size: small").attr("id","logoutBtn")
					.attr("role","button").text("로그아웃");
		
		$("#joinBtn").before(text, span);
		$(".nonMember").hide();
		
		//logout
		$("#logoutBtn").click(function(){
			location.href("${pageContext.request.contextPath }/member_logout.do");
		
		});
		
	};
	
	//로그인체크
	function loginCheck(){
		$.getJSON("${pageContext.request.contextPath }/login_check.do",
				function(jsonObj){
					if(jsonObj.status){
						menuChange(jsonObj);
					}
		});
	};

</script>
</head>
<body>

	<nav class="navbar navbar-default" role="navigation">
	
		<div class="navbar-header">
			<a href="#"><img src="../images/test/test_logo_resize.png" height="80px"/></a>
	 	 </div>
	 	 
		<div class="collapse navbar-collapse navbar-ex1-collapse">
		    <ul class="nav navbar-nav">
		      <li><a></a></li>
		     <li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown">카테고리 <b class="caret"></b></a>
		        <ul class="dropdown-menu">
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=festival">축제</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=performance">공연</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=exhibition">전시</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=classic">클래식</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=ect">기타</a></li>
		        </ul>
		      </li>
		      <li><a href="#">스탬프</a></li>
		    </ul>	
		        <form role="search" style="text-align: right;" action="${pageContext.request.contextPath }/event_search_keyword.do" method="post" class="navbar-form navbar-right">
	      	 	<a id="myModalLink" class="nonMember" href="#myModalContainer" role="button" class="btn" data-toggle="modal" data-target="#myModal" style="font-size: small;">로그인</a>&nbsp;&nbsp;
    		  	<a id="joinBtn" class="nonMember" href="${pageContext.request.contextPath }/member_joinForm.do" style="font-size: small;">회원가입</a><br/>
	    		<div class="form-group">
		        <input type="text" class="form-control" placeholder="검색어를 입력하세요" name="keyword" id="keyword">
		        </div>
		        <button type="submit" class="btn btn-default">검색</button>
			   </form>
		  	  </div>
				 	 
	</nav>
	
<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <span class="modal-title" id="myModalLabel" contenteditable="false" style="font-size: 1.5em;">로그인</span>
	        <span id="errorMsg" style="color: red;display:none">정확하게 입력하세요</span>
	      </div>
	   
	      <div class="modal-body" contenteditable="false">
	      	<span id="loginError"></span>
	      	<div class="form-group">
				 <label for="email">Email address</label>
				 <input type="email" class="form-control" id="loginUserId" name="userId" />
			</div>
			<div class="form-group">
				 <label for="password" >Password</label>
				 <input type="password" class="form-control" id="loginPassword" name="password" />
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