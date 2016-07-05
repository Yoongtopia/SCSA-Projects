<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>

<style type="text/css">
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

	#detail {
		text-align:center;
    	font-family: 'Nanum Gothic';
		color:black;
		margin-bottom: 100px;
		margin-left:240px;
		background-color: white;
	}
	
	#cont {
		height:500px;
		text-align:left;
		vertical-align: top;
		padding:20px
	}
	
	
	#detail td{
		border-bottom: 1px solid silver;
	}
	
	#write{
		width:400px;
	}
	
	.count{
		width:80px;
	}
	
	a{
		color:black;
	}
	
	#th1, #th2, #th3{
  	background-color: rgb(119, 158, 203); 
  	color: rgba(255, 255, 255, 0.9);
  	font-weight: bold;
  	width: 70px; 
  	height: 40px;
  	font-size: 15px;  
	}
	
	#th4{
    background-color: rgb(119, 158, 203);  
  	color: rgba(255, 255, 255, 0.9);
  	font-weight: bold;
  	width: 80px; 
  	height: 40px;
  	font-size: 15px;  
	}
	
</style>
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
		<div class="container ">
			<div class="row">
				<div class="span12 centered">
				<br><br>
					<h2 class="wow bounceInLeft animated" style="visibility: visible;font-family: 'Nanum Gothic';">
					${param.boardCategory } 조회</h2>
				</div>
			</div>
		</div>

<table id="detail"  class="ui inverted table segment" style="margin: 0 auto;  width:950px; margin-top:-50px; font-family: 'Nanum Gothic';" >
	<tr>
		<td id="th1">번호</td><td class="count">${board.boardNum }</td>
		<td id="th2">제목</td><td id="write">${board.boardTitle }</td>
		<td id="th3">작성자</td><td class="count">${board.boardWriter }</td>
		<td id="th4">작성날짜</td><td class="count">${board.boardDate }</td>
	</tr>
	<tr>
		<td colspan="8" id="cont">${board.boardCont }</td>
	</tr>
	<tr>
		<td colspan="8">
		<c:choose>
		<c:when test="${board.boardCategory=='notice'}">
			<c:if test="${board.boardWriter==sessionScope.member.memberId}">
				<a href="${pageContext.request.contextPath }/notice_update1.do?boardNum=${board.boardNum }">
				<input type="button" value="수정" class="ui button"/></a>
				<a href="${pageContext.request.contextPath }/notice_delete.do?boardNum=${board.boardNum }">
				<input type="button" value="삭제" class="ui button"/></a>
			</c:if>
				<a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice">
				<input type="button" value="목록 보기" class="ui button"/></a>
		</c:when>
		<c:when test="${board.boardCategory=='qna'}">
			<c:if test="${sessionScope.member.memberId=='admin'}">
				<a href="${pageContext.request.contextPath }/board_insert_answer.do?boardNum=${board.boardNum }&boardStatus=${board.boardStatus }">
				<input type="button" value="답글 작성" class="ui button"/></a>
			</c:if>
			<c:if test="${board.boardWriter==sessionScope.member.memberId}">
				<a href="${pageContext.request.contextPath }/board_update1.do?boardNum=${board.boardNum }">
				<input type="button" value="수정" class="ui button"/></a>
				<a href="${pageContext.request.contextPath }/board_delete.do?boardNum=${board.boardNum }">
				<input type="button" value="삭제" class="ui button"/></a>
			</c:if>
				<a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna">
				<input type="button" value="목록 보기" class="ui button"/></a>
		</c:when>
		</c:choose>
		</td>
	</tr>
</table>

</body>
</html>