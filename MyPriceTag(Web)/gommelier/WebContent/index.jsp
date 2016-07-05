<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Price Tag</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<link rel="shortcut icon" href="./images/background/title_logo.png">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.ratate.js"></script>
<style type="text/css">
li,#search_box { 
	font-family: 맑은 고딕;
	font-size: 12px;
}

li a {
	text-decoration: none;
	cursor: pointer;
}

.navbar-fixed-top {
	position: absolute;
	margin: 0;
	border: 0;
}

.navbar-brand {
	padding: 0px;
	margin-right: 205px;
}

.container-fluid {
	padding-left: 100px;
	padding-right: 50px;
	padding-top: 3px;
}

.navbar-default .navbar-brand {
	color: gray;
}

.navbar-default .navbar-nav>li>a {
	color: gray;
	font-weight: bold;
}

.navbar-default .navbar-brand:hover {
	color: #ff6600;
}

.navbar-default .navbar-nav>li>a:hover {
	color: #ff6600;
}

/* #super_btn {
	position: absolute;
	left: -1000px;
} */

#super_btn{
	width: 50px;
}

.cog {
	background-color: white;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 4px;
	position: absolute;
	right: -26px;
	top: -1px;
	padding: 5px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
}

.cog img {
	height: 20px;
	width: 20px;
}

.modal-content {
	
}

.modal-dialog {
	margin: 300px auto;
}

#loginButton {
	margin: 5px 0 0 0;
}

.panel panel-default {
	height: 700px;
}

.default-height {
	position: relative;
	top: 60px;
	margin: auto;
	width: 100%;
}

.table-responsive {
	width: 500px;
	font-family: 맑은 고딕;
	font-size: 12px;
}

.input-sm {
	size: 300px;
}

/* #login-form1,#login-form2 {
	position: fixed;
	right: 10%;
	top: 10%;
	z-index: 1000;
	background-color: white;
	border-radius: 10px;
	width: 400px;
	border: 2px solid #ff6600;
	display: none;
} */

#login-form {
	position: fixed;
	right: 10%;
	top: 10%;
	z-index: 1000;
	background-color: white;
	border-radius: 10px;
	width: 400px;
	border: 2px solid #ff6600;
	display: none;
}

.form-group {
	vertical-align: middle;
	margin: 0px;
}

.gangjo {
	color: #ff6600;
	font-weight: bold;
}

ul.side-menu {
	z-index: 1000;
	position: fixed;
	left: -140px;
	padding: 5px 0;
	padding-top:15px;
	top: 80px;
	display: block;
	float: left;
	list-style: none;
	font-size: 14px;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 4px;
	width: 150px;
	height: 200px;
}

ul.side-menu li a {
	display: block;
	padding: 3px 30px;
	clear: both;
	font-weight: bold;
	line-height: 1.8;
	color: #333;
	text-decoration: none;
	font-size: 13px;
}

ul.side-menu>li>a:hover {
	background-color: white;
	color: #FF4500;
	text-decoration: none;
}

.side-menu .divider {
	height: 1px;
	margin: 9px 0;
	overflow: hidden;
	background-color: #e5e5e5;
}

.thirdLine{
	
	background-color:#003366;
	width: 100%;
	height: 90px;
	bottom: 0;
	position: relative;
	}
	
#left{
	float:left;
	color: white;
	line-height: 90px;
	padding-left: 20px;
	font-size: 12px;
}

