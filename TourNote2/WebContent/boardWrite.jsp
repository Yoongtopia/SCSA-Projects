<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
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

#th1{
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
  height: 40px;
  font-size: 15px;
  vertical-align: top;  
}
#th3{
  background-color: rgb(150, 111, 214); 
  color: rgba(255, 255, 255, 0.9);
  font-weight: bold;
  width: 200px;  
  height: 400px;
  font-size: 15px;
  vertical-align: top;  
}
#th4{
  background-color: rgb(150, 111, 214); 
  color: rgba(255, 255, 255, 0.9);
  font-weight: bold;
  width: 200px;  
  font-size: 15px;
  height: 40px;
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
					QnA WRITE</h2>
				</div>
			</div>
		</div>
 

<form method="post" action="board_insert.do">

<table class="ui inverted table segment" style="margin: 0 auto;  width:800px; margin-top:-50px; font-family: 'Nanum Gothic';"> 
<tr align="center">
<td id="th1">제목</td>
<td width="500px">
<input type="text" id="boardTitle" name="boardTitle"  style="width: 550px;"/></td>
</tr>
<c:choose>
<c:when test="${sessionScope.member.memberId=='admin' }">
<tr align="center">
	<td id="th2">카테고리</td>
	<td align="left">&nbsp;&nbsp;
		<select name="boardCategory">
			<option value="faq">FAQ</option>
			<option value="qna">QNA</option>
		</select>
	</td>
</tr>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
<tr align="center">
<td id="th3">내용</td>
<td><textarea id="boardCont" name="boardCont" style="width: 550px; height: 450px;"></textarea></td>
</tr>
<tr align="center">
<td id="th4">비밀글여부</td>
<td align="left">&nbsp;&nbsp;
<input type="radio" name="boardStatus" value="f" checked="checked">공개
&nbsp;&nbsp;<input type="radio" name="boardStatus" value="t">비밀
</td>
</tr>
<tr><td align="center" colspan="2">
<input type="submit" value="등록" class="ui button"/>
<a href="http://localhost:8080/FinalProject_TourNote2/board_list_category.do?boardCategory=qna"><input type="button" value="돌아가기" class="ui button"/></a>
<input type="hidden" name="boardWriter" value="${sessionScope.member.memberId }">
<c:if test="${sessionScope.member.memberId!='admin' }">
<input type="hidden" name="boardCategory" value="qna">
</c:if>
</td></tr>
</table>
</form>
</body>
</html>