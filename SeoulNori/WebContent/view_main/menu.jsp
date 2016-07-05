<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-seoulnori.css' />
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-theme-seoulnori.css' />
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.11.0.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap_datepicker.css">
<script type='text/javascript' src='${pageContext.request.contextPath}/js/bootstrap-datepicker.js'></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
	
	$(function() {
		
		$("#detailSearchMenu").click(function() {
			$("#detailSearchBoard").toggle();
		});
		
		$("#keyword").focus(function() {
			$("#detailSearchBoard").css("display", "none");
		});
		
		/* 현재 주소창의 주소 받아오기 @sy */
		$("#returnUrl").val(location.href);
		
		loginCheck();

		
		$(".dropdown-toggle").dropdown();
	
		//dialog
		$(document).on('hidden.bs.modal', function (e) {
		    $(e.target).removeData('bs.modal');
		});
		
		// 자동 로그인 방지 & 로그인 에러시 이동 방지 @sy
		$("#loginForm").submit(function() {
			return false;
		});	
		
		//login
		 $("#modalLoginBtn").click(function(){
			$.post("${pageContext.request.contextPath}/member_login_ajax.do", 
			   {"userId":$("#email").val(), "password":$("#password").val()},
			   function(jsonObj){
				   if(jsonObj.status){	
						location.reload();
				   } else{
						$("#email").val("");
						$("#password").val("");
						$("#email").focus();
						$("#errorMsg").text("정확하게 입력하세요");
					   }
			   }, "json");
		
		}); 

		
		$("#sido").on("change", function(){
			$("#ssi").css({"display":"none"});
			$("#isi").css({"display":"none"});
			$("#kdo").css({"display":"none"});
			$(".non").attr("selected","selected");
			
			var value = $(this).val();
			
			console.log(value);
			if(value=="sou"){
				$("#isi").css("display","none");
				$("#kdo").css("display","none");
				$("#ssi").css("display","block");
			}
			if(value=="inc"){
				$("#ssi").css("display","none");
				$("#kdo").css("display","none");
				$("#isi").css("display","block");
			}
			if(value=="kyo"){
				$("#ssi").css("display","none");
				$("#isi").css("display","none");
				$("#kdo").css("display","block");
			}
			
		});
		
	 	$("#sou").on("click", function() {
			consloe.log("asdfadsf");
			$("#isi").attr("display","none");
			$("#kdo").attr("display","none");
			$("#ssi").attr("display","block");
		});
		$("#inc").on("click", function() {
			$("#ssi").attr("display","none");
			$("#kdo").attr("display","none");
			$("#isi").attr("display","block");
		});
		$("#kyo").on("click", function() {
			$("#ssi").attr("display","none");
			$("#isi").attr("display","none");
			$("#kdo").attr("display","block");

		});
		
		
		// datepicker @sy
		$("#datepicker").datepicker({dateFormat:"yy/mm/dd"})
										.on('changeDate', function(){
												$('#datepicker').datepicker('hide');
											});
		$(".datepicker").css("z-index", "10001");
		
	});
	
	function menuChange(a){
		
	var nickname = $("<span/>").attr("style","font-size: small; color: #FFF;")
	.text(a.member.nickname+"님 "); 
	
	var myPage = $("<a/>").attr("style","font-size: small;")
		.attr("href","${pageContext.request.contextPath }/member_mypage.do")
		.text("마이페이지  "); 
	
	var myCalendar = $("<a/>").attr("style","font-size: small;")
	.attr("href","${pageContext.request.contextPath }/my_calendar.do")
	.text("내캘린더 "); 

	var eventManagerPage = $("<a/>").attr("style","font-size: small;")
			.attr("href","${pageContext.request.contextPath }/manager_page.do")
			.text("행사관리  "); 
	
	var adminPage = $("<a/>").attr("style","font-size: small;")
			.attr("href","${pageContext.request.contextPath }/admin_page.do?pageNo=1")
			.text("관리페이지  "); 
	
	var logout = $("<a/>").attr("style","font-size: small;").attr("id","logoutBtn")
			.attr("href","${pageContext.request.contextPath }/member_logout.do")
			.text("로그아웃");
	
	var spanLock = $("<span/>").attr("class", "glyphicon glyphicon-lock")
														.css("color", "#FFF")
														.css("padding", "0 3px");
	
	var spanCalendar = $("<span/>").attr("class", "glyphicon glyphicon-calendar")
															.css("color", "#FFF")
															.css("padding", "0 3px");
	
	var user = $("<span/>").attr("class", "glyphicon glyphicon-user")
														.css("color", "#FFF")
														.css("padding", "0 3px");
	
	
	if(a.member.memberType=="member"){
	$("#joinBtn").before(nickname, user, myPage, spanCalendar, myCalendar, spanLock, logout);
	} else if(a.member.memberType=="manager"){
	$("#joinBtn").before(nickname, user, eventManagerPage, spanLock, logout);
	} else if(a.member.memberType=="admin"){
	$("#joinBtn").before(nickname, user, adminPage, spanLock, logout);
	}
	
	$("#loginLock").hide();
	$("#user").hide();
	$(".nonMember").hide();
		
	};

	
	//로그인체크
	function loginCheck(){
	$.getJSON("${pageContext.request.contextPath }/login_check.do",
			function(jsonObj){
				//로그인중
				if(jsonObj.status){
					menuChange(jsonObj);
				} else{
					$(".nonMember").show();
					$("#logoutBtn").hide();
					$("#loginMsg").hide();
				}
		});
	
		
	};