#right{
	float:right;
	color:white;
	line-height: 90px;
	padding-right:20px;
	font-size: 12px;
}
footer{
	clear: both;
	position: relative;
	z-index: 10;
	height: auto;
	bottom: 0;	
}
#loginBtn{
	background-color: #FF6600;
	border:1px solid #FF6600;
}
#loginBtn:HOVER {
	background-color: #EE9A00;
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
<div id="div_to_show" align="center" style="line-height:2.2; width: 130px; height: 30px; background-color: white; opacity:0.8; color: black; font-size: 13px; font-weight: bold; border: 1px solid black;"></div>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid" style="background-color: #003366;">
    <div class="navbar-header">
      <a class="navbar-brand" href="./index.jsp"><img width="100px" height="50px" src="./images/background/logo3.png"></a>
    </div>

    <div class="collapse navbar-collapse">
      	<form class="navbar-form navbar-right" role="search" action="product_search.do" method="post">
        	<div class="form-group">
         		<input id="search_box" type="text" class="form-control input-sm" name="text" placeholder="search" value="${param.text}">
        	</div>
        	<button id="super_btn" type="submit" class="btn btn-default btn-sm"><i class="orange large search basic icon"></i></button>
      	</form>
      	<ul class="nav navbar-nav">
	        <li><a href="./index.jsp?back=true"><i class="large globe icon"></i>MAP</a></li>
	        <li><a id="go_match"  href="./match.do"><i class="large community basic icon"></i>MATCH</a></li>
	        <li><a id="go_regist"  href="./move_regist_product.do"><i class="large pencil icon"></i>REGIST</a></li>
	        <li><a href="./notice_list.do?pageNo=1"><i class="large bullhorn icon"></i>NOTICE</a></li>     
		    <c:choose>
		    	<c:when test="${user eq null}">
		    		<li><a id="callLoginModal" ><i class="large id basic icon"></i>LOGIN</a></li>
		        	<li><a id="join"><i class="add user basic icon"></i>JOIN</a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li style="font-weight: bold;"><a style="color: white;">${user.user_name }님</a></li>
		    		<li><a href="${pageContext.request.contextPath}/logout.do" id="logout"><i class="large off icon"></i>LOGOUT</a></li>
		    	</c:otherwise>
		    </c:choose>         
      	</ul>
    </div>
  </div>
</nav>

<c:if test="${user ne null }">
	<ul class="side-menu">
		<li class="cog">
			<img src="images/Wheel.png">
		</li>
		<li><a href="my_product_list.do">마이샵</a></li>
	    <li><a href="move_user_update_form.do">회원정보수정</a></li>
	    <li><a href="msg_list_by_receiver_id.do?pageNo=1">쪽지함</a></li>
	    <li class="divider"></li>
	    <li><a href="push_list_by_id.do">푸시리스트</a></li>
	    <li><a href="wish_list_by_id.do">위시리스트</a></li>
	</ul>
</c:if>

<div class="default-height" align="center">
	<div class="panel-body">
		<c:choose>
			<c:when test="${page eq null }">
				<c:import url="main.jsp"></c:import>
			</c:when>
	
			<c:otherwise>
				<c:import url="${page}"></c:import>
			</c:otherwise>
		</c:choose>
	</div>
</div>


<!-- footer -->
<!-- <footer >
	<span id="left">
	2014 @ COPYRIGHT. ALL RIGHT RESERVED&nbsp;&nbsp; M Y P R I C E T A G 
	</span>
	<span id="right">
	CONTACT US : <span>www.mypricetag.com, 02-3429-5114</span>
	</span>
</footer> -->
	
<!-- 로그인 버튼 눌렀을 때 로그인 입력 폼 -->
<div id="login-form" class="table-responsive" align="center">
	<h3 align="left">&nbsp;&nbsp;&nbsp;Login</h3>
	<h6 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gangjo">MyPriceTag에 오신것을 환영합니다.</span></h6>
	<br/>
	<form method="post" action="${pageContext.request.contextPath}/login.do" class="login_submit">
		<table class="table table-condensed" style="width: 300px;">
			<tr>
				<td width="100px"><input type="text" name="user_id" id="userId" class="form-control input-sm" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="password" name="user_password" id="password" class="form-control input-sm" placeholder="비밀번호"></td>
			</tr>
				
			<tr >
				<td id="loginFail" style="display: none;"></td>
			</tr>
			<tr>
				<td align="center">
				<br/>
					<input type="submit" id="loginBtn" class="btn btn-warning btn-sm " value="로그인"/>
					<input type="button" id="closeBtn1" class="btn btn-default btn-sm" value="나가기"/>					
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- 매칭, 상품등록 버튼 눌렀을 때 로그인 입력 폼 -->
<%-- <div id="login-form2" class="table-responsive" align="center">
	<h3 align="left">&nbsp;&nbsp;&nbsp;Login</h3>
	<h6 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gangjo">Login하시면 더 많은 서비스를 이용하실 수 있습니다.</span></h6>
	<br/>
	<form method="post" action="${pageContext.request.contextPath}/login.do" class="login_submit">
		<table class="table table-condensed" style="width: 300px;">
			<tr>
				<td width="100px"><input type="text" name="user_id" id="userId" class="form-control input-sm" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="password" name="user_password" id="password" class="form-control input-sm" placeholder="비밀번호"></td>
			</tr>
		
			<tr >
				<td id="loginFail" style="display: none;"></td>
			</tr>
				<tr>
				<td align="center">
				<br/>
					<input type="submit" id="loginBtn" class="btn btn-warning btn-sm " value="로그인"/>
					<input type="button" id="closeBtn2" class="btn btn-default btn-sm" value="나가기"/>					
				</td>
			</tr>
		</table>
	</form>
