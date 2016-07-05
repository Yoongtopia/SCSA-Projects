<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<style>
   @font-face {
  font-family: 'Nanum Gothic';
  font-style: normal;
  font-weight: 700;
  src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.eot);
  src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.eot?#iefix) format('embedded-opentype'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.woff2) format('woff2'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.woff) format('woff'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.ttf) format('truetype');
  }
  @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 400;
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.eot);
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.eot?#iefix) format('embedded-opentype'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.woff2) format('woff2'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.woff) format('woff'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.ttf) format('truetype');
  }
  @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 800;
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.eot);
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.eot?#iefix) format('embedded-opentype'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.woff2) format('woff2'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.woff) format('woff'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.ttf) format('truetype');
  }

	#mytravel {
		margin-left:200px;
		width:900px;
		text-align:center;
    	font-family: 'Nanum Gothic';
		color:black;
		margin-bottom: 100px;
		background-color: white;
		
	}
		
	#mytravel td{
		height:30px;
		border-bottom: 1px solid silver;
	}
	
	#title{
	
	}
	a{
		color:black;
	}
	
	th{
		text-align:center;
		background-color: #39ABB9;
		color:white;
		height: 40px;
	}	
</style>

<script src="./js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#goMyPage").click(function(){
			location.replace("${pageContext.request.contextPath}/goMyPage.do");
		});
		
		
	});
</script>
		
<body class="container-mint">
		<div class="container">
			<div class="row">
			<br><br>
				<div class="span12 centered">
					<h2 class="wow bounceInLeft animated" style="visibility: visible;font-family: 'Nanum Gothic';">
					MY TRAVEL</h2>
					<p class="subheader wow bounceInRight animated"
						style="visibility: visible;">
						MANAGE YOUR TRAVEL LOG</p>
				</div>
			</div>
		</div>

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
<table id="mytravel">
	<tr>
		<th width="100">카테고리</th>
		<th>제목</th>
		<th width="100">여행 시작 시간</th>
		<th width="70">조회수</th>
		<th width="70">추천수</th>
		<th width="70">편집</th>
		<th width="70">삭제</th>
	</tr>
	<c:forEach items="${recordList }" var="list">
		<tr>
			<td>				
				<c:forEach items="${list.continentalName }" var="conti" varStatus="status">
					${conti}<c:if test="${not status.last }">,</c:if>
				</c:forEach>
			</td>
			<td id="title"><a href="${pageContext.request.contextPath}/selectRecord.do?recordNum=${list.recordNum}">${list.recordTitle}</a></td>
			<td>${list.recordStartTime}</td>
			<td>${list.recordHit}</td>
			<td>${list.recommend}</td>
			<td id="title"><a href="${pageContext.request.contextPath}/editRecordForm.do?recordNum=${list.recordNum}">편집</a></td>
			<td id="title"><a href="${pageContext.request.contextPath}/deleteRecord.do?recordNum=${list.recordNum}">삭제</a></td>
		</tr>
	</c:forEach>
	

</table>

<div align="center">
<input type="button" id="goMyPage" value="마이페이지" class="ui button"/>
</div>