</script>
<style type="text/css">
	#searchIconBtn:hover, #searchIconSpan:hover {
		color: #6dbd96;
	}
</style>
</head>
<body>

	<nav class="navbar navbar-seoulnori" role="navigation">
	
		<div class="navbar-header">
			<a href="${pageContext.request.contextPath}/seoulnori.do">
			<img src="${pageContext.request.contextPath}/images/main/logo.png"/></a>
	 	 </div>
	 	 
		<div class="collapse navbar-collapse navbar-ex1-collapse">
		    <ul class="nav navbar-nav">
		      <li><a></a></li>
		     <li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown">카테고리 <b class="caret"></b></a>
		        <ul class="dropdown-menu">
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=festival&pageNo=1">축제</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=performance&pageNo=1">공연</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=exhibition&pageNo=1">전시</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=classic&pageNo=1">클래식</a></li>
		          <li><a href="${pageContext.request.contextPath }/event_list_move.do?category=ect&pageNo=1">전통/기타</a></li>
		        </ul>
		      </li>
		      <li><a href="${pageContext.request.contextPath }/stamp_hall_of_fame.do">스탬프</a></li>
		      <li><a href="${pageContext.request.contextPath }/notice_list.do?pageNo=1">공지사항</a></li>
		    </ul>
		    
		    <form  method="post" role="search" action="${pageContext.request.contextPath }/event_search_keyword.do" 
		    			class="navbar-form navbar-right" style="text-align: right;">
		      <c:choose>
		    	<c:when test="${sessionScope.member == null}" >		
		    	<span id="loginLock" class="glyphicon glyphicon-lock" style="color: #FFF;"></span>
	      	 	<a id="loginModalLink" class="nonMember" href="#loginModalContainer" role="button" class="btn" data-toggle="modal" data-target="#loginModal" style="font-size: small;">로그인</a>&nbsp;&nbsp;
    		  
    		  	<span id="user" class="glyphicon glyphicon-user" style="color: #FFF;"></span>
    		  	<a id="joinBtn" class="nonMember" href="${pageContext.request.contextPath }/member_joinForm.do" style="font-size: small;">회원가입</a><br/><br/>
    		  	</c:when>
    		  	<c:otherwise>
	    		  	<span style="color: #FFF;">${sessionScope.member.nickname }님</span>&nbsp;&nbsp;
	    		  	<span class="glyphicon glyphicon-user" style="color: #FFF;"></span>
	    		  	<c:if test="${sessionScope.member.memberType =='member' }">
	    		    	<a style="color: #FFF;" href="${pageContext.request.contextPath }/member_mypage.do?tabId=myCalTab">마이페이지</a>
		      	    </c:if>
		      	    <c:if test="${sessionScope.member.memberType =='manager' }">
	    		  	    <a style="color: #FFF;" href="${pageContext.request.contextPath }/manager_page.do">행사관리</a>
		      	 	</c:if>
		      	 	<c:if test="${sessionScope.member.memberType =='admin' }">
	    		  	<a style="color: #FFF;" href="${pageContext.request.contextPath }/admin_page.do?pageNo=1">관리페이지</a>
		      	 	</c:if>
		      	 	&nbsp;&nbsp;
	      	 		<span class="glyphicon glyphicon-lock" style="color: #FFF;" ></span>
	      	 		<a style="color: #FFF;" href="${pageContext.request.contextPath }/member_logout.do">로그아웃</a><br/><br/>
	      	 	  </c:otherwise>
    		  </c:choose>	
		      <div id="searchXbutton" style="padding: 0; margin: 0; border: 1px solid #FFF; display: inline-block;">
			      <div class="form-group-seoulnori">
			     	<c:choose>
			     		<c:when test="${sessionScope.keyword!=null&&sessionScope.keyword.trim()!='' }">
			     			<input type="text" class="form-control-seoulnori" name="keyword" id="keyword"  
			     						placeholder="검색어를 입력하세요" style="border: 0;" value="${sessionScope.keyword }">
			     		</c:when>
			     		<c:otherwise>
			     			<input type="text" class="form-control-seoulnori" placeholder="검색어를 입력하세요" name="keyword" id="keyword"
			        			style="border: 0;">
			     		</c:otherwise>
			     	</c:choose>
			        
			      </div>
			      <button id="searchIconBtn" type="submit" class="btn seoulnori-btn-30 btn-seoulnori">
			      	<span id="searchIconSpan" class="glyphicon glyphicon-search"></span>
			      </button>
		      </div>
		      
		      <div style="display: inline-block; border: 1px solid #FFF;">
			      <input type="button" id="detailSearchMenu" class="btn btn-seoulnori" value="상세검색∨" 
			      				style="border-radius: 0; border: 0; padding: 6px 8px 6px 8px; font-size: small; 
			      				background-color: #6dbd96; color: #FFF;"/>
		      </div>
		      
		    </form>
		    
		</div><!-- end collapse navbar-collapse navbar-ex1-collapse -->
		 	 
	</nav>
	
	   <div id="detailSearchBoard" style="width: 269px; z-index: 10000;">
	   	<form method="post" action="${pageContext.request.contextPath }/event_detail_search.do">
	   		
	   		<table style="width: 240px; vertical-align: middle;">
	   			<tr>
	   				<td style="width: 70px; text-align: right; padding: 8px 15px 0 0;">
	   					<label for="detailKeyword">키워드</label>
	   				</td>
	   				<td style="padding: 5px 0 5px 0;">
	   					<input type="text" name="detailKeyword" id="detailKeyword" class="form-control" value="">
	   				</td>
	   			</tr>
	   			<tr>
	   				<td style="text-align: right; padding: 8px 15px 0 0;">
	   					<label for="selectPlace">위치</label>
	   				</td>
	   				<td style="padding: 5px 0 5px 0;">
				         <select  id="sido" name="sido" class="form-control" >
				         		<option class="sido"  value="">선택없음</option>	
				         		<optgroup label="시.도">		         
						         	<option id="sou" value="sou" >서울시</option>
						         	<option id="inc" value="inc">인천시</option>
						         	<option id="kyo" value="kyo">경기도</option>	
					         	</optgroup>					         	
				         </select>
	   				
				         <select  name="selectPlace1" id="ssi" class="form-control" style="display: none;">
				         	<option value="" class="non">선택없음</option>
				         <optgroup label="서울시">
					         	<option value="S1" >강남구</option>
					         	<option value="S2">강동구</option>
					         	<option value="S3">강북구</option>
					         	<option value="S4">강서구</option>
					         	<option value="S5">관악구</option>
					         	<option value="S6">광진구</option>
					         	<option value="S7">구로구</option>
					         	<option value="S8">금천구</option>
					         	<option value="S9">노원구</option>
					         	<option value="S10">도봉구</option>
					         	<option value="S11">동대문구</option>
					         	<option value="S12">동작구</option>
					         	<option value="S13">마포구</option>
					         	<option value="S14">서대문구</option>
					         	<option value="S15">서초구</option>
					         	<option value="S16">성동구</option>
					         	<option value="S17">성북구</option>
					         	<option value="S18">송파구</option>
					         	<option value="S19">양천구</option>
					         	<option value="S20">영등포구</option>
					         	<option value="S21">용산구</option>
					         	<option value="S22">은평구</option>
					         	<option value="S23">종로구</option>
					         	<option value="S24">중구</option>
					         	<option value="S25">중랑구</option>
				         	</optgroup>
				         </select>
				         <select  name="selectPlace2" id="isi" class="form-control" style="display: none;">
				         	<option value="" class="non">선택없음</option>
				         <optgroup label="인천시">
				         		<option value="I1" >강화군</option>
					         	<option value="I2">계양구</option>
					         	<option value="I3">남구</option>
					         	<option value="I4">남동구</option>
					         	<option value="I5">동구</option>
					         	<option value="I6">부평구</option>
					         	<option value="I7">서구</option>
					         	<option value="I8">연수구</option>
					         	<option value="I9">용진군</option>
					         	<option value="I10">중구</option>
				         	</optgroup>
			         		
				         </select>
				         <select  name="selectPlace3" id="kdo" class="form-control" style="display: none;">
				         	<option value="" class="non">선택없음</option>
				        <optgroup label="경기도">
				         		<option value="K1">가평군</option>
					         	<option value="K2">고양시</option>
					         	<option value="K3">과천시</option>
					         	<option value="K4">광명시</option>
					         	<option value="K5">광주시</option>
					         	<option value="K6">구리시</option>
					         	<option value="K7">군포시</option>
					         	<option value="K8">김포시</option>
					         	<option value="K9">남양주시</option>
					         	<option value="K10">동두천시</option>
					         	<option value="K11">부천시</option>
					         	<option value="K12">성남시</option>
					         	<option value="K13">수원시</option>
					         	<option value="K14">시흥시</option>
					         	<option value="K15">안산시</option>
					         	<option value="K16">안성시</option>
					         	<option value="K17">안양시</option>
					         	<option value="K18">양주시</option>
					         	<option value="K19">양평군</option>
					         	<option value="K20">여주시</option>
					         	<option value="K21">연천군</option>
					         	<option value="K22">오산시</option>
					         	<option value="K23">용인시</option>
					         	<option value="K24">의왕시</option>
					         	<option value="K25">의정부시</option>
					         	<option value="K26">이천시</option>
					         	<option value="K27">파주시</option>
					         	<option value="K28">평택시</option>
					         	<option value="K29">포천시</option>
					         	<option value="K30">하남시</option>
					         	<option value="K31">화성시</option>
				         	</optgroup>
				         </select>
	   				</td>
	   			</tr>
	   			<tr>
	   				<td style="text-align: right; padding: 10px 15px 0 0; vertical-align: top;">
	   					<b>카테고리</b>
	   				</td>
	   				<td style="padding: 5px 0 5px 0;">
	   						<input type="radio" name="categoryCheck" id="festival" value="festival">
					        <label for="festival">축제</label>&nbsp;
					        <input type="radio" name="categoryCheck" id="performance" value="performance">
					        <label for="performance">공연</label>&nbsp;
					        <input type="radio" name="categoryCheck" id="exhibition" value="exhibition">
					        <label for="exhibition">전시</label><br/>
					        <input type="radio" name="categoryCheck" id="classic" value="classic">
					        <label for="classic">클래식</label>&nbsp;
					        <input type="radio" name="categoryCheck" id="ect" value="ect">
					        <label for="ect">기타</label>
	   				</td>
	   			</tr>
	   			<tr>
	   				<td style="text-align: right; padding: 8px 15px 0 0;">
	   					<label for="datepicker">날짜</label>
	   				</td>
	   				<td style="padding: 5px 0 5px 0;">
	   					<input type="text" id="datepicker" name="datepicker" class="form-control">
	   				</td>
	   			</tr>
	   			<tr>
	   				<td colspan="2" style="text-align: center; padding: 6px 0">
	   					<button type="submit" class="btn btn-default" style="background-color: #FFF;">검색</button>
	   				</td>
	   			</tr>
	   		</table>
	   		
		</form>	
   </div>

	
