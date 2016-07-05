<%@page import="com.scsa.wapl.entity.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- 부트스트랩 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    
  </head>
  <body>
    <div class="navbar navbar-inverse navbar-fixed-top" style="background-color: #244B9A">
      <div>
       
       <div class="navbar-header">
       
       <div >
          <a class="navbar-brand" href="./app_myPage.jsp"><img src="./images/appMenu/app_menu_my.png" height="35px"></a>
       </div>
       <div >
          <a class="navbar-brand" href="${pageContext.request.contextPath}/main2.do"><img src="./images/appMenu/app_menu_travBoard.png" height="35px"></a>
       </div>
       <div>
          <a class="navbar-brand menu3" href="./app_index.jsp"><img id="logo" src="images/mainPage/logo3.png" height="37px"></a>
       </div>      
       
      <c:choose>
		<c:when test="${not empty sessionScope.member }">
			<c:if test="${sessionScope.member.memberId == 'admin' }">
       
       <div>
          <a class="navbar-brand menu4" href="${pageContext.request.contextPath }/logout2.do">
          <img id="logoutBtn" src="./images/appMenu/app_menu_logout.png" height="35px"/></a>
       </div>  
       
      </c:if>
	  <c:if test="${sessionScope.member.memberId != 'admin' }">
        <div>
          <a class="navbar-brand menu4" href="${pageContext.request.contextPath }/logout2.do">
          <img id="logoutBtn" src="./images/appMenu/app_menu_logout.png" height="35px"/></a>
       </div>  
       	</c:if>
      	</c:when>
		<c:otherwise>
       <div>
          <a class="navbar-brand menu5" href="app_join.jsp"><img id="joinBtn" src="./images/appMenu/app_menu_join.png" height="35px"/></a>
       </div>
       <div>
          <a class="navbar-brand menu6" href="${pageContext.request.contextPath }/loginForm2.do">
          <img id="loginBtn" src="./images/appMenu/app_menu_login.png" height="35px"/></a>
       </div> 
       
       		</c:otherwise>
		</c:choose>	
               	
        </div>
      </div>
    </div>
  </body>
</html>