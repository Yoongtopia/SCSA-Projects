<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" >
function pagelist(cpage){
	//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
	document.getElementById("pageNo").value=cpage;
	var frm = document.getElementById("frm");
	frm.action="goTransportationDelete.do";
	frm.submit();
}

</script>
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
		margin-left: 230px;
		background-color: white;
		
	}
	
	#update td{
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
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>

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
					<h2 class="wow bounceInLeft animated" style="visibility: visible;">
					교통정보 삭제</h2>
				</div>
			</div>
		</div>

<%-- <table >
	<tr>
		<td><a href="${pageContext.request.contextPath}/memberList.do">회원목록</a></td>
		<td><a href="${pageContext.request.contextPath}/goRegistTransportation.do">교통정보 등록</a></td>
		<td><a href="${pageContext.request.contextPath}/goTransportationDelete.do">교통정보 삭제</a></td>
		
		<td></td>
	</tr>
</table>
 --%>
<table id="update">
	<tr>
		<th>종류</th>
		<th>이름</th>
		<th>국가명</th>
		<th>도시명</th>
		<th>링크</th>
		<th>삭제</th>
	</tr>
	<c:forEach items="${transportationList}" var="list">
		<form method="post" name="updateOrDeleteForm" action="${pageContext.request.contextPath}/removeTransportation.do" >
			<tr>
				<td><input type="text" name="transportationType" value="${list.transportationType}" readonly="readonly" /></td>
				<td width="50px"><input type="text" name="transportationName" value="${list.transportationName}" readonly="readonly"/></td>
				<td width="50px"><input type="text" name="countryName" value="${list.countryName}" readonly="readonly"/></td>
				<td width="50px"><input type="text" name="cityName" value="${list.cityName}" readonly="readonly"/></td>
				<td width="50px"><input type="text" name="link" value="${list.link}" readonly="readonly"/></td>
				<td width="50px"><input type="submit" id="removeTP" value="삭제" />&nbsp;&nbsp;</td>
				</tr>
		</form>
	</c:forEach>
	
				<tr>
					<td colspan="5" align="center">${pageLink }
					<form id="frm" method="post">
					<input type="hidden" name="pageNo" id="pageNo"/>
					</form>
					</td>
				</tr>
	
</table>
</body>