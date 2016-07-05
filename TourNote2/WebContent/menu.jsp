<%@ page import="com.scsa.wapl.entity.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htsml PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/semantic.css" />
<link rel="stylesheet" type="text/css" href="./css/menu.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#searchRecord").click(function() {
			$("#searchForm").submit();
		});
	});
	
</script>
</head>

<body>

	<div class="ui tiered menu">
	  <div class="menu" style="background-color: #29527A; position: fixed; width: 100%; height: 65px; top: 0; z-index: 1000000000; ">
	  
	    <a class="item" href="${pageContext.request.contextPath }/">
	      <i class="blue home icon"></i><span style="font-size: 18px; color: white; ">MAIN</span>
	    </a>
	    
	    <div class="right menu">
	      <div class="item">
	        <div class="ui icon input">
	          <form id="searchForm" method="post" action="${pageContext.request.contextPath}/findTravelRecordListByKeyword.do">
	          <input type="text" name="keyword" id="keyword" placeholder="Search">
	            <a href="#"><i class="large blue search icon" id="searchRecord" width="20px" height="20px" style="margin-right: 50px;"></i></a>
	            <!-- <img src="./images/menu/Btn_search.png" id="searchRecord" width="20px" height="20px" style="margin-right: 10px;"> -->
	          </form>
	        </div>
	      </div>
	       
	     <c:choose>
				<c:when test="${not empty sessionScope.member }">
					<c:if test="${sessionScope.member.memberId == 'admin' }">
					    <a class="item" href="${pageContext.request.contextPath }/goManagerPage.do">
					   	  <i class="blue setting icon" style="margin-left: 50px;"></i><span style="font-size: 15px; color: white; ">Admin</span>
					   	</a>
	   				</c:if>
	 				<c:if test="${sessionScope.member.memberId != 'admin' }">
	   					<a class="item" href="${pageContext.request.contextPath }/goMyPage.do">	   					 
	   					  <i class="blue setting icon" style="margin-left: 50px;"></i><span style="font-size: 15px; color: white; ">MyPage</span>
	   					</a>
	   				</c:if>				
		   				<a class="item" >
		   					<span style="font-size: 15px; color: white; margin-left: 30px; "><b>${sessionScope.member.memberName} 님</b></span>
		   				</a>
		   				<a class="item" href="${pageContext.request.contextPath }/logout.do">
		   					<!-- <i class="blue remove circle icon"></i>  -->
		   					<span style="font-size: 15px; color: white; ">Logout</span>
		    				<i class="blue off icon"></i>
		    			</a>
	    		</c:when>
				<c:otherwise>
					<a class="item" href="${pageContext.request.contextPath }/loginForm.do" >
					  <i class="blue user icon" style="margin-left: 50px; "></i><span style="font-size: 15px; color: white; margin-right: 10px;">Login</span>
					</a>
					<a class="item" href="join.jsp">
					  <i class="blue users icon"></i><span style="font-size: 15px; color: white; padding-right: 5px; padding-top: 2px; padding-bottom: 7px;">Join</span>		  
					</a>	
	    		</c:otherwise>
		</c:choose>	
	    </div>
	  </div>
	</div>
</body>
</html>