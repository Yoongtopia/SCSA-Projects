<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<link rel="stylesheet" type="text/css" href="keepFoot/style.css" />

<link rel="shortcut icon" href="./images/background/title_logo.png">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.ratate.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body {
	margin:0;
	padding:0;
	height:100%;
}
#wrapper {
	min-height:100%;
	position:relative;
}
#header {
	background:#ededed;
	padding:10px;
}
#content {
	padding-bottom:100px;
}
#footer {
	background:#ffab62;
	width:100%;
	height:50px;
	position:absolute;
	bottom:0;
	left:0;
}
/* 여기 위로 절대 손대지 마시오 */
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

#login-form1,#login-form2 {
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
	top: 80px;
	display: block;
	float: left;
	list-style: none;
	font-size: 14px;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 4px;
	width: 150px;
}

ul.side-menu li a {
	display: block;
	padding: 3px 30px;
	clear: both;
	font-weight: 400;
	line-height: 1.42;
	color: #333;
	text-decoration: none;
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
</style>
</head>
<body>

	<div id="wrapper">

		<div id="header">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			  <div class="container-fluid" style="background-color: #003366;">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="./index.jsp" data-toggle="tooltip" data-placement="right" title="Tooltip on right"><img width="100px" height="50px" src="./images/background/logo3.png"></a>
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
				        <li><a id="go_match" href="./match.do"><i class="large community basic icon"></i>MATCH</a></li>
				        <li><a id="go_regist" href="./move_regist_product.do"><i class="large pencil icon"></i>REGIST</a></li>
				        <li><a href="./notice_list.do"><i class="large bullhorn icon"></i>NOTICE</a></li>     
					    <c:choose>
					    	<c:when test="${user eq null}">
					    		<li><a id="callLoginModal"><i class="large id basic icon"></i>LOGIN</a></li>
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
		</div>

		<div id="content">
			<c:if test="${user ne null }">
				<ul class="side-menu">
					<li class="cog">
						<img src="images/Wheel.png">
					</li>
					<li><a href="my_product_list.do">마이페이지</a></li>
				    <li><a href="move_user_update_form.do">회원정보수정</a></li>
				    <li><a href="msg_list_by_receiver_id.do">쪽지함</a></li>
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
		</div>


		<div id="footer">
			
		</div>


	</div>
	<!-- #wrapper -->

</body>
</html>