<!-- Modal -->
	<div class="modal-nori fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-nori-dialog">
	    <div class="modal-nori-content">
	      <div class="modal-nori-header">
	        <button type="button" class="close-nori" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <span class="modal-nori-title" id="loginModalLabel" contenteditable="false" style="font-size: 1.5em;">LOGIN</span>
	       
	      </div>
	   
	<!--    <form id="loginForm" method="post"> -->
	   
	      <div class="modal-nori-body" contenteditable="false">
	      	<p id="errorMsg" style="color: red; color: crimson; text-align: center; margin: 13px 0 5px 0;">&nbsp; </p>
	      	<label for="password" >Email address</label><br/>
	      	<div class="input-group-nori">
	      		
			  	<span class="input-group-nori-addon"><span class="ui-icon ui-icon-person"></span></span>
			  	<input type="email" class="form-control-login-nori" id="email" placeholder="email@xxx.xxx">
			</div>
			<label for="password" >Password</label><br/>
			<div class="input-group-nori">
				
			  	<span class="input-group-nori-addon"><span class="ui-icon ui-icon-locked"></span></span>
			  	<input type="password" class="form-control-login-nori" id="password"  placeholder="*********">
			</div>

			<!-- 	 <label for="email">Email address</label>
				 <input type="email" class="form-control" id="email" name="userId" /> -->
			
			<!-- <div class="form-group">
				 <label for="password" >Password</label>
				 <input type="password" class="form-control" id="password" name="password" /> -->
			
			</div>
	      <div class="modal-nori-footer" style="text-align: center">
	         <button type="button" style="width: 100px;" class="btn-primary" id="modalLoginBtn" contenteditable="false">로그인</button>&nbsp;&nbsp;&nbsp;
	         <a href="${pageContext.request.contextPath }/member_joinForm.do">
	         <button type="button" style="width: 100px;" class="btn-primary" id="modalJoinBtn" contenteditable="false">회원가입</button>
	      	 </a>
	       <!--   <button type="button" class="btn btn-default" id="resetBtn" data-dismiss="modal" contenteditable="false">취소</button> -->
	      </div>
	      
	      <input type="hidden" id="returnUrl" name="returnUrl" value=""/>
	      <input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}"/>
	      
	<!--       </form> -->
	    
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->


</body>
</html>