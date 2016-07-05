<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 답글쓰기</title>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
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
  
  #th1, #th3{
  background-color: rgb(150, 111, 214); 
  color: rgba(255, 255, 255, 0.9);
  font-weight: bold;
  width: 200px; 
  height: 40px;
  font-size: 15px;  
}

#th2{
  background-color: rgb(150, 111, 214); 
  color: rgba(255, 255, 255, 0.9);
  font-weight: bold;
  width: 200px;  
  height: 400px;
  font-size: 15px;
  vertical-align: top;  
}


</style>
</head>
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
					답글 작성</h2>
				</div>
			</div>
		</div>

<form method="post" action="board_insert_answer2.do">

<table  class="ui inverted table segment" style="margin: 0 auto;  width:800px; margin-top:-50px; font-family: 'Nanum Gothic';" >
<tr align="center">
<td align="center" id="th1">제목</td>
<td width="500px"><input type="text" id="boardTitle" name="boardTitle" style="width: 550px;" /></td>
</tr>
<tr align="center">
<td align="center" id="th2">내용</td>
<td id="cont"><textarea id="boardCont" name="boardCont" style="width: 550px; height: 450px;"></textarea></td>
</tr>
<tr align="center">
<td align="center" id="th3">비밀글 여부</td>
<td align="left">
<c:choose>
<c:when test="${param.boardStatus=='f' }">
<input type="radio" name="boardStatus" value="f" checked="checked">&nbsp;&nbsp;&nbsp;공개
<input type="radio" name="boardStatus" value="t">&nbsp;&nbsp;&nbsp;비밀
</c:when>
<c:otherwise>
<input type="radio" name="boardStatus" value="f">&nbsp;&nbsp;&nbsp;공개
<input type="radio" name="boardStatus" value="t" checked="checked">&nbsp;&nbsp;&nbsp;비밀
</c:otherwise>
</c:choose>
</td>
</tr>
<tr><td colspan="2" align="center">
<input type="submit" value="등록" class="ui button"/>
<a href="http://localhost:8080/FinalProject_TourNote2/board_list_category.do?boardCategory=qna">
<input type="button" value="돌아가기" class="ui button"/></a>
<input type="hidden" name="boardCategory" value="qna">
<input type="hidden" name="boardWriter" value="${sessionScope.member.memberId}">
<input type="hidden" name="boardNum" value="${param.boardNum }">
</td></tr>
</table>
</form>
</body>
</html>