</div> --%>



<form id="search" style="display: none;" action="product_search_click.do" method="post">
    <input id="hidden_text" type="text" name="text" >
    <input id="hidden_square_num" type="text" name="square_num" value="0">
</form>
	<script type="text/javascript">
	$(function(){
		if ('${param.back}') {
			$("#fullPage-nav a").each(function(index, item) {
				if(index == 1){
					$(item).trigger("click");
				}
			});
		}

		/* 메시지 체크 */
		var user = "${user}";
		if (user != '') {
			interval = setInterval(chkMsg,1000);
			
			/* 메뉴 돌리기 */
			var angle = 0;
			setInterval(function(){
			angle+=3;
			$(".cog img").rotate(angle);
			},20);
		}		
		
		function chkMsg() {
			$.getJSON("msg_checking.do", function(data) {
				if(data.status){
					window.open("msg_detail_by_receiver.do?msg_num=" + data.msg.msg_num, "_blank", "height=300,width=400");
				}
			});
		}
			
		/* 사이드 메뉴 */
		var timeout;
		var chk = 'possible';
 		$(".side-menu").hover(function(){
			clearTimeout(timeout);
			if(chk == 'possible'){
				$(".side-menu").animate({"left":"+=130px"}, "slow");	
				chk = 'no';
			}
		
		}, function(){
			timeout = setTimeout(function() {
				$(".side-menu").animate({"left":"-=130px"}, "slow");
				chk = 'possible';
			}, 1000);
		});
		
		$("#closeBtn1").on("click",function(){
			$("#login-form").attr('style','display: none');
		});
		
		/* $("#closeBtn2").on("click",function(){
			$("#login-form2").attr('style','display: none');
		}); */
		
		$("#logout").click(function(){
			alert("로그아웃 되었습니다.");
			window.location.reload(true);

		});
		
		/* 로긴안하고 메뉴 누를때 */
		$("#go_match, #go_regist").click(function(event) {
			event.preventDefault();
			if ('${user}' == "") {
				$("#login-form").fadeToggle();
			}else{
				$(location).attr('href',$(this).attr("href"));
			}
		});
		
		/* 로깅 */
		$("#callLoginModal").on("click",function(){
			$("#login-form").fadeToggle();
		});

		$("#loginBtn").click(function(e){
			e.preventDefault();
			$.post("${pageContext.request.contextPath}/login.do",
				{"user_id":$("#userId").val(),
				"user_password":$("#password").val()},
				function(jsonObj){
					if(jsonObj.status){
						window.location.reload(true);
					}else{
						$("#login-form").fadeIn();
						$("#userId").val("");
						$("#password").val("");
						$("#loginFail").text("아이디 또는 비밀번호가 잘못 입력됐습니다.").attr("font-size", "12px").attr("font-family", "맑은 고딕").css("display","inline-block");
					}
			});
		}); 
 	
 		
		
		$("#join").on("click", function(){
			location.href="${pageContext.request.contextPath}/univ_list.do";
		});

		
		/* 툴팁관련 실행 */
		$("[data-toggle=tooltip]").tooltip();
		
	});
</script>
</body>
</html>