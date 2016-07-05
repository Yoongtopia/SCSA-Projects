<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">

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

	#update {
		text-align:center;
    	font-family: 'Nanum Gothic';
		color:black;
		margin-bottom: 100px;
		margin-left:300px;
		background-color: white;
		
	}
	
	#update td{
		width:500px;
		height:30px;
		border-bottom: 1px solid silver;
	}
	
	#cont {
		height:500px;
	}
	
	a{
		color:black;
	}
	
	th{
		text-align:center;
		background-color: #39ABB9;
		color:white;
		width:100px;
		height: 40px;
	}	
</style>

<body class="container-mint">
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
					회원 수정</h2>
				</div>
			</div>
		</div>

<form method="post" action="${pageContext.request.contextPath}/memberModifyByadmin.do">
<table id="update">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="memberId" value="${member.memberId }" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" value="${member.password }" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="memberName" value="${member.memberName }" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="memberEmail" value="${member.memberEmail }" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="memberPhone" value="${member.memberPhone }" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>등급</th>
		<td>
			<select name="memberRank">
				<option value="${memberRank}">${member.memberRank }</option>
				<option value="R">R</option>
				<option value="S">S</option>
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>상태</th>
		<td><input type="text" name="memberStatus" value="${member.memberStatus }" readonly="readonly"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="등급수정"/>
		<c:if test="${member.memberStatus=='탈퇴'}">
		<a href="${pageContext.request.contextPath}/memberDelete.do?memberId=${member.memberId}"><button>회원 삭제</button></a>
		</c:if>
		</td>
	</tr>
</table>
</form>
</body>

