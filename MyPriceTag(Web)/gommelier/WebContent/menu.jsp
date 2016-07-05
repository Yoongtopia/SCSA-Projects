<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">
		.extraButton{
			margin-top: 8px;
		}
		.modal-body{
			position: relative;
			height: 300px;
		}
		.loginBox{
			margin-top: 80px;
		}
		#loginInput{
			position: absolute;
			left: 180px;
			width: 200px;
		}
		#loginButton{
			position: absolute;
			right: 50px;
			width: 200px;
		}
		.inputBox{
			display: block;
		}
		#loginBtn{
			height: 72px;
		}
	</style>
</head>
<body>
<!-- NAVBAR(MENU) -->
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li><a href="./index.jsp"><b>HOME</b></a></li>
        <li><a href="./match.do"><b>MATCH</b></a></li>
        <li><a href="./move_regist_product.do"><b>REGIST</b></a></li>
        <li><a href="./notice_list.do"><b>NOTICE</b></a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      	<li>
	      <form class="navbar-form navbar-left" role="search"
	      		method="post"
				action="${pageContext.request.contextPath}/product_list_by_tag.do">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search" id="menuSearchInput" name="tag">
	        </div>
	        <button type="submit" class="btn btn-default" id="menuSearchBtn">검색</button>
	      </form>
	    </li>  
	     
		<c:choose>
			<c:when test="${not empty user}">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.user_name }님
	          <b class="caret"></b></a>
	          <ul class="dropdown-menu">
	            <li><a href="/my_product_list.do">마이페이지</a></li>
	            <li><a href="./move_user_update_form.do">회원정보수정</a></li>
	            <li><a href="./msg_list_by_receiver_id.do">쪽지함</a></li>
	            <li class="divider"></li>
	            <li><a href="./push_list_by_id.do">푸시리스트</a></li>
	            <li><a href="./wish_list_by_id.do">위시리스트</a></li>
	          </ul>
	        </li>
	        
	        <li class="extraButton">
	        	<button class="btn btn-default" id="logout">LOGOUT</button>	
	        </li>
	        
	        </c:when>
	        <c:otherwise>

	        <li class="extraButton">
	            <button class="btn btn-default" id="callLoginModal">LOGIN</button>	
	        </li>
	        
	        <li class="extraButton">
	        	<button class="btn btn-default" id="join">JOIN</button>	
	        </li>
	        </c:otherwise>
        </c:choose>
        
      </ul>
  </div><!-- /.container-fluid -->
</nav>

<!-- login Modal Page -->
<div class="modal" id="loginModal">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title">LOGIN</h4>
        </div>
        
       <%--  <form method="post" action="${pageContext.request.contextPath}/login.do"> --%>
        <div class="modal-body">
           <div class="loginBox">
			<div id="loginInput">
				<input type="text" name="user_id" id="userId" class="inputBox" placeholder="아이디"><br/>
				<input type="password" name="user_password" id="password" class="inputBox" placeholder="비밀번호">
			</div>
			<div id="loginFail" style="display: none;">
			</div>
			<div id="loginButton">
				<button type="button" id="loginBtn" class="btn btn-default">LOGIN</button>
			</div>	
		   </div>	
        </div>
       <!--  </form> -->
      </div>
    </div>
</div>

<script type="text/javascript">
	$(function(){
		$("#callLoginModal").on("click", function(){
			$("#loginModal").modal({show:true});
		});
		
		$("#logout").click(function(){
			location.href="${pageContext.request.contextPath}/logout.do";
			alert("로그아웃 되었습니다.");
		});
		
		$("#join").on("click", function(){
			location.href="${pageContext.request.contextPath}/univ_list.do";
		});
		

		
	});
</script>
</body>
</html>