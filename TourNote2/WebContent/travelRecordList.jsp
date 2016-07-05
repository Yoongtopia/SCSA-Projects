<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/item.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/semantic.css">

<style>
	#link{
		text-align: center;
	}
	.item{
		height:250x;
	}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 $(function(){	
	 $("#reOrder").click(function(){
		 location.replace("${pageContext.request.contextPath}/findTravelRecordList.do?continentalName="+$('#continentalName').val()+"&lineup="+$('#lineup').val());
	 });
 });
</script>
<body class="container-white">
	 <nav class="sidenav" style="top: 60%; position: fixed;">   
		 <a href="${pageContext.request.contextPath }#top" class="n1"><img src="./images/mainPage/sideButton1.png" width="40px"/><span>TOP</span></a>
		 <c:choose>
			<c:when test="${sessionScope.member!=null && sessionScope.recordNum!=null }">		 
		 		<a href="${pageContext.request.contextPath }/upload_detail.do#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:when>
   	 		<c:otherwise>
		 		 <a href="${pageContext.request.contextPath }#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:otherwise>
		</c:choose> 
		 <a href="${pageContext.request.contextPath }#2" class="n1"><img src="./images/mainPage/sideButton3.png" width="40px"/><span>TRAVEL BOARD</span></a> 
		 <a href="${pageContext.request.contextPath }#3" class="n1"><img src="./images/mainPage/sideButton4.png" width="40px"/><span>MY TRAVEL</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice" class="n1"><img src="./images/mainPage/sideButton5.png" width="40px"/><span>NOTICE</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna" class="n1"><img src="./images/mainPage/sideButton6.png" width="40px"/><span>Q&A</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_faq.do?boardCategory=faq" class="n1"><img src="./images/mainPage/sideButton7.png" width="40px"/><span>FAQ</span></a> 
   	 </nav>

		<div class="container">
			<div class="row" >
				<div class="span12 centered" style="margin-top: 30px" >
					<h2 class="wow bounceInLeft animated" style="visibility: visible; color:white;">
					TRAVEL BOARD</h2>
					<p class="subheader wow bounceInRight animated"
						style="visibility: visible;">
						UPLOAD YOUR TRAVEL LOG</p>
				</div>
			</div>
		</div>

<div class="ui items" style="margin-left:200px; margin-top: -30px; ">
	<c:forEach items="${travelRecordList}" var="list" begin="0" end="5">
	<c:if test="${list.openPublic!='false'}"> 
  <div class="item">
    <div class="image">
      <a href="${pageContext.request.contextPath}/selectRecord.do?recordNum=${list.recordNum }">
      <img src="${pageContext.request.contextPath}/image/${list.recordPhoto}"></a>
    </div>
    <div class="content">
      <div class="name">${list.recordTitle} </div>
      <div class="extra" style="color:black">
          ${list.recommend } 추천
      </div>
    </div>
  </div>
  </c:if>
  </c:forEach>
</div>
<div id="link">
<a href="${pageContext.request.contextPath}/main4.do">
<input type="button" value="더보기" class="ui button"></a>
</div>
</body>