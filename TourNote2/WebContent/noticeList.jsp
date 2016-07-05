<%@page import="com.scsa.wapl.entity.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="./js/page.js"></script>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<link href="./css/semantic.css" rel="stylesheet" media="screen">
<script src="./js/bootstrap.min.js"></script>
<style>
a{
color:black;
font-weight: bold;
}

#frm{
margin:0px
}

#tablee td{
	border-bottom: 1px solid black;
}

#titleBar{
font-weight: bold;
}
body{
    font-family: 'Nanum Gothic';
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
					<h2 class="wow bounceInLeft animated" style="visibility: visible;">
					NOTICE</h2>
					<p class="subheader wow bounceInRight animated"
						style="visibility: visible;">
					NOTICE BOARD</p>
				</div>
			</div>
		</div>
		
		
<table height="600px">
<tr>
<td width="230px"></td>
<td width="800" height="200px">
<table class="ui inverted table segment" style="margin-left: 20px;margin-top:-50px;font-family: 'Nanum Gothic';">
	<tr id="titleBar" class="ui inverted table2">
		<td align="center">번호</td>
		<td align="center" width="400">제목</td>
		<td align="center">작성자</td>
		<td align="center">날짜</td>
		<td  align="center" width="70">조회수</td>
	</tr>
	<%ArrayList<Board> blist =(ArrayList<Board>) request.getAttribute("boardList"); %>
	<c:choose>
		<c:when test="${not empty boardList}">
			<c:forEach items="${boardList}" var="list">
				<tr id="tablee">
					<td align="center">${list.boardNum}</td>
					<td align="left">
					<a href="${pageContext.request.contextPath}/board_detail.do?boardNum=${list.boardNum }&boardCategory=NOTICE">${list.boardTitle }</a>
					</td>
					<td align="center">${list.boardWriter }</td>
					<td align="center">${list.boardDate }</td>
					<td align="center">${list.boardHit }</td>
				</tr>
			</c:forEach>
				<tr class="ui inverted table2">
					<td colspan="5" align="center">${pageLink }
					<form id="frm" method="post">
					<input type="hidden" name="pageNo" id="pageNo"/>
					<input type="hidden" name="boardCategory" value="${param.boardCategory }"/>
					</form>
					</td>
				</tr>
		</c:when>
		<c:otherwise>
				<tr>
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
		</c:otherwise>
	</c:choose>
	<c:if test="${param.boardCategory=='notice' && sessionScope.member.memberId=='admin'}">
		<tr><td align="right" colspan="5">
			<a href="${pageContext.request.contextPath}/notice_insert_form.do">글쓰기</a>
		</td></tr>
	</c:if>
</table>
</td>
</tr>
</table>
</body>